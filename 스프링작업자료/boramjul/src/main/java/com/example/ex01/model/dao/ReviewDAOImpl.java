package com.example.ex01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.OrderDetailDTO;
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
	public void review_insert(ReviewDTO dto) {
		sqlSession.insert("mysqlReview.review_insert",dto);
	}

	@Override
	public void review_lookup(int renum) {
		sqlSession.update("mysqlReview.review_lookup", renum);
	}

	@Override
	public int review_score(int prodnum) {
		return sqlSession.selectOne("mysqlReview.review_score", prodnum);
	}

	@Override
	public void review_recom(int renum) {
		sqlSession.update("mysqlReview.review_recom", renum);
	}

	@Override
	public List<ReviewDTO> prod_review_list(int prodnum) {
		return sqlSession.selectList("mysqlReview.prod_review_list", prodnum);
	}

	@Override
	public List<ReviewDTO> email_review_list(String email) {
		return sqlSession.selectList("mysqlReview.email_review_list", email);
	}

	@Override
	public void review_count(int prodnum) {
		sqlSession.update("mysqlReview.review_count", prodnum);
	}

	@Override
	public void review_score_insert(int prodnum) {
		sqlSession.update("mysqlReview.review_score_insert", prodnum);
	}

	@Override
	public void review_update(ReviewDTO dto) {
		sqlSession.update("mysqlReview.review_update", dto);
	}

	@Override
	public void review_delete(int renum) {
		sqlSession.delete("mysqlReview.review_delete", renum);
	}

	@Override
	public void review_count_delete(int prodnum) {
		sqlSession.update("mysqlReview.review_count_delete", prodnum);
	}

	@Override
	public void review_score_delete(int prodnum) {
		sqlSession.update("mysqlReview.review_score_delete", prodnum);
	}


	
	
	
}
