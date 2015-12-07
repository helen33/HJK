<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
.aucingtable{
	font-size:13px;
	width:600px;
}
.aucingtable td{
	padding:5px;
}

.detailname{
	font-weight: bold;
	font-size: 40px;
}

.detailstartp{
	font-size: 20px;
	vertical-align: top;
	font-weight: bold;
	text-align:center;
}

.detailsetp{
	font-size: 30px;
	vertical-align: top;
	font-weight: bold;
	text-align:center;
	color:red;
}
</style>

<script>
$(document).ready(function(){
	var state = a_state.value;
	if(state == 1){
		document.getElementById('img').innerHTML =  
			"<img src='${pageContext.request.contextPath}/resources/images/detail_startp.png'/>"
			+ "<font class='detailstartp'><fmt:formatNumber value='${auctionInfo.a_start}' type='currency' currencySymbol='￦'/></font>"
			+ "<img src='${pageContext.request.contextPath}/resources/images/detail_setp.png' />"
			+ "<font class='detailsetp'><fmt:formatNumber value='${auctionInfo.a_sucprice}' type='currency' currencySymbol='￦'/></font>";
	}else if (state == 3){
		document.getElementById('img').innerHTML =  
			"&nbsp;&nbsp;&nbsp;&nbsp;<img src='${pageContext.request.contextPath}/resources/images/detail_exp.png' />"
			+ "<font class='detailstartp'><fmt:formatNumber value='${auctionInfo.a_start}' type='currency' currencySymbol='￦'/></font>";
	}
});
</script>
</head>
<body>
	<center>
	<div id='aucend_detail'>
		<table width="600" class='aucingtable'>
			<tr>
				<td rowspan="3" width="250px" height="auto">
					<img src="http://sangque.iptime.org:7070/hjk_img/auctionimages/${auctionInfo.a_img}" width="249px"/>
				</td>
				<td>
					<img src='${pageContext.request.contextPath}/resources/images/auction_state_end.gif' />
					<input type="hidden" id="a_state" name="a_state" value="${auctionInfo.a_state}">
				</td>
			</tr>
			<tr>
				<td colspan="2"><font class='detailname'>${auctionInfo.c_name}</font></td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="img"></span>
				</td>
			</tr>
		</table>

		<table class="aucingtable" >
		<tr bgcolor="#000000">
			<td colspan="3" width="900px">
			<font color="#F6F6F6"><b>제품 사양</b></font>
			</td>
		</tr>
		<c:forEach var="result" items="${auctionParts}" varStatus="status">
		<tr onclick="pcimg('${result.p_img}')">
				<td bgcolor="#EAEAEA">
					<center><b>${result.PC_NAME}</b></center>
				</td>
				<td>
					<center>${result.P_NAME}</center>
				</td>
		</tr>			
		</c:forEach>
</table>
	</div>
	</center>
</body>
</html>