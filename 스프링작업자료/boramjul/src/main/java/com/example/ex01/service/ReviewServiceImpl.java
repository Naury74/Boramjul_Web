package com.example.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.ReviewDAO;
import com.example.ex01.model.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Inject
	ReviewDAO reviewDao;
	
	@Override
	public List<ReviewDTO> review_list() {
		return reviewDao.review_list();
	}
	
	@Override
	public ReviewDTO review_detail(int renum) {
		return reviewDao.review_detail(renum);
	}
	
	@Override
	public void Review_insert(ReviewDTO dto) {
		reviewDao.Review_insert(dto);
	}



	
	
	
}
