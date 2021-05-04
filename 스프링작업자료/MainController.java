package com.example.ex01;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.RequestMapping;

// 스프링에서 관리하는 Controller임을 의미
@Controller
public class MainController {
	
	// URL 맵핑
	@RequestMapping("/")
	public String main(Model model) {
		System.out.println("요청 승인:");
		
		// request.setAttribute("","");		
		model.addAttribute("message","현재 테스트를 위한 작업 페이지입니다");
		
		// 포워딩 : 접두사: "/WEB-INF/views/"+"main"+ ".jsp"
		return "main";
	}
			
}
















