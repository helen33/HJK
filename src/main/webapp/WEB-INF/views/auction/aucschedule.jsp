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
}
.auTable th{text-align:center; padding:5px; background-color:#FAECC5;}
.auTable td{text-align:center; padding:5px; }
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
        <center>
<div id='auction before list'>
	<table width="900px" align="center" class='auTable'>	
	<c:forEach var="result" items="${auscheduleList}">
		<tr onclick="goods_detail('${result.A_NUM}')">
			<td width="20%" align="center" valign="middle">
				<img src="http://sangque.iptime.org:7070/hjk_img/auctionimages/${result.A_IMG}" width="130" height="130" />
			</td>  
			<td width="50%" align="left" valign="middle">
				${result.C_NAME}
			</td>
			<td width="10%" align="center" valign="middle">
				${result.A_STARTTIME}
				<br> ~ <br>
				  ${result.A_ENDTIME}
			</td>
			<td width="20%" align="center" valign="middle">
				<img src='${pageContext.request.contextPath}/resources/images/Startp.png' /> <span id="startp"><fmt:formatNumber value='${result.A_START}' type='number'/></span>원
			</td>
		</tr>
		<tr>
			<td colspan='4'>
				<hr>
			</td>
		</tr>
	</c:forEach>
	</table>
	
</div>
</center>
</body>
</html>