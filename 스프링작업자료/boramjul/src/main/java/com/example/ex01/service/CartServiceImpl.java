package com.example.ex01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.CartDAO;
import com.example.ex01.model.dto.CartDTO;

@Service
public class CartServiceImpl implements CartService{
	
	@Inject
	CartDAO cartDao;
	
//	@Override
//	public List<CartDTO> cartMoney() {
//		return cartDao.cartMoney();
//	}
//
//	@Override
//	public void insert(CartDTO dto) {
//		cartDao.insert(dto);
//	}

	@Override
	public List<CartDTO> listCart(String email) {
		return cartDao.listCart(email);
	}

	@Override
	public void cart_delete(CartDTO dto) {
		cartDao.cart_delete(dto);
	}
//
//	@Override
//	public void deleteAll(String userid) {
//		cartDao.deleteAll(userid);
//	}

	@Override
	public int cart_tot(String email) {
		return cartDao.cart_tot(email);
	}

//	@Override
//	public int coutCart(String userid, int product_id) {
//		return cartDao.coutCart(userid, product_id);
//	}
//
	@Override
	public void cart_update(CartDTO dto) {
		cartDao.cart_update(dto);
	}
	
	@Override
	public void cart_reset(CartDTO dto) {
		cartDao.cart_reset(dto);
	}

}
