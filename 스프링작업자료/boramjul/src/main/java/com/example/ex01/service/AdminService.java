package com.example.ex01.service;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.QnADTO;


public interface AdminService {
	
	//관리자 로그인
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto, HttpSession session);
	public void logout(HttpSession session);
	
	//qna 관련
	public void QnA_insert(QnADTO dto);
	void QnA_delete(int cartnum);
	void QnA_update(QnADTO dto);
	
	//상품 관련
	public BooksDTO prodnum_list(int prodnum);
	public boolean prodname_list(String prodname);
	public void prod_insert(BooksDTO dto);
	public void order_now(CartDTO dto);
	public int name_list(String prodname);
}
