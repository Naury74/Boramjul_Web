package com.example.ex01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dto.QnADTO;
import com.example.ex01.service.EtcService;

@RequestMapping("/etc/*")
@Controller
public class EtcController {
	private static  final Logger logger = LoggerFactory.getLogger(EtcController.class);
	
	@Inject
	EtcService etcService;
	
	@RequestMapping("order.do")
	public String order() {
		return "etc/order";
	}
	
	@RequestMapping("completed.do")
	public String completed() {
		return "etc/completed";
	}
	
	@RequestMapping("map.do")
	public String map( Model model) {

		return "etc/map";
	}
	
	@RequestMapping("event.do")
	public String event( Model model) {

		return "etc/event";
	}
	
	@RequestMapping("QnA.do")
	public ModelAndView QnA(HttpSession session, ModelAndView mav, QnADTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<QnADTO> list = etcService.QnAlist();
		
		map.put("list", list);
		
		mav.addObject("map", map);
		mav.setViewName("/etc/QnA");
		
		return mav;


	}

	
	@RequestMapping("faqbutton.do")
	public String faqbutton( Model model) {

		return "etc/faqbutton";
	}
	
	
	

}
