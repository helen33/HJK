package com.jang.hjk.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Order_detail;
import com.jang.hjk.model.Orders;
import com.jang.hjk.model.Parts;
import com.jang.hjk.service.MemberService;
import com.jang.hjk.service.OrdersService;
import com.jang.hjk.service.PartsService;

@Controller
public class OrdersController {
	
	@Resource(name = "partsService") 
	private PartsService partsService;
	
	@Resource(name = "memberService") 
	private MemberService memberService;
	
	@Resource(name = "ordersService") 
	private OrdersService ordersService;
	
	// ////////////////////////////////////Order(주문부분)/////////////////////////////////////////////
	
	// -------------------------------------- 주문 등록 ----------------------------------------------//
	@RequestMapping(value = "/orderInsert")
	public String orderInsert(@ModelAttribute("Orders") Orders orders,
			@RequestParam("zip_addr") String zip_addr, @RequestParam("psum") String psum,
			@ModelAttribute("Order_detail") Order_detail order_detail,
			HttpSession session, ModelMap model) {
		System.out.println("오더 인서트 컴트롤러 진입");
		String memberId = (String) session.getAttribute("memberId");
		int m_num = memberService.findMemberNum(memberId);
		orders.setM_num(m_num);
		
		ordersService.insertOrders(orders);
		
		int o_num = ordersService.chkOrderSeq(); // 현재 시퀀스로 주문번호 확인

		String pnum[] = psum.split(",");
		int p_num = 0;

		for(int i=0; i<pnum.length; i++){
			System.out.println("p_num확인하자!!!!!!!!!" + pnum[i]);
			p_num = Integer.parseInt(pnum[i]);
			System.out.println("--------------------->" + p_num);
			order_detail.setO_num(o_num);
			order_detail.setP_num(p_num);
			ordersService.insertOrdersDetail(order_detail);
			this.ordersService.minorAmount(p_num);
		}
		List<Orders> partsList = ordersService.getOrderPartsList(o_num);
		Orders infoList = this.ordersService.getOrderList(o_num);  
		System.out.println("너!!!!여러개지?" + partsList);  
		System.out.println("너!!!!한개지?" + infoList);  
		model.addAttribute("partsList",partsList); 
		model.addAttribute("infoList",infoList);
		model.addAttribute("zip_addr", zip_addr);
		return "/orders/orderSuccess";

	}

	//----------------- 주문서 작성 (화면) ---------------------------------------------
	@RequestMapping(value = "/orderList")
	public String orderList(@RequestParam(value = "p_num") String p_num,
			ModelMap model, HttpSession session) throws Exception {
		System.out.println("주문서 작성 확인!!!" + "부품번호 >>" + p_num);
		String fix[] = p_num.split("/"); 
		String fixed = fix[1];
		System.out.println("가격 찍히나요!!!!!!!!!!!!!!!!!!!!!!!!! = " + fixed);
		String[] psplit = fix[0].split(",");
		int ss=0;
		ArrayList<Parts> myArry = new ArrayList<Parts>();
		for(int i=0; i<psplit.length; i++){
			System.out.println("확인 = " + psplit[i]);
			ss = Integer.parseInt(psplit[i]);
 
			Parts partsContent = this.partsService.getPartscontent(ss);
			
			myArry.add(partsContent);
			model.addAttribute("myArry",myArry); 
			System.out.println("myArry 확인>>" + myArry);
		}
		model.addAttribute("fixed",fixed);
		return "/orders/orderList";
	}
	
	// ////////////////////////////////////Cart(장바구니부분)/////////////////////////////////////////
	
	//-------------------------- 장바구니 삽입 (하나일때) ------------------------------------//
	@RequestMapping(value = "/cartInsert")
	public ModelAndView cartpartInsert(@RequestParam(value = "p_num", required = false, defaultValue="0") int p_num,
			 @ModelAttribute("Cart") Cart cart,  @ModelAttribute("Cartpart") Cartpart cartpart,
			HttpSession session) throws Exception {
		System.out.println("장바구니 삽입!!!" + p_num);
		String memberId = (String) session.getAttribute("memberId"); 
		int m_num = memberService.findMemberNum(memberId);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:./esmain.do?es_page=/cartList2");
		String[] chkCart = this.ordersService.findPNum(m_num);
		for(int i=0; i<chkCart.length; i++){
			System.out.println("p_num확인하자!!!!!!!!!" + chkCart[i]);
			if(Integer.parseInt(chkCart[i]) == cart.getP_num()){
				System.out.println("같대");
				return model;
			}
		}  
		
		cartpart.setP_num(p_num);
		cartpart.setM_num(m_num);
		
		ordersService.insertCartpart(cartpart);
		System.out.println("삽입했지롱~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		
		return model;
	}
	
	//-------------------------- 장바구니 삽입 (견적일때) ------------------------------------//
	@RequestMapping(value = "/cartgyunInsert")
	public ModelAndView cartInsert(@RequestParam(value = "p_num") String psum,
			 HttpSession session) throws Exception {
		Cart cartModel = new Cart();
		System.out.println("장바구니 삽입!!!" + psum);
		String memberId = (String) session.getAttribute("memberId"); 
		int m_num = memberService.findMemberNum(memberId);
		
		String cartArray[] = psum.split("/");
		String cartname = cartArray[0];
		System.out.println("장바구니이름 --> " + cartname);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("redirect:./esmain.do?es_page=/cartList2");
		
		String partsArray[] = cartArray[1].split(",");
		int p_num = 0;

		for(int i=0; i<partsArray.length; i++){
			System.out.println("p_num확인하자!!!!!!!!!" + partsArray[i]);
			p_num = Integer.parseInt(partsArray[i]);
			System.out.println("--------------------->" + p_num);
			cartModel.setP_num(p_num);
			cartModel.setM_num(m_num);
			cartModel.setCart_name(cartname);
			this.ordersService.insertCart(cartModel);
			System.out.println("삽입했지롱~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
		}
		
	
		return model;
	}
	
	//-------------------------- 장바구니리스트 (화면) ------------------------------------//
	@RequestMapping(value = "/cartList2")
	public String cartList(@ModelAttribute("Cart") Cart cart,  @ModelAttribute("Cartpart") Cartpart cartpart,
			 ModelMap model, HttpSession session) throws Exception {
		System.out.println("장바구니 리스트");
		String memberId = (String) session.getAttribute("memberId");
		int m_num = memberService.findMemberNum(memberId);
		
		List<Cartpart> cartList1 = this.ordersService.myCartpart(m_num);
		List<Cart> cartList2 = this.ordersService.myCart(m_num);  
		List<Cart> cartName = this.ordersService.chkCartname(m_num);
		model.addAttribute("cartList1", cartList1);
		model.addAttribute("cartList2", cartList2);
		model.addAttribute("cartName", cartName);
		
		return "/orders/cartList";
	}
	
	//-------------------------- 장바구니 1개삭제 (화면및처리) ------------------------------------//
	@RequestMapping(value = "/cartDelete")
	public ModelAndView cartDelete(@RequestParam("p_num") int p_num, HttpSession session) throws Exception {
		ModelAndView model = new ModelAndView();
		System.out.println("장바구니 리스트 삭제");
		System.out.println("부품번호??" + p_num);
		String memberId = (String) session.getAttribute("memberId");
		int m_num = memberService.findMemberNum(memberId);

		ordersService.deleteOneCartpart(p_num, m_num);
		model.setViewName("redirect:./esmain.do?es_page=/cartList2");
		return model;
	}
	
	//-------------------------- 장바구니 1개삭제 (화면및처리) ------------------------------------//
	@RequestMapping(value = "/cartGyunDelete")
	public ModelAndView cartGyunDelete(@RequestParam("cart_name") String cart_name) throws Exception {
		ModelAndView model = new ModelAndView();
		System.out.println("장바구니 리스트 삭제");
		System.out.println("장바구니이름 --> " + cart_name);   
		this.ordersService.deleteGyunCart(cart_name);
		model.setViewName("redirect:./esmain.do?es_page=/cartList2");
		return model;
	}
	
	
	///////////////////////////안드로이드 부분/////////////////////////////////////////
	//----------------- 주문서 작성 (화면) ---------------------------------------------
		@RequestMapping(value = "/m_orderList")
		public String m_orderList(@RequestParam(value = "p_num") String p_num,
				@RequestParam(value = "m_id") String am_id,
				ModelMap model, HttpSession session) throws Exception {
			System.out.println("주문서 작성 확인!!!" + "부품번호 >>" + p_num);
			session.setAttribute("am_id", am_id);
			String fix[] = p_num.split("/"); 
			String fixed = fix[1];
			System.out.println("가격 찍히나요!!!!!!!!!!!!!!!!!!!!!!!!! = " + fixed);
			String[] psplit = fix[0].split(",");
			int ss=0;
			ArrayList<Parts> myArry = new ArrayList<Parts>();
			for(int i=0; i<psplit.length; i++){
				System.out.println("확인 = " + psplit[i]);
				ss = Integer.parseInt(psplit[i]);
	 
				Parts partsContent = this.partsService.getPartscontent(ss);
				
				myArry.add(partsContent);
				model.addAttribute("myArry",myArry); 
				System.out.println("myArry 확인>>" + myArry.get(0));
			}
			model.addAttribute("fixed",fixed);
			return "/orders/android_orderList";
		}
		
		// -------------------------------------- 주문 등록 ----------------------------------------------//
		@RequestMapping(value = "/m_orderInsert")
		public String m_orderInsert(@ModelAttribute("Orders") Orders orders,
				@RequestParam("zip_addr") String zip_addr,
				@RequestParam("psum") String psum,
				@ModelAttribute("Order_detail") Order_detail order_detail, ModelMap model, HttpSession session) {
			System.out.println("오더 인서트 컴트롤러 진입");
			String am_id = (String) session.getAttribute("am_id");
			int m_num = memberService.findMemberNum(am_id);
			orders.setM_num(m_num);
			
			ordersService.insertOrders(orders);
			
			int o_num = ordersService.chkOrderSeq(); // 현재 시퀀스로 주문번호 확인

			String pnum[] = psum.split(",");
			int p_num = 0;

			for(int i=0; i<pnum.length; i++){
				System.out.println("p_num확인하자!!!!!!!!!" + pnum[i]);
				p_num = Integer.parseInt(pnum[i]);
				System.out.println("--------------------->" + p_num);
				order_detail.setO_num(o_num);
				order_detail.setP_num(p_num);
				ordersService.insertOrdersDetail(order_detail);
				this.ordersService.minorAmount(p_num);
			}
			List<Orders> partsList = ordersService.getOrderPartsList(o_num);
			Orders infoList = this.ordersService.getOrderList(o_num);  
			System.out.println("너!!!!여러개지?" + partsList);  
			System.out.println("너!!!!한개지?" + infoList);  
			model.addAttribute("partsList",partsList); 
			model.addAttribute("infoList",infoList);
			model.addAttribute("zip_addr", zip_addr);
			return "/orders/orderSuccess";

		}

}
