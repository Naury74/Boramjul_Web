package com.webcrawling.webcrawlingapp;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class HomeController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
    			 
		public String function(Model model) throws IOException {
			
		String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
		
				
		Document doc = Jsoup.connect(URL).get();		
		
		Elements title_contents = doc.select(".title a strong");
        Elements author_contents = doc.select(".author");
        Elements price_contents = doc.select(".book_price");
        Elements ImageGroupList = doc.select(".cover a");
        
        for (int i=0; i<20; i++) {        
        model.addAttribute("test1", title_contents.get(i).text());
        model.addAttribute("test2", author_contents.get(i).text());
        model.addAttribute("test4", price_contents.get(i).text());
        model.addAttribute("test6", ImageGroupList.get(i).select("img").attr("src"));
        }
        
		
		return "home";		
	}
	
}