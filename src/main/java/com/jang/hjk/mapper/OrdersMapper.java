package com.jang.hjk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Order_detail;
import com.jang.hjk.model.Orders;

//주문, 주문상세, 장바구니
@Repository(value = "ordersMapper")
public interface OrdersMapper {
	
	//------------------------ 장바구니 -------------------------------//
	List<Cart> myCart(int m_num); // 회원장바구니 리스트 불어오기
	List<Cartpart> myCartpart(int m_num); // 회원장바구니 리스트 불어오기
	String[] cartSum(int m_num); // 장바구니 합계
	String[] findPNum(int m_num); // 회원장바구니에 부품 중복인지 아닌지 확인
	List<Cart> chkCartname(int m_num); // 장바구니이름갯수알려줄꺼야
	void insertCart(Cart cart); // 장바구니 담기
	void insertCartpart(Cartpart cartpart); // 장바구니담기 - 부품하나
	void deleteOneCartpart(@Param(value="p_num") int p_num, @Param(value="m_num") int m_num); // 장바구니 삭제 - 부품하나씩
	void deleteGyunCart(@Param(value="cart_name") String cart_name); // 장바구니이름으로된거 다 삭제
	
	//------------------------- 주문 -----------------------------------------//	
	void insertOrders(Orders orders); // 주문 등록
	int chkOrderSeq(); // 현재 시퀀스 조회
	void insertOrdersDetail(Order_detail order_detail); // 주문상세 등록
	List<Orders> getOrderPartsList(int o_num); // 주문확인창
	Orders getOrderList(int o_num); // 주문확인창
	void minorAmount(int p_num); // 재고수량 깍기
	
	//-----------------------마이페이지----------------------------------------//
	List<Orders> mytotalorders(String m_id); //회원아이디로 총 주문 리스트 불러오기
}
