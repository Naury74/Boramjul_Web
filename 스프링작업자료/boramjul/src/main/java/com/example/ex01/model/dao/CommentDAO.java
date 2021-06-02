package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.CommentDTO;

public interface CommentDAO {
	
	//리뷰 게시글별로 댓글 조회
	List<CommentDTO> comment_list(int renum);
	
	//회원 별로 댓글 조회
	List<CommentDTO> comment_list2(String email);
	
	//댓글 등록
	public void comment_insert(CommentDTO dto);
	
	//댓글 수 review 테이블에 업데이트
	public void comscore_update(int renum);

}
