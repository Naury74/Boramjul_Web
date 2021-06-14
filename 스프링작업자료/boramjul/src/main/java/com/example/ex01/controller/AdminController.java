package com.example.ex01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ex01.model.dto.AdminDTO;
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
	
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(@ModelAttribute AdminDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 로그인 체크 처리하는 서비스 요청(세션값을 생성 시킴)
		String name = adminService.loginCheck(dto, session);
		logger.info("관리자 name: "+name);
		
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
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		// session정보 모두 지우기
		// session.invalidate();
		
		session.removeAttribute("id");
		session.removeAttribute("name");

		logger.info("관리자 로그아웃");

		return "main";
	}
	
	@RequestMapping("QnA_write.do")
	public String write() {
		return "admin/QnA_write";
	}
	
	@RequestMapping("QnA_insert.do")
	public String insert(@ModelAttribute QnADTO dto) {
		System.out.println("insert  받아온 내용: "+dto);

		adminService.QnA_insert(dto);
		
		System.out.println(dto);

		return "redirect:/etc/QnA.do";
	}
	
	@RequestMapping("QnA_delete.do")
	public String QnA_delete(@RequestParam int qnanum) {
		
		adminService.QnA_delete(qnanum);
		
		return "redirect:/etc/QnA.do";
	}
	
	@RequestMapping("QnA_edit.do" )
	public ModelAndView QnA_edit(@RequestParam("qnanum")int qnanum, ModelAndView mav) {
		
		mav.setViewName("/admin/QnA_edit");
		mav.addObject("dto", etcService.detailProduct(qnanum));
		
		return mav;
	}
	
	@RequestMapping("QnA_update.do")
	public String QnA_update(@RequestParam("qnanum") int qnanum, QnADTO dto, RedirectAttributes redirect) {
		
		adminService.QnA_update(dto);
		
		redirect.addAttribute("qnanum", qnanum);
		
		return "redirect:/etc/detail.do";
		
	}


}
