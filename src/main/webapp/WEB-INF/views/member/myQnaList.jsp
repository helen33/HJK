<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>내가 쓴 문의글 </title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
.myQnaL{
	font-size:13px;
	width:720px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
}
.myQnaL td{
	text-align:center;
	padding:7px;
}

.Header{
	BORDER-BOTTOM: #1A90D8 2px solid;
	text-align:center;
	vertical-align:middle;
	font-weight: bold;
}
</style>
</head>
<body>
<hr color="red">
<font size="2" color="red">내가 쓴 문의글</font>
<hr color="red">
	<table class="myQnaL">
		<tr class='Header'>
			<td width="50">번호</td>
			<td width="400">제목</td>
			<td width="120">날짜</td>
			<td width="50">조회</td>
		</tr>
		<c:forEach var="result" items="${myqna}" varStatus="status">
		<tr>
			<td>${result.q_num}</td>
			<td>
			<a href="esmain.do?es_page=/qnaContent.do?q_num=${result.q_num}">${result.q_name}</a>
			</td>
			<td>${result.q_date}</td>
			<td>${result.q_hits}</td>
		</tr>
		</c:forEach>
	</table>
	${note}
</body>
</html>