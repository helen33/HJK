<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>주문확인</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet"
	media="all" />
<style>
#ordersu_warp {
	width: 850px;
	margin: 0 auto;
}


.orderChkTable {
	width: 820px;
	vertical-align: middle;
	border: none;
	border-collapse: collapse;
	text-align:center;
}

.orderChkTable td {
	border: solid 1px #CCC;
	padding: 5px;
}

.orderChkTable th {
	padding: 5px;
}

.orderChk {
	font-family: "맑은 고딕";
	font-weight: bold;
	font-size: 16px;
	text-align: left;
	border-bottom: solid #999;
}
</style>
<script>
	$(document).ready(function(){
		var one = "결제완료";
		if (o_state.value == 1) {
			document.getElementById('o_state2').innerHTML = '결제완료';
		} else if (o_state.value == 2) {
			document.getElementById('o_state2').innerHTML = '배송준비';
		} else if (o_state.value == 3) {
			document.getElementById('o_state2').innerHTML = '배송중';
		} else if (o_state.value == 4) {
			document.getElementById('o_state2').innerHTML = '배송완료';
		}

		if (o_way.value == 'M') {
			document.getElementById('o_way2').innerHTML = '현금결제';
		} else {
			document.getElementById('o_way2').innerHTML = '신용카드결제';
		}

		for (var i = 0; i < "${partsList}".length; i++) {
			p_sum.value = parseInt(p_fixed[i].value) - parseInt(p_dis[i].value);
		}
	});
</script>
</head>
<body>
	<center>
		<!-- header : 상단 -->
		<div id="header" name="header">
			<jsp:include page="../header.jsp" />
			<!-- es_navi_menu : 상단 메뉴부분 -->
			<div id="es_navi_menu" name="es_navi_menu">
				<jsp:include page="../estimate/es_navi_menu.jsp" />
			</div>
			<!-- footer div가 메인안에 div에있는 정렬의 영향을 받지 않도록 함-->
			<div style="clear: both"></div>
			<div id='ordersu_warp'>
				<div id='goods_state'>
					<table class="orderChkTable">
						<tr>
							<th class="orderChk" colspan="5">| 상품정보</th>
						</tr>
						<tr>
							<th width="10%" bgcolor="#EAEAEA">상품번호</th>
							<th width="40%" bgcolor="#EAEAEA">상품명</th>
							<th width="15%" bgcolor="#EAEAEA">상품금액</th>
							<th width="15%" bgcolor="#EAEAEA">할인금액</th>
							<th width="20%" bgcolor="#EAEAEA">총 금액</th>
						</tr>
						<c:forEach var="result" items="${partsList}" varStatus="status">
							<tr>
								<td>${result.P_NUM}</td>
								<td>${result.P_NAME}</td>
								<td style="text-align: right; padding-right: 10px">
									<fmt:formatNumber value="${result.P_FIXED}" type="number" /> 원</td>
								<td>- ${result.P_DIS} 원</td>
								<td style="text-align: right; padding-right: 10px">
									<fmt:formatNumber value="${result.P_FIXED}" type="number" /> 원</td>
							</tr>
						</c:forEach>
						<tr style="border-bottom: solid #999;">
							<td colspan="3" style="border: none">&nbsp;</td>
							<td style="border: none">
								<strong>합계</strong>
							</td>
							<td style="border: none; text-align: right; padding-right: 8px;">
								<strong>
									<font color="#FF0000"><fmt:formatNumber	value="${infoList.o_ototal}" type="number" /></font>원
								</strong>
							</td>
						</tr>
					</table>
				</div>
				<br>
				<br>
				<div id="step2">
					<table class="orderChkTable">
						<tr>
							<th class="orderChk" colspan="5">| 배송정보</th>
						</tr>
						<tr>
							<th bgcolor="#EAEAEA">받는이</th>
							<td>${infoList.o_payee}</td>
						</tr>
						<tr>
							<th bgcolor="#EAEAEA">연락처</th>
							<td>${infoList.o_pphone}</td>
						</tr>
						<tr style="border-bottom: solid #999;">
							<th bgcolor="#EAEAEA">주소</th>
							<td>[${infoList.zip_code}] ${zip_addr} ${infoList.o_addr}</td>
						</tr>
					</table>
				</div>
				<br>
				<br>
				<div id="step3">
					<table class="orderChkTable">
						<tr>
							<th class="orderChk" colspan="5">| 결제정보</th>
						</tr>
						<tr>
							<th width="15%" bgcolor="#EAEAEA">결제방법</th>
							<td width="35%"><span id="o_way2" name="o_way2"></span>
								<input type="hidden" id="o_way" name="o_way" value="${infoList.o_way}">
							</td>
							<th width="15%" bgcolor="#EAEAEA">주문상태</th>
							<td width="35%"><span id="o_state2" name="o_state2"></span>
								<input type="hidden" id="o_state" name="o_state" value="${infoList.o_state}">
							</td>
						</tr>
						<tr>
							<th width="15%" bgcolor="#EAEAEA">주문총액</th>
							<td width="35%">${infoList.o_ototal} 원</td>
							<th width="15%" bgcolor="#EAEAEA">할인금액</th>
							<td width="35%">
								- <fmt:formatNumber value="${infoList.o_dis}" type="number" /> 원
							</td>
						</tr>
						<tr style="border-bottom: solid #999;">
							<th width="15%" bgcolor="#EAEAEA">배송비</th>
							<td width="35%">${infoList.o_del} 원</td>
							<th width="15%" bgcolor="#EAEAEA">최종 결제금액</th>
							<td width="35%">
								<strong>
									<font color="#FF0000"><fmt:formatNumber value="${infoList.o_sum}" type="number" /></font> 원
								</strong>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- footer div가 메인안에 div에있는 정렬의 영향을 받지 않도록 함-->
			<div style="clear: both"></div>

			<!-- footer : 하단 -->
			<div id="footer" style="height: 50px; margin-top: 10px;">
				<jsp:include page="../footer.jsp" />
			</div>
	</center>
</body>
</html>