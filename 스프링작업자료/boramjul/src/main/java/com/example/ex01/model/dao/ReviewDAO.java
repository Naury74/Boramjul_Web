package com.example.ex01.model.dao;

import java.util.List;
import com.example.ex01.model.dto.ReviewDTO;


public interface ReviewDAO {
	
	//리뷰리스트 리뷰관련 조회
	public List<ReviewDTO> review_list();
	
	//리뷰리스트 상품관련 조회
	public List<ReviewDTO> product_list();
	
	//리뷰 상세보기
	public ReviewDTO review_detail(int renum);
	
	//리뷰 추가
	public void Review_insert(ReviewDTO dto);
	
	//조회수 증가
	public void review_lookup(int renum);
	
	//상품별 리뷰 수 조회
	public int review_score (int prodnum);
	

}
