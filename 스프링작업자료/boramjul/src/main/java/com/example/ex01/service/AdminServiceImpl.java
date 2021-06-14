package com.example.ex01.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.ex01.model.dao.AdminDAO;
import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.QnADTO;

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
			
			 logger.info("관리자 로그인 session : "+session.getAttribute("id"));
			 logger.info("관리자 로그인 session : " + session.getAttribute("name"));
		} 
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		
		session.removeAttribute("id");
		session.removeAttribute("name");
		
		 logger.info("관리자 로그아웃 session : "+session.getAttribute("id"));
		 logger.info("관리자 로그아웃 session : " + session.getAttribute("name"));
		
	}
	
	@Override
	public void QnA_insert(QnADTO dto) {
		adminDao.QnA_insert(dto);
	}

	@Override
	public void QnA_delete(int cartnum) {
		adminDao.QnA_delete(cartnum);
	}

	@Override
	public void QnA_update(QnADTO dto) {
		adminDao.QnA_update(dto);
	}

	@Override
	public void prod_insert(BooksDTO dto) {
		adminDao.prod_insert(dto);
	}

	@Override
	public boolean prodname_list(String prodname) {
		return adminDao.prodname_list(prodname);
	}

	@Override
	public BooksDTO prodnum_list(int prodnum) {
		return adminDao.prodnum_list(prodnum);
	}

	@Override
	public int name_list(String prodname) {
		return adminDao.name_list(prodname);
	}

}
