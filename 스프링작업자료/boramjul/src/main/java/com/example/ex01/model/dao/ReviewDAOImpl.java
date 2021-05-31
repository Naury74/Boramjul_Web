package com.example.ex01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;


import com.example.ex01.model.dto.ReviewDTO;


@Repository
public class ReviewDAOImpl implements ReviewDAO {
		
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<ReviewDTO> review_list(){
		return sqlSession.selectList("mysqlReview.review_list");
	}

	@Override
	public ReviewDTO review_detail(int renum) {
		return sqlSession.selectOne("mysqlReview.review_detail", renum);
	}
	
	@Override
	public void Review_insert(ReviewDTO dto) {
		sqlSession.insert("mysqlReview.review_insert",dto);
	}



	
	
	
}
