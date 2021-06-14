package com.example.ex01;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ex01.model.dto.BooksDTO;

@Controller
public class MainController {
	
	@RequestMapping("/")
	public String main(Model model) throws IOException {
		
		System.out.println("요청 승인");
		
		String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
		
		ArrayList<BooksDTO> mainbs_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements image = doc.select(".cover a");
	    
	    for (int i = 0;i<image.size();i++){
	    	String url = image.get(i).select("img").attr("src");
	        if(!url.equals("")){
	            imgUrl.add(url);
	        }
	    }
	    
	    for (int i=0; i<4; i++) {
	    	
	    	BooksDTO dto = new BooksDTO();
	    	dto.setImage(imgUrl.get(i));
	    	
	    	mainbs_list.add(dto);
	    	
	    	model.addAttribute("mainbslist",mainbs_list);

	    }
	    
		String URLNB = "http://www.kyobobook.co.kr/newproduct/newProductList.laf?orderClick=Ca1";
		
		ArrayList<BooksDTO> mainnb_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrlNB = new ArrayList<String>();
		
		
		Document docNB = Jsoup.connect(URLNB).get();		
		
		Elements imageNB = docNB.select(".cover a");
	    
	    for (int i = 0;i<imageNB.size();i++){
	    	String url = imageNB.get(i).select("img").attr("src");
	        if(!url.equals("")){
	            imgUrlNB.add(url);
	        }
	    }
	    
	    for (int i=0; i<4; i++) {
	    	
	    	BooksDTO dto = new BooksDTO();
	    	dto.setImage(imgUrlNB.get(i));
	    	
	    	mainnb_list.add(dto);
	    	
	    	model.addAttribute("mainnblist",mainnb_list);

	    }
	    
		return "main";
	}

}
