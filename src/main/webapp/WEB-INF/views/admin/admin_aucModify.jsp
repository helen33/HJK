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
		function search(pccode,pcname){
			browsing_window = window
			.open(
					'partSearch?pccode=' + pccode + "&pcname=" + pcname,
					'window',
					"height=500, width=500, toolbar=auto, menubar=no, location=no");
			browsing_window.focus();
		}
		function pcimg(img) {
			browsing_window = window
			.open(
					'aucingimg?img=' + img,
					'window',
					"height=700, width=500, toolbar=auto, menubar=no, location=no");
			browsing_window.focus();
		}
		function partsModify() {
			alert("수정되셨습니다.");
			document.adminAucModi.action = "adminAucModi";
		 	document.adminAucModi.submit();
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
<img src="${pageContext.request.contextPath}/resources/images/10.png" width="120px" style="position: relative; left: -390px; top: 0px;">
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
				<input type="text" name="c_name" id="c_name" value="${auction.c_name}">
			</td>
		<tr>
			<th scope="row">즉시구매가</th>
			<td><input type="text" name="a_buy" id="a_buy" value="${auction.a_buy}"></td>
			<th scope="row">시작가</th>
			<td><input type="text" name="a_start" id="a_start" value="${auction.a_start}"></td>
		</tr>
		<tr>
			<th scope="row" width="200px">시작일</th>
			<td width="250px"><input type="text" name="a_starttime" id="a_starttime" value="${auction.a_starttime}"></td>
			<th scope="row" width="200px">마감일</th>
			<td width="250px"><input type="text" name="a_endtime" id="a_endtime" value="${auction.a_endtime}"></td>
		</tr>
		<tr>
			<th colspan="4"><b>제품 사양</b></th>
		</tr>
		<c:forEach var="result" items="${listP}" varStatus="status">
		<tr>
			<th onclick="pcimg('${result.p_img}')"><b>${result.pc_name}</b></th>
				<c:if test ="${result.pc_code == 140}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="cpu" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 150}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="cpucl" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 160}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="mainb" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 170}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="memory" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 180}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="ssd" name="auction_goods" size="50" value="${result.p_name}" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 190}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="hardD" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 200}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="grapc" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 210}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="cdD" name="auction_goods" size="50" value="${result.p_name}" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 220}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="sound" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 230}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="lanC" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 240}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="casec" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 250}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="power" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<c:if test ="${result.pc_code == 260}">
			<td colspan="2" onclick="pcimg('${result.p_img}')"><input id="window" name="auction_goods" value="${result.p_name}" size="50" style="border:0px;"/></td>
			</c:if>
			<td width="100px" align="right"  onclick="search('${result.pc_code}','${result.pc_name}')">검색&nbsp;&nbsp;</td>
		</tr>
		</c:forEach>

	</table>
	<input type="reset" name="" id="" value="취소" />
	<input type="button" value="수정" onclick="partsModify()"/>
		
</center>
</form>

</body>
</html>