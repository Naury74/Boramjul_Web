package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.CartDTO;

public interface CartService {
//	//	상품별 금액
//	List<CartDTO> cartMoney();
//	
//	// 장바구니 추가
//	void insert(CartDTO dto);
	
	// 개별 장바구니 목록
	List<CartDTO> listCart(String email);
	
	// 개별 장바구니 삭제
	void cart_delete(CartDTO dto);
//	
//	// 장바구니 비우기
//	void deleteAll(String email);
//	
	// 장바구니 금액 합산
	int cart_tot(String email);
//	
//	// 장바구니 상품 개수
//	int coutCart(String email, int product_id);
//
	// 장바구니 수정
	void cart_update(CartDTO dto);
	
	//장바구니 초기화
	void cart_reset(CartDTO dto);
	
	//주문내역 조회
	List<CartDTO> listOrder(String email);
}
