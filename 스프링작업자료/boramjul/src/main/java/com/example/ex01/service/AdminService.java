package com.example.ex01.service;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.QnADTO;


public interface AdminService {
	
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto, HttpSession session);
	public void logout(HttpSession session);
	void QnA_delete(int cartnum);
	void QnA_update(QnADTO dto);
}
