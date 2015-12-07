<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>무제 문서</title>
<style>
.auction_detail {
	width: auto;
	vertical-align: middle;
	margin: 0 auto;
	text-align: center;
}

.start_p {
	font-size: 15px
}

.now_p {
	font-size: 20px;
	font-weight: bold;
	color: #F00;
}

.auction_detail_table {
	border: 1px solid #A6A6A6;
	border-collapse: collapse;
}
.auction_detail_table th{
	font-size: 10pt;
}

.best_bid {
	font-weight: bold;
}
</style>
<script type="text/javascript">
	function pcimg(img) {
		browsing_window = window.open('m_aucingimg?img=' + img, 'window',
				"toolbar=auto, menubar=no, location=no");
		browsing_window.focus();
	}
</script>
</head>
<body>
	<div class="auction_detail" id='auction_detail'>
		<center>
			<!-- 경매중일 때 -->
			<c:if test="${auction.a_state eq 2}">
				<c:import url="/autimer"></c:import>
			</c:if>
			<!-- 종료된 경매 일 때 -->
			<c:if test="${auction.a_state eq 1}">
				<img src='${pageContext.request.contextPath}/resources/images/auction_state_end.gif' />
			</c:if>
			<!-- 종료된 경매 일 때 -->
			<c:if test="${auction.a_state eq 3}">
				<img src='${pageContext.request.contextPath}/resources/images/auction_state_schedule.gif' />
			</c:if>
			
			<p>
				<font size='+2'><strong>${auction.c_name}</strong></font>
			</p>
			
			<p>
				<img src="http://sangque.iptime.org:7070/hjk_img/auctionimages/${auction.a_img}" width="50%" height="50%" border="0" />
			</p>
			<!-- 경매 예정일 때 -->
			<c:if test="${auction.a_state eq 3}">
			<p class="start_p">
				<strong>시작가 : <font size='+2' color='red'><span id="">${auction.a_start}원</span></font></strong>
			</p>
			</c:if>
			<!-- 경매중이거나 종료일 때 -->
			<c:if test="${auction.a_state != '3'}">
				시작가 : <span id=""><fmt:formatNumber value='${auction.a_start}' type='currency'/>원</span>
			</c:if>
			
			<!-- 경매중일 때 -->
			<c:if test="${auction.a_state eq 2}">
				<p class="now_p">
					현재가 : <span id=""><fmt:formatNumber value='${auction.a_now}' type='currency'/>원</span>
				</p>
			</c:if>
			
			<!-- 종료된 경매 일 때 -->
			<c:if test="${auction.a_state eq 1}">
				<p class="now_p">
					낙찰가 : <span id=""><fmt:formatNumber value='${auction.a_sucprice}' type='currency'/>원</span>
				</p>
			</c:if>
			
			<!-- 경매중이거나 종료일 때 -->
			<c:if test="${auction.a_state != '3'}">
			<table width="98%" class="auction_detail_table">
				<tr bgcolor="#000000">
					<th colspan="3" align="center"><font color="#FFFFFF">입찰내역</font>
					</th>
				</tr>
				<tr bgcolor="#EAEAEA">
					<th>입찰자</th>
					<th>입찰일자</th>
					<th>입찰가격</th>
				<tr>
					<!-- FOR문으로 입찰자 데이터 불러올 곳 시작-->
					<c:forEach var="result" items="${bids}" varStatus="status">
						<c:if test="${bidder.B_PRICE == result.B_PRICE}">
							<tr align="center" bgcolor="#FFCCFF">
								<td class='best_bid'>${result.M_NAME}</td>
								<td class='best_bid'>${result.B_DATE}</td>
								<td class='best_bid'>${result.B_PRICE}원</td>
							</tr>
						</c:if>
						<c:if test="${bidder.B_PRICE != result.B_PRICE}">
							<tr align="center">
								<td>${result.M_NAME}</td>
								<td>${result.B_DATE}</td>
								<td>${result.B_PRICE}원</td>
							</tr>
						</c:if>
					</c:forEach>
					<!-- FOR문으로 입찰자 데이터 불러올 곳 끝-->
			</table>
			</c:if>
			<hr>
			<font size='-1' color='red'>각각의 부품 이름을 터치 하시면 상세 이미지를 볼 수 있습니다.</font>
			<table width="98%" align="center" class="auction_detail_table">
				<tr bgcolor="#000000">
					<th colspan="2" align="center"><font color="#FFFFFF">제품사양</font>
					</th>
				</tr>
				<!-- FOR문으로 상품 상세데이터 불러올 곳 시작-->
				<c:forEach var="result" items="${listP}" varStatus="status">
					<tr style="border-bottom: 1px solid #CCC;" height='50px' onclick="pcimg('${result.p_img}')">
						<th width='70px' bgcolor="#EAEAEA">${result.pc_name}</th>
						<td style="padding-left:10px">${result.p_name}</td>
					</tr>
				</c:forEach>
				<!-- FOR문으로 상품 상세데이터 불러올 곳 끝-->
			</table>
			<input type="hidden" id="psum" name="psum" value="${pnumsnum}">
			<input type="hidden" id="pnum" name="pnum">
		</center>
	</div>
</body>
</html>
