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
.totalOders{
	font-size:13px;
	width:720px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
}
.totalOders td{
	text-align:center;
	width:180px;
	padding: 5px;
}

.Header{
	BORDER-BOTTOM: #1A90D8 2px solid;
	text-align:center;
	vertical-align:middle;
	font-weight: bold;
}
</style>
<script type="text/javascript">
function order_detail(onum){
	location.href="esmain.do?es_page=/mypage?my_page=/myorder_detail?onum="+onum;
}
</script>
</head>
<body>
<hr color="red">
<font size="2" color="red">전체 주문 리스트</font>
<hr color="red">
	<table class="totalOders">
		<tr class='Header'>
			<td>주문번호</td>
			<td>배송상태</td>
			<td>주문일</td>
			<td>총 결제액</td>
		</tr>
		<c:forEach var="result" items="${mytotalorders}" varStatus="status">
		<tr>
			<td onclick="order_detail('${result.o_num}')">${result.o_num}</td>
			<td onclick="order_detail('${result.o_num}')">
				<c:if test='${result.o_state eq 1}'>
					결제완료
				</c:if>
				<c:if test='${result.o_state eq 2}'>
					배송준비
				</c:if>
				<c:if test='${result.o_state eq 3}'>
					배송중
				</c:if>
				<c:if test='${result.o_state eq 4}'>
					배송완료
				</c:if>
			</td>
			<td onclick="order_detail('${result.o_num}')">${result.o_date}</td>
			<td onclick="order_detail('${result.o_num}')">${result.o_sum}</td>
		</tr>
		</c:forEach>
	</table>
	${note}
	<hr>
</body>
</html>