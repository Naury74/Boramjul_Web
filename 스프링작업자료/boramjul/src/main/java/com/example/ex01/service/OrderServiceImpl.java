package com.example.ex01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.OrderDAO;
import com.example.ex01.model.dto.OrderDTO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	OrderDAO orderDao;

	@Override
	public void order_insert(OrderDTO dto) {
		orderDao.order_insert(dto);
		
	}

}
