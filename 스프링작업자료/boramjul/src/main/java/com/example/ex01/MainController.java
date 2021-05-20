package com.example.ex01;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ex01.model.dto.ProductDTO;
import com.example.ex01.model.dto.BooklistDTO;

@Controller
public class MainController {
	
	// URL 맵핑
		@RequestMapping("/")
		public String main(Model model) throws IOException {

			String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
			
			ArrayList<BooklistDTO> mainbs_list = new ArrayList<BooklistDTO>();
			
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
		    	
		    	BooklistDTO dto = new BooklistDTO();
		    	dto.setImage(imgUrl.get(i));
		    	
		    	mainbs_list.add(dto);
		    	
		    	model.addAttribute("mainbslist",mainbs_list);

		    }
		    
			String URLNB = "http://www.kyobobook.co.kr/newproduct/newProductList.laf?orderClick=Ca1";
			
			ArrayList<BooklistDTO> mainnb_list = new ArrayList<BooklistDTO>();
			
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
		    	
		    	BooklistDTO dto = new BooklistDTO();
		    	dto.setImage(imgUrlNB.get(i));
		    	
		    	mainnb_list.add(dto);
		    	
		    	model.addAttribute("mainnblist",mainnb_list);

		    }
		    
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
		public String search(@ModelAttribute ProductDTO dto, Model model) {
			
			System.out.println(dto);
			model.addAttribute("dto",dto);
		
			return "webtest/searchedResults";
		}
		
		@RequestMapping("BestSellers.do")
		public String BestSellers( Model model) throws IOException {
			
		String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
		
		ArrayList<BooklistDTO> bs_list = new ArrayList<BooklistDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements name = doc.select(".title a strong");
        Elements content = doc.select(".author");
        Elements price = doc.select(".book_price");
        Elements image = doc.select(".cover a");
        
        for (int i = 0;i<image.size();i++){
        	String url = image.get(i).select("img").attr("src");
            if(!url.equals("")){
                imgUrl.add(url);
            }
        }
        
        for (int i=0; i<20; i++) {
        	
        	BooklistDTO dto = new BooklistDTO();
        	dto.setName(name.get(i).text());
        	dto.setContent(content.get(i).text());
        	dto.setPrice(price.get(i).text());
        	dto.setImage(imgUrl.get(i));
        	
        	bs_list.add(dto);
        	
        	model.addAttribute("bslist",bs_list);

        }
        	return "books/BestSellers";
		}
		
		@RequestMapping("NewBooks.do")
		public String NewBooks( Model model) throws IOException {
			
			String URL = "http://www.kyobobook.co.kr/newproduct/newProductList.laf?orderClick=Ca1";
			
			ArrayList<BooklistDTO> nb_list = new ArrayList<BooklistDTO>();
			
			ArrayList<String> imgUrl = new ArrayList<String>();
			
			
			Document doc = Jsoup.connect(URL).get();		
			
			Elements name = doc.select(".title a strong");
		    Elements content = doc.select(".author");
		    Elements price = doc.select(".sell_price");
		    Elements image = doc.select(".cover a");
		    
		    for (int i = 0;i<image.size();i++){
		    	String url = image.get(i).select("img").attr("src");
		        if(!url.equals("")){
		            imgUrl.add(url);
		        }
		    }
		    
		    for (int i=0; i<20; i++) {
		    	
		    	BooklistDTO dto = new BooklistDTO();
		    	dto.setName(name.get(i).text());
		    	dto.setContent(content.get(i).text());
		    	dto.setPrice(price.get(i).text());
		    	dto.setImage(imgUrl.get(i));
		 
		    	nb_list.add(dto);
		    	
		    	model.addAttribute("nblist",nb_list);
		 
		    }
		    
			return "books/NewBooks";
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
