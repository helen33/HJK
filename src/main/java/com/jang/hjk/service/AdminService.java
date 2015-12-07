package com.jang.hjk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jang.hjk.mapper.AdminMapper;
import com.jang.hjk.model.Auction;
import com.jang.hjk.model.Auction_goods;
import com.jang.hjk.model.Company;
import com.jang.hjk.model.Library;
import com.jang.hjk.model.Manager;
import com.jang.hjk.model.Member;
import com.jang.hjk.model.Parts;

@Service(value= "adminService")
public class AdminService {

	@Resource(name = "adminMapper")
	private AdminMapper adminMapper;
	
	public List<Manager> getManagerAll() {
		System.out.println("AdminService" + "getManagerAll()");
		return this.adminMapper.getManagerAll();
	}
	
	public void adminMemDel(int m_num){
		System.out.println("AdminService" + "adminMemDel(int m_num)");
		this.adminMapper.adminMemDel(m_num);
	}
	
	public void adminPartsDel(int p_num) {
		System.out.println("AdminService" + "adminPartsDel(int p_num)");
		this.adminMapper.adminPartsDel(p_num);
	}
	
	public List<Company> getCompany(){
		System.out.println("AdminService" + "getCompany()");
		return this.adminMapper.getCompany();
	}
	
	public void insertParts(Parts parts){
		System.out.println("AdminService" + "insertParts(Parts parts)");
		this.adminMapper.insertParts(parts);
	}
	
	public String getPcname(int pc_code){
		System.out.println("AdminService" + "getPcname(int pc_code)");
		return this.adminMapper.getPcname(pc_code);
	}
	
	public int currentPnum(){
		System.out.println("AdminService" + "currentPnum()");
		return this.adminMapper.currentPnum();
	}
	
	public void partsUpdate(Parts parts){
		System.out.println("AdminService" + "partsUpdate(Parts parts)");
		this.adminMapper.partsUpdate(parts);
	}
	
	public void libDelete(int l_num){
		System.out.println("AdminService" + "libDelete(int l_num)");
		this.adminMapper.libDelete(l_num);
	}
	
	public void insertLib(Library library){
		System.out.println("AdminService" + "insertLib(Library library)");
		this.adminMapper.insertLib(library);
	}
	
	public String getState(int a_num){
		System.out.println("AdminService" + "getState(int a_num)");
		return this.adminMapper.getState(a_num);
	}
	public void auctionUpdate(Auction auction){
		this.adminMapper.auctionUpdate(auction);
	}
	public int getPnum(String p_name){
		return this.adminMapper.getPnum(p_name);
	}
	public void aucgoodsUpdate(Auction_goods auction_goods){
		this.adminMapper.aucgoodsUpdate(auction_goods);
	}
	public void auctionInsert(Auction auction){
		this.adminMapper.auctionInsert(auction);
	}
	public int chkAuctionSeq() {
		return this.adminMapper.chkAuctionSeq();
	}
	public void aucgoodsInsert(Auction_goods auction_goods){
		this.adminMapper.aucgoodsInsert(auction_goods);
	}
}
