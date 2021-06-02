package com.example.ex01.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.MemberDAO;
import com.example.ex01.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);

	@Inject
	MemberDAO memberDao;
	
	
	@Override
	public void insert(MemberDTO dto) {
		memberDao.insert(dto);
	}

	@Override
	public MemberDTO myInfo(String email) {
		return memberDao.myInfo(email);
	}

	@Override
	public void delete(String email) {
		memberDao.delete(email);
	}

	@Override
	public void update(MemberDTO dto) {
		memberDao.update(dto);
	}
	
	@Override
	public MemberDTO findemail(String phone) {
		return memberDao.findemail(phone);
	}
	
	@Override
	public MemberDTO findpwd(String email) {
		return memberDao.findpwd(email);
	}

	@Override
	public boolean check_passwd(String email, String passwd) {
		return memberDao.check_passwd(email, passwd);
	}
	
	@Override
	public String loginCheck(MemberDTO dto, HttpSession session) {
		String name = memberDao.loginCheck(dto);
		
		if (name != null) {
			
			//로그인이 성공이면 세션값 생성
			session.setAttribute("email", dto.getEmail());
			session.setAttribute("name", name);
		
			// logger.info("session : "+session.getAttribute("id"));
			// logger.info("session : " + session.getAttribute("name"));
			
		} 
		return name;
	}
	
	@Override
	public void logout(HttpSession session) {
		session.removeAttribute("email");
		session.removeAttribute("name");
		
		 logger.info("로그아웃 했을 경우 email값 : "+session.getAttribute("email"));
		 logger.info("로그아웃 했을 경우 name값 : "+session.getAttribute("name"));

	}

	@Override
	public List<MemberDAO> list() {
		return memberDao.list();
	}

}
