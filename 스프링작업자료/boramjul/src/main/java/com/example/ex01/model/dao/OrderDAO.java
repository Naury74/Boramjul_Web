package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.OrderDTO;
import com.example.ex01.model.dto.OrderDetailDTO;

public interface OrderDAO {
	
	//order 테이블에 추가
	public void order_insert(OrderDTO dto);
	
	//order detail 테이블에 추가
	public void order_detail_insert(OrderDetailDTO dto);
	
	//주문완료 후 상세페이지 조회
	public OrderDTO order_detail_list(OrderDTO dto);
	
	//리뷰 작성 이후 리뷰작성 유무 업데이트
	public void review_result(int prodnum);
	
	//리뷰작성 삭제시
	public void review_result_delete(int prodnum);
	
	//주문내역 조회
	List<OrderDetailDTO> detail_list(String email);

	//상품 등록
	public void prod_insert(OrderDetailDTO dto);
	
	public int prod_duplication(String prodname);
 
}
