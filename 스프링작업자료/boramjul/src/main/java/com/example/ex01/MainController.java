package com.example.ex01;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ex01.model.dto.BooksDTO;

@Controller
public class MainController {
	
	// URL 맵핑
		@RequestMapping("/")
		public String main(Model model) {
			System.out.println("요청 승인:");
			
			// 포워딩 : 접두사: "/WEB-INF/views/"+"main"+ ".jsp"
			return "main";
		}
		
		
		@RequestMapping("event.do")
		public String event( Model model) {

			return "etc/event";
		}
		
		@RequestMapping("QnA.do")
		public String QnA( Model model) {

			return "etc/QnA";
		}
		
		@RequestMapping("search.do")
		public String search(@ModelAttribute BooksDTO dto, Model model) {
			
			System.out.println(dto);
			model.addAttribute("dto",dto);
		
			return "webtest/searchedResults";
		}
		
		@RequestMapping("BestSellers.do")
		public String BestSellers( Model model) {

			return "Books/BestSellers";
		}
		
		@RequestMapping("NewBooks.do")
		public String NewBooks( Model model) {

			return "Books/NewBooks";
		}
		
		@RequestMapping("ReviewsList.do")
		public String ReviewsList( Model model) {

			return "Books/ReviewsList";
		}
		
		@RequestMapping("map.do")
		public String map( Model model) {

			return "etc/map";
		}

}
