package com.jang.hjk.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.jang.hjk.mapper.OrdersMapper;
import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Order_detail;
import com.jang.hjk.model.Orders;

@Service(value= "ordersService")
public class OrdersService {

	@Resource(name = "ordersMapper")
	private OrdersMapper ordersMapper;
	
	public List<Cart> myCart(int m_num) {
		System.out.println("OrdersService " + "myCart(int m_num)");
		return this.ordersMapper.myCart(m_num);
	}
	
	public String[] findPNum(int m_num) {
		System.out.println("OrdersService " + "findPNum(int m_num)");
		String[] chkCart = this.ordersMapper.findPNum(m_num);
		return chkCart;
	}
	
	public List<Cartpart> myCartpart(int m_num) {
		System.out.println("OrdersService " + "myCartpart(int m_num)");
		return this.ordersMapper.myCartpart(m_num);
	}
	
	public String[] cartSum(int m_num){
		System.out.println("OrdersService " + "cartSum(int m_num)");
		return this.ordersMapper.cartSum(m_num);
	}
	
	public void insertCart(Cart cart) {
		System.out.println("OrdersService" + "insertCart(Cart cart)");
		this.ordersMapper.insertCart(cart);
	}
	
	public void insertCartpart(Cartpart cartpart) {
		System.out.println("OrdersService" + "insertCartpart(Cartpart cartpart)");
		this.ordersMapper.insertCartpart(cartpart);
	}
	
	public void deleteOneCartpart(int p_num, int m_num) {
		System.out.println("OrdersService" + "deleteOneCartpart(int p_num, int m_num)" + p_num + "&" + m_num);
		this.ordersMapper.deleteOneCartpart(p_num, m_num);
	}
	
	public void insertOrders(Orders orders) {
		System.out.println("OrdersService" + "insertOrders(Orders orders)");
		this.ordersMapper.insertOrders(orders);
	}
	
	public void insertOrdersDetail(Order_detail order_detail) {
		System.out.println("OrdersService" + "insertOrdersDetail(Order_detail order_detail)");
		this.ordersMapper.insertOrdersDetail(order_detail);
	}

	public int chkOrderSeq() {
		System.out.println("OrdersService" + "chkOrderSeq()");
		return this.ordersMapper.chkOrderSeq();
	}
	
	public List<Orders> getOrderPartsList(int o_num) {
		System.out.println("OrdersService" + "getOrderList(int o_num)");
		return this.ordersMapper.getOrderPartsList(o_num);
	}
	
	public Orders getOrderList(int o_num) {
		System.out.println("OrdersService" + "getOrderList(int o_num)");
		return this.ordersMapper.getOrderList(o_num);
	}
	
	public void minorAmount(int p_num){
		System.out.println("OrdersService" + "minorAmount(int p_num)");
		this.ordersMapper.minorAmount(p_num);
	}
	
	public List<Cart> chkCartname(int m_num) {
		System.out.println("OrdersService" + "chkCartname(int m_num)");
		return this.ordersMapper.chkCartname(m_num);
	}
	
	public void deleteGyunCart(String cart_name){
		System.out.println("OrdersService" + "deleteGyunCart(String cart_name)");
		this.ordersMapper.deleteGyunCart(cart_name);
	}
	
	public List<Orders> mytotalorders(String m_id){
		System.out.println("OrdersService / " + "mytotalorders / " + m_id);
		return this.ordersMapper.mytotalorders(m_id);
	}
}