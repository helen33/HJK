<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자료실 상세</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
.libContable {
	font-family: 'Nanum Gothic', sans-serif;
	font-size:13px;
	width:900px;
	border-collapse: collapse;
	text-align:center;
	vertical-align:middle;
	BORDER-BOTTOM: #1A90D8 2px solid;
	BORDER-TOP: #1A90D8 2px solid;
}

.libContablehead{
	border-bottom-color: #666;
	border-top-color: #666;
	border-bottom-style: solid;
	border-top-style: solid;
	border-bottom-width: 1px;
	border-top-width: 1px;
}

.libContable td{
	text-align:center;
	vertical-align:middle;
}
.libContable th{
	background-color:#EFEFEF;
	vertical-align:middle;
}
</style>

</head>
<body>

<font style="text-decoration:underline; font-size:20px; font-weight:bold;">자료실상세페이지</font><br><br>
		
<table class="libContable">
	<tr>
		<td width="620" height="30" colspan='8'><strong>${libContent.l_name}</strong></td>
	</tr>
	<tr>
		<td style="font-weight:bold">글번호</td>
		<td>${libContent.l_num}</td>
		<td style="font-weight:bold">작성자</td>
		<td>관리자</td>
		<td style="font-weight:bold">작성일</td>
		<td>${libContent.l_reg}</td>
		<td style="font-weight:bold">조회수</td>
		<td>${libContent.l_hits}</td>
	</tr>
	<tr>
		<td width="620" height="200" colspan='8'>
			<strong>${libContent.l_content}</strong>
			<hr>
			<br><br><br><br><br>
			첨부파일 : <a href="#"><font color='blue'>${libContent.l_file}</font></a>
		</td>
	</tr>
</table>

</body>
</html>