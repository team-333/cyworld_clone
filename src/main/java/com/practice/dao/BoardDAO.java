package com.practice.dao;

import java.util.HashMap;
import java.util.List;


public interface BoardDAO {
	

	
	List<BoardVO> selectAll(HashMap<String, String> map);
		
	
	
	public BoardVO selectOne(HashMap<String, String> map);
		
	
	
	public int insert(HashMap<String, Object> map);
		
	

	public List<FolderVO> selectFolderAll();



	public String defaultFolder();



	int viewUp(HashMap<String,String> map);
		
	

	
}
