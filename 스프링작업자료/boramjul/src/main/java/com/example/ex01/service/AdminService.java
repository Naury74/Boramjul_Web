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
	
	//책 번호로 상품 조회
	public BooksDTO prodnum_list(int prodnum);
	
	//상품 목록에 등록되어있는지 책 이름으로 조회
	public boolean prodname_list(String prodname);
	
	//상품 목록에 추가
	public void prod_insert(BooksDTO dto);
	
	//책 이름으로 책 번호 조회
	public int name_list(String prodname);
}
