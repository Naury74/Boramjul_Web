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
	
	@RequestMapping("join1.do")
	public String join1() {	
		return "member/join1";
	}
	
	@RequestMapping("join1_1.do")
	public String join1_1() {	
		return "member/join1_1";
	}
	
	@RequestMapping("join1_2.do")
	public String join1_2() {	
		return "member/join1_2";
	}
	
	@RequestMapping("joinok.do")
	public String joinok(@ModelAttribute MemberDTO dto, Model model) {	
		model.addAttribute("dto",dto);
		return "member/joinok";
	}
	
	@RequestMapping("findemail.do")
	public String findemail() {	
		return "member/findemail";
	}
	
	@RequestMapping("findemailok.do")
    public String findemailok(@RequestParam String phone, Model model) {
        model.addAttribute("dto", memberService.findemail(phone));
        return "member/findemailok";
    }
	
	@RequestMapping("findpwd.do")
	public String findpwd() {	
		return "member/findpwd";
	}
	
	@RequestMapping("findpwdok.do")
	public String findpwdok(@RequestParam String email, Model model) {	
		model.addAttribute("dto", memberService.findpwd(email));
		return "member/findpwdok";
	}	
		
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		
		dto.setSns(1);
		System.out.println("insert 받아온 내용"+dto);
		
		memberService.insert(dto);
		
		return "redirect:/member/joinok.do";
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
		System.out.println("dto1: "+dto);
		System.out.println("test kakao request ");
			
		return "redirect:api_login_check.do";
	}
	
	@RequestMapping("naver_request.do" )
	public String naver_request() {
		System.out.println("test naver request ");
			
		return "member/naver_login";
	}
	
	@RequestMapping("api_login_check.do" ) //api용
	public ModelAndView login_api(@ModelAttribute MemberDTO dto, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("dto2: "+dto);
		String name = memberService.apiloginCheck(dto, session);
		logger.info("name: "+name);
		if (name != null) {// 로그인 성공시  session값을 생성해서 home페이지로 이동
			mav.setViewName("main");
		} else {
			// 로그인 실패시 에러 메시지와 함께 로그인 페이지로 이동
			mav.setViewName("member/join");
			mav.addObject("message","error");
		}
		return mav;

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

