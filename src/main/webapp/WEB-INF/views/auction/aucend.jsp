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
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<title>경매 예정</title>
<style>
.auTable{
	width:900px;
	font-size:13px;
	border:none;
}
.auTable th{text-align:center; padding:5px; background-color:#FAECC5;}
.auTable td{text-align:center; padding:5px;}
</style>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<script type="text/javascript">
function goods_detail(anum) {
	browsing_window = window
	.open(
			'auction_detail?a_num=' + anum,
			'window',
			"height=700, width=680, toolbar=auto, menubar=no, location=no");
	browsing_window.focus();
}
</script>
</head>
<body>
		<!-- banner -->
        <div id='action banner'>
        	<center>
        	<jsp:include page="../estimate/banner.jsp" />
        	</center>
        </div>
	<!-- auction after list -->
	<div id='auction after list'>
		<font color="#FF0000">
			<center>
				해당 리스트를 클릭하시면 정보를 자세히 보실 수 있습니다.
			</center>
		</font>
		<table width="900px" border='0' align="center" class='auTable'>
<%-- 			<c:forEach var='min' begin='1' end='10' step='1'> --%>
				<c:forEach var='result' items='${aucionendList}' varStatus='status'>
				<tr onClick="goods_detail('${result.A_NUM}')">
					<!-- 상품 이미지 -->
					<td width="20%" align="center" valign="middle">
						<img src="http://sangque.iptime.org:7070/hjk_img/auctionimages/${result.A_IMG}" width="130" height="130" />
					</td>
					<!-- 상품 산략 설명 -->
					<td width="50%" align="left" valign="middle">
						경매번호 : ${result.A_NUM} <br>
						상품명 :  ${result.C_NAME}
					</td>
					<!-- 시작/낙찰 가격 -->
					<td width="30%" align="center" valign="middle">
						<img src='${pageContext.request.contextPath}/resources/images/Startp.png' />
							<span id="startp"><fmt:formatNumber value='${result.A_START}' type='number'/></span>원<br />
						<img src='${pageContext.request.contextPath}/resources/images/setp.png' />
							<span id="setp"><fmt:formatNumber value='${result.A_SUCPRICE}' type='number'/></span>원
					</td>
				</tr>
				<tr>
					<td colspan='3'>
						<hr>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>