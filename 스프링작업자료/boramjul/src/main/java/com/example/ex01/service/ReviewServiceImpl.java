package com.example.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.ReviewDAO;
import com.example.ex01.model.dto.OrderDetailDTO;
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
	public void review_insert(ReviewDTO dto) {
		reviewDao.review_insert(dto);
	}

	@Override
	public void review_lookup(int renum) {
		reviewDao.review_lookup(renum);
	}

	@Override
	public int review_score(int prodnum) {
		return reviewDao.review_score(prodnum);
	}

	@Override
	public void review_recom(int renum) {
		reviewDao.review_recom(renum);
	}

	@Override
	public List<ReviewDTO> prod_review_list(int prodnum) {
		return reviewDao.prod_review_list(prodnum);
	}
	
	@Override
	public List<ReviewDTO> prod_review_list2(String prodname) {
		return reviewDao.prod_review_list2(prodname);
	}

	@Override
	public List<ReviewDTO> email_review_list(String email) {
		return reviewDao.email_review_list(email);
	}

	@Override
	public void review_count(int prodnum) {
		reviewDao.review_count(prodnum);
	}

	@Override
	public void review_score_insert(int prodnum) {
		reviewDao.review_score_insert(prodnum);
	}

	@Override
	public void review_update(ReviewDTO dto) {
		reviewDao.review_update(dto);
	}

	@Override
	public void review_delete(int renum) {
		reviewDao.review_delete(renum);
	}

	@Override
	public void review_count_delete(int prodnum) {
		reviewDao.review_count_delete(prodnum);
	}

	@Override
	public void review_score_delete(int prodnum) {
		reviewDao.review_score_delete(prodnum);
	}

	@Override
	public void reserves_add(String email) {
		reviewDao.reserves_add(email);
	}


}
