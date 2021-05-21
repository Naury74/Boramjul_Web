package com.example.ex01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.service.MemberService;
import com.example.ex01.service.CartService;

@RequestMapping("/mypage/*")
@Controller
public class MypageController {
	private static  final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	MemberService memberService;
	
	@Inject
	CartService cartService;
	
	@RequestMapping("myList.do")
	public ModelAndView myList(HttpSession session, ModelAndView mav, CartDTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String email = (String) session.getAttribute("email");
		
		if (email != null) {
			
			List<CartDTO> list = cartService.listOrder(email);
			logger.info("이메일: "+email);
			logger.info("주문내역: "+list.toString());
			
			map.put("list", list);
			map.put("count", list.size());
			
			mav.addObject("map",map);
			mav.setViewName("/mypage/myList");
			
			return mav;
			
		} else {
			return new ModelAndView("/member/login", "",null);
		}
	}
	
	@RequestMapping("myCart.do")
	public ModelAndView myCart(HttpSession session, ModelAndView mav, CartDTO dto) {
		
		// 장바구니 정보를 저장하기 위한 객체 생성
		Map<String, Object> map = new HashMap<String, Object>();
		// 개인별 장바구니 조회를 위한 세션에 있는 email값 추출
		String email = (String) session.getAttribute("email");
		
		if (email != null) { // 로그인 상태이면
			
			// 1. email에 해당하는 멤버회원의 장바구니 목록 조회
			List<CartDTO> list = cartService.listCart(email);
			logger.info("이메일: "+email);
			logger.info("장바구니 목록: "+list.toString());
			
			cartService.cart_reset(dto);
			
			// 2. 장바구니 총 금액
			int cart_tot = cartService.cart_tot(email);
			logger.info("장바구니 총합계: "+cart_tot);
			
			// 3. 장바구니에 대한 정보 저장해서 전송(포워딩)
			map.put("list", list);
			map.put("count", list.size());
			map.put("cart_tot", cart_tot);
			
			mav.addObject("map",map);
			mav.setViewName("/mypage/myCart");
			
			return mav;
			
		} else { // 로그인 상태가 아님
			/*
			mav.addObject("key","값");
			mav.setViewName("/member/login");
			return mav;
			*/
			return new ModelAndView("/member/login", "",null);
		}

	}
	
	@ResponseBody
	@RequestMapping(value="cart_delete.do", method = RequestMethod.POST)
	public int cart_delete(HttpSession session, @RequestParam(value="check[]") List<String> chArr, CartDTO dto) {
		logger.info("장바구니 개별상품 삭제을 요청했습니다.");
		
		int cartnum = dto.getCartnum();
		
		int result = 0;
		
		if(dto != null) {
			dto.setCartnum(cartnum);
			
			for(String i : chArr) {
				cartnum = Integer.parseInt(i);
				dto.setCartnum(cartnum);
				cartService.cart_delete(dto);
			}
			result = 1;
		}
		return result;
	}
	
	@RequestMapping("cart_update.do")
	public String cart_update(int[] quantity, int[] cartnum , int[] price, HttpSession session ) {
		logger.info("장바구니 수정을 요청했습니다.");
		
		String email = (String) session.getAttribute("email");
		
		for (int i=0; i<cartnum.length; i++) {
			if (quantity[i] > 0) {
				CartDTO dto = new CartDTO();
				
				dto.setEmail(email);
				dto.setCartnum(cartnum[i]);
				dto.setQuantity(quantity[i]);
				dto.setPrice(price[i]);
				dto.setTotalprice(quantity[i]*price[i]);
				dto.setCart_tot( (quantity[i]*price[i])*i );
				System.out.println(dto);

				cartService.cart_update(dto);
			}
		}
		
		return "redirect:/mypage/myCart.do";
	}
	
	@RequestMapping("myReview.do")
	public String myReview() {
		return "mypage/myReview";
	}
	
	@RequestMapping("myInfo.do")
	public String myInfo(@RequestParam String email, Model model) {
		model.addAttribute("dto", memberService.myInfo(email));
		return "mypage/myInfo";
	}
	
	@RequestMapping("membership.do")
	public String membership(@RequestParam String email, Model model) {
		model.addAttribute("dto", memberService.myInfo(email));
		
		return "mypage/membership";
	}

}
