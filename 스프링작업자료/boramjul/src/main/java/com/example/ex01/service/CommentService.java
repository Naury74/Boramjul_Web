package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.CommentDTO;

public interface CommentService {
	
	List<CommentDTO> comment_list(int renum);
	List<CommentDTO> comment_list2(String email);
	public void comment_insert(CommentDTO dto);
	public void comscore_update(int renum);

}
