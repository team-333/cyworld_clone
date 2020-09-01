package com.practice.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.practice.dao.BoardVO;
import com.practice.service.BoardService;

@Controller
public class BoardController {

	@Autowired
	private BoardService bs;
	
	@RequestMapping(value = "/board/", method = RequestMethod.GET)
	public ModelAndView board(HttpServletRequest req) {
		String folder ="first";
		// 1. listing each boards
		// 2. importing data from each boards when user click it.
		return bs.selectAll(folder, req); 	}
	
	
	@RequestMapping(value="/board/{folderid}/", method = RequestMethod.GET)
	public ModelAndView board1(@PathVariable("folderid")String folder, HttpServletRequest req) {
		
		return bs.selectAll(folder, req);
	}
	
	@RequestMapping(value="/detail/{folderid}/{bnum}/", method = RequestMethod.GET)
	public ModelAndView boardDetail(@PathVariable("folderid")String folderid,
								@PathVariable("bnum")int bnum) {
		return bs.selectOne(folderid, bnum);
	}
	
	@RequestMapping(value="/board/insert/{folderid}/", method = RequestMethod.GET)
	public ModelAndView boardInsert(@PathVariable("folderid")String folder) {
		
		ModelAndView mv = new ModelAndView("boardInsert");
		mv.addObject("folderid", folder);
		return mv;
	}
	
	@RequestMapping(value="/board/insert/{folderid}/", method = RequestMethod.POST)
	public ModelAndView boardInsert(@PathVariable("folderid")String folderid, BoardVO vo) {
		System.out.println(vo.getContext());
		System.out.println(vo.getTitle());
		
		
		return bs.insert(folderid, vo);
	}

}