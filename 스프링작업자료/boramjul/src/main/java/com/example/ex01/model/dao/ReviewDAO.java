package com.example.ex01.model.dao;

import java.util.List;
import com.example.ex01.model.dto.ReviewDTO;


public interface ReviewDAO {
	
	//리뷰리스트 조회
	public List<ReviewDTO> review_list();
	
	//리뷰 상세보기
	public ReviewDTO review_detail(int renum);
	
	//리뷰 추가
	public void Review_insert(ReviewDTO dto);
	

}
