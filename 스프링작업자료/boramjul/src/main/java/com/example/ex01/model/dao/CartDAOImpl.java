package com.example.ex01.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.ex01.model.dto.CartDTO;

@Repository
public class CartDAOImpl implements CartDAO{
	
	@Inject
	SqlSession sqlSession;
	
//	@Override
//	public List<CartDTO> cartMoney() {
//		return sqlSession.selectList("mysqlCart.listAllCart");
//	}
//
//	@Override
//	public void insert(CartDTO dto) {
//		sqlSession.insert("mysqlCart.insertCart",dto);
//	}

	@Override
	public List<CartDTO> listCart(String email) {
		return sqlSession.selectList("mysqlCart.listCart", email);
	}

	// 장바구니 개별 상품 삭제
	@Override
	public void cart_delete(CartDTO dto) {
		sqlSession.delete("mysqlCart.cart_delete", dto);
	}
//
//	// 특정 아이디 장바구니 비우기
//	@Override
//	public void deleteAll(String userid) {
//		sqlSession.delete("mysqlCart.deleteAllCart", userid);
//	}
	@Override
	public void cart_update(CartDTO dto) {
		sqlSession.update("mysqlCart.cart_update", dto);
	}	
	 //장바구니 합계
	@Override
	public int cart_tot(String email) {
		return sqlSession.selectOne("mysqlCart.cart_tot",email);
	}
	
	//장바구니 초기화
	@Override
	public void cart_reset(CartDTO dto) {
		sqlSession.update("mysqlCart.cart_reset", dto);
	}

	@Override
	public List<CartDTO> listOrder(String email) {
		return sqlSession.selectList("mysqlCart.listOrder", email);
	}

	@Override
	public void order_insert(CartDTO dto) {
		sqlSession.update("mysqlCart.cart_order", dto);
	}
	
	@Override
	public void order_result_3(CartDTO dto) {
		sqlSession.update("mysqlCart.order_result_3", dto);
	}

	@Override
	public List<CartDTO> orderCart(String email) {
		return sqlSession.selectList("mysqlCart.order_list", email);
	}

	@Override
	public int order_tot(String email) {
		return sqlSession.selectOne("mysqlCart.order_tot",email);
	}



//	@Override
//	public int coutCart(String userid, int product_id) {
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("userid", userid);
//		map.put("product_id", product_id);
//		
//		return sqlSession.selectOne("mysqlCart.countCart", map);
//	}

}
