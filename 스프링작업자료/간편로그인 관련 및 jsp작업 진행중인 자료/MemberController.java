package com.example.ex01.contoller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.ex01.service.MemberService;
import com.fasterxml.jackson.annotation.JsonInclude;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import com.example.ex01.model.dao.MemberDAO;
import com.example.ex01.model.dto.MemberDTO;
import org.json.simple.parser.ParseException;

@RequestMapping("/member/*")
@Controller
public class MemberController {

	@Inject
	MemberService dao;
	
	//회원 정보 리스트 서블릿
	@RequestMapping("list.do")
	public String mysql_list(Model model) {
		List<MemberDAO> list = dao.list();
		System.out.println(list);
		model.addAttribute("list", list);
		return "member/list";
	}
	
	//안드로이드 데이터 통신을 위한 회원정보 리스트 json 형식으로 변환 서블릿 
	@RequestMapping("memberinfojson.do")
	public @ResponseBody List<MemberDAO> jsonTest() { //@ResponseBody를 통해 json형식으로 반환
		System.out.println("회워정보 json 서블릿");
		List<MemberDAO> list = dao.list();
		System.out.println(list);
		return list;
	}
	
	//회원정보 리스트 json 파싱 테스트용 
	
	@RequestMapping(value = "jsonToParsing.do")
	public String jsonToParsing(Model model) throws IOException {
		System.out.println("jsonToParsing 서블릿");
		BufferedReader bufferedReader = null;
		String resultSet = null;
		
		String reurl = "http://www.boramjul.kro.kr/member/memberinfojson.do";
		URL url = new URL(reurl);
		bufferedReader = new BufferedReader(new InputStreamReader(url.openConnection().getInputStream(), "UTF-8"));
		resultSet = bufferedReader.readLine();		
		ArrayList<MemberDTO> list = new ArrayList<MemberDTO>();
		
		try {
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = (JSONArray) jsonParser.parse(resultSet);
	
			
			for(int i=1; i<jsonArray.size(); i++){ 
				JSONObject obj = (JSONObject) jsonArray.get(i);
				
				MemberDTO dto = new MemberDTO();
				
				//데이터 값 int 형으로 파싱
				int snsjson = Integer.parseInt(String.valueOf(obj.get("sns")));				
				int rankjson = Integer.parseInt(String.valueOf(obj.get("rank")));
				int totalpricejson = Integer.parseInt(String.valueOf(obj.get("totalprice")));
				
				//데이터 형에 맞추어 MemberDTO에 담기 
				dto.setId(obj.get("id").toString());		 
				dto.setPasswd(obj.get("passwd").toString());
				dto.setName(obj.get("name").toString());
				dto.setEmail(obj.get("email").toString());
				dto.setPhone(obj.get("phone").toString());
				dto.setSns(snsjson);		
				dto.setBirth(obj.get("birth").toString());
				//주소값이 없을 경우를 대비한 코드
				if(obj.get("address")==null) {					
				}else {
					dto.setAddress(obj.get("address").toString());	
				}					
				dto.setRank(rankjson);
				dto.setTotalprice(totalpricejson);	
				list.add(dto);
				System.out.println(reurl);
			 }
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(reurl);	
		System.out.println(list);
		model.addAttribute("list", list);
		return "member/list2";

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
		int rankjson = Integer.parseInt(String.valueOf(obj.get("rank")));
		int totalpricejson = Integer.parseInt(String.valueOf(obj.get("totalprice")));
		
		//데이터 형에 맞추어 MemberDTO에 담기 
		dto.setId(obj.get("id").toString());		 
		dto.setPasswd(obj.get("passwd").toString());
		dto.setName(obj.get("name").toString());
		dto.setEmail(obj.get("email").toString());
		dto.setPhone(obj.get("phone").toString());
		dto.setSns(snsjson);		
		dto.setBirth(obj.get("birth").toString());
		dto.setAddress(obj.get("address").toString());	
		dto.setRank(rankjson);
		dto.setTotalprice(totalpricejson);		
		
		System.out.println("전송 받은 값 : "+dto);
		//MemberrDAO 에 있는 insert 함수 실행
		dao.insert(dto);
		System.out.println("insert 실행됨");
	}	
	
	@RequestMapping("join.do")
	public String join() {	
		return "member/join";
	}
	
	@RequestMapping("insert.do")
	public String insert(@ModelAttribute MemberDTO dto) {
		// dto멤버변수와 매개변수 이름이 같아야 자동으로 맵핑됨
		System.out.println("insert 실행됨");
		System.out.println("받아온 내용"+dto);
		dao.insert(dto);
		return "redirect:/member/list.do";
	}
	
	////////////////////////////////////////////아래부터 조성현 추가 부분 입니다
	
	@RequestMapping("login.do")
	public String login( Model model) {

		return "member/login";
	}
	
	@RequestMapping("kakao_request.do" )
	public String kakao_request() {
		System.out.println("test kakao request ");
			
		return "member/kakao_login";
	}
	
	@RequestMapping("naver_request.do" )
	public String naver_request() {
		System.out.println("test naver request ");
			
		return "member/naver_login";
	}
	
	@RequestMapping("login_result.do" )
	public String login_result(@ModelAttribute MemberDTO dto, Model model) {
		
		//회원이면 그대로 로그인, 회원 아니면 간편 회원가입 페이지로 이동하는거 짜야함
		model.addAttribute("dto",dto);
		System.out.println("dto: "+dto);
		
		if(dto.getSns()==3) {
			return "member/kakao_login";
		} else if(dto.getSns()==4) {
			return "member/naver_login";
		} else {
			dto.setSns(1);
			return "member/loginOk";
		}
		

	}
	
	@RequestMapping("update.do")
	public String update(@ModelAttribute MemberDTO dto) {
		System.out.println("update 실행됨");
		System.out.println("받아온 내용"+dto);
		dao.update(dto);
		return "redirect:/mypage/myInfo.do";
	}

}

