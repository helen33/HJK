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
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<title>나의 입/낙찰 내역</title>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.myQnaL{
	font-size:10px;
	width:100%;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
}
.myQnaL td{
	text-align:center;
	padding: 7px;
}

.Header{
	BORDER-BOTTOM: #1A90D8 2px solid;
	text-align:center;
	vertical-align:middle;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function myescon(bnum,cname){
	location.href="m_myesticontent?bnum="+bnum+"&cname="+cname;
}
</script>
</head>
<body>
<form id="myesti" name ="myesti">
<input id="bnum" name="bnum" type="hidden"><input id="cname" name="cname" type="hidden">
<hr color="red">
<font size="2" color="red">※ 진행 중 경매</font>
<hr color="red">
	<table class="myQnaL">
		<tr class='Header'>
			<td width="10%">번호</td>
			<td width="40%">경매상품</td>
			<td width="30%">날짜</td>
			<td width="20%">가격</td>
		</tr>
		<c:forEach var="result" items="${list2}" varStatus="status">
		<tr>
			<td width="10%">${result.b_num}</td>
			<td width="40%">${result.c_name}</td>
			<td width="30%">${result.b_date}</td>
			<td width="20%">${result.b_price}</td>
		</tr>
		</c:forEach>
	</table><br>
	<hr color="red">
<font size="2" color="red">※ 종료 된 경매</font>
<hr color="red">
	<table class="myQnaL">
		<tr class='Header'>
			<td width="10%">번호</td>
			<td width="40%">제목</td>
			<td width="30%">날짜</td>
			<td width="20%">가격</td>
		</tr>
		<c:forEach var="result" items="${list}" varStatus="status">
		<tr>
			<td width="10%">${result.b_num}</td>
			<td width="40%" onclick="myescon('${result.b_num}','${result.c_name}')">${result.c_name}</td>
			<td width="30%">${result.b_date}</td>
			<td width="20%">${result.b_price}</td>
		</tr>
		</c:forEach>
	</table>
	</form>
</body>
</html>