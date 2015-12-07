package com.jang.hjk.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.jang.hjk.model.Cart;
import com.jang.hjk.model.Cartpart;
import com.jang.hjk.model.Company;
import com.jang.hjk.model.Order_detail;
import com.jang.hjk.model.Orders;
import com.jang.hjk.model.Parts;
import com.jang.hjk.model.Parts_code;

//부품, 부품분류, 제조사
@Repository(value = "partsMapper")
public interface PartsMapper {
	//------------------------- 상품 -----------------------------------------//	
	List<Parts_code> getPccode(); // 부품코드 부르기
	List<Parts> getParts(int pc_code); // 부품코드별 부품부르기
	Parts getPartscontent(int p_num); // 부품번호로 상세정보찾기
	List<Parts> getvaildsocket(@Param(value="pc_code") int pc_code, @Param(value="p_socket") String p_socket); //부품 코드별 부품 중 같은 소켓을 가진 부품 부르기
	List<Parts> getvaildpower(@Param(value="pc_code") int pc_code, @Param(value="p_power") int p_power); //부품 코드별 부품 중 해당 power이상을 가진 부품 부르기
	Parts getgyunvaild(String rename); // 부품이름으로 유효성에 필요한 socket/power 찾기

}
