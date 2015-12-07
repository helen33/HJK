package com.jang.hjk.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jang.hjk.model.Auction;
import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Bid;
import com.jang.hjk.model.Parts;
import com.jang.hjk.service.AuctionService;
import com.jang.hjk.service.MemberService;
import com.jang.hjk.service.OrdersService;
import com.jang.hjk.service.PartsService;

@Controller
public class AuctionController {
	@Resource(name = "memberService") 
	private MemberService memberService;
	
	@Resource(name = "partsService") 
	private PartsService partsService;
	
	@Resource(name = "ordersService") 
	private OrdersService ordersService;;
	                  
	@Resource(name = "auctionService") 
	private AuctionService auctionService;
	
	
	//---------경매메인 레이아웃-----------//
	@RequestMapping(value="/aumain", method = RequestMethod.GET)
	public String aumain(){
		return "/auction/aumain";
	}

	// /////////////////////////// 경매 종료  ///////////////////////////////// //
	//--------경매종료 리스트(뷰)----------//
	@RequestMapping(value="/aucend")
	public String aucend(
			HttpSession session, ModelMap model) throws Exception{
		List<Auction> aucionendList = this.auctionService.getendAuctionAll();
		model.addAttribute("aucionendList", aucionendList);
		return "/auction/aucend";
	}
	
	// /////////////////////////// 경매 중  ///////////////////////////////// //
                      
	//---------경매메인 레이아웃-----------//
	@RequestMapping(value="/autimer", method = {RequestMethod.GET, RequestMethod.POST})
	public String autimer(HttpSession session,Model model,
			@RequestParam(value = "a_num") int a_num) throws Exception {		
		System.out.println("a_num???? = " + a_num);
		
		Auction auction = auctionService.getendtimer(a_num);
		/////////End date - Sysdate///////
		int aday = Integer.parseInt(auction.getDay());
		int ahour = Integer.parseInt(auction.getHour());
		int aminute = Integer.parseInt(auction.getMinute());
		System.out.println(auction.getSecond());
		System.out.println("End date - Sysdate : " + aday + "일" + ahour + "시" + aminute + "분");
		     
		model.addAttribute("aday", aday);
		model.addAttribute("ahour", ahour);
		model.addAttribute("aminute", aminute);
		model.addAttribute("a_num" , a_num);
		
		  
		return "/auction/timer";
	}
	//--------경매중 리스트(뷰)----------//
	@RequestMapping(value="/aucing")
	public String aucing(ModelMap model){
		List<Auction> aucing = this.auctionService.getAucing();
		model.addAttribute("aucing", aucing);
		return "/auction/aucing";    
	}
	//--------경매중 상세(뷰)----------//
	@RequestMapping(value="/aucingD") 
	public String aucingD(@RequestParam(value = "a_num") int a_num, ModelMap model){
		
		String pnumsnum = "";              

		Auction auction = this.auctionService.getAuction(a_num);
		List<Bid> bids = this.auctionService.getBids(a_num);
		List<Auction_goods> ac_go = this.auctionService.getmyauction_goods(a_num);
		
		List<Parts> listP = new ArrayList();

		for(int i=0; i<ac_go.size(); i++){
			Parts parts = this.partsService.getPartscontent(ac_go.get(i).getP_num());
			listP.add(parts);
			pnumsnum += ac_go.get(i).getP_num() + ",";
		}
		model.addAttribute("pnumsnum", pnumsnum);
		model.addAttribute("bidder", bids.get(0));
		model.addAttribute("auction", auction);
		model.addAttribute("bids", bids);
		model.addAttribute("listP", listP);
		return "/auction/aucingcontent";
	}
	
	//----------------------- 경매중 부품 이미지 상세 팝업창 -----------------------------//
	@RequestMapping(value="/aucingimg")
	public String aucingimg(@RequestParam("img") String img, ModelMap model){
		model.addAttribute("img", img);  
		return "/auction/aucimg";  
	}

	// -----------------------경매중 상세(뷰)--------------------------------------//
	@ResponseBody  
	// @ResponseBody ajax에서 데이터를 넘길때 필요한 어노테이션
	@RequestMapping(value = "/bidbestUpdate", method = RequestMethod.POST)
	public Object add(int bestbid, int a_num, HttpSession session,
			ModelMap model) {
		String memberId = (String) session.getAttribute("memberId");
		
		String m_state = this.auctionService.getmState(memberId, a_num);
		if(m_state.equals("1")){
			System.out.println("인서트 시킬꺼에요 ");
			this.auctionService.insertBider(memberId, bestbid, a_num);
			
		}else{
			System.out.println("업데이트 시킬꺼에요 ");
			this.auctionService.updateBider(memberId, bestbid, a_num);
			
		}
		Map<String, Object> result = new HashMap<String, Object>();

		result.put("one", "입찰되셨습니다.");
		return result;	
	}
	
	// -----------------------경매중 상세(뷰)--------------------------------------//
	@RequestMapping(value="/bidend") 
	public String bidend(@RequestParam(value = "a_num") int a_num, ModelMap model){
		
		this.auctionService.bidendUpdate(a_num);
		List<Auction> aucing = this.auctionService.getAucing();
		model.addAttribute("aucing", aucing);
		return "/auction/aucing"; 
	}
	
	// /////////////////////////// 경매 예정  ///////////////////////////////// //
	//---------------- 경매예정 리스트 -----------------------//
	@RequestMapping(value="/aucschedule")
	public String auscheduleList(ModelMap model){
		List<Auction> auscheduleList = this.auctionService.getAucSchedule();
		model.addAttribute("auscheduleList", auscheduleList);
		return "/auction/aucschedule";
	}
	
	//--------------- 경매종료 상세 상품창 --------------------//
	@RequestMapping(value="/auction_detail")
	public String aucshcedule_detail(@RequestParam("a_num") int a_num, ModelMap model){
		System.out.println("경매번호 들어왔니??? 여기 ==> " + a_num);
		List<Auction> auctionParts = this.auctionService.getAuctionParts(a_num);
		Auction auctionInfo = this.auctionService.getAuction(a_num);
		model.addAttribute("auctionInfo", auctionInfo);  
		model.addAttribute("auctionParts", auctionParts);  
		return "/auction/auction_detail";  
	}
	
	//////////////////////////////Android 부분//////////////////////////////////
	@RequestMapping(value="/m_auction_detail")
	public String m_auction_detail(
			@RequestParam("a_num") int a_num, ModelMap model){
		System.out.println("경매번호 들어왔니??? 여기 ==> " + a_num);
		
		String pnumsnum = "";              

		Auction auction = this.auctionService.getAuction(a_num);
		List<Bid> bids = this.auctionService.getBids(a_num);
		List<Auction_goods> ac_go = this.auctionService.getmyauction_goods(a_num);
		
		List<Parts> listP = new ArrayList();

		for(int i=0; i<ac_go.size(); i++){
			Parts parts = this.partsService.getPartscontent(ac_go.get(i).getP_num());
			listP.add(parts);
			pnumsnum += ac_go.get(i).getP_num() + ",";
		}
		model.addAttribute("pnumsnum", pnumsnum);
		model.addAttribute("bidder", bids.get(0));
		model.addAttribute("auction", auction);
		model.addAttribute("bids", bids);
		model.addAttribute("listP", listP);
		return "/auction/android_auction_detail";
	}
}
