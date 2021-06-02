package com.example.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.CommentDAO;
import com.example.ex01.model.dto.CommentDTO;
@Service
public class CommentServiceImpl implements CommentService {
	
	@Inject
	CommentDAO commentDao;

	@Override
	public List<CommentDTO> comment_list(int renum) {
		return commentDao.comment_list(renum);
	}
	
	@Override
	public List<CommentDTO> comment_list2(String email) {
		return commentDao.comment_list2(email);
	}

	@Override
	public void comment_insert(CommentDTO dto) {
		commentDao.comment_insert(dto);
	}

	@Override
	public void comscore_update(int renum) {
		commentDao.comscore_update(renum);
	}



}
