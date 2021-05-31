package com.example.ex01.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.MemberDTO;
import com.example.ex01.model.dto.OrderDTO;
import com.example.ex01.model.dto.OrderDetailDTO;
import com.example.ex01.service.MemberService;
import com.example.ex01.service.OrderService;
import com.example.ex01.service.AdminService;
import com.example.ex01.service.CartService;

@RequestMapping("/mypage/*")
@Controller
public class MypageController {
	private static  final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Inject
	MemberService memberService;
	
	@Inject
	CartService cartService;
	
	@Inject
	OrderService orderService;
	
	@Inject
	AdminService adminService;
	
	@Autowired SqlSessionTemplate mysql;
	
	
	@RequestMapping("myList.do")
	public ModelAndView myList(HttpSession session, ModelAndView mav, OrderDetailDTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String email = (String) session.getAttribute("email");
		
		if (email != null) {
			
			List<OrderDetailDTO> list = orderService.detail_list(email);
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
			
			cartService.cart_redelete(email);
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
			return new ModelAndView("/member/login", "",null);
		}

	}
	
	@RequestMapping("cart_insert.do")
	public String cart_insert(Model model, @ModelAttribute BooksDTO dto, CartDTO dto1, @RequestParam String email, String prodname) {
		
		System.out.println("bookdto: "+dto+" / cartdto: "+dto1);

		boolean result=adminService.prodname_list(prodname);
		if(result) {
			cartService.cart_insert(dto1);
		}else {
			adminService.prod_insert(dto);
			cartService.cart_insert(dto1);
		}
		
		return "redirect:/mypage/myCart.do";
		
	}
	
	@ResponseBody
	@RequestMapping(value="cart_delete.do", method = RequestMethod.POST)
	public int cart_delete(HttpSession session, @RequestParam(value="check[]") List<String> checkArr, CartDTO dto) throws Exception {
		logger.info("장바구니 개별상품 삭제을 요청했습니다.");
		
		int cartnum = 0;
		int result = 0;
		System.out.println(checkArr);
		
		if(dto != null) {
			for(String i : checkArr) {
				System.out.println("i:"+i);
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
	
	@ResponseBody
	@RequestMapping(value="order_insert.do", method = RequestMethod.POST)
	public int order_insert(HttpSession session, @RequestParam(value="check[]") List<String> checkArr, CartDTO dto) throws Exception  {
		logger.info("result값 2로 변경");
		
		int cartnum = 0;
		int result = 0;
		System.out.println("checkArr: "+checkArr);
		
		if(dto != null) {
			for(String i : checkArr) {
				System.out.println("i:"+i);
				cartnum = Integer.parseInt(i);
				dto.setCartnum(cartnum);
				cartService.order_insert(dto);
			}
			result = 1;
		}
		return result;
	}
	
	@RequestMapping("order.do")
	public ModelAndView order(ModelAndView mav, CartDTO dto, @RequestParam String email, Model model) {
		
		model.addAttribute("memberdto", memberService.myInfo(email));
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if (email != null) {
			
			List<CartDTO> list = cartService.orderCart(email);
			logger.info("이메일: "+email);
			logger.info("주문요청 들어온 목록: "+list.toString());
			
			int order_tot = cartService.order_tot(email);
			logger.info("주문요청 총 합계: "+order_tot);
			
			map.put("list", list);
			map.put("order_tot", order_tot);
			
			mav.addObject("map",map);
			mav.setViewName("/mypage/order");
			
			return mav;
			
		} else { 
			return new ModelAndView("/member/login", "",null);
		}
	}
	
	@RequestMapping("order_now.do")
	public String order_now(Model model, @ModelAttribute BooksDTO dto, @RequestParam String email, String prodname) {
		
		if (email != null) {
			
			boolean result=adminService.prodname_list(prodname);
			
			if(result) {
				model.addAttribute("memberdto", memberService.myInfo(email));
				model.addAttribute("booksdto", dto);
			}else {
				adminService.prod_insert(dto);
				model.addAttribute("memberdto", memberService.myInfo(email));
				model.addAttribute("booksdto", dto);
			}
			
			System.out.println("바로구매 dto: "+dto);

			return "mypage/order_now";
			
		}else { 
			return "/member/login";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="order_result_3.do", method = RequestMethod.POST)
	public int order_result_3(@RequestParam(value="cartnum[]") List<String> list, CartDTO dto) throws Exception  {
		logger.info("result값 3으로 변경요청");
		
		int cartnum = 0;
		int result = 0;
		
		System.out.println("list: "+list);
		
			for(String i : list) {
				System.out.println("i2:"+i);
				cartnum = Integer.parseInt(i);
				dto.setCartnum(cartnum);
				cartService.order_result_3(dto);
			}
			result=1;
		
		return result;
	}
	
	
	@RequestMapping("completed.do")
	public String completed(ModelMap modelmap, Model model, @ModelAttribute OrderDTO dto, @RequestParam String email) throws Exception {
		
        orderService.order_insert(dto);
		
		// 파라메터 셋팅
        Map param = new HashMap();
        param.put("email", dto.getEmail());
         
        // 프로시져 호출
        mysql.selectOne("mysqlCart.order_result_add", param);
 
        System.out.println("param: "+param);
        
		model.addAttribute("dto", orderService.order_detail_list(dto));
		
		System.out.println("주문 상세 dto: "+dto);
        
		return "mypage/completed";
	}
	
	@RequestMapping("now_completed.do")
	public String now_completed(ModelMap modelmap, Model model, @ModelAttribute OrderDTO dto, OrderDetailDTO dto2 ,@RequestParam String email) throws Exception {
		System.out.println("now_completed.do");
		System.out.println("orderdto: "+dto);
		System.out.println("orderdetaildto: "+dto2);
		orderService.order_insert(dto);
		orderService.order_detail_insert(dto2);
		
		// 파라메터 셋팅
        Map param = new HashMap();
        param.put("email", dto.getEmail());
         
        // 프로시져 호출
        mysql.selectOne("mysqlCart.order_now_result_add", param);
        
		model.addAttribute("dto", orderService.order_detail_list(dto));
	
		return "mypage/completed";
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
