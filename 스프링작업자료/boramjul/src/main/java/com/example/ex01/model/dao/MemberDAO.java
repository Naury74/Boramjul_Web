package com.example.ex01.model.dao;

import java.util.List;

import com.example.ex01.model.dto.MemberDTO;

public interface MemberDAO {
	
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
	
	//로그인
	public boolean check_passwd(String email, String passwd);

	// 로그인, 로그아웃 세션 설정하기 위한 메서드
	public String loginCheck(MemberDTO dto);


}
