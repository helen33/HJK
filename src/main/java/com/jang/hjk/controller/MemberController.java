package com.jang.hjk.controller;

import java.util.ArrayList;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Bid;
import com.jang.hjk.model.Manager;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Orders;
import com.jang.hjk.model.Parts;
import com.jang.hjk.model.Post;
import com.jang.hjk.model.Qna;
import com.jang.hjk.service.AuctionService;
import com.jang.hjk.service.BoardService;
import com.jang.hjk.service.MemberService;
import com.jang.hjk.service.OrdersService;
import com.jang.hjk.service.PartsService;

@Controller
public class MemberController {
	
	@Resource(name = "memberService") 
	private MemberService memberService;
	
	@Resource(name = "boardService") 
	private BoardService boardService;
	
	@Resource(name = "auctionService") 
	private AuctionService auctionService;
	
	@Resource(name = "partsService") 
	private PartsService partsService;
	
	@Resource(name = "ordersService") 
	private OrdersService ordersService;
	
	//------------ 견적 입찰 비밀번호 확인 --------------------------------------------//
	@ResponseBody // @ResponseBody ajax에서 데이터를 넘길때 필요한 어노테이션
	@RequestMapping(value = "/idpass", method = RequestMethod.POST)
    public Object add(String pass, HttpSession session){

		String aucpass = (String) session.getAttribute("aucpass");
	
		Map<String, Object> result = new HashMap<String, Object>();
		
			if(pass.equals(aucpass)){
				result.put("one", "1");
				return result;
			}else{
				result.put("one", "2");
				result.put("two", "비밀번호가 맞지 않습니다.");
				return result;
			}
	}
	
	//----------------- 로그인 (화면) ---------------------------------------------//
	@RequestMapping(value = "/login.do")
	public String login() {
		return "/login/login";
	}
	
	//-----------------회원 정보 수정 처리 ----------------------------------------------//
	@ResponseBody // @ResponseBody ajax에서 데이터를 넘길때 필요한 어노테이션
	@RequestMapping(value = "/idlogin", method = RequestMethod.POST)
    public Object add(String m_id, String m_pass, HttpSession session){
		Map<String, Object> result = new HashMap<String, Object>();
		
		Member loginUser = this.memberService.getMember(m_id, m_pass);
		Manager loginManager = this.memberService.findManager(m_id, m_pass);
		
		if(loginUser != null) { // Member 로그인 성공시
			System.out.println("z");
			session.setAttribute("memberId", m_id); // 세션에 변수등록
			session.setAttribute("aucpass", m_pass);
			result.put("two", m_id+ "님, 환영합니다..");
			return result;
			
		} else if(loginManager != null) { // Manager 로그인 성공시
			System.out.println("gf");
			session.setAttribute("managerId", m_id); // 세션에 변수등록
			result.put("two", m_id+"관리자로 로그인되었습니다.");
			return result;
			
		} else { // Member&Manager 로그인 실패시
			System.out.println("dd");
				result.put("one", 1);
				result.put("two", "아이디와 비밀번호를 확인 해 주세요.");
				return result;
	}
	}
	
	//----------------- 로그아웃 ------------------------//
	@RequestMapping(value =  "/logout")
    public String logout(HttpSession session) {
		session.invalidate();
        System.out.println("세션종료");
        return "redirect:/index.do";
    }
	
	//----------------- 회원가입 (화면) -----------------//
	@RequestMapping(value = "/meminsert.do")
	public String sign() {
		return "/login/meminsert";
	}
	
	//-------------------------------- 회원가입(처리) -----------------------------//
	@RequestMapping(value = "/meminsert", method = RequestMethod.POST)
	public String joinProc(@ModelAttribute("Member") Member member) {
		memberService.insert(member);
		return "/index";
	}
	
	//-------------------회원 정보 수정 (화면) ----------------------------------------//
	@RequestMapping(value = "/myupdateForm", method = RequestMethod.GET)
	public String toUserEditView(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		Member member=memberService.findMemberInfo(memberId);
		model.addAttribute("member", member);
		return "/member/myupdate";
	}   
	
	//-----------------회원 정보 수정 처리 ----------------------------------------------//
	@ResponseBody // @ResponseBody ajax에서 데이터를 넘길때 필요한 어노테이션
	@RequestMapping(value = "/myupdate", method = RequestMethod.POST)
    public Object add(String m_id, String m_pass, String m_name, String m_email, String m_phone, String m_birth,
    		String zip_code, String m_addr){
		System.out.println("zz");
		Map<String, Object> result = new HashMap<String, Object>();
		 	Member member = new Member();
		 	System.out.println("확인 = >" + m_id + "생일 =>" + m_birth);
		 	member.setM_id(m_id);
		 	member.setM_pass(m_pass);
		 	member.setM_name(m_name);
		 	member.setM_email(m_email);
		 	member.setM_phone(m_phone);
		 	member.setM_birth(m_birth);
		 	member.setZip_code(zip_code);
		 	member.setM_addr(m_addr);

			this.memberService.updateMember(member); // user data 수정	
			Member mem = this.memberService.getMember(m_id, m_pass); 
			
			result.put("one","회원수정완료 되었습니다.");
			result.put("mem", mem);
			
			return result;
	}
	
	
	//----------------- 회원탈퇴 (화면) ----------------------------------------------//
	@RequestMapping(value =  "/mydelete", method = RequestMethod.GET)
    public String memberdeleteform(Member member, HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		member = memberService.findMemberInfo(memberId);
		model.addAttribute("member", member);
        return "/member/mydelete";
    }
	
	//----------------회원탈퇴 (처리) -------------------------------------------------//
	@RequestMapping(value = "memberDelete", method = RequestMethod.POST)
	public ModelAndView memberdeletelogic(@ModelAttribute("Member") @Valid Member member){
		ModelAndView modelAndView = new ModelAndView();
		this.memberService.deleteMember(member);
		modelAndView.setViewName("./member/myDeleteSuccess");
		modelAndView.addObject("deleteok", "삭제가 완료되었습니다");
		modelAndView.addObject("member",member);				
		return modelAndView;
	}
	
	//----------------중복체크 ------------------------------------------------------//
	@ResponseBody // @ResponseBody ajax에서 데이터를 넘길때 필요한 어노테이션
	@RequestMapping(value = "/checkid_Bean", method = RequestMethod.POST)
	public HashMap<String, Object> checkidProc(@RequestParam(value = "m_id", required = false) String m_id, 
				ModelMap model) throws Exception {

		HashMap<String, Object> result = new HashMap<String, Object>();
		int c_id = this.memberService.checkid(m_id);
		System.out.println("컨트롤러의 c_id=" + c_id);
		if(c_id > 0)
		{
			result.put("one","이미 있는 아이디입니다.");
			result.put("two", c_id);
			model.addAttribute("one","이미 있는 아이디입니다.");
			
			return result;
		} else
		{
			result.put("one","사용가능한 아이디입니다.");
			result.put("two", c_id);
			model.addAttribute("one","사용가능한 아이디입니다.");
			return result;
		}	
	}
	
	//----------------- 우편번호 - 회원가입 (화면) ---------------------------------------------//
	@RequestMapping(value = "/checkpost")
	public String toPostView(@RequestParam(value = "ch", defaultValue = "0") String ch,
			ModelMap model) {
		model.addAttribute("ch", ch);
		return "/login/post";
	}

	//------------------------------- 우편번호 찾기 ---------------------------------//
	@RequestMapping(value = "/checkpost_Bean", method = RequestMethod.POST)
	public String form(@RequestParam(value = "dong", required = false, defaultValue = "0") String dong,
			@RequestParam(value = "ch", required = false, defaultValue = "0") String ch,
			ModelMap model) throws Exception {
		model.addAttribute("ch", ch);
		ModelAndView modelAndView = new ModelAndView();
		try {
			String dong2 = "%" + dong + "%" ;
			List<Post> postcheck = this.memberService.getPost(dong2);
			modelAndView.addObject("postcheck" , postcheck);
			model.addAttribute("postcheck", postcheck);
			return "/login/post";
		} catch (EmptyResultDataAccessException e){
			return "/login/post";
		}
	}
		
	//----------------- ID찾기 (화면) ---------------------------------------------//
	@RequestMapping(value = "/idsearchFrom")
	public String idsearch() {
		return "/login/idsearch";
	}
	
	//----------------- ID찾기 (처리) ---------------------------------------------//
	@RequestMapping(value = "/idsearch", method = RequestMethod.POST)
	public ModelAndView idsearchProc(@Valid @ModelAttribute("Member") Member member) {
		ModelAndView modelAndView = new ModelAndView();
				
		try {
			Member idSearch = this.memberService.idSearch(member.getM_name(), member.getM_phone());

			if(idSearch.getM_id().equals("1")){
				System.out.println("여기");
				modelAndView.setViewName("/login/idsearch");
				modelAndView.addObject("no","일치하는 회원 정보가 없습니다.");
				return modelAndView;
			}else{
			modelAndView.setViewName("/login/searchSuc");
			modelAndView.addObject("what","회원님의 아이디는 (" + idSearch.getM_id() + ")입니다.");
			return modelAndView;
			}
		} catch (EmptyResultDataAccessException e) { //id pass 가 입력되었으나 틀린 경우
			return modelAndView;
		}
	}
	
	//----------------- PW찾기 (화면) ---------------------------------------------//
	@RequestMapping(value = "/pwsearchFrom")
	public String pwsearch() {
		return "/login/pwsearch";
	}
		
	//----------------- PW찾기 (처리) ---------------------------------------------//
	@RequestMapping(value = "/pwsearch", method = RequestMethod.POST)
	public ModelAndView pwsearchProc(@Valid @ModelAttribute("Member") Member member) {

		ModelAndView modelAndView = new ModelAndView();
				          
		try {
			Member pwSearch = this.memberService.pwSearch(member.getM_id(),member.getM_name(),member.getM_phone());
					
			if(pwSearch.getM_pass().equals("1")){
				System.out.println("여기");
				modelAndView.setViewName("/login/pwsearch");
				modelAndView.addObject("no","일치하는 회원 정보가 없습니다.");
				return modelAndView;
			}else{
				modelAndView.setViewName("/login/searchSuc");
				modelAndView.addObject("what", "회원님의 비밀번호는 (" + pwSearch.getM_pass() + ")입니다.");
				return modelAndView;
			}

			
		} catch (EmptyResultDataAccessException e) { //id pass 가 입력되었으나 틀린 경우
			return modelAndView;
		}
	}
	
	
	///////////////////////////=마이페이지= //////////////////////////////////////////
	//------------------------ 마이페이지 네비게이션 ---------------------------------//
		@RequestMapping(value = "/mypage_navi")
		public String mypage_navi() {
			return "/member/mypage_navi_menu";
		}
		//------------------------------- 마이페이지 ---------------------------------//
		
		@RequestMapping(value = "/mypage")
		public String mypage(HttpSession session) {
			String memberId = (String) session.getAttribute("memberId");
			if(memberId == null){
				return "/login/login";
			}else{
				return "/member/mypage";
			}
		}
		
		//----------------- 전체 주문내역 (화면) ---------------------------------------------//
		@RequestMapping(value = "/mytotalOders")
		public String mytotalOders(HttpSession session, Model model) {
			String memberId = (String) session.getAttribute("memberId");
			System.out.println("확인=" + memberId);
			
			List<Orders> mytotalorders = this.ordersService.mytotalorders(memberId);
			
			if(mytotalorders.size() == 0){
				model.addAttribute("mytotalorders", mytotalorders);
				model.addAttribute("note", "구매된 상품이 없습니다.");
			} else {
				model.addAttribute("mytotalorders", mytotalorders);
				model.addAttribute("note", "");
			}
			
			return "/member/totalOders";
		}
		
		//--------------- 주문 상세 내역 (화면)------------------------------------------------//
		@RequestMapping(value = "myorder_detail")
		public String myorder_detail(
				@RequestParam(value = "onum", required = false, defaultValue = "0") int o_num,
				HttpSession session, ModelMap model) throws Exception{
			ModelAndView ModelAndView = new ModelAndView();
			String m_id = (String) session.getAttribute("memberId");
			
			System.out.println("m_id?"+m_id);
			
			//주문 정보//
			Orders infoList = this.ordersService.getOrderList(o_num);  
			System.out.println("너!!!!한개지?" + infoList); 
			//주문 상품 정보//
			List<Orders> partsList = ordersService.getOrderPartsList(o_num);
			System.out.println("너!!!!여러개지?" + partsList);
			
			model.addAttribute("infoList", infoList);
			model.addAttribute("partsList", partsList);
			
			return "/member/myorder_detail";
		}
		    
		//----------------- 내가 쓴 문의글 (화면) ---------------------------------------------//
		@RequestMapping(value = "/myQnaList")
		public String myQnaList(HttpSession session, Model model) {
			String memberId = (String) session.getAttribute("memberId");
			System.out.println("확인=" + memberId);
			List<Qna> myqna = this.boardService.getMyqna(memberId);
			if(myqna.size() == 0){
				model.addAttribute("myqna", myqna);
				model.addAttribute("note", "등록된 글이 없습니다.");
			}else{
				model.addAttribute("myqna", myqna);
				model.addAttribute("note", "");
			}
			return "/member/myQnaList";
		}
		
		//----------------- 나의 입 낙찰내역 (화면) ---------------------------------------------//
		@RequestMapping(value = "/myauction")
		public String myestimateList(HttpSession session,Model model) {
			String m_id = (String) session.getAttribute("memberId");
			List<Bid> mybid = this.auctionService.getmybid(m_id);
			
			GregorianCalendar today = new GregorianCalendar ( ); 
			 
			int year = today.get ( today.YEAR );
			int month = today.get ( today.MONTH ) + 1;
			int yoil = today.get ( today.DAY_OF_MONTH ); 
			String day1 = year + "-" + month + "-" + yoil ;

			List<Bid> list = new ArrayList();
			List<Bid> list2 = new ArrayList();
			
				for(int i=0 ; i < mybid.size() ; i++){
				String day2 = mybid.get(i).getB_date();  
				int compare = day1.compareTo(day2);
				if(compare > 0){
					System.out.println("지난날짜");
					list.add(mybid.get(i));
				}
				else if(compare < 0){
					System.out.println("경매중");
					list2.add(mybid.get(i));
				}
				else{                 
					System.out.println("현재");      
					list2.add(mybid.get(i));
				}
			}  
					model.addAttribute("list", list);
					model.addAttribute("list2", list2);
					return "/member/myauction";          
		}
		//------------------------------- 나의 입낙찰 내역상세화면 ---------------------------------//
		@RequestMapping(value = "/myesticontent")
		public String form(@RequestParam(value = "bnum", required = false, defaultValue = "0") int b_num,
				@RequestParam(value = "cname", required = false, defaultValue = "0") String c_name,
				HttpSession session, ModelMap model) throws Exception {
			ModelAndView ModelAndView = new ModelAndView();

			String m_id = (String) session.getAttribute("memberId");

			Bid bid = this.auctionService.getmyauction(b_num);
			List<Auction_goods> ac_go = this.auctionService.getmyauction_goods(bid.getA_num());
			
			model.addAttribute("c_name", c_name);
			model.addAttribute("bid", bid);
			model.addAttribute("m_id", m_id);
			  
			List<Parts> listP = new ArrayList();
			
			for(int i=0; i<ac_go.size(); i++){
				Parts parts = this.partsService.getPartscontent(ac_go.get(i).getP_num());
				listP.add(parts);
				System.out.println("리스트안에 확인좀 = " + parts.getPc_code());
			}
			System.out.println("리스트안에 확인좀 22= " +listP.size());
			model.addAttribute("listP", listP);
			return "/member/myestiContent";
		}
		
		///////////////////////////////안드로이드//////////////////////////////////
		//----------------- 나의 입 낙찰내역 (화면) ---------------------------------------------//
				@RequestMapping(value = "/m_myauction")
				public String m_myestimateList(@RequestParam(value = "m_id") String am_id,
						HttpSession session,Model model) {
					session.setAttribute("am_id", am_id);
					List<Bid> mybid = this.auctionService.getmybid(am_id);
					
					GregorianCalendar today = new GregorianCalendar ( ); 
					 
					int year = today.get ( today.YEAR );
					int month = today.get ( today.MONTH ) + 1;
					int yoil = today.get ( today.DAY_OF_MONTH ); 
					String day1 = year + "-" + month + "-" + yoil ;

					List<Bid> list = new ArrayList();
					List<Bid> list2 = new ArrayList();
					
						for(int i=0 ; i < mybid.size() ; i++){
						String day2 = mybid.get(i).getB_date();  
						int compare = day1.compareTo(day2);
						if(compare > 0){
							System.out.println("지난날짜");
							list.add(mybid.get(i));
						}
						else if(compare < 0){
							System.out.println("경매중");
							list2.add(mybid.get(i));
						}
						else{                 
							System.out.println("현재");      
							list2.add(mybid.get(i));
						}
					}  
							model.addAttribute("list", list);
							model.addAttribute("list2", list2);
							return "/member/android_myauction";          
				}
				
		//------------------------------- 나의 입낙찰 내역상세화면 ---------------------------------//
		@RequestMapping(value = "/m_myesticontent")
		public String m_myesticontent(
				@RequestParam(value = "bnum", required = false, defaultValue = "0") int b_num,
				@RequestParam(value = "cname", required = false, defaultValue = "0") String c_name,
				HttpSession session, ModelMap model) throws Exception {
			
			String am_id = (String) session.getAttribute("am_id");

			Bid bid = this.auctionService.getmyauction(b_num);
			List<Auction_goods> ac_go = this.auctionService.getmyauction_goods(bid.getA_num());
			
			model.addAttribute("c_name", c_name);
			model.addAttribute("bid", bid);
			model.addAttribute("am_id", am_id);
			  
			List<Parts> listP = new ArrayList();
			
			for(int i=0; i<ac_go.size(); i++){
				Parts parts = this.partsService.getPartscontent(ac_go.get(i).getP_num());
				listP.add(parts);
				System.out.println("리스트안에 확인좀 = " + parts.getPc_code());
			}
			System.out.println("리스트안에 확인좀 22= " +listP.size());
			model.addAttribute("listP", listP);
			return "/member/android_myestiContent";
		}
		
		
		//----------------- 전체 주문내역 (화면) ---------------------------------------------//
			@RequestMapping(value = "/m_mytotalOders")
			public String m_mytotalOders(
					@RequestParam(value = "m_id") String am_id,
					HttpSession session, Model model) {
				session.setAttribute("am_id", am_id);
				System.out.println("확인=" + am_id);
				
				List<Orders> mytotalorders = this.ordersService.mytotalorders(am_id);
				
				if(mytotalorders.size() == 0){
					model.addAttribute("mytotalorders", mytotalorders);
					model.addAttribute("note", "구매된 상품이 없습니다.");
				} else {
					model.addAttribute("mytotalorders", mytotalorders);
					model.addAttribute("note", "");
				}
				
				return "/member/android_totalOders";
			}
		
		//--------------- 주문 상세 내역 (화면)------------------------------------------------//
		@RequestMapping(value = "m_myorder_detail")
		public String m_myorder_detail(
				@RequestParam(value = "onum", required = false, defaultValue = "0") int o_num,
				HttpSession session, ModelMap model) throws Exception{
			
			String am_id = (String) session.getAttribute("am_id");
			System.out.println("확인=" + am_id);
			
			//주문 정보//
			Orders infoList = this.ordersService.getOrderList(o_num);  
			System.out.println("너!!!!한개지?" + infoList); 
			//주문 상품 정보//
			List<Orders> partsList = ordersService.getOrderPartsList(o_num);
			System.out.println("너!!!!여러개지?" + partsList);
			
			model.addAttribute("infoList", infoList);
			model.addAttribute("partsList", partsList);
			
			return "/member/android_myorder_detail";
		}
		
		
		
}

