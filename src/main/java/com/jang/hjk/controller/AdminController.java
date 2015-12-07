package com.jang.hjk.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jang.hjk.model.Auction;
import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Bid;
import com.jang.hjk.model.Company;
import com.jang.hjk.model.Library;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Parts;
import com.jang.hjk.model.Parts_code;
import com.jang.hjk.service.AdminService;
import com.jang.hjk.service.AuctionService;
import com.jang.hjk.service.BoardService;
import com.jang.hjk.service.MemberService;
import com.jang.hjk.service.OrdersService;
import com.jang.hjk.service.PartsService;


@Controller
public class AdminController {
	
	@Resource(name = "adminService") 
	private AdminService adminService;
	
	@Resource(name = "memberService") 
	private MemberService memberService;
	
	@Resource(name = "partsService") 
	private PartsService partsService;
	
	@Resource(name = "boardService") 
	private BoardService boardService;
	
	@Resource(name = "auctionService") 
	private AuctionService auctionService;
	
	@Resource(name = "ordersService") 
	private OrdersService ordersService;

	//----------------- 배너(배너) ------------------------------------//
	@RequestMapping(value = "/test")
	public String test() {
		return "/test";
	}
	
	//----------------- HJK로딩 페이지(화면) ------------------------------//
		@RequestMapping(value = "/loding")
		public String loding() {
			return "/loding";
		}
	
	//----------------- 관리자페이지 (바탕) ---------------------------------//
	@RequestMapping(value = "/adminpage")
	public String adminMain() {
		return "/admin/adminpage";
	}
	  
	//----------------- 관리자 네비게이션 ------------------------------------//
	@RequestMapping(value = "/adminpage_navi")
	public String adminNavi(HttpSession session) {
		String managerId = (String) session.getAttribute("managerId");
		return "/admin/adminpage_navi_menu";
	}
	
	// //////////////////////////////// 관리자 회원관리 ////////////////////////////////// //
	//----------------- 회원리스트 ------------------------------------//
	@RequestMapping(value = "/adminMember")
	public String adminMember(ModelMap model) {
		System.out.println("회원관리");
		List<Member> memberAll = this.memberService.getMemberAll();
		model.addAttribute("memberAll", memberAll);     
		return "/admin/admin_member";
	}
	
	//----------------- 회원탈퇴 (처리) ----------------------------------
	@RequestMapping(value = "/adminMemDel")
	public ModelAndView adminMemDel(@RequestParam(value = "m_num") int m_num) throws Exception {

		ModelAndView model = new ModelAndView();
		System.out.println("회원번호 확인 == " + m_num);
		this.adminService.adminMemDel(m_num);
	
		model.setViewName("redirect:./adminpage?admin_page=/adminMember");
		return model;
	}
	
	// //////////////////////////////// 관리자 상품관리 ////////////////////////////////// //
	//------------------------- 상품리스트 ------------------------------------//
	@RequestMapping(value = "/adminParts")
	public String adminParts(ModelMap model) {
		System.out.println("상품관리");
		List<Parts_code> partsCode = this.partsService.getPccode();
		model.addAttribute("partsCode", partsCode);
		return "/admin/admin_parts";
	}
	
	//------------------------- 상품검색 ------------------------------------//
	@ResponseBody
	@RequestMapping(value = "/adminPartsSearch", method = RequestMethod.POST)
	public HashMap<String, Object> adminPartsSearch(@RequestParam(value = "pc_code", required = false) String pc_code) {
		System.out.println("adminPartsSearch e들어왔지롱ㅋㅋㅋㅋㅋㅋㅋ");
		System.out.println("selectedVal왔냐 -> " + pc_code);
		int pccode = Integer.parseInt(pc_code);
		List<Parts> partsList = this.partsService.getParts(pccode);
		HashMap<String, Object> result = new HashMap<String, Object>();
		result.put("partsList", partsList);
		return result;
	}
	
	//----------------- 상품상세 (화면) ----------------------------------
	@RequestMapping(value = "/adminPartsContent")
	public String adminPartsContent(@RequestParam(value = "p_num") int p_num, ModelMap model) throws Exception {

		System.out.println("부품번호 확인 == " + p_num);
		Parts partsContent = this.partsService.getPartscontent(p_num);  
		model.addAttribute("partsContent", partsContent);

		return "/admin/admin_partsContent";
	}
	
	//----------------- 상품 등록 (화면)----------------------------------
	@RequestMapping(value = "/adminPartsInsert")
	public String adminPartsInsert(ModelMap model) throws Exception {

		List<Parts_code> partsCode = this.partsService.getPccode();
		List<Company> companyList = this.adminService.getCompany();
		model.addAttribute("partsCode", partsCode);
		model.addAttribute("companyList", companyList);

		return "/admin/admin_partsInsert";
	}
	
	//----------------- 상품 등록 (처리) ----------------------------------
	@RequestMapping(value = "/adminPartsInsertProc")
	public ModelAndView adminPartsInsertProc(@ModelAttribute("Parts") Parts parts, 
			MultipartHttpServletRequest request, ModelMap model) throws Exception {
		int pccode = parts.getPc_code();
		String pc_name = this.adminService.getPcname(pccode);
		System.out.println("pc_code 확인 =====> " + pc_name);
		
		String uploadPath = "C:\\Users\\admin\\Desktop\\1117hyesu\\hjk\\src\\main\\webapp\\resources\\partsInsert\\" + pc_name + "\\";
		ModelAndView modelandview = new ModelAndView();
		System.out.println("상품등록처리 컨트롤러 들어옴!!!!!");
		MultipartFile file = request.getFile("uploadFile"); // get upload file
		System.out.println("파일 확인 --> " + file);
		
		String fileName	= file.getOriginalFilename();

		if(fileName.length() > 0){
			File uploadFile = new File(uploadPath + fileName); // java.io 패키지
			
			if (uploadFile.exists()) { // uploadFile이 있다면 date()를 flieName 앞에 붙여서 업로드 한다.
				fileName = new Date().getTime() + fileName;
				uploadFile = new File(uploadPath + fileName);
			}		
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {    
				e.printStackTrace();
			}
		} else{
		}
		parts.setP_img(pc_name + "/" + fileName);
		
		this.adminService.insertParts(parts);
		System.out.println("삽입완료!");
		int p_num = this.adminService.currentPnum();
		modelandview.setViewName("redirect:./adminpage?admin_page=/adminPartsContent?p_num=" + p_num);
		return modelandview;
	}
	
	//----------------- 상품수정 (화면) ----------------------------------
	@RequestMapping(value = "/adminPartsModiForm")
	public String adminPartsModiForm(@RequestParam(value = "p_num") int p_num, ModelMap model) throws Exception {
		System.out.println("수정화면들어왔지롱~~" + p_num);
		List<Parts_code> partsCode = this.partsService.getPccode();
		List<Company> companyList = this.adminService.getCompany();
		Parts parts = this.partsService.getPartscontent(p_num);
		model.addAttribute("partsCode", partsCode);
		model.addAttribute("companyList", companyList);
		model.addAttribute("parts", parts);
		return "/admin/admin_partsModify";
	}
			
	//----------------- 상품수정 (처리) ----------------------------------
	@RequestMapping(value = "/adminPartsModi")
	public ModelAndView adminPartsModi(@ModelAttribute("Parts") Parts parts, 
			MultipartHttpServletRequest request, ModelMap model) throws Exception {
		ModelAndView modelandview = new ModelAndView();
		
		int pccode = parts.getPc_code();
		String pc_name = this.adminService.getPcname(pccode);
		
		String uploadPath = "C:\\Users\\admin\\Desktop\\1117hyesu\\hjk\\src\\main\\webapp\\resources\\partsInsert\\" + pc_name + "\\";
		
		String orgFileName = request.getParameter("orgFile");
		MultipartFile newFile = request.getFile("newFile");// get upload file
		String newfileName = newFile.getOriginalFilename();

		parts.setP_img(orgFileName);
		if(newFile != null && !newFile.equals("")) { // 파일을 변경하고 싶을 때
			File removeFile = new File(uploadPath + orgFileName); // 업로드 파일 제거
			removeFile.delete();
			parts.setP_img(pc_name + "/" + newfileName);
		}
			
		File newUploadFile = new File(uploadPath + newfileName); // 업로드 파일 새로 생성
		try {
			newFile.transferTo(newUploadFile);
			
		} catch (Exception e) {  
				e.printStackTrace();
		}
		
		String content = parts.getP_memo().replaceAll("\r\n", "<br />"); 
		parts.setP_memo(content);

		this.adminService.partsUpdate(parts);

		modelandview.setViewName("redirect:./adminpage?admin_page=/adminPartsContent?p_num=" + parts.getP_num());
		return modelandview;
	}
	
	//----------------- 상품삭제 (처리) ----------------------------------
	@RequestMapping(value = "/adminPartsDel")
	public ModelAndView adminPartsDel(@RequestParam(value = "p_num") int p_num) throws Exception {

		ModelAndView model = new ModelAndView();
		System.out.println("부품번호 확인 == " + p_num);
		this.adminService.adminPartsDel(p_num);
	
		model.setViewName("redirect:./adminpage?admin_page=/adminParts");
		return model;
	}
	
	// //////////////////////////////// 관리자 자료실관리 ////////////////////////////////// ///
	
	//----------------- 자료실 글 등록(화면) ----------------------------------
	@RequestMapping(value = "/adminLibInsertForm")
	public String adminLibInsertForm() throws Exception {
		System.out.println("자료실 등록 화면!");
		
		return "admin/admin_libInsert";
	}
	
	//----------------- 자료실 글 등록(처리) ----------------------------------
	@RequestMapping(value = "/adminLibInsert")
	public ModelAndView adminLibInsert(@ModelAttribute("Library") Library library,
			MultipartHttpServletRequest request) throws Exception {
		System.out.println("자료실 등록 처리~~~~~~~~~~~~~");
		ModelAndView modelandview = new ModelAndView();
		
		String uploadPath = "C:\\Users\\admin\\Desktop\\1117hyesu\\hjk\\src\\main\\webapp\\resources\\libInsert\\";
		
		MultipartFile file = request.getFile("uploadFile"); // get upload file
		System.out.println("파일 확인 --> " + file);
		
		String fileName	= file.getOriginalFilename();

		if(fileName.length() > 0){
			File uploadFile = new File(uploadPath + fileName); // java.io 패키지
			
			if (uploadFile.exists()) { // uploadFile이 있다면 date()를 flieName 앞에 붙여서 업로드 한다.
				fileName = new Date().getTime() + fileName;
				uploadFile = new File(uploadPath + fileName);
			}		
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {    
				e.printStackTrace();
			}
		} else{
		}
		library.setL_file(fileName);
		
		System.out.println("제목 ------------------>" + library.getL_name());
		System.out.println("파일 ------------------>" + library.getL_file());
		System.out.println("상세 ------------------>" + library.getL_content());
		
		this.adminService.insertLib(library);
		System.out.println("삽입완료!!!!!!!!!!!!!!!!!!!!!!");
		
		modelandview.setViewName("redirect:./esmain.do?es_page=/libraryForm");
		return modelandview;
	}
	
	//----------------- 자료실 글 수정(화면) ----------------------------------
	@RequestMapping(value = "/adminLibModiForm")
	public String adminLibModiForm(@RequestParam(value = "l_num") int l_num,
			ModelMap model) throws Exception {
		System.out.println("자료실 수정 화면!");
		System.out.println("자료실번호 확인 == " + l_num);
		
		Library library = this.boardService.libContentView(l_num);
		model.addAttribute("library", library);
		return "/admin/admin_libModify";
	}
	
	//----------------- 자료실 글 수정(처리) ----------------------------------
	@RequestMapping(value = "/adminLibModi")
	public ModelAndView adminLibModi(@ModelAttribute("Library") Library library,
			MultipartHttpServletRequest request) throws Exception {
		System.out.println("자료실 수정처리~~~~~~~~~~~~~~~~");
		ModelAndView modelandview = new ModelAndView();
		
		String uploadPath = "C:\\Users\\admin\\Desktop\\1117hyesu\\hjk\\src\\main\\webapp\\resources\\libInsert\\";
		
		String orgFileName = request.getParameter("orgFile");
		MultipartFile newFile = request.getFile("newFile");// get upload file
		String newfileName = newFile.getOriginalFilename();

		library.setL_file(orgFileName);
		if(newFile != null && !newFile.equals("")) { // 파일을 변경하고 싶을 때
			File removeFile = new File(uploadPath + orgFileName); // 업로드 파일 제거
			removeFile.delete();
			library.setL_file(newfileName);
		}
			
		File newUploadFile = new File(uploadPath + newfileName); // 업로드 파일 새로 생성
		try {
			newFile.transferTo(newUploadFile);
			
		} catch (Exception e) {  
				e.printStackTrace();
		}
		
		String content = library.getL_content().replaceAll("\r\n", "<br />"); 
		library.setL_content(content);
		
		//update문
		//modelandview.setViewName("redirect:./esmain.do?es_page=/libContent.do?l_num=" + library.getL_num());
		
		return modelandview;
	}
	
	//----------------- 자료실 글 삭제(처리) ----------------------------------
	@RequestMapping(value = "/adminLibDel")
	public ModelAndView adminLibDel(@RequestParam(value = "l_num") int l_num) throws Exception {

		ModelAndView modelandview = new ModelAndView();
		System.out.println("자료실번호 확인 == " + l_num);
		this.adminService.libDelete(l_num);
	
		modelandview.setViewName("redirect:./esmain.do?es_page=/libraryForm");
		return modelandview;
	}
	
	// //////////////////////////////// 관리자 경매관리 ////////////////////////////////// //
	
	//----------------- 관리자 경매리스트 ------------------------------------//
	@RequestMapping(value = "/adminAuction")
	public String adminAuction() {
		System.out.println("경매관리");
		return "/admin/admin_auction";
	}  
	
	//------------------------- 경매검색 ------------------------------------//
		@ResponseBody
		@RequestMapping(value = "/adminAuctionSearch", method = RequestMethod.POST)
		public HashMap<String, Object> adminAuctionSearch(@RequestParam(value = "aucing", required = false) int aucing) {

			HashMap<String, Object> result = new HashMap<String, Object>();

			if(aucing == 1){
				List<Auction> aucsch = this.auctionService.getAucSchedule();
				result.put("aucState", "경매예정");				
				result.put("aucList", aucsch);

				return result;
			}else if(aucing == 2){
				List<Auction> aing = this.auctionService.getAucing();
				result.put("aucState", "경매중");
				result.put("aucList", aing);
				return result;    
			}else{
				List<Auction> endAuc = this.auctionService.getendAuctionAll();
				result.put("aucState", "경매종료");
				result.put("aucList", endAuc);
				return result;
			}
		}
     
		//----------------- 경매수정 (화면) ----------------------------------
		@RequestMapping(value = "/adminAucUp")
		public String adminAucDel(@RequestParam(value = "a_num") int a_num, ModelMap model) throws Exception {             
			Auction auction = this.auctionService.getAuction(a_num);
			String state = this.adminService.getState(a_num); 
			
			String pnumsnum = ""; 
			List<Auction_goods> ac_go = this.auctionService.getmyauction_goods(a_num);
			List<Parts> listP = new ArrayList();
			for(int i=0; i<ac_go.size(); i++){
				Parts parts = this.partsService.getPartscontent(ac_go.get(i).getP_num());
				listP.add(parts);
				pnumsnum += ac_go.get(i).getP_num() + ",";
			}
			if(state.equals("1")){
				model.addAttribute("state", "경매종료");
				model.addAttribute("auction", auction);
				model.addAttribute("listP", listP);
				return "/admin/admin_aucModify";
				
			}else if(state.equals("2")){
				model.addAttribute("auction", auction);
				model.addAttribute("listP", listP);
				return "/admin/admin_aucModify";
				
			}else{
				model.addAttribute("auction", auction);
				model.addAttribute("listP", listP);  
				return "/admin/admin_aucModify";
			}
		}
		@RequestMapping(value = "/partSearch")
		public String partSearch(@RequestParam(value = "pccode") int pc_code, @RequestParam(value = "pcname") String pcname, ModelMap model) throws Exception { 
			List<Parts> part = this.partsService.getParts(pc_code);
			model.addAttribute("pcname", pcname);
			model.addAttribute("part", part);
			model.addAttribute("pccode", pc_code);
			return "admin/partssearch";
		}
		          
		//----------------- 경매수정 (처리) ----------------------------------
		@RequestMapping(value = "/adminAucModi")
		public ModelAndView adminAucModi(
				@ModelAttribute("Auction") Auction Auction,
				@ModelAttribute("Auction_goods") Auction_goods Auction_goods,
				@RequestParam(value = "a_num") int a_num,
				@RequestParam(value = "auction_goods") String[] p_name, ModelMap model) throws Exception {
			ModelAndView ModelAndView = new ModelAndView();
			Auction.setA_num(a_num);
			this.adminService.auctionUpdate(Auction);
			Auction_goods.setA_num(a_num);
			for(int i=0; i<p_name.length; i++){
				int p_num = this.adminService.getPnum(p_name[i]);
				System.out.println(i+"p_num =>" + p_num);
//				Auction_goods.setP_num(p_num);
//				this.adminService.aucgoodsUpdate(Auction_goods);
			}
			ModelAndView.setViewName("redirect:./adminpage?admin_page=/admincontent?a_num="+a_num);
			return ModelAndView;
		}
		//----------------- 경매 등록 (화면)----------------------------------
		@RequestMapping(value = "/adminAucInsert")
		public String adminAucInsert(ModelMap model) throws Exception {

			List<Parts_code> partsCode = this.partsService.getPccode();
			List<Company> companyList = this.adminService.getCompany();
			model.addAttribute("partsCode", partsCode);
			model.addAttribute("companyList", companyList);

			return "/admin/admin_aucInsert";
		}
		//----------------- 경매등록 (처리) ----------------------------------
		@RequestMapping(value = "/adminAucInPro")
		public ModelAndView adminAucInPro(
						@ModelAttribute("Auction") Auction Auction,
						@ModelAttribute("Auction_goods") Auction_goods Auction_goods,
						@RequestParam(value = "auction_goods") String[] p_name, ModelMap model) throws Exception {
			ModelAndView ModelAndView = new ModelAndView();
			int a_start = Auction.getA_start();
			Auction.setA_now(a_start);
			this.adminService.auctionInsert(Auction);
			int a_num = adminService.chkAuctionSeq();
			Auction_goods.setA_num(a_num);
			for(int i=0; i<p_name.length; i++){
				int p_num = this.adminService.getPnum(p_name[i]);
				System.out.println(i+"p_num =>" + p_num);
				Auction_goods.setP_num(p_num);
				this.adminService.aucgoodsInsert(Auction_goods);
			}
			ModelAndView.setViewName("redirect:./adminpage?admin_page=/admincontent?a_num="+a_num);
			return ModelAndView;
		}
		//----------------- 경매수정 (화면) ----------------------------------
				@RequestMapping(value = "/admincontent")
				public String admincontent(@RequestParam(value = "a_num") int a_num, ModelMap model) throws Exception {             
					Auction auction = this.auctionService.getAuction(a_num);
					String state = this.adminService.getState(a_num); 
					
					String pnumsnum = ""; 
					List<Auction_goods> ac_go = this.auctionService.getmyauction_goods(a_num);
					List<Parts> listP = new ArrayList();
					for(int i=0; i<ac_go.size(); i++){
						Parts parts = this.partsService.getPartscontent(ac_go.get(i).getP_num());
						listP.add(parts);
						pnumsnum += ac_go.get(i).getP_num() + ",";
					}
					if(state.equals("1")){
						model.addAttribute("state", "경매종료");
						model.addAttribute("auction", auction);
						model.addAttribute("listP", listP);
						return "/admin/admin_content";
						
					}else if(state.equals("2")){
						model.addAttribute("state", "경매중");
						model.addAttribute("auction", auction);
						model.addAttribute("listP", listP);
						return "/admin/admin_content";
						
					}else{
						model.addAttribute("state", "경매예정");
						model.addAttribute("auction", auction);
						model.addAttribute("listP", listP);  
						return "/admin/admin_content";
				}
				}
}
