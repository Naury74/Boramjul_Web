package com.example.ex01.service;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dto.MemberDTO;

public interface MemberService {
	
		public void insert(MemberDTO dto);
		public MemberDTO myInfo(String email);
		public void delete(String email);
		public void update(MemberDTO dto);
		public MemberDTO findemail(String phone);
		public MemberDTO findpwd(String email);
		public boolean check_passwd(String email, String passwd);
		public boolean check_api(String email, String name);
		
		// 로그인 성공여부에 따라 session값 생성 
		public String loginCheck(MemberDTO dto, HttpSession session);
		public String apiloginCheck(MemberDTO dto, HttpSession session);
		public void logout(HttpSession session);

}
