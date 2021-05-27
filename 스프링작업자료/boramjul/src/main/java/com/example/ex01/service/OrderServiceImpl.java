package com.example.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.OrderDAO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.OrderDTO;
import com.example.ex01.model.dto.OrderDetailDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO orderDao;

	@Override
	public void order_insert(OrderDTO dto) {
		orderDao.order_insert(dto);
		
	}

	@Override
	public OrderDTO order_detail_list(OrderDTO dto) {
		return orderDao.order_detail_list(dto);
	}

	@Override
	public List<OrderDetailDTO> detail_list(String email) {
		return orderDao.detail_list(email);
	}
	


}
