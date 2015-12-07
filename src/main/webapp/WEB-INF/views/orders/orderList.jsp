<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<title>주문서 작성</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style>
.ordertable {
	width: 900px;
	padding: 5px;
	font-size:13px; 
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	text-align:left;
}
.ordertd {
	padding: 5px;
	text-valign:middle;
}
</style>
<script>
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
function pnum(mId){
	if(mId == "null"){
		alert("로그인 후 사용가능합니다.");
		return false;
	}
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
	location.href=".esmain.do?es_page=/orderInsert?"
	document.orders.submit();
	}
}
</script>
</head>
<body onload="orders()">
<center>
<form id="orders" name="orders" action="orderInsert">
<input type="hidden" id="psum" name="psum" value="">
	<table class="ordertable">
		<tr>
			<td colspan="3" class="ordertd" style="border-bottom:1px solid;">상품확인</td>
		</tr>
		<tr>
			<td colspan="2" class="ordertd">상품명</td>
			<td>가격</td>
		</tr>
		<c:forEach var="test" items="${myArry}">
			<tr>
				<td class="ordertd"><img src="http://168.126.146.37/20132397/parts/${test.p_img}" width="150px" ></td>
				<td style="vertical-align:middle">[${test.c_name}] ${test.p_name}</td>
				<td style="vertical-align:middle">
					<fmt:formatNumber value="${test.p_fixed}" type="number"/> 원 
					<input type="hidden" id="p_fixed" name="p_fixed" value="${test.p_fixed}">
					<input type="hidden" id="p_num" name="p_num" value="${test.p_num}">
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<table class="ordertable">
		<tr>
			<td colspan="2" class="ordertd" style="border-bottom:1px solid;">배송정보</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">받으실 분</td>
			<td>
				<input type="text" name="o_payee" id="o_payee" placeholder="수취인이름"/>
			</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">받으실 곳</td>
			<td>
				<input type="text" name="Zip_code" id="Zip_code" value="" class="post" placeholder="000-000" OnClick="ZipCode('1')"/>
                <input OnClick="ZipCode('1')" name="zip_code" id="zip_code" type='button' value='우편번호검색' class="button">
			</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd"></td>
			<td>
				<input type="text" size="50" name="zip_addr" id="zip_addr" value="" placeholder="수취인기본주소"/>
			</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd"></td>
			<td>
				<input type="text" size="50" name="o_addr" id="o_addr" value="" placeholder="수취인상세주소"/>
			</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">연락처</td>
			<td>
				<input type="text" size="13" name="o_pphone" id="o_pphone" placeholder="수취인연락처"/>
			</td>
		</tr>
	</table>
	
	<br>
	
	<table class="ordertable">
		<tr>
			<td colspan="2" class="ordertd" style="border-bottom:1px solid;">결제금액</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">상품합계금액</td>
			<td><input type="text" id="o_ototal" name="o_ototal" value="${fixed}" readOnly="true">원</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">배송비</td>
			<td><input type="text" id="o_del" name="o_del" value="2500" readOnly="true">원</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">할인비</td>
			<td><input type="text" id="o_dis" name="o_dis" value="0" readOnly="true">원</td>
		</tr>
		<tr>
			<td width="200px" class="ordertd">총결제금액</td>
			<td><input type="text" id="o_sum" name="o_sum" value="o_sum" readOnly="true">원</td>
		</tr>
	</table>
	
	<br>
	
	<table class="ordertable">
		<tr>
			<td class="ordertd" style="border-bottom:1px solid;">결제수단</td>
		</tr>
		<tr>
			<td>
				<input type="radio" name="order" id="order" onclick="radio('C')"> 신용카드
				<input type="radio" name="order" id="order" onclick="radio('M')"> 현금결제
				<input type="hidden" name="o_way" id="o_way" value="">
			</td>
		</tr>
	</table>
	
	<input type="reset" value="취소">
	<input type="button" value="결제하기" onclick="pnum('<%=session.getAttribute("memberId")%>')">
	
</form>
</center>
</body>
</html>