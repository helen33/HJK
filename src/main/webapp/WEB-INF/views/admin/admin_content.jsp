<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<title>Insert title here</title>
	<script>
		function pcimg(img) {
			browsing_window = window
			.open(
					'aucingimg?img=' + img,
					'window',
					"height=700, width=500, toolbar=auto, menubar=no, location=no");
			browsing_window.focus();
		}
	</script>
</head>
<style>
.insertTable{
	
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 8px;
}
.insertTable th {
	padding: 8px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.insertTable td{
	padding-left:10px;
	font-size:13px; 
	border-left:1px solid #EAEAEA;
}
</style>
<body>
<form name="adminAucModi" id="adminAucModi" enctype="multipart/form-data" method="post" action="adminPartsModi">
<input type="hidden" name="a_num" id="a_num" value="${auction.a_num}">
<img src="${pageContext.request.contextPath}/resources/images/16.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<center>
	<table border="1" width="900px" id="aumodi" class="insertTable" style="margin-top:15px;">
		<tr>
			<th scope="row">경매상태</th>
			<td colspan="3">
				${state}
			</td>
		</tr>
		<tr>
			<th scope="row">상품이름</th>
			<td colspan="3">
				${auction.c_name}
			</td>
		<tr>
			<th scope="row">즉시구매가</th>
			<td>${auction.a_buy}</td>
			<th scope="row">시작가</th>
			<td>${auction.a_start}</td>
		</tr>
		<tr>
			<th scope="row" width="200px">시작일</th>
			<td width="250px">${auction.a_starttime}</td>
			<th scope="row" width="200px">마감일</th>
			<td width="250px">${auction.a_endtime}</td>
		</tr>
		<tr>
			<th colspan="4"><b>제품 사양</b></th>
		</tr>
		<c:forEach var="result" items="${listP}" varStatus="status">
		<tr>
			<th onclick="pcimg('${result.p_img}')"><b>${result.pc_name}</b></th>
			<td colspan="3" onclick="pcimg('${result.p_img}')">${result.p_name}</td>
		</tr>
		</c:forEach>

	</table>
</center>
</form>

</body>
</html>