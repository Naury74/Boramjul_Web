package com.example.ex01.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.ex01.model.dto.BooksDTO;

@RequestMapping("/books/*")
@Controller
public class BooksController {
	
	@RequestMapping("BestSellers.do")
	public String BestSellers( Model model) throws IOException {
		
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
        	String prodnum = LinkList.replaceAll("http://www.kyobobook.co.kr/product/detailViewKor.laf\\?mallGb=KOR&ejkGb=KOR&barcode=", "");
        	dto.setProdnum(prodnum);
        	
        	bs_list.add(dto);
        	        	
        	model.addAttribute("bslist",bs_list);
        	
        	//System.out.println("dto: "+dto);

        }
        
        	return "books/BestSellers";
	}
	

	@RequestMapping("NewBooks.do")
	public String NewBooks( Model model)throws IOException  {

		String URL = "http://www.kyobobook.co.kr/newproduct/newProductList.laf?orderClick=Ca1";
		
		ArrayList<BooksDTO> nb_list = new ArrayList<BooksDTO>();
		
		ArrayList<String> imgUrl = new ArrayList<String>();
		
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements name = doc.select(".title a strong");
	    Elements content = doc.select(".author");
	    Elements price = doc.select(".sell_price");
	    Elements image = doc.select(".cover a");
	    Elements link = doc.select(".cover");
	    
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
        	String prodnum = LinkList.replaceAll("http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&linkClass=", "");
//        	                                   
        	dto.setProdnum(prodnum);
        	
        	System.out.println(prodnum);

	 
	    	nb_list.add(dto);
	    	
	    	model.addAttribute("nblist",nb_list);
	    }
	    
		return "books/NewBooks";
	}
	
	
	@RequestMapping("BookDetail.do")
	public String BookDetail( Model model, HttpServletRequest request) throws IOException {
		
		// 바코드 받기
		
		String page = request.getParameter("prodnum");
		
		String URL = "http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode="+page; //크롤링할 url지정
//		              http://www.kyobobook.co.kr/product/detailViewKor.laf?mallGb=KOR&ejkGb=KOR&barcode=9791191347180
		ArrayList<BooksDTO> detail_list = new ArrayList<BooksDTO>();
		
		Document doc = Jsoup.connect(URL).get();		
		
		Elements name = doc.select(".box_detail_point h1 strong");
        Elements content = doc.select(".author");
        Elements price = doc.select(".sell_price");
        Elements image = doc.select(".cover a");
//        Elements detail = doc.select(".desc");
        
//        System.out.println("name: "+name+"detail: "+detail);
        
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
    	
//   	dto.setDetail(detail.get(0).text());
//    	<div class="desc">
//			오늘과 내일의 도시
//			<br>
//			<br>「뉴욕타임스」 칼럼니스트 토머스 프리드먼의 말처럼 세계는 이제 ‘코로나 이전BC, Before Corona’과 ‘코로나 이후AC, After Corona’로 나뉘게 될지도 모른다. 기간이나 감염자, 사망자 수 모두 우리의 예상을 훨씬 뛰어 넘었다. 지난 1년간 많은 것이 변했고, 2021년에도 그 흐름은 이어질 것이다. 우리가 누리던 일상의 공간들과 단절되었고, 많은 이(특히 젊은 직장인들)에게 잠자는 기능이 가장 컸던 집은 이제 가장 오래 머무는 곳이 되었다. 그만큼 공간에 대한 관심이 커졌다. 이 책은 집, 직장, 학교, 상업 시설, 공원, 종교 시설 등이 어떻게 바뀌었고 어떻게 바뀌어 갈 것인지 그리고 어떻게 바뀌어야 하는지 이야기한다. 단순한 공간 이야기에 그치지 않고 학교 건물을 이야기할 때는 더 나은 교육을 위한 고민이 담겨 있고, 주거를 이야기할 때는 더 많은 사람이 내 집을 마련할 수 있는 방법까지 고민한다. 주거부터 국토 균형 발전까지, 우리 공간에 대한 다양한 이야기와 건축가로서의 진단, 비판, 바람이 담겨 있다. 
//			<br>
//			<br>"시대가 급변하고 위기의 시간이 오면 미래에 대해 이야기하는 온갖 선지자들이 등장한다. 그중 상당수는 후대에 거짓 선지자로 판명될 것이다. 워낙에 많은 변수가 있기 때문에 미래를 예측한다는 것은 사실상 불가능하다. 따라서 나 역시 거짓 선지자 중 한 명이 될 수도 있다. 그런 위험을 감수하더라도 이 책을 내놓는 것은 더 다양한 전공의 사람들이 다각도에서 예측할수록 사회가 올바른 방향으로 갈 가능성이 높아진다고 믿기 때문이다."    
//			<br>- ‘여는 글’ 중에서
//			<br>
//			<br>미래는 꿈꾸는 자들이 만든다
//			<br>
//			<br>마당 같은 발코니가 있는 아파트, 아이들 각각에 맞는 맞춤 교육 과정이 있는 학교, 지역과 지역을 이어 주는 선형 공원, 분산된 거점 오피스로 나눠진 회사, 내 집 가까이에 있는 작은 공원과 도서관, 자율 주행 전용 지하 물류 터널, DMZ 평화 도시
//			<br>
//			<br>고개가 끄덕여지며 바로 적용될 것만 같은 이야기도 있지만, ‘DMZ 평화 도시’처럼 이게 될까 싶은 이야기도 있다. 하지만 이야기 끝에 저자는 힘주어 말한다. 미래는 꿈꾸는 자들이 만든다고. 소수를 위한 디스토피아가 아닌, 함께 행복한 유토피아는 멀리 있지 않다. 이 책은 그 작은 걸음들의 시작을 위한 고민의 결과다.
//		</div>
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
	
			list.add(dto);
			
			model.addAttribute("list", list);
	
		}
		return "books/category";
	}
	
	@RequestMapping("search.do")
	public String search(@ModelAttribute BooksDTO dto, String search,  Model model) throws IOException {
		System.out.println(dto);
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
        	dtoSR.setImage(imgUrl.get(i));
        	
        	String price1 = (price.get(i).text());
        	String price2 = price1.replaceAll("원", "");
        	String price3 = price2.replaceAll(",", "");
        	int price4 = Integer.parseInt(price3);
        	dto.setPrice(price4);
        	
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
