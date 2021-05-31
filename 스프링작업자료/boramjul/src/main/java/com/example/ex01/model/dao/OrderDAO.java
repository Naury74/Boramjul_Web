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
	
	//주문내역 조회
	List<OrderDetailDTO> detail_list(String email);
 
}
