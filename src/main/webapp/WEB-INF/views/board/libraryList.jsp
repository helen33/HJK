<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실리스트</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
/* 리스트 타이틀 */
.libtitle{
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 11pt;
	color: #000000;
	font-weight: bold;
	text-align:center;
	height: 25px;
	width: 900px;
	BORDER-BOTTOM: #1A90D8 2px solid;
}

/* 리스트 테이블 */
.libList {
	
	BORDER-bottom: #BABABA 1px solid;
	font-size: 9pt;
	border-collapse: collapse;
	width: 900px;
}

.libList td {
	BORDER-bottom: #E0E0E0 1px solid;
	padding-left: 2px;
	padding-right: 2px;
	background-color: #F7F7F7;
	height: 40px;
	text-align:center;
	vertical-align: middle;
}


</style>

</head>
<body>
<center>
<font style="text-decoration:underline; font-size:20px; font-weight:bold;">자료실 리스트 </font><br><br>
<table class="libtitle">
	<tr>
		<td width="50">번호</td>
		<td width="400">제목</td>
		<td width="120">작성일</td>
		<td width="50">조회</td>
	</tr>
</table>
	
<c:forEach var="result" items="${libList}" varStatus="status">
	
	<table class="libList">
		<tr>
			<td width="50">${result.L_NUM}</td>
			<td width="400"><a href="esmain.do?es_page=/libContent.do?l_num=${result.L_NUM}">${result.L_NAME}</a></td>
			<td width="120">${result.L_REG}</td>
			<td width="50">${result.L_HITS}</td>
		</tr>
	</table>
		
</c:forEach>

	<br />
	<!-- 10페이지 이후 다음 페이지로 넘겨준다. -->
	${paging}
	<br /><br />
	
</center>
</body>
</html>