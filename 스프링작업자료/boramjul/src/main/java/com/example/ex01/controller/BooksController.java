package com.example.ex01.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.ReviewDTO;
import com.example.ex01.service.AdminService;
import com.example.ex01.service.OrderService;
import com.example.ex01.service.ReviewService;

@RequestMapping("/books/*")
@Controller
public class BooksController {
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	AdminService adminService;
	
	@Inject
	OrderService orderService;
	
	
	
	@RequestMapping("BestSellers.do")
	public String BestSellers( Model model) throws IOException {
		
		String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
		
		ArrayList<BooksDTO> bs_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements prodname = doc.select(".title a strong");
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
        	BooksDTO dto = new BooksDTO();
        	
        	dto.setProdname(prodname.get(i).text());
        	dto.setContent(content.get(i).text());
        	dto.setImage(imgUrl.get(i));
        	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto.setPrice(price4);
        	
        	bs_list.add(dto);
        	        	
        	model.addAttribute("bslist",bs_list);
        }
        	return "books/BestSellers";
	}

	@RequestMapping("NewBooks.do")
	public String NewBooks( Model model) throws IOException  {

		String URL = "http://www.kyobobook.co.kr/newproduct/newProductList.laf?orderClick=Ca1";
		
		ArrayList<BooksDTO> nb_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements prodname = doc.select(".title strong");
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
	    	BooksDTO dto = new BooksDTO();
	    	dto.setProdname(prodname.get(i).text());
	    	dto.setContent(content.get(i).text());
	    	dto.setImage(imgUrl.get(i));
	    	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto.setPrice(price4);
        	
	    	nb_list.add(dto);
	    	
	    	model.addAttribute("nblist",nb_list);
	    }
	    
		return "books/NewBooks";
	}
	
	@RequestMapping("BookDetail.do")
	public String BookDetail(Model model, @ModelAttribute BooksDTO dto, @RequestParam String prodname) {
		
		System.out.println(prodname);
		model.addAttribute("booksdto", dto);
    	System.out.println("땡겨온 데이터: "+dto);
       
        return "books/BookDetail";
	}
	
	@RequestMapping("BookDetail_review.do")
	public ModelAndView BookDetail_review(Model model, ModelAndView mav, ReviewDTO dto, BooksDTO dto1, @RequestParam("prodnum") int prodnum) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ReviewDTO> list = reviewService.prod_review_list(prodnum);

		map.put("list", list);
		
		model.addAttribute("dto", adminService.prodnum_list(prodnum));
		System.out.println(dto1);
		
		System.out.println(list);
		mav.addObject("map",map);
		mav.addObject("score", reviewService.review_score(prodnum));
		mav.setViewName("/books/BookDetail_review");
		
		return mav;
		
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
	
		Elements prodname = doc.select(".title a strong");
		Elements content = doc.select(".author");
		Elements price = doc.select(".sell_price");
		Elements image = doc.select(".cover a");
	
		for (int i = 0;i<image.size();i++){
			String url = image.get(i).select("img").attr("src");
		    if(!url.equals("")){
		        imgUrl.add(url);
		    }
		}
	
		for (int i=0; i<20; i+=2) {
			BooksDTO dto = new BooksDTO();
			dto.setProdname(prodname.get(i).text());
			dto.setContent(content.get(i).text());
			dto.setImage(imgUrl.get(i));
			
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto.setPrice(price4);
        	
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
		
		Elements prodname = doc.select(".title a strong");
        Elements content = doc.select(".author");
        Elements price = doc.select(".org_price");
        Elements image = doc.select(".cover a");
        Elements score_review_contents = doc.select(".rating");
        
        for (int i = 0;i<image.size();i++){
        	String url = image.get(i).select("img").attr("src");
            if(!url.equals("")){
                imgUrl.add(url);
            }
        }
        
        for (int i=0; i<score_review_contents.size(); i++) {
        	BooksDTO dtoSR = new BooksDTO();
        	dtoSR.setProdname(prodname.get(i).text());
        	dtoSR.setContent(content.get(i).text());
        	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll(" 원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dtoSR.setPrice(price4);
        	
        	dtoSR.setImage(imgUrl.get(i));
        	
        	searched_list.add(dtoSR);
        	
        	model.addAttribute("searchedlist",searched_list);	
        }
		return "books/SearchedResults";
	}

	@RequestMapping("ReviewsList.do")
	public ModelAndView ReviewsList(ModelAndView mav) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ReviewDTO> review = reviewService.review_list();
		
		map.put("review", review);
		
		mav.addObject("map", map);
		mav.setViewName("/books/ReviewsList");

		return mav;
	}
	
	@RequestMapping("ReviewWrite.do")
	public String ReviewWrite( Model model, BooksDTO dto, @RequestParam("prodnum") int prodnum) {
		model.addAttribute("dto", adminService.prodnum_list(prodnum));
		
		return "books/ReviewWrite";
	}
	
	@RequestMapping("review_insert.do")
	public String review_insert(ReviewDTO dto, @RequestParam("prodnum") int prodnum) {
	
		reviewService.review_insert(dto); //리뷰 등록
		reviewService.review_count(prodnum); //상품의 리뷰 갯수 추가
		reviewService.review_score_insert(prodnum); //상품의 리뷰 점수 추가
		orderService.review_result(prodnum);//작성 유무
		
		return "redirect:/books/ReviewsList.do";
	}
	
	@RequestMapping("review_detail.do")
	public ModelAndView review_detail(@RequestParam("renum") int renum, @RequestParam("prodnum") int prodnum, ModelAndView mav) {
		reviewService.review_lookup(renum);
		
		System.out.println("renum: "+renum+", prodnum: "+prodnum);
		
		mav.setViewName("/books/ReviewView");
		mav.addObject("dto", reviewService.review_detail(renum));
		mav.addObject("score", reviewService.review_score(prodnum));

		return mav;
	}
	
	@RequestMapping("recom_update.do")
	public String review_com(@RequestParam("renum") int renum, @RequestParam("prodnum") int prodnum) {
		reviewService.review_recom(renum);
		
		return "redirect:/books/review_detail.do";
	}
	
	@RequestMapping("Review_update.do")
	public String Review_update(@RequestParam("renum") int renum, ReviewDTO dto, Model model) {
		
		model.addAttribute("dto", reviewService.review_detail(renum));

		return "books/ReviewUpdate";
	}
	
	@RequestMapping("Review_update_end.do")
	public String Review_update_end(@RequestParam("renum") int renum, @RequestParam("prodnum") int prodnum, ReviewDTO dto, RedirectAttributes redirect) {
		System.out.println("resum: "+renum+", prodnum: "+prodnum);
		
		reviewService.review_update(dto);
		
		redirect.addAttribute("renum", renum);
		redirect.addAttribute("prodnum", prodnum);
		
		return "redirect:/books/review_detail.do";
		
	}
	
	@RequestMapping("Review_delete.do")
	public String Review_delete (@RequestParam("renum") int renum, @RequestParam("prodnum") int prodnum) {
		
		reviewService.review_delete(renum);
		reviewService.review_count_delete(prodnum); //상품의 리뷰 갯수 삭제
		reviewService.review_score_delete(prodnum); //상품의 리뷰 점수 삭제
		orderService.review_result_delete(prodnum);//작성 유무 삭제
		
		return "redirect:/books/ReviewsList.do";
	}
		
	
	
	
}
