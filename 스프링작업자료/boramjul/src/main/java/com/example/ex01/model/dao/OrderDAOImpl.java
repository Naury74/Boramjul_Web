package com.example.ex01.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.OrderDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;

	@Override
	public void order_insert(OrderDTO dto) {
		sqlSession.insert("mysqlOrder.order_insert",dto);
		
	}

}
