package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.CartDTO;

public interface CartDAO {
	
	// 개별 장바구니 목록
	List<CartDTO> listCart(String email);
	
	//주문진행 페이지 장바구니 목록
	List<CartDTO> orderCart(String email);
	
	// 개별 장바구니 삭제
	void cart_delete(CartDTO dto);
	
	//장바구니 result값 2로 변경
	void order_insert(CartDTO dto);
	
	//장바구니 result값 3으로 변경
	void order_result_3(CartDTO dto);
	
	//장바구니 result값 3 삭제
	void cart_redelete(String email);

	// 장바구니 금액 합산
	int cart_tot(String email);
	
	// 주문진행 페이지 장바구니 금액 합산
	int order_tot(String email);
	
	//장바구니 담기
	void cart_insert(CartDTO dto);

	// 장바구니 수정
	void cart_update(CartDTO dto);
	
	//장바구니 초기화
	void cart_reset(CartDTO dto);
	

}
