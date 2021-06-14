package com.example.ex01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.CommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Inject
	SqlSession sqlSession;
	

	@Override
	public List<CommentDTO> comment_list(int renum) {
		return sqlSession.selectList("mysqlComment.comment_list", renum);
	}
	
	@Override
	public List<CommentDTO> comment_list2(String email) {
		return sqlSession.selectList("mysqlComment.comment_list2", email);
	}

	@Override
	public void comment_insert(CommentDTO dto) {
		sqlSession.insert("mysqlComment.comment_insert", dto);
	}

	@Override
	public void comscore_update(int renum) {
		sqlSession.update("mysqlComment.comscore_update", renum);
	}


}
