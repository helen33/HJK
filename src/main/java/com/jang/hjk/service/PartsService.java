package com.jang.hjk.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.jang.hjk.mapper.PartsMapper;
import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Order_detail;
import com.jang.hjk.model.Orders;
import com.jang.hjk.model.Parts;
import com.jang.hjk.model.Parts_code;


@Service(value= "partsService")
public class PartsService {
	
	@Resource(name = "partsMapper")
	private PartsMapper partsMapper;
	
	public List<Parts_code> getPccode() {
		System.out.println("PartsService" + "getPccode()");
		return this.partsMapper.getPccode();
	}
	
	public List<Parts> getParts(int pc_code) {
		System.out.println("PartsService" + "getParts(int pc_code)");
		return this.partsMapper.getParts(pc_code);
	}
	
	public Parts getPartscontent(int p_num) {
		System.out.println("PartsService" + "getPartscontent(int p_num)");
		return this.partsMapper.getPartscontent(p_num);
	}

	public List<Parts> getvaildsocket(int pc_code, String p_socket)	{
		System.out.println("PartsService" + pc_code +" / " + p_socket);
		return this.partsMapper.getvaildsocket(pc_code, p_socket);
	}
	
	public Parts getgyunvaild(String rename){
		System.out.println("PartsService=" + rename);
		return this.partsMapper.getgyunvaild(rename);
	}
	
	public List<Parts> getvaildpower(int pc_code, int p_power){
		System.out.println("PartsService" + "getvaildsocket" + pc_code + " / " + p_power);
		return this.partsMapper.getvaildpower(pc_code, p_power);
	}

}
