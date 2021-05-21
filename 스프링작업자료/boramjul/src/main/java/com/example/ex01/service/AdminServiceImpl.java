package com.example.ex01.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.AdminDAO;
import com.example.ex01.model.dto.AdminDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Inject
	AdminDAO adminDao;
	
	@Override
	public boolean check_passwd(String id, String passwd) {
		return adminDao.check_passwd(id, passwd);
	}

	@Override
	public String loginCheck(AdminDTO dto, HttpSession session) {
		String name = adminDao.loginCheck(dto);
		
		if (name != null) {
			session.setAttribute("id", dto.getId());
			session.setAttribute("name", name);
			
			 logger.info("session : "+session.getAttribute("id"));
			 logger.info("session : " + session.getAttribute("name"));
		} 
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.removeAttribute("id");
		session.removeAttribute("name");
		
	}

}
