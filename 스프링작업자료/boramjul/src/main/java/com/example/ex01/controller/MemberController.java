package com.example.ex01.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dao.MemberDAO;
import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.MemberDTO;
import com.example.ex01.service.MemberService;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RequestMapping("/member/*")
@Controller
public class MemberController {
	
	private static  final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Inject
	MemberService memberService;
	
	String safe;
	
	@RequestMapping("join.do")
	public String join() {	
		return "member/join";
	}
	
	@RequestMapping("join1.do")
	public String join1() {	
		return "member/join1";
	}
	
	@RequestMapping("join1_1.do")
	public String join1_1() {	
		return "member/join1_1";
	}
	
	@RequestMapping("join1_2.do")
	public String join1_2() {	
		return "member/join1_2";
	}
	
	@RequestMapping("joinok.do")
	public String joinok(@ModelAttribute MemberDTO dto, Model model) {	
		model.addAttribute("dto",dto);
		return "member/joinok";
	}
	
	@RequestMapping("findemail.do")
	public String findemail() {	
		return "member/findemail";
	}
	
	@RequestMapping("findemailok.do")
    public String findemailok(@RequestParam String phone, Model model) {
        model.addAttribute("dto", memberService.findemail(phone));
        return "member/findemailok";
    }
	
	@RequestMapping("findpwd.do")
	public String findpwd() {	
		return "member/findpwd";
	}
	
	@RequestMapping("findpwdok.do")
	public String findpwdok(@RequestParam String email, Model model) {	
		model.addAttribute("dto", memberService.findpwd(email));
		return "member/findpwdok";
	}	
		
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		
		dto.setSns(1);
		System.out.println("insert 받아온 내용"+dto);
		
		memberService.insert(dto);
		
		return "redirect:/member/joinok.do";
	}
	
	////////////////////////////////////////////아래부터 조성현 작업 부분 입니다
	
	@RequestMapping("login.do")
	public String login( Model model) {
		
		model.addAttribute("message","nologin");
		return "member/login";
	}
	
	@RequestMapping("kakao_request.do" )
	public String kakao_request(@ModelAttribute MemberDTO dto, Model model) {
		model.addAttribute("dto",dto);
		System.out.println("dto1: "+dto);
		System.out.println("test kakao request ");
			
		return "redirect:api_login_check.do";
	}
	
	@RequestMapping("naver_request.do" )
	public String naver_request() {
		System.out.println("test naver request ");
			
		return "member/naver_login";
	}
	
	@RequestMapping("api_login_check.do" ) //api용
	public ModelAndView login_api(@ModelAttribute MemberDTO dto, HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		System.out.println("dto2: "+dto);
		String name = memberService.apiloginCheck(dto, session);
		logger.info("name: "+name);
		if (name != null) {// 로그인 성공시  session값을 생성해서 home페이지로 이동
			mav.setViewName("main");
		} else {
			// 로그인 실패시 에러 메시지와 함께 로그인 페이지로 이동
			mav.setViewName("member/join");
			mav.addObject("message","error");
		}
		return mav;

	}
	
	@RequestMapping("login_check.do")
	public ModelAndView login_check(	@ModelAttribute MemberDTO dto, HttpSession session, Model model) throws IOException {
		ModelAndView mav = new ModelAndView();
		
		// 로그인 체크 처리하는 서비스 요청(세션값을 생성 시킴)
		String name = memberService.loginCheck(dto, session);
		logger.info("name: "+name);
		
		// 로그인 처리 결과에 따라 처리
		if (name != null) {// 로그인 성공시  session값을 생성해서 home페이지로 이동
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
		    	
		    	BooksDTO dto1 = new BooksDTO();
		    	dto1.setImage(imgUrl.get(i));
		    	
		    	mainbs_list.add(dto1);
		    	
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
		    	
		    	BooksDTO dto1 = new BooksDTO();
		    	dto1.setImage(imgUrlNB.get(i));
		    	
		    	mainnb_list.add(dto1);
		    	
		    	model.addAttribute("mainnblist",mainnb_list);
		    }
			mav.setViewName("main");

		} else {
			// 로그인 실패시 에러 메시지와 함께 로그인 페이지로 이동
			mav.setViewName("member/login");
			mav.addObject("message","error");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model model) throws IOException {
			
		session.removeAttribute("email");
		session.removeAttribute("name");
		
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
		logger.info("로그아웃");

		return "main";
	}

	@RequestMapping("update.do")
	public String update(@ModelAttribute MemberDTO dto, Model model) {
		System.out.println("update 내용: "+dto);
		memberService.update(dto);
		model.addAttribute("email",dto.getEmail());
		return "redirect:/mypage/myInfo.do";

	}
	
	@RequestMapping("requestmember/{id}")
	public String androidtest(@PathVariable String id) {
		safe = id;        
		return "redirect:/member/memberrespondjson.do";
	}
	
	//안드로이드 데이터 통신을 위한 회원정보 리스트 json 형식으로 변환 서블릿 
	@RequestMapping("memberrespondjson.do")
	public @ResponseBody MemberDTO memberrespondjson() { //@ResponseBody를 통해 json형식으로 반환
		System.out.println("회워정보 json 2서블릿");
		MemberDTO list = memberService.findpwd(safe);
		return list;
	}	
	
	//안드로이드 >> json 형식 데이터 전송 >> 서블릿으로 처리 >> db에 insert
	@RequestMapping(value = "androidsignup.do", method = {RequestMethod.POST, RequestMethod.GET}, headers="Accept=application/json" )	
	public void androidsignup(@RequestBody String resultSet) throws Exception {//RequestBody이용하여 resultset 변수에 전송된값 저장
		System.out.println("androidsignup 서블릿");
		
		JSONParser jsonParser = new JSONParser();
		//jsonparser 이용 하여 json 데이터 파싱
		JSONObject obj = (JSONObject) jsonParser.parse(resultSet);		
				
		MemberDTO dto = new MemberDTO();
		
		//데이터 값 int 형으로 파싱
		int snsjson = Integer.parseInt(String.valueOf(obj.get("sns")));
		
		//데이터 형에 맞추어 MemberDTO에 담기
		dto.setPasswd(obj.get("passwd").toString());
		dto.setName(obj.get("name").toString());
		dto.setEmail(obj.get("email").toString());
		dto.setPhone(obj.get("phone").toString());
		dto.setSns(snsjson);		
		dto.setBirth(obj.get("birth").toString());
		dto.setAddress(obj.get("address").toString());
		
		System.out.println("전송 받은 값 : "+dto);
		//MemberrDAO 에 있는 insert 함수 실행
		memberService.insert(dto);
		System.out.println("insert 실행됨");
	}	

}

