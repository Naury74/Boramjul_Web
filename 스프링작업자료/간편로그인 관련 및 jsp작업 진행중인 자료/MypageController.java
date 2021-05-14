package com.example.ex01.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/mypage/*")
@Controller
public class MypageController {
	
	@RequestMapping("myList.do")
	public String myList( Model model) {

		return "mypage/myList";
	}
	
	@RequestMapping("myCart.do")
	public String myCart( Model model) {

		return "mypage/myCart";
	}
	
	@RequestMapping("myReview.do")
	public String myReview( Model model) {

		return "mypage/myReview";
	}
	
	@RequestMapping("myInfo.do")
	public String myInfo( Model model) {

		return "mypage/myInfo";
	}
	
	@RequestMapping("membership.do")
	public String membership( Model model) {

		return "mypage/membership";
	}

}
