package com.practice.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.practice.dao.BoardDAO;
import com.practice.dao.BoardVO;
import com.practice.dao.FolderVO;

@Service
public class BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	public ModelAndView selectAll(String folder,HttpServletRequest req) {
		
		ModelAndView mv = new ModelAndView("board");
		HashMap<String, String> map = new HashMap<String, String>();
		// 게시판 작성에 필요한 폴더 아이
		String folderid;
		
		// 게시판 접근시 맨 첫번쪠 열 폴더 열기
		if(folder=="first") {
		map.put("folder",dao.defaultFolder());
		folderid=dao.defaultFolder();
		System.out.println("folder값 : "+dao.defaultFolder());
		}
		else {
			//폴더를 클릭시 pathvariable로 받은  folderid값 넘겨주기
			map.put("folder", folder);
			folderid=folder;
		
		}
		List<BoardVO> list = dao.selectAll(map);
		// 폴더리스트 불어오
		List<FolderVO> flist = dao.selectFolderAll();
		
		mv.addObject("list", list);
		mv.addObject("flist",flist);
		mv.addObject("folderid",folderid);
		return mv;
	}
	
	public ModelAndView selectOne(String folderid, int bnum) {
		
		ModelAndView mv = new ModelAndView("boardDetail");
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("folderid", folderid);
		map.put("bnum", String.valueOf(bnum));
		
		dao.viewUp(map);
		List<FolderVO> flist = dao.selectFolderAll();

		BoardVO board = dao.selectOne(map);
		
		mv.addObject("board", board);
		mv.addObject("flist",flist);
		
		return mv;
	}
	
	public ModelAndView insert(String folderid, BoardVO vo) {
		
		ModelAndView mv = new ModelAndView("redirect:/board/"+folderid+"/");
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<FolderVO> flist = dao.selectFolderAll();

		map.put("folderid", folderid);
		map.put("vo", vo);
		mv.addObject("flist",flist);
		int result = dao.insert(map);
		
		if(result == 1)
			return mv;
		else {
			mv.setViewName("error");
			return mv;
		}
	}
}
