package com.jang.hjk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import util.PageHelper;
import util.PageHelper2;

import com.jang.hjk.mapper.BoardMapper;
import com.jang.hjk.model.Comments;
import com.jang.hjk.model.Library;
import com.jang.hjk.model.Qna;

@Service(value= "boardService")
public class BoardService {

	@Resource(name = "boardMapper") 
	private BoardMapper boardMapper;
	
	PageHelper pageHelper = new PageHelper();
	
	PageHelper2 pageHelper2 = new PageHelper2();
	
	public StringBuffer PageUrl (int currentPage) {
		int totalNum = boardMapper.getTotalArticle();
		return pageHelper.getPageUrl (currentPage, totalNum);
	}
	
	public StringBuffer PageUrl2 (int currentPage2) {
		int totalNum2 = boardMapper.getQnaTotal();
		return pageHelper2.getPageUrl (currentPage2, totalNum2);
	}
	
	public List<Library> getLibraryAll(int currentPage) {
		int startRow = (currentPage - 1) * this.pageHelper.getPageSize()+1;
		int endRow = currentPage * this.pageHelper.getPageSize();
		
		return this.boardMapper.getLibraryAll(startRow, endRow);
	}
	
	public Library libContentView(int l_num) {
		return this.boardMapper.libContentView(l_num);
	}
	
	public boolean updateHitsCnt(int l_num) {
		return this.boardMapper.updateHitsCnt(l_num);
	}
	
	public List<Qna> getQnaAll(int currentPage) {
		int startRow = (currentPage - 1) * this.pageHelper2.getPageSize()+1;
		int endRow = currentPage * this.pageHelper2.getPageSize();
		
		return this.boardMapper.getQnaAll(startRow, endRow);
	}
	
//	public List<Comments> getCommentsAll() {
//		return this.boardMapper.getCommentsAll();
//	}
	
	//나의 문의글 찾기
	public List<Qna> getMyqna(String m_id){
		return this.boardMapper.getMyqna(m_id);
	}

	public Qna qnaContentView(int q_num) {
		return this.boardMapper.qnaContentView(q_num);
	}
	
	public void qnainsert(Qna qna){
		this.boardMapper.qnainsert(qna);
	}
	
	public void qnaupdate(Qna qna){
		this.boardMapper.qnaupdate(qna);
	}
	
	public void qnadel(int q_num){
		this.boardMapper.qnadel(q_num);
	}
}
