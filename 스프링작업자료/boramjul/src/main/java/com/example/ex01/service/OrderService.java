package com.example.ex01.service;

import java.util.List;

import com.example.ex01.model.dto.OrderDTO;
import com.example.ex01.model.dto.OrderDetailDTO;

public interface OrderService {
	
	public void order_insert(OrderDTO dto);
	
	public OrderDTO order_detail_list(OrderDTO dto);
	
	List<OrderDetailDTO> detail_list(String email);
	
	public void order_detail_insert(OrderDetailDTO dto);

}
