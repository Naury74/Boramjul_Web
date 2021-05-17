package com.example.ex01.service;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dto.MemberDTO;

public interface MemberService {
	
		public void insert(MemberDTO dto);
		public MemberDTO myInfo(String email);
		public void delete(String email);
		public void update(MemberDTO dto);
		public boolean check_passwd(String email, String passwd);
		
		// 로그인 성공여부에 따라 session값 생성 
		public String loginCheck(MemberDTO dto, HttpSession session);
		public void logout(HttpSession session);

}
