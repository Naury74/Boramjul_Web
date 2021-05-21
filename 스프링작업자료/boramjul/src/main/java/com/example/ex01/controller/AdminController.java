package com.example.ex01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dto.AdminDTO;
import com.example.ex01.model.dto.MemberDTO;
import com.example.ex01.model.dto.QnADTO;
import com.example.ex01.service.AdminService;
import com.example.ex01.service.EtcService;


@RequestMapping("/admin/*")
@Controller
public class AdminController {
	
	@Inject
	EtcService etcService;
	
	@Inject
	AdminService adminService;
	
	private static  final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@RequestMapping("login.do")
	public String login( Model model) {
		
		model.addAttribute("message","nologin");
		return "admin/login";
	}
	
	@RequestMapping("QnA_write.do")
	public String write() {
		return "etc/QnA_write";
	}
	
	@RequestMapping("QnA_insert.do")
	public String insert(@ModelAttribute QnADTO dto, HttpSession session) {
		System.out.println("insert  받아온 내용: "+dto);

		etcService.QnA_insert(dto);
		
		System.out.println(dto);

		return "redirect:/etc/QnA.do";
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(	@ModelAttribute AdminDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 로그인 체크 처리하는 서비스 요청(세션값을 생성 시킴)
		String name = adminService.loginCheck(dto, session);
		logger.info("name: "+name);
		
		// 로그인 처리 결과에 따라 처리
		if (name != null) {// 로그인 성공시  session값을 생성해서 home페이지로 이동
			mav.setViewName("main");
		} else {
			// 로그인 실패시 에러 메시지와 함께 로그인 페이지로 이동
			mav.setViewName("member/login");
			mav.addObject("message","error");
		}
		return mav;
	}

}
