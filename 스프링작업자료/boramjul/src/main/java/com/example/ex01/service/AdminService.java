package com.example.ex01.service;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.QnADTO;


public interface AdminService {
	
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto, HttpSession session);
	public void logout(HttpSession session);
	
	void QnA_delete(int cartnum);
	void QnA_update(QnADTO dto);
	
	public BooksDTO prodnum_list(int prodnum);
	public boolean prodname_list(String prodname);
	public void prod_insert(BooksDTO dto);
	public void order_now(CartDTO dto);
}
