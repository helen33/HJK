package com.jang.hjk.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.jang.hjk.model.Parts;
import com.jang.hjk.model.Parts_code;
import com.jang.hjk.service.MemberService;
import com.jang.hjk.service.PartsService;

@Controller
public class PartsController {
	
	@Resource(name = "partsService") 
	private PartsService partsService;
	
	@Resource(name = "memberService") 
	private MemberService memberService;

	// ----------------------- 견적메인 뷰 (화면)------------------------------------//
	@RequestMapping(value = "/esmain")
	public String index(ModelMap model) {
		List<Parts_code> code = this.partsService.getPccode();
		model.addAttribute("code", code);
		return "/estimate/esmain";
	}

	// ----------------- 배너 및 상품리스트 (화면) -------------------------------------//
	@RequestMapping(value = "/partTab")
	public String esListTab(@RequestParam(value = "pc_code") int pc_code,
			ModelMap model) throws Exception {

		List<Parts_code> pcCode = this.partsService.getPccode();
		List<Parts> partList = this.partsService.getParts(pc_code);
		System.out.println("부품코드번호호확인 >>" + pc_code);
		model.addAttribute("pcCode", pcCode);
		model.addAttribute("partList", partList);

		return "/estimate/eslist";
	}
	
	//----------------- 상품상세(화면) ---------------------------------------------//
	@RequestMapping(value = "/partTab/partsContent")
	public String partsContent(@RequestParam(value = "p_num") int p_num,
			ModelMap model) throws Exception {
		
		Parts partsContent = this.partsService.getPartscontent(p_num);
		model.addAttribute("partsContent", partsContent);
		
		return "/estimate/partsContent";
	}

	// ////////////////////////////////////Estimate(견적부분)//////////////////////////////////////////////////

	// -----------------견적하기 레이아웃 뷰----------------------
	@RequestMapping(value = "/estimateForm")
	public String estimateForm(HttpSession session) {
		return "/estimate/estimatepage";
	}

	// ---------------견적하기 부품목록 뷰-----------------------
	@RequestMapping(value = "/estimatePartsMainForm")
	public String estimatePartsForm(HttpSession session) {
		return "/estimate/estimatePartsMain";
	}

	// ---------------견적하기 부품선택 목록 뷰-----------------------
	@RequestMapping(value = "/estimatePartsListForm")
	public String estimatePartsListForm(HttpSession session) {
		
		System.out.println("야 들어왔냐");
		return "/estimate/estimatePartsList";
	}

	// ---------------부품 코드 별 견적 부품 리스트 뿌리기 --------------------------

	@ResponseBody
	@RequestMapping(value = "/gyun_search", method = RequestMethod.POST)
	public Object gyun_searchProc(
			@RequestParam(value = "pc_code", required = false) int pc_code,
			@RequestParam(value = "p_socket", required = false) String p_socket,
			@RequestParam(value = "p_power", required = false) String p_power,
			ModelMap model, HttpSession session) throws Exception {
 
		ModelAndView modelAndView = new ModelAndView();
		Map<String, Object> retVal = new HashMap<String, Object>();
		
		System.out.println("소켓확인 ->" + p_socket);
		System.out.println("파워확인 ->" + p_power);
		
		if(pc_code == 140 || pc_code == 160){
			System.out.println("피씨코드 140, 160");
			if(p_socket.length() <= 0){
				System.out.println("///////////////소켓 널임");
				List<Parts> gyun_parts_list = this.partsService.getParts(pc_code);
				modelAndView.addObject("gyun_parts_list", gyun_parts_list);	
				    
				retVal.put("gyun_parts_list",gyun_parts_list);
				retVal.put("crepeat", gyun_parts_list.size());
				
				System.out.println("해쉬맵 확인좀 =>" + retVal);
				modelAndView.setViewName("redirect:/estimatePartsListForm");
				return retVal;
			}        
			if(p_socket != null){
				System.out.println("///////////////소켓 널 아님");
				List<Parts> gyun_parts_list = this.partsService.getvaildsocket(pc_code,p_socket);
				modelAndView.addObject("gyun_parts_list", gyun_parts_list);	
			    
				retVal.put("gyun_parts_list",gyun_parts_list);
				retVal.put("crepeat", gyun_parts_list.size());
				
				System.out.println("해쉬맵 확인좀 =>" + retVal);
				modelAndView.setViewName("redirect:/estimatePartsListForm");
				return retVal;
			}
		}
		
		if(pc_code == 200 || pc_code == 250){
			if(p_power.length() <=0 ){
				System.out.println("파워 널 임");
				List<Parts> gyun_parts_list = this.partsService.getParts(pc_code);
				modelAndView.addObject("gyun_parts_list", gyun_parts_list);	

				retVal.put("gyun_parts_list",gyun_parts_list);
				retVal.put("crepeat", gyun_parts_list.size());
				
				System.out.println("해쉬맵 확인좀 =>" + retVal);
				modelAndView.setViewName("redirect:/estimatePartsListForm");
				return retVal;
			}
			if(p_power != null){
				System.out.println("파워 널 아님");   
				List<Parts> gyun_parts_list = this.partsService.getvaildpower(pc_code,Integer.parseInt(p_power));
				modelAndView.addObject("gyun_parts_list", gyun_parts_list);	
				    
				retVal.put("gyun_parts_list",gyun_parts_list);
				retVal.put("crepeat", gyun_parts_list.size());
				
				System.out.println("해쉬맵 확인좀 =>" + retVal);
				modelAndView.setViewName("redirect:/estimatePartsListForm");
				return retVal;
			}
		}
		if(pc_code != 140 && pc_code != 160 && pc_code != 200 && pc_code != 250){
			List<Parts> gyun_parts_list = this.partsService.getParts(pc_code);
			System.out.println("부품코드 받아 컨트롤러 입장 gyun_parts_list = " + gyun_parts_list.size());
			
			modelAndView.addObject("gyun_parts_list", gyun_parts_list);	
			
			retVal.put("gyun_parts_list",gyun_parts_list);
			retVal.put("crepeat", gyun_parts_list.size());
			
			System.out.println("해쉬맵 확인좀 =>" + retVal);
			modelAndView.setViewName("redirect:/estimatePartsListForm");
			return retVal;		
		}
		return retVal;
	}    
	
	//---------------------유효성 검사-------------------------------------
	@ResponseBody
	@RequestMapping(value = "/gyun_vaild", method = RequestMethod.POST)
	public Object gyun_vaildProc(
			@RequestParam(value = "rename", required = false) String rename,
			ModelMap model, HttpSession session) throws Exception {
		ModelAndView modelAndView = new ModelAndView();
		
		System.out.println("검색된 상품명 받아  입장 rename = " + rename);
		
		Parts parts = partsService.getgyunvaild(rename);
		System.out.println("여기왔니? =>" + parts.getP_name());
		Map<String, Object> vaild = new HashMap<String, Object>();
		    
		if(parts.getPc_code() == 140 || parts.getPc_code() == 160 || parts.getPc_code() == 200 || parts.getPc_code() == 250)
		{		
			System.out.println("pc_code가 cpu, 메인보드, 그래픽카드 일 때");
			System.out.println("power=>" + parts.getP_power());
			System.out.println("power=>" + parts.getP_socket());
			
			if(parts.getPc_code() == 140 || parts.getPc_code() == 160){
				System.out.println("cpu, 메인보드 일때는 소켓만 등록");
				vaild.put("socket", parts.getP_socket());
			}
			else if(parts.getPc_code() == 200 || parts.getPc_code() == 250)
			{
				System.out.println("그래픽카드, 파워일때는 파워만 등록");
				vaild.put("power", parts.getP_power());
			}
			modelAndView.setViewName("estimatePartsListForm");
			return vaild;
		}
		else
		{
			System.out.println("pc_code가 다른 거 일 때");
//			vaild.put("power", null);
//			vaild.put("socket", null);
			
			modelAndView.setViewName("estimatePartsListForm");
			return vaild;
		}
	}
	
}
