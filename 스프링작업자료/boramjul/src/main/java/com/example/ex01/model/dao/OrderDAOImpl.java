package com.example.ex01.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.OrderDTO;
import com.example.ex01.model.dto.OrderDetailDTO;

@Repository
public class OrderDAOImpl implements OrderDAO {
	
	@Inject
	SqlSession sqlSession;
	

	@Override
	public void order_insert(OrderDTO dto) {
		sqlSession.insert("mysqlOrder.order_insert",dto);
	}

	@Override
	public OrderDTO order_detail_list(OrderDTO dto) {
		return sqlSession.selectOne("mysqlOrder.order_detail_list",dto);
	}

	@Override
	public List<OrderDetailDTO> detail_list(String email) {
		return sqlSession.selectList("mysqlOrderDetail.detail_list", email);
	}

	@Override
	public void order_detail_insert(OrderDetailDTO dto) {
		sqlSession.insert("mysqlOrderDetail.order_detail_insert", dto);
	}

	@Override
	public void review_result(int prodnum) {
		sqlSession.update("mysqlOrderDetail.review_result", prodnum);
	}

	@Override
	public void review_result_delete(int prodnum) {
		sqlSession.update("mysqlOrderDetail.review_result_delete", prodnum);
	}
	
	@Override
	public int prod_duplication(String prodname) {
		return sqlSession.selectOne("mysqlOrder.prod_duplication", prodname);
	}
	
	@Override
	public void prod_insert(OrderDetailDTO dto) {
		sqlSession.insert("mysqlOrder.prod_insert", dto);
	}
	

}
