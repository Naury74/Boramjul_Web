package com.example.ex01.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.ex01.service.MemberService;

@RequestMapping("/mypage/*")
@Controller
public class MypageController {
	private static  final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("myList.do")
	public String myList() {
		return "mypage/myList";
	}
	
	@RequestMapping("myCart.do")
	public String myCart() {
		return "mypage/myCart";
	}
	
	@RequestMapping("myReview.do")
	public String myReview() {
		return "mypage/myReview";
	}
	
	@RequestMapping("myInfo.do")
	public String myInfo(@RequestParam String email, Model model) {
		model.addAttribute("dto", memberService.myInfo(email));
		return "mypage/myInfo";
	}
	
	@RequestMapping("membership.do")
	public String membership(@RequestParam String email, Model model) {
		model.addAttribute("dto", memberService.myInfo(email));
		
		return "mypage/membership";
	}

}
