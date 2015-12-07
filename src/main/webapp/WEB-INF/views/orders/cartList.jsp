<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style>
.carttable {
	width: 900px;
	padding: 5px;
	font-size:13px; 
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	text-align:left;
}
.carttable th{
	background-color: black; 
	color:#FFFFFF;
	font-weight:bold;
}
.carttd {
	padding: 5px;
}
</style>
<script>
function deletes(pnum) {
	location.href="cartDelete?p_num=" + pnum;
}
function chkOrders(){
	var chk = cartList.pnumChk; // 체크박스 객체담는다
	var chkCnt = 0; // 체크된 체크박스 개수
	var chkLast = ''; //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기 위한 변수ㄴ
	var chksum = ''; //체크된 체크박스의 모든 value
	var cnt = 0;
	for(var i=0;i<chk.length;i++){
		if(chk[i].checked == true){
			chkCnt++; //체크된 체크박스 개수
			chkLast = i; // 체크된 체크박스의 인덱스
		}
	}
	for (var i=0;i<chk.length;i++){
		if(chk[i].checked == true){
			chk[i].value;
			chksum += chk[i].value + ",";
			cnt++;
		}
	}
	//document.cartList.p_num.value = chksum;
	chksum = chksum + "/" + document.cartList.fixed.value;
	location.href = "esmain.do?es_page=/orderList?p_num=" + chksum;
// 	document.submit();
}
function chmoney(pfixed,pnum){
// 	var chk = cartList.pnumChk;
// alert("확인=>"+$("#carttable").find("[name=" + pnum + "_name]").text());

	if(document.cartList.pnum.value.length <= 1){
		document.cartList.pnum.value = ","+pnum;
		document.cartList.fixed.value = parseInt(document.cartList.fixed.value) + parseInt(pfixed);
		return false;
	}
	if(document.cartList.pnum.value.length > 1){
		var array = document.cartList.pnum.value.split(",");
		for(var i=1;i<=array.length;i++){
			if(array[i] == pnum){
				var array2 = array[i];
				for(var j=1; j<array.length; j++){
					if(array[j] == array2){
						document.cartList.fixed.value = parseInt(document.cartList.fixed.value) - parseInt(pfixed);
					}else{
						document.cartList.ar3.value = document.cartList.ar3.value + "," + array[j];
					}
					document.cartList.pnum.value = document.cartList.ar3.value;
					
				}
				document.cartList.ar3.value="";
				return false;
			}
		}
	}
	if(document.cartList.pnum.value.length > 1){
		var array = document.cartList.pnum.value.split(",");
		for(var i=1;i<=array.length;i++){
			if(array[i] != pnum){
				document.cartList.pnum.value = document.cartList.pnum.value + ","+pnum;
				document.cartList.fixed.value = parseInt(document.cartList.fixed.value) + parseInt(pfixed);
				return false;
			}
		}
	}
}
function cartDel(cartname){
	location.href="cartGyunDelete?cart_name=" + cartname;
}
$(document).ready(function(){
	var total = 0;
	var payplus = document.cartList.pay;
	for(var i=0; i<payplus.length; i++){
		total += parseInt(payplus[i].value);
	}
	document.getElementById('total').innerHTML =  total;
});
</script>
</head>
<body>
<center>
<form name="cartList" id="cartList">
<input type="hidden" id="p_num" name="p_num">
<input type="hidden" id="pnum" name="pnum"><input type="hidden" id="ar3" name="ar3">
<img src="${pageContext.request.contextPath}/resources/images/15.png" width="120px" style="position: relative; left: -390px; top: 0px; margin-bottom:10px;">

<br>
	<table class="carttable">
		<tr>
			<th>장바구니이름</th>
			<th class="carttd">상품명</th>
			<th>가격</th>
			<th>주문/삭제</th>
		</tr>
	<c:forEach var="cartName" items="${cartName}">
		<tr style="border-top:1px solid;">
			<td> 
				${cartName.CART_NAME}
			</td>
			<td>
				<table>
				<c:forEach var="result2" items="${cartList2}" varStatus="status">
					
						<tr>
							<td>${result2.PC_NAME}</td>
							<td style="padding:0px 0px 5px 10px;">${result2.P_NAME}</td>
						</tr>
					<input type="hidden" id="pay" name="pay" value="${result2.P_FIXED}">
				</c:forEach> 
				</table>
			</td>
			<td> <span id="total"></span></td>
			<td>
				<input type="button" value="삭제" onclick="cartDel('${cartName.CART_NAME}')">
			</td>
		</tr>
	</c:forEach>
</table>

<br>
<div id="line" style="width: 900px; height: 1px; background-color: #999; margin: 0px"></div>
<br>

<img src="${pageContext.request.contextPath}/resources/images/14.png" width="120px" style="position: relative; left: -390px; top: 0px; margin-bottom:10px;">
<br>
	<table class="carttable">

		<tr>
			<th>&nbsp;</th>
			<th colspan="2" class="carttd">상품명</th>
			<th>가격</th>
			<th>삭제</th>
		</tr>
	<c:forEach var="result" items="${cartList1}" varStatus="status">
	
		<tr style="border-top:1px solid;">
			<td><input type="checkbox" id="pnumChk" name="pnumChk" value="${result.P_NUM}" onclick="chmoney('${result.P_FIXED}','${result.P_NUM}')"></td>
			<td><img src="http://168.126.146.37/20132397/parts/${result.P_IMG}" width="100" height="100"></td>
			<td> 
				<a href="esmain.do?es_page=/partTab/partsContent?p_num=${result.P_NUM}">${result.P_NAME}</a>
			</td>
			<td> ${result.P_FIXED} 원</td>
			<td>
				<input type="button" value="삭제" onclick="deletes('${result.P_NUM}')">
			</td>
		</tr>
	</c:forEach>
		<tr style="border-top:1px solid;">
			<td>&nbsp;</td>
			<td colspan="2">
			</td>
			<td><strong> <input type="text" id="fixed" name="fixed" value="0"> 원</strong>
			</td>
			<td>
				<input type="button" value="주문" onclick="chkOrders()">
				<input type="button" value="삭제" onclick="">
			</td>
		</tr>
</table>

</form>
</center>
</body>
</html>