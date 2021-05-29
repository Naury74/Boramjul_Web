package com.example.ex01.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.service.AdminService;

@RequestMapping("/books/*")
@Controller
public class BooksController {
	
	
	@RequestMapping("BestSellers.do")
	public String BestSellers( Model model, @ModelAttribute BooksDTO dto) throws IOException {
		
		String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
		
		ArrayList<BooksDTO> bs_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements name = doc.select(".title a strong");
        Elements content = doc.select(".author");
        Elements price = doc.select(".book_price");
        Elements image = doc.select(".cover a");
        Elements link = doc.select(".cover");
        
        for (int i = 0;i<image.size();i++){
        	String url = image.get(i).select("img").attr("src");
            if(!url.equals("")){
                imgUrl.add(url);
            }
        }
        
        for (int i=0; i<20; i++) {
        	BooksDTO dto1 = new BooksDTO();
        	dto1.setName(name.get(i).text());
        	dto1.setContent(content.get(i).text());
        	dto1.setImage(imgUrl.get(i));
        	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto1.setPrice(price4);
        	
        	String LinkList = link.get(i+1).select("a").attr("href");
        	String prodnum = LinkList.replaceAll("http://www.kyobobook.co.kr/product/detailViewKor.laf\\?mallGb=KOR&ejkGb=KOR&barcode=", "");
	    	//System.out.println("링크리스트: "+LinkList+"proudnum: "+prodnum);
        	dto1.setProdnum(prodnum);
        	
        	bs_list.add(dto1);
        	        	
        	model.addAttribute("bslist",bs_list);
        	//System.out.println("dto: "+dto);
        }
        	return "books/BestSellers";
	}

	@RequestMapping("NewBooks.do")
	public String NewBooks( Model model)throws IOException  {

		//String URL = "http://www.kyobobook.co.kr/newproduct/newProductList.laf?orderClick=Ca1";
		String URL = "http://digital.kyobobook.co.kr/digital/publicview/publicViewNew.ink?tabType=EBOOK&tabSrnb=12";
		
		ArrayList<BooksDTO> nb_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements name = doc.select(".title strong");
	    Elements content = doc.select(".n1, co1, n2");
	    Elements price = doc.select(".cost span");
	    Elements image = doc.select(".pic_area img");
	    Elements link = doc.select(".pic_area a");
	    
	    for (int i = 0;i<image.size();i++){
	    	String url = image.get(i).select("img").attr("src");
	        if(!url.equals("")){
	            imgUrl.add(url);
	        }
	    }
	    
	    for (int i=0; i<20; i++) {
	    	BooksDTO dto = new BooksDTO();
	    	dto.setName(name.get(i).text());
	    	dto.setContent(content.get(i).text());
	    	dto.setImage(imgUrl.get(i));
	    	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto.setPrice(price4);
	    	
	    	String LinkList = link.get(i+1).select("a").attr("href");
        	//String prodnum = LinkList.replaceAll(" javascript:goDetailView('KOR','090911', ", "");
  	        String prodnum = LinkList.substring(LinkList.indexOf("barcode=")+8);
	    	System.out.println("링크리스트: "+LinkList+"proudnum: "+prodnum);
        	
        	dto.setProdnum(prodnum);
        	
	    	nb_list.add(dto);
	    	
	    	model.addAttribute("nblist",nb_list);
	    }
	    
		return "books/NewBooks";
	}
	
	@RequestMapping("BookDetail.do")
	public String BookDetail( Model model, HttpServletRequest request) throws IOException {
		
		String page = request.getParameter("prodnum");
		
		String URL = "http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode="+page; //크롤링할 url지정
		
		ArrayList<BooksDTO> detail_list = new ArrayList<BooksDTO>();
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements name = doc.select(".box_detail_point h1 strong");
        Elements content = doc.select(".author");
        Elements price = doc.select(".sell_price");
        Elements image = doc.select(".cover a");
        
        String url_detail = image.get(0).select("img").attr("src");
        
        BooksDTO dto = new BooksDTO();
        dto.setName(name.get(0).text());
    	dto.setContent(content.get(0).text());
    	dto.setImage(url_detail);
    	
    	String price1 = (price.get(0).text());
    	String price2 = price1.replaceAll("원", "");
    	String price3 = price2.replaceAll(",", "");
    	int price4 = Integer.parseInt(price3);
    	dto.setPrice(price4);
    	
    	detail_list.add(dto);
    	
    	model.addAttribute("detaillist",detail_list);    
    	
    	System.out.println("크롤링된 데이터: "+dto);
       
        return "books/BookDetail";
	}
	
	
	@RequestMapping("/{category}.do")
	public String category(@PathVariable("category") String category, Model model) throws IOException{
		
		String URL = "";
		System.out.println(category);
		
		switch (category) {
		case "Novel":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=01&menuCode=002";
			break;
		case "Essay":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=03&menuCode=002";
			break;
		case "Economy":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=13&menuCode=002";
			break;
		case "SelfHelp":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=15&menuCode=002";
			break;
		case "Humanities":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=05&menuCode=002";
			break;
		case "History":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=19&menuCode=002";
			break;
		case "Religion":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=21&menuCode=002";
			break;
		case "Politics":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=17&menuCode=002";
			break;
		case "Art":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=23&menuCode=002";
			break;
		case "Science":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=29&menuCode=002";
			break;
		case "Technology":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=26&menuCode=002";
			break;
		case "IT":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=33&menuCode=002";
			break;
		case "Toddler":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=41&menuCode=002";
			break;
		case "Children":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=42&menuCode=002";
			break;
		case "ChildrenComp":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=51&menuCode=002";
			break;
		case "Teenager":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=38&menuCode=002";
			break;
		case "ChildrenEng":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=45&menuCode=002";
			break;
		case "Elementary":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=39&menuCode=002";
			break;
		case "MiddleHigh":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=25&menuCode=002";
			break;
		case "University":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=50&menuCode=001";
			break;
		case "OpenUniversity":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?pageNumber=1&perPage=20&mallGb=KOR&linkClass=0551&ejkGb=&sortColumn=&menuCode=002";
			break;
		case "Comics":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=47&menuCode=002";
			break;
		case "Korea":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=53&menuCode=002";
			break;
		case "Job":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=31&menuCode=002";
			break;
		case "Language":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=27&menuCode=002";
			break;
		case "Family":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=07&menuCode=002";
			break;
		case "Health":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=09&menuCode=002";
			break;
		case "Travel":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=32&menuCode=002";
			break;
		case "Cooking":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=08&menuCode=002";
			break;
		case "Hobby":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=11&menuCode=002";
			break;
		case "Magazine":
			URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=35&menuCode=002";
			break;
		}
		
		ArrayList<BooksDTO> list = new ArrayList<BooksDTO>();
	
		ArrayList<String> imgUrl = new ArrayList<String>();
	
		Document doc = Jsoup.connect(URL).get();		
	
		Elements name = doc.select(".title a strong");
		Elements content = doc.select(".author");
		Elements price = doc.select(".sell_price");
		Elements image = doc.select(".cover a");
       // Elements link = doc.select(".cover");
	
		for (int i = 0;i<image.size();i++){
			String url = image.get(i).select("img").attr("src");
		    if(!url.equals("")){
		        imgUrl.add(url);
		    }
		}
	
		for (int i=0; i<20; i+=2) {
			BooksDTO dto = new BooksDTO();
			dto.setName(name.get(i).text());
			dto.setContent(content.get(i).text());
			dto.setImage(imgUrl.get(i));
			
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto.setPrice(price4);
        	
//        	String LinkList = link.get(i+0).select("a").attr("href");
//        	String prodnum = LinkList.substring(LinkList.indexOf("barcode=")+8);
//	    	System.out.println("링크리스트: "+LinkList+"proudnum: "+prodnum);
//        	dto.setProdnum(prodnum);
	
			list.add(dto);
			
			model.addAttribute("list", list);
	
		}
		return "books/category";
	}
	
	@RequestMapping("search.do")
	public String search(@ModelAttribute BooksDTO dto, String search,  Model model) throws IOException {
		
		model.addAttribute("dto",dto);
		System.out.println("검색어:"+search);

		String URL = "https://search.kyobobook.co.kr/web/search?vPstrKeyWord=" + search;

		ArrayList<BooksDTO> searched_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		Document doc = Jsoup.connect(URL).get();
		
		Elements name = doc.select(".title a strong");
        Elements content = doc.select(".author");
        Elements price = doc.select(".org_price");
        Elements image = doc.select(".cover a");
        Elements link = doc.select(".cover");
        Elements score_review_contents = doc.select(".rating");
        
        for (int i = 0;i<image.size();i++){
        	String url = image.get(i).select("img").attr("src");
            if(!url.equals("")){
                imgUrl.add(url);
            }
        }
        
        for (int i=0; i<score_review_contents.size(); i++) {
        	BooksDTO dtoSR = new BooksDTO();
        	dtoSR.setName(name.get(i).text());
        	dtoSR.setContent(content.get(i).text());
        	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll(" 원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dtoSR.setPrice(price4);
        	
        	String LinkList = link.get(i+0).select("a").attr("href");
        	String prodnum = LinkList.substring(LinkList.indexOf("barcode=")+8);
	    	System.out.println("링크리스트: "+LinkList+"proudnum: "+prodnum);
        	dtoSR.setProdnum(prodnum);
        	
        	dtoSR.setImage(imgUrl.get(i));
        	
        	searched_list.add(dtoSR);
        	
        	model.addAttribute("searchedlist",searched_list);	
        }
		return "books/SearchedResults";
	}

	@RequestMapping("ReviewsList.do")
	public String ReviewsList( Model model) {

		return "books/ReviewsList";
	}
	
	@RequestMapping("ReviewWrite.do")
	public String ReviewWrite( Model model) {

		return "books/ReviewWrite";
	}
	@RequestMapping("ReviewView.do")
	public String ReviewView( Model model) {

		return "books/ReviewView";
	}
}
