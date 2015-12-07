package com.jang.hjk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jang.hjk.mapper.AuctionMapper;
import com.jang.hjk.model.Auction;
import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Bid;

@Service(value= "auctionService")
public class AuctionService {

	@Resource(name = "auctionMapper")
	private AuctionMapper auctionMapper;
	
	public List<Auction> getAuctionAll() {
		
		return this.auctionMapper.getAuctionAll();
	}
	public List<Auction_goods> getAuction_goodsAll() {
		
		return this.auctionMapper.getAuction_goodsAll();
	}
	public List<Bid> getBidAll() {
		
		return this.auctionMapper.getBidAll();
	}
	
	public List<Bid> getmybid(String m_id){
		return this.auctionMapper.getmybid(m_id);
	}
	
	public List<Auction> getendAuctionAll(){
		System.out.println("AuctionService" + "getendAuctionAll() 진입");
		return this.auctionMapper.getendAuctionAll();
	}
	
	public List<Auction> getAucSchedule(){
		System.out.println("AuctionService" + "getAucSchedule()");
		return this.auctionMapper.getAucSchedule();
	}
	
	public List<Auction> getAuctionParts(int a_num){
		System.out.println("AuctionService" + "getAuctionParts(int a_num)");
		return this.auctionMapper.getAuctionParts(a_num);
	}
	
	public Auction getAuction(int a_num) {
		System.out.println("AuctionService" + "getAuction(int a_num)");
		return this.auctionMapper.getAuction(a_num);
	}
	//-----------------------경 매 중--------------------------//
	public List<Auction> getAucing(){
		return this.auctionMapper.getAucing();
	}
	
	public List<Bid> getBids(int a_num) {
		return this.auctionMapper.getBids(a_num);
	}
	public Auction getendtimer(int a_num){
		return this.auctionMapper.getendtimer(a_num);
	}
	public String getmState(String m_id,int a_num){
		return this.auctionMapper.getmState(m_id,a_num);
	}
	public void updateBider(String m_id, int b_price, int a_num){
		this.auctionMapper.updateBider(m_id,b_price,a_num);
	}
	public void bidendUpdate(int a_num){
		System.out.println("여기여기" + a_num);
		this.auctionMapper.bidendUpdate(a_num);
	}
	public void insertBider(String m_id, int b_price, int a_num){
		this.auctionMapper.insertBider(m_id,b_price,a_num);
	}
	
	//----------------나의 입낙찰 페이지 --------------------------//
	public Bid getmyauction(int b_num){
		return this.auctionMapper.getmyauction(b_num);
	}

	public List<Auction_goods> getmyauction_goods(int a_num){
		return this.auctionMapper.getmyauction_goods(a_num);
	}
}

