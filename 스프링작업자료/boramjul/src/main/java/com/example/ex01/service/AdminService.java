package com.example.ex01.service;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dto.AdminDTO;


public interface AdminService {
	
	public boolean check_passwd(String id, String passwd);
	public String loginCheck(AdminDTO dto, HttpSession session);
	public void logout(HttpSession session);

}
