package com.jang.hjk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jang.hjk.model.Comments;
import com.jang.hjk.model.Library;
import com.jang.hjk.model.Manager;
import com.jang.hjk.model.Qna;



//자료실, 문의하기, 댓글
@Repository(value = "boardMapper")
public interface BoardMapper {

	//------------------------ 자료실 -------------------------------//
	List<Library> getLibraryAll(@Param(value = "startRow")int startRow, @Param(value = "endRow")int endRow); // 자료실리스트
	Library libContentView(int l_num); // 글번호로 상세페이지 데이터 받아오기
	boolean updateHitsCnt(int l_num); // 조회수 갱신
	int getTotalArticle(); // 자료실 --> 몇 개가 있는지	
	
	//------------------------ 문의하기 -------------------------------//
	List<Qna> getQnaAll(@Param(value = "startRow")int startRow, @Param(value = "endRow")int endRow); // 문의하기 리스트
	Qna qnaContentView(int q_num);// 글번호로 상세페이지 데이터 받아오기
//	boolean updateqnaHitsCnt(int q_num); // 문의하기 조회수 갱신  --> 추가해야됨
	int getQnaTotal(); // 문의하기 --> 몇 개가 있는지
	void qnainsert(Qna qna); // 문의하기 글 등록
	void qnaupdate(Qna qna); // 문의하기 글 수정
	void qnadel(int q_num); // 문의하기 삭제

	//------------------------ 마이페이지 -----------------------------//
	List<Qna> getMyqna(String m_id);
	
//	List<Comments> getCommentsAll(); // 댓글리스트
}
