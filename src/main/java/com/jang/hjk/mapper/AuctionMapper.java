package com.jang.hjk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jang.hjk.model.Auction;
import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Bid;

//경매, 경매상품, 입찰
@Repository(value = "auctionMapper")
public interface AuctionMapper {

	List<Auction> getAuctionAll();
	List<Auction_goods> getAuction_goodsAll();
	List<Bid> getBidAll();
	List<Bid> getmybid(String m_id);
	
	List<Auction> getAuctionParts(int a_num); // 경매상품가져오기
	Auction getAuction(int a_num); // 경매번호에 따른 정보가져오기  
	
	
	////////////////////나의 입낙찰 페이지 //////////////////////
	Bid getmyauction(int b_num);//나의 입낙찰 내역 상세화면 
	List<Auction_goods> getmyauction_goods(int a_num); // 나의 경매 부품번호  보르기
	
	//////////////////// 경매종료 //////////////////////////
	List<Auction> getendAuctionAll(); //경매 종료 상품 모두 가져오기
	
	////////////////////경매중 //////////////////////////
	List<Auction> getAucing();//경매 중 상품 모두 가져오기
	List<Bid> getBids(int a_num); // 입찰리스트
	Auction getendtimer(int a_num); // 경매중 타이머
	String getmState(@Param(value="m_id")String m_id, @Param(value="a_num")int a_num);
	void insertBider(@Param(value="m_id")String m_id, @Param(value="b_price")int b_price, @Param(value="a_num")int a_num);
	void updateBider(@Param(value="m_id")String m_id, @Param(value="b_price")int b_price, @Param(value="a_num")int a_num);
	void bidendUpdate(int a_num);
	////////////////////경매예정 //////////////////////////
	List<Auction> getAucSchedule(); //경매예정상품리스트

}
