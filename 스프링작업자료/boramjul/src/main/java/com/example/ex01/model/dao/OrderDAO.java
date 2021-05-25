package com.example.ex01.model.dao;

import com.example.ex01.model.dto.OrderDTO;

public interface OrderDAO {
	
	//order 테이블에 추가
	public void order_insert(OrderDTO dto);
 
}
