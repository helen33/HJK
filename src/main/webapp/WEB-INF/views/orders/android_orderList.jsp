<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>무제 문서</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style>
	.order_detail{
		width: 100%;
		margin: 0 auto;
		margin-left:auto;
	}
	
	.m_order_top{
		border-bottom: #333 solid 1px;
	}
	
	.m_order_meminfo{
		width: 100%;
		text-align:center;
		vertical-align:middle;
	}
	.m_order_meminfo td{
		text-align:left;
	}
	
	.m_order_price{
		width: 100%;
		text-align:center;
		vertical-align:middle;
		font-weight:bold;
	}
	
	.m_order_way{
		width: 100%;
		text-align:center;
		vertical-align:middle;
	}

	.m_order_way td{
		align: right;
	}
	#layer_fixed
     {
       height:auto;
       width:100%;
       position:fixed;
       z-index:999;
       top:0px;
       left:0px;
     }
    /* ------------------------------------------------- */
    
</style>
<script type="text/javascript">
 
function radio(chk){
    document.orders.o_way.value = chk;
}
$(document).ready(function(){
	document.orders.o_sum.value = parseInt(document.orders.o_ototal.value) + parseInt(document.orders.o_del.value) - parseInt(document.orders.o_dis.value);
	var psum = '';
	var parray = document.orders.p_num;
	if(parray.length > 0) {
		for(var i=0;i<parray.length;i++){
			psum += parray[i].value + ",";
		}
	} else {
		psum = document.orders.p_num.value + ",";
	}

	document.orders.psum.value = psum;
});
function ZipCode(ch) {
	browsing_window = window
	.open(
			"checkpost?ch=" + ch,
			"_zipinput",
			"height=300,width=600, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
	browsing_window.focus();
}
function pnum(){
	if(document.orders.o_payee.value.length <= 1 || document.orders.o_payee.value == "수취인이름"){
		alert("수취인이름을 확인 해 주세요");
		return false;
	}
	if(document.orders.Zip_code.value.length <= 1 || document.orders.Zip_code.value == "000-000"){
		alert("우편번호를 확인 해 주세요");
		return false;
	}
	if(document.orders.zip_addr.value.length <= 1 || document.orders.zip_addr.value == "수취인기본주소"){
		alert("수취인기본주소를 확인 해 주세요");
		return false;
	}
	if(document.orders.o_addr.value.length <= 1 || document.orders.o_addr.value == "수취인상세주소"){
		alert("수취인상세주소를 확인 해 주세요");
		return false;
	}
	if(document.orders.o_pphone.value.length <= 1 || document.orders.o_pphone.value == "수취인연락처"){
		alert("수취인연락처를 확인 해 주세요");
		return false;
	}
	if(document.orders.o_way.value.length < 1){
		alert("결제수단을 선택 해 주세요");
		return false;
	}else{
	document.orders.psum.value;
	document.orders.zip_addr.value;
	location.href="m_orderInsert"
	document.orders.submit();
	}
}
</script>
</head>
<body onload="orders()">
	<div class="order_detail" id='order_detail'>
    <form id="orders" name="orders" action="m_orderInsert">
    <input type="hidden" id="psum" name="psum" value="">
			<div id="layer_fixed">
				<center>
					<input type="reset" class='reset' value="취소" style='width:50%;'><input type="button" class='reset' value="결제하기" onclick="pnum()" style='width:50%;'>
				</center>
			</div>
			<br />
			<hr />
   <!-- 상단 이미지/상품명/가격부분 시작 -->
	<table class="m_order_top" id="m_order_top" width='100%' style='font-size:10pt; text-align:center; vertical-align:middle;'>
        <c:forEach var="test" items="${myArry}">
        	<tr>
            	<td>
                	<img src="http://168.126.146.37/20132397/parts/${test.p_img}" width="150px" >
                </td>
                <td width='40%' style='font-weight:bold;'>
                	[${test.c_name}] ${test.p_name}
                </td>
                <td width='30%' style='font-weight:bold;'>
                	<fmt:formatNumber value="${test.p_fixed}" type="number"/> 원 
					<input type="hidden" id="p_fixed" name="p_fixed" value="${test.p_fixed}">
					<input type="hidden" id="p_num" name="p_num" value="${test.p_num}">
                </td>
            </tr>
            </c:forEach>
      </table>
     <!-- 상단 이미지/상품명/가격부분 끝 -->
     <table class='m_order_meminfo' id="m_order_meminfo">
     	<tr>
        	<th colspan="2">
            	주문자/배송 정보
            </th>
        </tr>
        <tr>
        	<th>
            	받으실 분
            </th>
            <td>
            	<input type="text" size="15" name="o_payee" id="o_payee" placeholder="수취인이름"/ value='테스트'>
            </td>
       </tr>
       <tr>
        	<th>
            	연락처
            </th>
            <td>
            	<input type="text" size="15" name="o_pphone" id="o_pphone" placeholder="수취인연락처" value='010-0000-0000'/>
            </td>
      </tr>
      <tr>
      		<th rowspan="3">
            	받으실 곳
            </th>
            <td>
            	<input type="text" size="4" name="Zip_code" id="Zip_code" value="445-892" class="post" placeholder="000-000" OnClick="ZipCode('1')"/>
            	<input OnClick="ZipCode('1')" name="zip_code" id="zip_code" type='button' value='우편번호검색' class="button">
            </td>
      </tr>
      <tr>
        	<td>
            	<input type="text" size="20" name="zip_addr" id="zip_addr" value="경기 화성시 봉담읍 당하리 " placeholder="수취인기본주소"/>
            </td>
     </tr>
     <tr>
        	<td>
            	<input type="text" size="20" name="o_addr" id="o_addr" value="12-123" placeholder="수취인상세주소"/>
            </td>
    </tr>
    </table>
     <hr>
     <table class="m_order_price" id='m_order_price'>
     	<tr>
        	<th colspan="2">
            	결제금액
            </th>
        </tr>
        <tr>
        	<th>
            	상품합계금액
            </th>
            <td>
            	<input type="text" id="o_ototal" name="o_ototal" value="${fixed}" readOnly="true" style="text-align:right; border:0;">원
            </td>
        <tr>
        <tr>
        	<th>
            	배송비
            </th>
            <td>
            	<input type="text" id="o_del" name="o_del" value="2500" readOnly="true" style="text-align:right; border:0;">원
            </td>
        </tr>
                <tr>
        	<th>
            	할인비
            </th>
            <td>
            	<input type="text" id="o_dis" name="o_dis" value="0" readOnly="true" style="text-align:right; border:0;">원
            </td>
        </tr>
                <tr>
        	<th>
            	총 결제금액
            </th>
            <td>
            	<input type="text" id="o_sum" name="o_sum" value="o_sum" readOnly="true" style="text-align:right; border:0; font-weight:bold; color:red;">원
            </td>
        </tr>
     </table>
     <hr>
     <table class="m_order_way" id="m_order_way">
     	<tr>
        	<th>
            	결제 수단
            </th>
        </tr>
        <tr>
        	<td>
            	<input type="radio" name="order" id="order" onclick="radio('C')"> 신용카드
				<input type="radio" name="order" id="order" onclick="radio('M')"> 현금결제
				<input type="hidden" name="o_way" id="o_way" value="">
            </td>
        </tr>
     </table>
    </form>
   	</div>
</body>
</html>
