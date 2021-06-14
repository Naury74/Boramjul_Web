package com.example.ex01.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.ex01.model.dto.BooksDTO;
import com.example.ex01.model.dto.CartDTO;
import com.example.ex01.model.dto.CommentDTO;
import com.example.ex01.model.dto.MemberDTO;
import com.example.ex01.model.dto.OrderDTO;
import com.example.ex01.model.dto.OrderDetailDTO;
import com.example.ex01.model.dto.ReviewDTO;
import com.example.ex01.service.MemberService;
import com.example.ex01.service.OrderService;
import com.example.ex01.service.ReviewService;
import com.example.ex01.service.AdminService;
import com.example.ex01.service.CartService;
import com.example.ex01.service.CommentService;

@RequestMapping("/mypage/*")
@Controller
public class MypageController {
	private static  final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	String safe;
	
	@Inject
	MemberService memberService;
	
	@Inject
	CartService cartService;
	
	@Inject
	OrderService orderService;
	
	@Inject
	AdminService adminService;
	
	@Inject
	ReviewService reviewService;
	
	@Inject
	CommentService commentService;
	
	@Autowired SqlSessionTemplate mysql;
	
	
	@RequestMapping("myList.do")
	public ModelAndView myList(HttpSession session, ModelAndView mav, OrderDetailDTO dto) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String email = (String) session.getAttribute("email");
		
		if (email != null) {
			List<OrderDetailDTO> list = orderService.detail_list(email);

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
	public String cart_insert(@ModelAttribute BooksDTO dto, CartDTO dto1, @RequestParam String email, String prodname) {

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
	@RequestMapping("cart_delete.do")
	public int cart_delete(@RequestParam(value="check[]") List<String> checkArr, CartDTO dto) throws Exception {
		
		int cartnum = 0;
		int result = 0;
		
		if(dto != null) {
			for(String i : checkArr) {
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

				cartService.cart_update(dto);
			}
		}
		return "redirect:/mypage/myCart.do";
	}
	
	@ResponseBody
	@RequestMapping("order_insert.do")
	public int order_insert(@RequestParam(value="check[]") List<String> checkArr, CartDTO dto) throws Exception  {
		
		int cartnum = 0;
		int result = 0;
		
		if(dto != null) {
			for(String i : checkArr) {
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
			return "mypage/order_now";
			
		}else { 
			return "/member/login";
		}
		
	}
	
	
	@ResponseBody
	@RequestMapping("order_result_3.do")
	public int order_result_3(@RequestParam(value="cartnum[]") List<String> list, CartDTO dto) throws Exception  {
		
		int cartnum = 0;
		int result = 0;
		
		if(dto != null) {
			for(String i : list) {
				cartnum = Integer.parseInt(i);
				
				dto.setCartnum(cartnum);
				
				cartService.order_result_3(dto);
			}
			result=1;
		}
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
        
		model.addAttribute("dto", orderService.order_detail_list(dto));
        
		return "mypage/completed";
	}
	
	@RequestMapping("now_completed.do")
	public String now_completed(ModelMap modelmap, Model model, @ModelAttribute OrderDTO dto, OrderDetailDTO dto2 ,@RequestParam String email) throws Exception {

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
	public ModelAndView myReview(ModelAndView mav, String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ReviewDTO> list = reviewService.email_review_list(email);
		
		map.put("list", list);
		
		mav.addObject("map", map);
		mav.setViewName("mypage/myReview");
		
		return mav;
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
	
	//아래부터 안드로이드 통신
	
	@RequestMapping("requrestorderinfo/{id}")
	public String androidtest(@PathVariable String id) {
		
		safe = id;        
		
		return "redirect:/mypage/orderrespondjson.do";
	}
	
	// http://localhost:8090/mypage/requrestorderinfo/hongtest@gmail.com
	@RequestMapping(value = "orderrespondjson.do", method = {RequestMethod.POST, RequestMethod.GET}, headers="Accept=application/json" )
	public @ResponseBody String orderrespondjson() {	
		
		logger.info("전송 받은 이메일: "+safe);
		
		OrderDTO email = new OrderDTO();
		
		email.setEmail(safe);		
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		OrderDTO dto = orderService.order_detail_list(email);
		List<OrderDetailDTO> list = orderService.detail_list(safe);				
				
		JSONArray obj = new JSONArray();
		JSONArray orderinfo = new JSONArray();
		JSONObject data_o = new JSONObject();		
		JSONArray product = new JSONArray();
		
		data_o.put("email", dto.getEmail().toString());
		data_o.put("name", dto.getName().toString());
		data_o.put("phone", dto.getPhone().toString());
		data_o.put("totalprice", dto.getTotalprice());
		data_o.put("saleprice", dto.getSaleprice());
		data_o.put("usereserves", dto.getUsereserves());
		data_o.put("payprice", dto.getPayprice());
		data_o.put("addreserves", dto.getAddreserves());
		data_o.put("pay", dto.getPay().toString());
		data_o.put("address", dto.getAddress().toString());
		data_o.put("request", dto.getRequest().toString());
					
		for(int i = 0; i < list.size(); i++){ 
			JSONObject data_p = new JSONObject();
			data_p.put("name", list.get(i).getProdname().toString());
			data_p.put("image", list.get(i).getImage().toString());
			data_p.put("quantity", list.get(i).getQuantity());
			data_p.put("price", list.get(i).getPrice());
			data_p.put("totalprice", list.get(i).getTotalprice());
			product.add(data_p);
			System.out.println(data_p);
		}
		data_o.put("list", product);
		obj.add(data_o);
		
		return obj.toString();
	}
	

	@RequestMapping(value = "androidorder.do", method = {RequestMethod.POST, RequestMethod.GET}, headers="Accept=application/json" )	
	public void androidorder(@RequestBody String resultSet) throws Exception {//RequestBody이용하여 resultset 변수에 전송된값 저장
		System.out.println("androidorder 서블릿");
		
		String result = resultSet.replace("\\", "");
		String result1 = result.replace("\"{", "{");
		String result2 = result1.replace("}\"", "}");
		System.out.println("-----------------------------");
		System.out.println(result2);	
		
		OrderDTO dto = new OrderDTO();
		List<OrderDetailDTO> dto_d = new ArrayList<OrderDetailDTO>();

		try {
			
			JSONParser jsonParser = new JSONParser();
			JSONObject orderinfo = (JSONObject) jsonParser.parse(result2);
			System.out.println("-----------------------------");
			System.out.println(orderinfo);
			
			int totalpricejson =  Integer.parseInt(String.valueOf(orderinfo.get("totalprice")));
			int salepricejson =  Integer.parseInt(String.valueOf(orderinfo.get("saleprice")));
			int usereservesjson =  Integer.parseInt(String.valueOf(orderinfo.get("usereserves")));
			int paypricejson =  Integer.parseInt(String.valueOf(orderinfo.get("payprice")));
			int addreservesjson =  Integer.parseInt(String.valueOf(orderinfo.get("addreserves")));
			
			dto.setEmail(orderinfo.get("email").toString());
			dto.setName(orderinfo.get("name").toString());
			dto.setPhone(orderinfo.get("phone").toString());
			dto.setTotalprice(totalpricejson);
			dto.setSaleprice(salepricejson);
			dto.setUsereserves(usereservesjson);
			dto.setPayprice(paypricejson);
			dto.setAddreserves(addreservesjson);
			dto.setPay(orderinfo.get("pay").toString());
			dto.setAddress(orderinfo.get("address").toString());
			dto.setRequest(orderinfo.get("request").toString());
			System.out.println("------------------------------------------");
			System.out.println("받은 결제 정보 :  " + dto);
			System.out.println("------------------------------------------");
			
			orderService.order_insert(dto);
						
			JSONArray product = (JSONArray) orderinfo.get("list"); 
			
			System.out.println("------------------------------------------");
			System.out.println("받은 상품 정보  :  " + product);
			System.out.println("------------------------------------------");
			
			for(int i = 0; i< product.size(); i++){
				JSONObject list = (JSONObject) product.get(i);	
				
				OrderDetailDTO detail = new OrderDetailDTO();
								
				int pricedetail =  Integer.parseInt(String.valueOf(list.get("price")));
				int quantitydetail =  Integer.parseInt(String.valueOf(list.get("quantity")));
				int totalpricedetail =  (pricedetail*quantitydetail);
				
				detail.setProdname(list.get("name").toString());
				detail.setImage(list.get("image").toString());
				detail.setQuantity(quantitydetail);
				detail.setPrice(pricedetail);
				detail.setTotalprice(totalpricedetail);
				
				detail.setEmail(dto.getEmail());				
				dto_d.add(detail);
				int duplication = orderService.prod_duplication(detail.getProdname());
				if(duplication == 1) {
					// 같은 이름을 가진 상품목록이 있음
				} else {
					// 같은 이름을 가진 상품목록이 없음
					//orderService.prod_insert(detail);
				}	
				System.out.println(duplication);
				orderService.order_detail_insert(dto_d.get(i));
			}
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        // 프로시져 호출
        mysql.selectOne("mysqlOrder.order_result_android", (dto.getEmail()));
		System.out.println("------------------------------------------");
		System.out.println("받은 이메일  :  " + dto.getEmail());
		System.out.println("------------------------------------------");

		
	}
	

}
