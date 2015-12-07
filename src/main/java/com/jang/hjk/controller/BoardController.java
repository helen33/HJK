package com.jang.hjk.controller;

import java.io.File;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jang.hjk.model.Library;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Qna;
import com.jang.hjk.service.BoardService;
import com.jang.hjk.service.MemberService;


@Controller
public class BoardController {
	
	@Resource(name = "boardService")
	private BoardService boardService;
	
	@Resource(name = "memberService")
	private MemberService memberService;
	
	private String uploadPath = "C:\\Users\\admin\\Desktop\\km\\hjk\\src\\main\\webapp\\resources\\qnafiles\\";//문의 첨부파일 경로
	
	// /////////////////////////////////// 문의하기  ///////////////////////////////////////// //
	
	//----------------- 문의하기 리스트(화면) --------------------------------------------------//
	@RequestMapping(value = "/qnaForm")
	public String qnaList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage2,
			ModelMap model, HttpSession session) throws Exception {
		System.out.println("문의하기 들어옴");
		
		List<Qna> qnaList = this.boardService.getQnaAll(currentPage2);
		StringBuffer paging = this.boardService.PageUrl2(currentPage2);
		
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("paging", paging);
		
		return "/board/qnaList";
		
	}
	 
	//----------------- 문의하기상세(화면) ---------------------------------------------------------//
	@RequestMapping(value = "/qnaContent", method = RequestMethod.GET)
	public String qnaView(@RequestParam(value = "q_num", defaultValue="0") int q_num, 
			Model model) throws Exception {
		
		Qna qnaContent = boardService.qnaContentView(q_num); // 글번호 받아서 상세페이지 뿌리기
	
		boardService.updateHitsCnt(q_num);
		model.addAttribute("qnaContent", qnaContent);
		
		return "/board/qnaContent";
	}
	
	//----------------- 문의글 패스워드 작성 (화면) ----------------------------------------------------//
	@RequestMapping(value = "/qnaPass")
	public String qnapass() {
		return "/board/qnaPass";
	}
	
	//----------------- 문의하기비밀글(화면) -----------------------------------------------------------//   
	@RequestMapping(value = "/scret", method = RequestMethod.GET)
	public String form1(@RequestParam(value = "q_num",  defaultValue = "0") int q_num,
			ModelMap model, HttpSession session) throws Exception {
		Qna qnaContent = boardService.qnaContentView(q_num); // 글번호 받아서 상세페이지 뿌리기

		boardService.updateHitsCnt(q_num);
		model.addAttribute("qnaContent", qnaContent);
		
		return "/board/qnaAnswer";
	}
	
	//----------------- 문의글 작성 (화면) ------------------------------------//
	@RequestMapping(value = "/qnaWrite.do")
	public String test() {
		return "/board/qnaWrite";
	} 
	
	//---------------------- 문의하기 쓰기(처리) -------------------------------//
	@RequestMapping(value = "/write.do")
	public ModelAndView boardWriteProc(@ModelAttribute("Qna") Qna qna,
		MultipartHttpServletRequest request, HttpSession session) {
		
		String memberId = (String) session.getAttribute("memberId");
		Member mem = this.memberService.findMemberInfo(memberId);
		
		qna.setM_num(mem.getM_num());
		qna.setMa_num(4);
		
		ModelAndView model = new ModelAndView();
		
		MultipartFile file = request.getFile("uploadFile"); // get upload file
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
		qna.setQ_file(fileName);

		String content = qna.getQ_content().replaceAll("\r\n", "<br />");
		qna.setQ_content(content);
		
		this.boardService.qnainsert(qna);
		model.setViewName("redirect:./esmain.do?es_page=/qnaForm");
		return model;
	}
	
	//----------------- 문의하기수정 (화면) ----------------------------------------------------------------------------
	@RequestMapping(value = "/qnaModi", method = RequestMethod.GET)
	public String qnaView2(@RequestParam(value = "q_num", defaultValue="0") int q_num, 
			Model model, HttpSession session) throws Exception {
		String memberId = (String) session.getAttribute("memberId");
		Qna qnaContent = boardService.qnaContentView(q_num); // 글번호 받아서 상세페이지 뿌리기
		
		boardService.updateHitsCnt(q_num);
		model.addAttribute("qnaContent", qnaContent);
		model.addAttribute("memberId", memberId);
		
		return "/board/qnaModify";
	}
	
	//------------------- 문의하기 수정(처리) ------------------------------------
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public ModelAndView qnamodify(@ModelAttribute("Qna") Qna qna,
		MultipartHttpServletRequest request, HttpSession session) {
		
		String memberId = (String) session.getAttribute("memberId");
		Member mem = this.memberService.findMemberInfo(memberId);

		qna.setM_num(mem.getM_num());
		qna.setMa_num(4);
		
		ModelAndView model = new ModelAndView();
		
		MultipartFile file = request.getFile("uploadFile"); // get upload file
		String fileName	= file.getOriginalFilename();
		
		if(fileName.length() > 0){
			File uploadFile = new File(uploadPath + fileName); // java.io 패키지
			System.out.println("들어옴 " + fileName);
			
			if (uploadFile.exists()) { // uploadFile이 있다면 date()를 flieName 앞에 붙여서 업로드 한다.
				fileName = new Date().getTime() + fileName;
				
				uploadFile = new File(uploadPath + fileName);
			}		
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {    
				e.printStackTrace();
			}
		}else{
			
		}
		qna.setQ_file(fileName);

		String content = qna.getQ_content().replaceAll("\r\n", "<br />");
		qna.setQ_content(content);
		
		this.boardService.qnaupdate(qna);
		model.setViewName("redirect:./esmain.do?es_page=/qnaForm");
		return model;
	}
	
	//----------------- 문의하기삭제 (처리) ----------------------------------------------------------------------------
	@RequestMapping(value = "/qnaDel", method = RequestMethod.GET)
	public ModelAndView qnaView3(@RequestParam(value = "q_num", required = false, defaultValue="0") 
	int q_num, HttpServletRequest request, HttpSession session) throws Exception {

		ModelAndView model = new ModelAndView();
		
		this.boardService.qnadel(q_num);
		
		model.setViewName("redirect:./esmain.do?es_page=/qnaForm");
		return model;
	}
	
	// /////////////////////////////////// 자료실 ///////////////////////////////////////// //

	//----------------- 자료실 리스트(화면) --------------------------------------------------------------------------
	@RequestMapping(value = "/libraryForm")
	public String libList(@RequestParam(value = "page", required = false, defaultValue = "1") int currentPage,
			ModelMap model) throws Exception {
		
		List<Library> libList = this.boardService.getLibraryAll(currentPage); // 자료실 리스트불러오기
		
		StringBuffer paging = this.boardService.PageUrl(currentPage);

		model.addAttribute("libList", libList);
		model.addAttribute("paging", paging);
		
		return "/board/libraryList";
	}
	
	//----------------- 자료실상세(화면) ----------------------------------------------------------------------------
	@RequestMapping(value = "/libContent")
	public String libView(@RequestParam(value = "l_num", required = false, defaultValue="0") 
	int l_num, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		
		Library libContent = boardService.libContentView(l_num); // 글번호 받아서 상세페이지 뿌리기
		
		boardService.updateHitsCnt(l_num);
		model.addAttribute("libContent", libContent);
		
		return "/board/libraryContent";
	}

}
