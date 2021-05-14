package com.example.ex01.contoller;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.example.ex01.model.dto.GoogleOauthRequest;
import com.example.ex01.model.dto.GoogleOauthResponse;
import com.example.ex01.model.dto.MemberDTO;
import com.example.ex01.service.MemberService;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;

@RequestMapping("/webtest/*")
@Controller
public class testController {
	
	@Inject
	MemberService dao;
	
//	final static String GOOGLE_AUTH_BASE_URL = "https://accounts.google.com/o/oauth2/v2/auth";
//	final static String GOOGLE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/token";
//	final static String GOOGLE_REVOKE_TOKEN_BASE_URL = "https://oauth2.googleapis.com/revoke";
//	
//	@Value("${api.client_id}")
//	String clientId;
//	@Value("${api.client_secret}")
//	String clientSecret;

	@RequestMapping("login.do")
	public String login( Model model) {

		return "webtest/login";
	}
	
//	@RequestMapping("google_request.do" )
//	public String google_request() {
//	public String google_request(Model model, @RequestParam(value = "code") String authCode) 
//						throws JsonProcessingException{
//	
//	System.out.println("test google request ");
//
//	return "webtest/google_login";	
	
//		//HTTP Request를 위한 RestTemplate
//		RestTemplate restTemplate = new RestTemplate();
//
//		//Google OAuth Access Token 요청을 위한 파라미터 세팅
//		GoogleOauthRequest googleOAuthRequestParam = GoogleOauthRequest
//				.builder()
//				.clientId(clientId)
//				.clientSecret(clientSecret)
//				.code(authCode)
//				.redirectUri("http://localhost:8090/webtest/google_request.do")
//				.grantType("authorization_code").build();
//		
//		System.out.println("clientId: "+clientId+", clientSecret: "+clientSecret);
//					
//		//JSON 파싱을 위한 기본값 세팅
//		//요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
//		ObjectMapper mapper = new ObjectMapper();
//		mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
//		mapper.setSerializationInclusion(Include.NON_NULL);
//
//		//AccessToken 발급 요청
//		ResponseEntity<String> resultEntity = restTemplate.postForEntity(GOOGLE_TOKEN_BASE_URL, googleOAuthRequestParam, String.class);
//		
//		System.out.println(googleOAuthRequestParam.toString());
//
//		//Token Request
//		GoogleOauthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOauthResponse>() {
//		});
//		
//		System.out.println(resultEntity.getBody());
//
//		//ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
//		String jwtToken = result.getIdToken();
//		String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo")
//		.queryParam("id_token", jwtToken).encode().toUriString();
//		
//		String resultJson = restTemplate.getForObject(requestUrl, String.class);
//		
//		Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});
//		model.addAllAttributes(userInfo);
//		model.addAttribute("token", result.getAccessToken());
//		System.out.println(userInfo);
//
//	}
	
	@RequestMapping("kakao_request.do" )
	public String kakao_request() {
		System.out.println("test kakao request ");
			
		return "webtest/kakao_login";
	}
	
	@RequestMapping("naver_request.do" )
	public String naver_request() {
		System.out.println("test naver request ");
			
		return "webtest/naver_login";
	}
	
	@RequestMapping("login_result.do" )
	public String login_result(String email, String name, int sns, Model model) {
		
		MemberDTO dto = new MemberDTO();

		System.out.println("name: "+name+", email: "+email+", sns: "+sns);
		
		dto.setEmail(email);
		dto.setName(name);
		dto.setSns(sns);
		
		System.out.println("dto: "+dto);

		return "webtest/main";
	}
		
	
	
//	@RequestMapping("header.do")
//	public String header(Model model) {
//
//		return "webtest/header";
//	}
//	
//	@RequestMapping("search.do")
//	public String search(@ModelAttribute webtestDTO dto, Model model) {
//		model.addAttribute("dto",dto);
//		
//		return "webtest/searchedResults";
//	}
	

}
