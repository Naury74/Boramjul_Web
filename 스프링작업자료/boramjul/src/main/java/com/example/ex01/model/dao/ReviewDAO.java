package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.OrderDetailDTO;
import com.example.ex01.model.dto.ReviewDTO;


public interface ReviewDAO {
	
	//리뷰리스트 리뷰관련 조회
	public List<ReviewDTO> review_list();
	
	//리뷰 상세보기
	public ReviewDTO review_detail(int renum);
	
	//회원별 리뷰 조회
	List<ReviewDTO> email_review_list(String email);
	
	//상품별 리뷰 조회
	List<ReviewDTO> prod_review_list(int prodnum);
	
	//상품별 리뷰 조회2
	List<ReviewDTO> prod_review_list2(String prodname);
	
	//리뷰 추가
	public void review_insert(ReviewDTO dto);
	
	//리뷰 수정
	public void review_update(ReviewDTO dto);
	
	//리뷰 삭제
	public void review_delete(int renum);
	
	//후기 작성시 포인트 추가
	public void reserves_add(String email);
	
	//리뷰 수 product 테이블에 추가
	public void review_count(int prodnum);
	
	//리뷰 점수 product 테이블에 추가
	public void review_score_insert(int prodnum);
	
	//리뷰 수 product 테이블에 차감
	public void review_count_delete(int prodnum);
	
	//리뷰 점수 product 테이블에 차감
	public void review_score_delete(int prodnum);
	
	//조회 수 증가
	public void review_lookup(int renum);
	
	//추천 수 증가
	public void review_recom(int renum);
	
	//상품별 리뷰 수 조회
	public int review_score (int prodnum);
	

}
