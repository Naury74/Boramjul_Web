package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.MemberDTO;

public interface MemberDAO {
	
	public void insert(MemberDTO dto);
	public MemberDTO myInfo(String email);
	public void delete(String email);
	public void update(MemberDTO dto);
	public MemberDTO findemail(String phone);
	public MemberDTO findpwd(String email);
	public boolean check_passwd(String email, String passwd);
	public List<MemberDAO> list();

	// 로그인, 로그아웃 세션 설정하기 위한 메서드
	public String loginCheck(MemberDTO dto);


}
