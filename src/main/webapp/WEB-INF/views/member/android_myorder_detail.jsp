<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>주문확인</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style>
.orderChk{font-family:"맑은 고딕"; font-weight: bold; font-size:16px; padding:5px;}
.orderChkTable{
	font-size:13px;
	font-family:"맑은 고딕";
	border:1px solid #A6A6A6;
	padding:5px;
	border-collapse:collapse;
}
.orderChkTable td{text-align:center; padding:5px; border: 1px solid #000000;}
.orderChkTable th{text-align:center; padding:5px; border: 1px solid #000000; background-color:#FAECC5;}
</style>
<script>
function change(){

	var one = "결제완료";
	if (o_state.value == 1){
		document.getElementById('o_state2').innerHTML =  '결제완료';
	} else if (o_state.value == 2) {
		document.getElementById('o_state2').innerHTML =  '배송준비';
	} else if (o_state.value == 3) {
		document.getElementById('o_state2').innerHTML =  '배송중';
	} else if (o_state.value == 4) {
		document.getElementById('o_state2').innerHTML =  '배송완료';
	}

	if (o_way.value == 'M') {
		document.getElementById('o_way2').innerHTML =  '현금결제';
	} else {
		document.getElementById('o_way2').innerHTML =  '신용카드결제';
	}
	

 	for(var i=0; i<"${partsList}".length; i++){
 		p_sum.value = parseInt(p_fixed[i].value) - parseInt(p_dis[i].value);
 	}
		
}
</script>
</head>
<body onload="change()">
		<center>
<div class="orderChk">상품정보</div>
	<table width="100%" class="orderChkTable">
		<tr>
			<th width="10%" scope="col">상품번호</th>
			<th width="50%" scope="col">상품명</th>
			<th width="20%" scope="col">상품금액</th>
			<th width="20%" scope="col">할인금액</th>
			<th scope="col">총 금액</th>
		</tr>
	<c:forEach var="result" items="${partsList}" varStatus="status">
		<tr>
			<td>${result.P_NUM}</td>
			<td>${result.P_NAME}</td>
			<td style="text-align:right; padding-right:10px">${result.P_FIXED} 원 </td>
			<td>- ${result.P_DIS} 원 </td>
			<td style="text-align:right; padding-right:10px">${result.P_FIXED} 원 </td>
		</tr>
	</c:forEach>
		<tr>
			<td colspan="3">&nbsp;</td>
			<td style="border-right:0px; "><strong>합계</strong></td>
			<td style="border-left:0px; text-align:right; padding-right:10px"><strong>${infoList.o_ototal} 원</strong></td>
		</tr>
	</table>
	<table width="100%">
		<tr>	
			<td width="50%">
				<div class="orderChk">배송지정보</div>
				<table width="100%" class="orderChkTable">
				  <tr>
				    <th width="30%" scope="row">받으시는 분</th>
				    <td>${infoList.o_payee}</td>
				  </tr>
				  <tr>
				    <th width="30%" scope="row">연락처</th>
				    <td>${infoList.o_pphone}</td>
				  </tr>
				  <tr>
				    <th width="30%" height="auto" scope="row">주소</th>
				    <td>[${infoList.zip_code}] ${zip_addr} ${infoList.o_addr}</td>
				  </tr>
				</table>
			</td>
			<td width="50%">
				<div class="orderChk">결제정보</div>
				<table width="100%" class="orderChkTable">
				  <tr>
				    <th width="40%" scope="row">결제방법</th>
				    <td style="text-align:left; padding-left:30px;">
					    <span id="o_way2" name="o_way2"></span>
					    <input type="hidden" id="o_way" name="o_way" value="${infoList.o_way}">
					</td>
				  </tr>
				  <tr>
				    <th width="40%" scope="row">주문 총액</th>
				    <td style="text-align:left; padding-left:30px;">${infoList.o_ototal} 원</td>
				  </tr>
				  <tr>
				    <th width="40%" scope="row">배송비</th>
				    <td style="text-align:left; padding-left:30px;">${infoList.o_del} 원</td>
				  </tr>
				  <tr>
				    <th width="40%" scope="row">할인금액</th>
				    <td style="text-align:left; padding-left:30px;">- ${infoList.o_dis} 원</td>
				  </tr>
				  <tr>
				    <th width="30%" scope="row">최종 결제금액</th>
				    <td style="text-align:left; padding-left:30px;"><strong>${infoList.o_sum} 원</strong></td>
				  </tr>
				  <tr>
				    <th width="30%" scope="row">주문상태</th>
				    <td style="text-align:left; padding-left:30px;">
				    	<span id="o_state2" name="o_state2"></span>
					    <input type="hidden" id="o_state" name="o_state" value="${infoList.o_state}">
				    </td>
				  </tr>
				  
				</table>
			</td>
		</tr>
	</table>
	</center>
</body>
</html>