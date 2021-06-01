package com.example.ex01.service;

import java.util.List;


import com.example.ex01.model.dto.ReviewDTO;


public interface ReviewService {
	public  List<ReviewDTO> review_list();
	public List<ReviewDTO> product_list();
	public void Review_insert(ReviewDTO dto);
	public ReviewDTO review_detail(int renum);
	public void review_lookup(int renum);
	public int review_score (int prodnum);
	
}
