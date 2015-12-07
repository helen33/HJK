<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의하기상세</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
.qnaContable {
	font-family: 'Nanum Gothic', sans-serif;
	font-size:13px;
	width:900px;
	border-collapse: collapse;
	text-align:center;
	vertical-align:middle;
	BORDER-BOTTOM: #1A90D8 2px solid;
	BORDER-TOP: #1A90D8 2px solid;
}

.qnaContablehead{
	border-bottom-color: #666;
	border-top-color: #666;
	border-bottom-style: solid;
	border-top-style: solid;
	border-bottom-width: 1px;
	border-top-width: 1px;
}

.qnaContable td{
	text-align:center;
	vertical-align:middle;
}
.qnaContable th{
	background-color:#EFEFEF;
	vertical-align:middle;
}
</style>
<script>
function modi(qnum){
	document.qnamodi.q_num.value = qnum;
	location.href="./esmain.do?es_page=/qnaModi?q_num=" + qnum;
}
function del(qnum){
	document.qnamodi.q_num.value = qnum;
	document.qnamodi.action = "qnaDel";
	document.qnamodi.submit();
}
</script>
</head>
<body>
<form id="qnamodi" name="qnamodi">
<font style="text-decoration:underline; font-size:20px; font-weight:bold;">문의상세페이지</font><br><br>
	<input type="hidden" id="q_num" name="q_num">
	<table class="qnaContable">
		<tr>
			<th width="620" height="30" colspan='8'>${qnaContent.q_name}</th>
		</tr>
		<tr class='qnaContablehead'>
			<td width="77" style="font-weight:bold; padding:5px;">글번호</td>
			<td width="auto">${qnaContent.q_num}</td>
			<td width="77" style="font-weight:bold; padding:5px;">작성자</td>
			<td width="auto">${qnaContent.m_id}</td>
			<td width="77" style="font-weight:bold; padding:5px;">작성일</td>
			<td width="auto">${qnaContent.q_date}</td>
			<td width="77" style="font-weight:bold; padding:5px;">조회수</td>
			<td width="auto">${qnaContent.q_hits}</td>
		</tr>
		<tr>
			<td height="200" colspan='8'>${qnaContent.q_content}</td>
		</tr>
		<tr>
		  <td height="200" colspan='8'><img src="./resources/qnafiles/${qnaContent.q_file}"></td>
	  </tr>
	</table>
	<c:if test="${qnaContent.m_id eq memberId}">
		<input type="button" value="수정" OnClick="modi(${qnaContent.q_num})">
		<input type="button" value="삭제" OnClick="del(${qnaContent.q_num})">
  </c:if>
</form>
</body>
</html>