package com.example.ex01.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/etc/*")
@Controller
public class EtcController {
	private static  final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("order.do")
	public String order() {
		return "etc/order";
	}
	
	@RequestMapping("completed.do")
	public String completed() {
		return "etc/completed";
	}
	
	
	

}
