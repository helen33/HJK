<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품리스트</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
/* 상품 구분 몱록 */
#eslist_head {
	background: #ffffff;
	height: 30px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 10.5px;
	margin:0 auto;
	width: 900px;
	
}
#eslist_head > ul {

	background: #4b4b4b;
	height: 30px;
	float: left;
	list-style: none;
	margin: 0;
	padding: 0;
	width: 900px;
}
#eslist_head > ul > li {
	float: left;
	position: relative;
	width: 69px;
}
#eslist_head > ul > li > a {
	color: #ffffff;
	display: block;
	letter-spacing: 0.1em;
	line-height: 30px;
	text-align: center;
	text-decoration: none;
}
#eslist_head > ul > li.current > a,
#eslist_head > ul > li.current > a:hover,
#eslist_head ul li ul li.current a,
#eslist_head ul li ul li.current a:hover {
	background: #000000;
	color: #ffffff;
}
#eslist_head ul li a:hover {
	background: #D2D2D2;
	color: #000000;
}

/* 상품 데이터 리스트 */
.pccodeTable{
	font-size:17px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
	margin-top:5px;
	
}
.pccodeTable td{
	text-align:center;
	padding:5px;
}
.eslistTable{
	font-size:13px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
	margin-top:5px;
	
}
.eslistTable td{
	text-align:center;
	padding:5px;
}

</style>
<script>

</script>

</head>
<body>

<!-- banner : 메인베너 -->
<div id="banner" name="banner">
	<jsp:include page="./banner.jsp" />
</div>

<div id="line" style="width: 900px; height: 1px; background-color: #999; margin: 0px"></div>
<div id="eslist_head">
			<ul>
		<c:forEach var="pcCode" items="${pcCode}" varStatus="status" >
				<li>
					<a href="esmain.do?es_page=/partTab?pc_code=${pcCode.PC_CODE}"> <c:out value="${pcCode.PC_NAME}" /> </a>
				</li>
		</c:forEach>
			</ul>
			
</div>
<table border="0" width="900px">
	<tr>
			<c:forEach var="partList" items="${partList}" varStatus="status">
			
				<td><a
					href="esmain.do?es_page=/partTab/partsContent?p_num=${partList.P_NUM}"
					onclick="check()">
						<table border="1" width="300px" height="" class="eslistTable" >
							<tr>
								<td>
								<img src="http://168.126.146.37/20132397/parts/${partList.P_IMG}" width="130" height="130"></td>
							</tr>
							<tr>
								<td style="font-weight:bold">[${partList.C_NAME}] ${partList.P_NAME}</td>
							</tr>
							<tr>
								<td><fmt:formatNumber value="${partList.P_FIXED}" type="number"/>원</td>
							</tr>
						</table>
				</a></td>
				<c:if test="${ status.count%3 eq 0 }">
					</tr>
					<tr>
			</c:if>
			</c:forEach>
			
	</table>

</body>
</html>