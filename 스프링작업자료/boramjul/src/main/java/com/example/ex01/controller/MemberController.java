package com.example.ex01.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dto.MemberDTO;
import com.example.ex01.service.MemberService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	private static  final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService memberService;
		
	@RequestMapping("join.do")
	public String join() {	
		return "member/join";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		// dto멤버변수와 매개변수 이름이 같아야 자동으로 맵핑됨
		System.out.println("insert 실행됨");
		System.out.println("받아온 내용"+dto);
		memberService.insert(dto);
		return "redirect:/member/list.do";
	}
	
	////////////////////////////////////////////아래부터 조성현 작업 부분 입니다
	
	@RequestMapping("login.do")
	public String login( Model model) {
		
		model.addAttribute("message","nologin");
		return "member/login";
	}
	
	@RequestMapping("kakao_request.do" )
	public String kakao_request(@ModelAttribute MemberDTO dto, Model model) {
		model.addAttribute("dto",dto);
		System.out.println("dto: "+dto);
		System.out.println("test kakao request ");
			
		return "member/kakao_login";
	}
	
	@RequestMapping("naver_request.do" )
	public String naver_request() {
		System.out.println("test naver request ");
			
		return "member/naver_login";
	}
	
	@RequestMapping("login_result.do" ) //api용
	public String login_result(@ModelAttribute MemberDTO dto, Model model) {
		
		//회원이면 그대로 로그인, 회원 아니면 간편 회원가입 페이지로 이동하는거 짜야함
		//model.addAttribute("dto",dto);
		//System.out.println("dto: "+dto);
		
		if(dto.getSns()==3) {
			return "";
		} else if(dto.getSns()==4) {
			return "";
		} else {
			dto.setSns(1);
			return "member/loginOk";
		}
	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(	@ModelAttribute MemberDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 로그인 체크 처리하는 서비스 요청(세션값을 생성 시킴)
		String name = memberService.loginCheck(dto, session);
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
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		// session정보 모두 지우기
		// session.invalidate();
			
		session.removeAttribute("email");
		session.removeAttribute("name");
		
		logger.info("로그아웃");

		return "main";
	}

	@RequestMapping("update.do")
	public String update(@ModelAttribute MemberDTO dto, Model model) {
		System.out.println("update 내용: "+dto);
		memberService.update(dto);
		model.addAttribute("email",dto.getEmail());
		return "redirect:/mypage/myInfo.do";

	}

}

