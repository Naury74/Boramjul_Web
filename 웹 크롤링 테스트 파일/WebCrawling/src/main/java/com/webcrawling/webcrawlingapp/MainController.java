package com.webcrawling.webcrawlingapp;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.webcrawling.webcrawlingapp.model.book.BooklistDTO;


@Controller
public class MainController {
	@RequestMapping(value = "/BestSellers", method = RequestMethod.GET)
	
		public String BestSellers(Model model) throws IOException {
			
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
        	
//        	System.out.println(i+"��: "+imgUrl.get(i));

        	bs_list.add(dto);
        	
        	model.addAttribute("bslist",bs_list);
        	
//        model.addAttribute("test1", title_contents.get(i).text());
//        model.addAttribute("test2", author_contents.get(i).text());
//        model.addAttribute("test4", price_contents.get(i).text());
//        model.addAttribute("test6", ImageGroupList.get(i).select("img").attr("src"));
        
        
        }
        
		
		return "BestSellers";		
	}
	
	@RequestMapping(value = "/NewBooks", method = RequestMethod.GET)
	
	public String NewBooks(Model model) throws IOException {
		
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
    	
	return "NewBooks";		
}
	
	@RequestMapping(value = "/Category-Novel", method = RequestMethod.GET)
	
	public String Novel(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=01&menuCode=002";
	
	ArrayList<BooklistDTO> novel_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	novel_list.add(dto);
    	
    	model.addAttribute("novellist",novel_list);
 
    }
    	
	return "Novel";		
}
	
	@RequestMapping(value = "/Category-Essay", method = RequestMethod.GET)
	
	public String Essay(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=03&menuCode=002";
	
	ArrayList<BooklistDTO> essay_list = new ArrayList<BooklistDTO>();
	
	ArrayList<String> imgUrl = new ArrayList<String>();
	
	
	Document doc = Jsoup.connect(URL).get();		
	
	Elements name = doc.select(".title a strong");
    Elements content = doc.select(".author");
    Elements price = doc.select(".sell_price");
    Elements image = doc.select(".cover a");
    
    for (int i = 0; i<image.size(); i++){
    	String url = image.get(i).select("img").attr("src");
        if(!url.equals("")){
            imgUrl.add(url);
        }
    }
    
    for (int i=0; i<20; i+=2) {
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	essay_list.add(dto);
    	
    	model.addAttribute("essaylist",essay_list);
 
    }
    	
	return "Essay";		
}
	

	@RequestMapping(value = "/Category-Economy", method = RequestMethod.GET)
	
	public String Economy(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=13&menuCode=002";
	
	ArrayList<BooklistDTO> economy_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	economy_list.add(dto);
    	
    	model.addAttribute("economylist",economy_list);
 
    }
    	
	return "Economy";		
}
	
	@RequestMapping(value = "/Category-SelfHelp", method = RequestMethod.GET)
	
	public String SelfHelp(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=15&menuCode=002";
	
	ArrayList<BooklistDTO> selfhelp_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	selfhelp_list.add(dto);
    	
    	model.addAttribute("selphelplist",selfhelp_list);
 
    }
    	
	return "SelfHelp";		
}
	
	@RequestMapping(value = "/Category-Humanities", method = RequestMethod.GET)
	
	public String Humanities(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=05&menuCode=002";
	
	ArrayList<BooklistDTO> humanities_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	humanities_list.add(dto);
    	
    	model.addAttribute("humanitieslist",humanities_list);
 
    }
    	
	return "Humanities";		
}
	
	@RequestMapping(value = "/Category-History", method = RequestMethod.GET)
	
	public String History(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=19&menuCode=002";
	
	ArrayList<BooklistDTO> history_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	history_list.add(dto);
    	
    	model.addAttribute("historylist",history_list);
 
    }
    	
	return "History";	
	
}
	
	@RequestMapping(value = "/Category-Religion", method = RequestMethod.GET)
	
	public String Religion(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=21&menuCode=002";
	
	ArrayList<BooklistDTO> religion_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	religion_list.add(dto);
    	
    	model.addAttribute("religionlist",religion_list);
 
    }
    	
	return "Religion";

}	
	
	@RequestMapping(value = "/Category-Politics", method = RequestMethod.GET)
	
	public String Politics(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=17&menuCode=002";
	
	ArrayList<BooklistDTO> politics_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	politics_list.add(dto);
    	
    	model.addAttribute("politicslist",politics_list);
 
    }
    	
	return "Politics";
	
}
	@RequestMapping(value = "/Category-Art", method = RequestMethod.GET)
	
	public String Art(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=23&menuCode=002";
	
	ArrayList<BooklistDTO> art_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	art_list.add(dto);
    	
    	model.addAttribute("artlist",art_list);
 
    }
    	
	return "Art";
	
}
	
	@RequestMapping(value = "/Category-Science", method = RequestMethod.GET)
	
	public String Science(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=29&menuCode=002";
	
	ArrayList<BooklistDTO> science_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	science_list.add(dto);
    	
    	model.addAttribute("sciencelist",science_list);
 
    }
    	
	return "Science";
	
}
	@RequestMapping(value = "/Category-Technology", method = RequestMethod.GET)
	
	public String Technology(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=26&menuCode=002";
	
	ArrayList<BooklistDTO> technology_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	technology_list.add(dto);
    	
    	model.addAttribute("technologylist",technology_list);
 
    }
    	
	return "Technology";
	
}
	@RequestMapping(value = "/Category-IT", method = RequestMethod.GET)
	
	public String IT(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=33&menuCode=002";
	
	ArrayList<BooklistDTO> it_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	it_list.add(dto);
    	
    	model.addAttribute("itlist",it_list);
 
    }
    	
	return "IT";
	
}
	
	@RequestMapping(value = "/Category-Toddler", method = RequestMethod.GET)
	
	public String Toddler(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=41&menuCode=002";
	
	ArrayList<BooklistDTO> toddler_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	toddler_list.add(dto);
    	
    	model.addAttribute("toddlerlist",toddler_list);
 
    }
    	
	return "Toddler";
	
}
	@RequestMapping(value = "/Category-Children", method = RequestMethod.GET)
	
	public String Children(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=42&menuCode=002";
	
	ArrayList<BooklistDTO> children_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	children_list.add(dto);
    	
    	model.addAttribute("childrenlist",children_list);
 
    }
    	
	return "Children";
	
}
	
	@RequestMapping(value = "/Category-ChildrenComp", method = RequestMethod.GET)
	
	public String ChildrenComp(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=51&menuCode=002";
	
	ArrayList<BooklistDTO> childrencomp_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	childrencomp_list.add(dto);
    	
    	model.addAttribute("childrencomplist",childrencomp_list);
 
    }
    	
	return "ChildrenComp";
	
}
	@RequestMapping(value = "/Category-Teenager", method = RequestMethod.GET)
	
	public String Teenager(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=38&menuCode=002";
	
	ArrayList<BooklistDTO> teenager_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	teenager_list.add(dto);
    	
    	model.addAttribute("teenagerlist",teenager_list);
 
    }
    	
	return "Teenager";
	
}
	@RequestMapping(value = "/Category-ChildrenEng", method = RequestMethod.GET)
	
	public String ChildrenEng(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=45&menuCode=002";
	
	ArrayList<BooklistDTO> childreneng_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	childreneng_list.add(dto);
    	
    	model.addAttribute("childrenenglist",childreneng_list);
 
    }
    	
	return "ChildrenEng";
	
}

	@RequestMapping(value = "/Category-Elementary", method = RequestMethod.GET)
	
	public String Elementary(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=39&menuCode=002";
	
	ArrayList<BooklistDTO> elementary_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	elementary_list.add(dto);
    	
    	model.addAttribute("elementarylist",elementary_list);
 
    }
    	
	return "Elementary";
	
}
	@RequestMapping(value = "/Category-MiddleHigh", method = RequestMethod.GET)
	
	public String MiddleHigh(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=25&menuCode=002";
	
	ArrayList<BooklistDTO> middlehigh_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	middlehigh_list.add(dto);
    	
    	model.addAttribute("middlehighlist",middlehigh_list);
 
    }
    	
	return "MiddleHigh";
	
}
	@RequestMapping(value = "/Category-University", method = RequestMethod.GET)
	
	public String University(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=50&menuCode=001";
	
	ArrayList<BooklistDTO> university_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	university_list.add(dto);
    	
    	model.addAttribute("universitylist",university_list);
 
    }
    	
	return "University";
	
}
	@RequestMapping(value = "/Category-OpenUniversity", method = RequestMethod.GET)
	
	public String OpenUniversity(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?pageNumber=1&perPage=20&mallGb=KOR&linkClass=0551&ejkGb=&sortColumn=&menuCode=002";
	
	ArrayList<BooklistDTO> openuniversity_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	openuniversity_list.add(dto);
    	
    	model.addAttribute("openuniversitylist",openuniversity_list);
 
    }
    	
	return "OpenUniversity";
	
}
	@RequestMapping(value = "/Category-Comics", method = RequestMethod.GET)
	
	public String Comics(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=47&menuCode=002";
	
	ArrayList<BooklistDTO> comics_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	comics_list.add(dto);
    	
    	model.addAttribute("comicslist",comics_list);
 
    }
    	
	return "Comics";
	
}
	@RequestMapping(value = "/Category-Korea", method = RequestMethod.GET)
	
	public String Korea(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=53&menuCode=002";
	
	ArrayList<BooklistDTO> korea_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	korea_list.add(dto);
    	
    	model.addAttribute("korealist",korea_list);
 
    }
    	
	return "Korea";
	
}
	
	@RequestMapping(value = "/Category-Job", method = RequestMethod.GET)
	
	public String JOB(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=31&menuCode=002";
	
	ArrayList<BooklistDTO> job_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	job_list.add(dto);
    	
    	model.addAttribute("joblist",job_list);
 
    }
    	
	return "Job";
	
}
	
	@RequestMapping(value = "/Category-Language", method = RequestMethod.GET)
	
	public String Language(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=27&menuCode=002";
	
	ArrayList<BooklistDTO> language_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	language_list.add(dto);
    	
    	model.addAttribute("languagelist",language_list);
 
    }
    	
	return "Language";
	
}
	@RequestMapping(value = "/Category-Family", method = RequestMethod.GET)
	
	public String Family(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=07&menuCode=002";
	
	ArrayList<BooklistDTO> family_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	family_list.add(dto);
    	
    	model.addAttribute("familylist",family_list);
 
    }
    	
	return "Family";
	
}
	@RequestMapping(value = "/Category-Health", method = RequestMethod.GET)
	
	public String Health(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=09&menuCode=002";
	
	ArrayList<BooklistDTO> health_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	health_list.add(dto);
    	
    	model.addAttribute("healthlist",health_list);
 
    }
    	
	return "Health";
	
}
	@RequestMapping(value = "/Category-Travel", method = RequestMethod.GET)
	
	public String Travel(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=32&menuCode=002";
	
	ArrayList<BooklistDTO> travel_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	travel_list.add(dto);
    	
    	model.addAttribute("travellist",travel_list);
 
    }
    	
	return "Travel";
	
}
	@RequestMapping(value = "/Category-Cooking", method = RequestMethod.GET)
	
	public String Cooking(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=08&menuCode=002";
	
	ArrayList<BooklistDTO> cooking_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	cooking_list.add(dto);
    	
    	model.addAttribute("cookinglist",cooking_list);
 
    }
    	
	return "Cooking";
	
}
	@RequestMapping(value = "/Category-Hobby", method = RequestMethod.GET)
	
	public String Hobby(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=11&menuCode=002";
	
	ArrayList<BooklistDTO> hobby_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	hobby_list.add(dto);
    	
    	model.addAttribute("hobbylist",hobby_list);
 
    }
    	
	return "Hobby";
	
}
	@RequestMapping(value = "/Category-Magazine", method = RequestMethod.GET)
	
	public String Magazine(Model model) throws IOException {
		
	String URL = "http://www.kyobobook.co.kr/categoryRenewal/categoryMain.laf?perPage=20&mallGb=KOR&linkClass=35&menuCode=002";
	
	ArrayList<BooklistDTO> magazine_list = new ArrayList<BooklistDTO>();
	
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
    	
    	BooklistDTO dto = new BooklistDTO();
    	dto.setName(name.get(i).text());
    	dto.setContent(content.get(i).text());
    	dto.setPrice(price.get(i).text());
    	dto.setImage(imgUrl.get(i));
 
    	magazine_list.add(dto);
    	
    	model.addAttribute("magazinelist",magazine_list);
 
    }
    	
	return "Magazine";
	
}
}