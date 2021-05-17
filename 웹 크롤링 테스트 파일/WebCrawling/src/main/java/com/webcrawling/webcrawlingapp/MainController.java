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

import com.webcrawling.webcrawlingapp.model.book.NewBooksDTO;
import com.webcrawling.webcrawlingapp.model.book.ArtDTO;
import com.webcrawling.webcrawlingapp.model.book.BestSellersDTO;
import com.webcrawling.webcrawlingapp.model.book.ChildrenCompDTO;
import com.webcrawling.webcrawlingapp.model.book.ChildrenDTO;
import com.webcrawling.webcrawlingapp.model.book.ChildrenEngDTO;
import com.webcrawling.webcrawlingapp.model.book.ComicsDTO;
import com.webcrawling.webcrawlingapp.model.book.CookingDTO;
import com.webcrawling.webcrawlingapp.model.book.EconomyDTO;
import com.webcrawling.webcrawlingapp.model.book.ElementaryDTO;
import com.webcrawling.webcrawlingapp.model.book.EssayDTO;
import com.webcrawling.webcrawlingapp.model.book.FamilyDTO;
import com.webcrawling.webcrawlingapp.model.book.HealthDTO;
import com.webcrawling.webcrawlingapp.model.book.HistoryDTO;
import com.webcrawling.webcrawlingapp.model.book.HobbyDTO;
import com.webcrawling.webcrawlingapp.model.book.HumanitiesDTO;
import com.webcrawling.webcrawlingapp.model.book.ITDTO;
import com.webcrawling.webcrawlingapp.model.book.JobDTO;
import com.webcrawling.webcrawlingapp.model.book.KoreaDTO;
import com.webcrawling.webcrawlingapp.model.book.LanguageDTO;
import com.webcrawling.webcrawlingapp.model.book.MagazineDTO;
import com.webcrawling.webcrawlingapp.model.book.MiddleHighDTO;
import com.webcrawling.webcrawlingapp.model.book.NovelDTO;
import com.webcrawling.webcrawlingapp.model.book.OpenUniversityDTO;
import com.webcrawling.webcrawlingapp.model.book.PoliticsDTO;
import com.webcrawling.webcrawlingapp.model.book.ReligionDTO;
import com.webcrawling.webcrawlingapp.model.book.ScienceDTO;
import com.webcrawling.webcrawlingapp.model.book.SelfHelpDTO;
import com.webcrawling.webcrawlingapp.model.book.TechnologyDTO;
import com.webcrawling.webcrawlingapp.model.book.TeenagerDTO;
import com.webcrawling.webcrawlingapp.model.book.ToddlerDTO;
import com.webcrawling.webcrawlingapp.model.book.TravelDTO;
import com.webcrawling.webcrawlingapp.model.book.UniversityDTO;


@Controller
public class MainController {
	@RequestMapping(value = "/BestSellers", method = RequestMethod.GET)
	
		public String BestSellers(Model model) throws IOException {
			
		String URL = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa";
		
		ArrayList<BestSellersDTO> bs_list = new ArrayList<BestSellersDTO>();
		
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
        	
        	BestSellersDTO dto = new BestSellersDTO();
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
	
	ArrayList<NewBooksDTO> nb_list = new ArrayList<NewBooksDTO>();
	
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
    	
    	NewBooksDTO dto = new NewBooksDTO();
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
	
	ArrayList<NovelDTO> novel_list = new ArrayList<NovelDTO>();
	
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
    	
    	NovelDTO dto = new NovelDTO();
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
	
	ArrayList<EssayDTO> essay_list = new ArrayList<EssayDTO>();
	
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
    	
    	EssayDTO dto = new EssayDTO();
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
	
	ArrayList<EconomyDTO> economy_list = new ArrayList<EconomyDTO>();
	
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
    	
    	EconomyDTO dto = new EconomyDTO();
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
	
	ArrayList<SelfHelpDTO> selfhelp_list = new ArrayList<SelfHelpDTO>();
	
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
    	
    	SelfHelpDTO dto = new SelfHelpDTO();
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
	
	ArrayList<HumanitiesDTO> humanities_list = new ArrayList<HumanitiesDTO>();
	
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
    	
    	HumanitiesDTO dto = new HumanitiesDTO();
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
	
	ArrayList<HistoryDTO> history_list = new ArrayList<HistoryDTO>();
	
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
    	
    	HistoryDTO dto = new HistoryDTO();
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
	
	ArrayList<ReligionDTO> religion_list = new ArrayList<ReligionDTO>();
	
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
    	
    	ReligionDTO dto = new ReligionDTO();
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
	
	ArrayList<PoliticsDTO> politics_list = new ArrayList<PoliticsDTO>();
	
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
    	
    	PoliticsDTO dto = new PoliticsDTO();
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
	
	ArrayList<ArtDTO> art_list = new ArrayList<ArtDTO>();
	
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
    	
    	ArtDTO dto = new ArtDTO();
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
	
	ArrayList<ScienceDTO> science_list = new ArrayList<ScienceDTO>();
	
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
    	
    	ScienceDTO dto = new ScienceDTO();
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
	
	ArrayList<TechnologyDTO> technology_list = new ArrayList<TechnologyDTO>();
	
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
    	
    	TechnologyDTO dto = new TechnologyDTO();
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
	
	ArrayList<ITDTO> it_list = new ArrayList<ITDTO>();
	
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
    	
    	ITDTO dto = new ITDTO();
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
	
	ArrayList<ToddlerDTO> toddler_list = new ArrayList<ToddlerDTO>();
	
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
    	
    	ToddlerDTO dto = new ToddlerDTO();
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
	
	ArrayList<ChildrenDTO> children_list = new ArrayList<ChildrenDTO>();
	
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
    	
    	ChildrenDTO dto = new ChildrenDTO();
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
	
	ArrayList<ChildrenCompDTO> childrencomp_list = new ArrayList<ChildrenCompDTO>();
	
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
    	
    	ChildrenCompDTO dto = new ChildrenCompDTO();
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
	
	ArrayList<TeenagerDTO> teenager_list = new ArrayList<TeenagerDTO>();
	
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
    	
    	TeenagerDTO dto = new TeenagerDTO();
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
	
	ArrayList<ChildrenEngDTO> childreneng_list = new ArrayList<ChildrenEngDTO>();
	
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
    	
    	ChildrenEngDTO dto = new ChildrenEngDTO();
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
	
	ArrayList<ElementaryDTO> elementary_list = new ArrayList<ElementaryDTO>();
	
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
    	
    	ElementaryDTO dto = new ElementaryDTO();
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
	
	ArrayList<MiddleHighDTO> middlehigh_list = new ArrayList<MiddleHighDTO>();
	
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
    	
    	MiddleHighDTO dto = new MiddleHighDTO();
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
	
	ArrayList<UniversityDTO> university_list = new ArrayList<UniversityDTO>();
	
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
    	
    	UniversityDTO dto = new UniversityDTO();
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
	
	ArrayList<OpenUniversityDTO> openuniversity_list = new ArrayList<OpenUniversityDTO>();
	
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
    	
    	OpenUniversityDTO dto = new OpenUniversityDTO();
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
	
	ArrayList<ComicsDTO> comics_list = new ArrayList<ComicsDTO>();
	
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
    	
    	ComicsDTO dto = new ComicsDTO();
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
	
	ArrayList<KoreaDTO> korea_list = new ArrayList<KoreaDTO>();
	
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
    	
    	KoreaDTO dto = new KoreaDTO();
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
	
	ArrayList<JobDTO> job_list = new ArrayList<JobDTO>();
	
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
    	
    	JobDTO dto = new JobDTO();
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
	
	ArrayList<LanguageDTO> language_list = new ArrayList<LanguageDTO>();
	
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
    	
    	LanguageDTO dto = new LanguageDTO();
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
	
	ArrayList<FamilyDTO> family_list = new ArrayList<FamilyDTO>();
	
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
    	
    	FamilyDTO dto = new FamilyDTO();
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
	
	ArrayList<HealthDTO> health_list = new ArrayList<HealthDTO>();
	
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
    	
    	HealthDTO dto = new HealthDTO();
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
	
	ArrayList<TravelDTO> travel_list = new ArrayList<TravelDTO>();
	
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
    	
    	TravelDTO dto = new TravelDTO();
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
	
	ArrayList<CookingDTO> cooking_list = new ArrayList<CookingDTO>();
	
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
    	
    	CookingDTO dto = new CookingDTO();
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
	
	ArrayList<HobbyDTO> hobby_list = new ArrayList<HobbyDTO>();
	
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
    	
    	HobbyDTO dto = new HobbyDTO();
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
	
	ArrayList<MagazineDTO> magazine_list = new ArrayList<MagazineDTO>();
	
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
    	
    	MagazineDTO dto = new MagazineDTO();
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