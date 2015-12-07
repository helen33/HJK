package com.jang.hjk.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.jang.hjk.model.Auction;
import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Company;
import com.jang.hjk.model.Library;
import com.jang.hjk.model.Manager;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Parts;
import com.jang.hjk.model.Qna;

//관리자			--> 상품등록
@Repository(value = "adminMapper")
public interface AdminMapper {
	List<Manager> getManagerAll(); // 관리자정보 불러오기
	
	//----------------- 회원관리 --------------------//
	void adminMemDel(int m_num); // 회원번호로 회원 탈퇴시키기
	
	//----------------- 상품관리 --------------------//
	void adminPartsDel(int p_num); // 부품번호로 부품 삭제
	List<Company> getCompany(); // 제조사 부르기
	void insertParts(Parts parts); // 상품등록
	String getPcname(int pc_code); // 부품분류코드로 부품분류명불러오기
	int currentPnum(); // 부품번호 현재 시퀀스 조회
	void partsUpdate(Parts parts); // 상품수정
	
	//----------------- 자료실관리 --------------------//
	void insertLib(Library library); // 자료실 글 등록
	void libDelete(int l_num); // 자료실 글 삭제
	
	//----------------- 경매관리 ---------------------//
	String getState(int a_num);//경매상태확인
	void auctionUpdate(Auction auction);
	int getPnum(String p_name);
	void aucgoodsUpdate(Auction_goods auction_goods);
	void auctionInsert(Auction auction);
	int chkAuctionSeq();//현재 시퀀스 조회
	void aucgoodsInsert(Auction_goods auction_goods);
}
