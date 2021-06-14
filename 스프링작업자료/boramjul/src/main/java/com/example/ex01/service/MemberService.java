package com.example.ex01.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.ex01.model.dao.MemberDAO;
import com.example.ex01.model.dto.MemberDTO;

public interface MemberService {
	
	//회원 가입
	public void insert(MemberDTO dto);
	
	//내 정보 조회
	public MemberDTO myInfo(String email);
	
	//회원 삭제
	public void delete(String email);
	
	//회원 정보 수정
	public void update(MemberDTO dto);
	
	//이메일 찾기
	public MemberDTO findemail(String phone);
	
	//비밀번호 찾기
	public MemberDTO findpwd(String email);
	
	//안드로이드 json 전용 체크
	public List<MemberDAO> list();
	
	// 로그인 로그아웃 관련
	public boolean check_passwd(String email, String passwd);
	public String loginCheck(MemberDTO dto, HttpSession session);
	public void logout(HttpSession session);

}
