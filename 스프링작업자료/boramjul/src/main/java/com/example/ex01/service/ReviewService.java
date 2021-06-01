package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.OrderDetailDTO;
import com.example.ex01.model.dto.ReviewDTO;


public interface ReviewService {
	public  List<ReviewDTO> review_list();
	public void review_insert(ReviewDTO dto);
	public ReviewDTO review_detail(int renum);
	List<ReviewDTO> prod_review_list(int prodnum);
	List<ReviewDTO> email_review_list(String email);
	public void review_lookup(int renum);
	public int review_score (int prodnum);
	public void review_recom(int renum);
	public void review_count(int prodnum);
	public void review_score_insert(int prodnum);
	public void review_update(ReviewDTO dto);
	public void review_delete(int renum);
	public void review_count_delete(int prodnum);
	public void review_score_delete(int prodnum);
	
}
