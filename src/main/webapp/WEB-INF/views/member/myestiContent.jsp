<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<title>나의 입/낙찰 내역 상세</title>
 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<style type="text/css">
.myQnaC{
	font-size:13px;
	width:720px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
}
.myQnaC td{
	text-align:center;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
<table class="myQnaC">
		<tr>
			<td width="50">경매제목 : ${c_name}</td>
			<td width="400">낙찰자 ID : ${m_id}</td>
		</tr>
		<tr>
			<td width="120">낙찰일 : ${bid.b_date}</td>
			<td width="50">낙찰 가격 : ${bid.b_price}</td>
		</tr>
</table>
<table class="myQnaC">
	<c:forEach var="result" items="${listP}" varStatus="status">
		<tr>
			<c:if test="${result.pc_code == 140}">
				<td>CPU</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>
		</tr>			
		<tr>
			<c:if test="${result.pc_code == 150}">
				<td>CPU쿨러</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 160}">
				<td>메인보드 </td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 170}">
				<td>메모리</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>
		</tr>
		<tr>	
			<c:if test="${result.pc_code == 180}">
				<td>SSD</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 190}">
				<td>하드 </td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 200}">
				<td>그래픽 </td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 210}">
				<td>CD드라이브</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 220}">
				<td>사운드</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 230}">
				<td>랜카드</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 240}">
				<td>케이스</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
		<tr>
			<c:if test="${result.pc_code == 250}">
				<td>파워</td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>
		</tr>
		<tr>
			<c:if test="${result.pc_code == 260}">
				<td>윈도우 </td>
				<td>${result.p_name}</td>
				<td><img src="http://168.126.146.37/20132397/parts/${result.p_img}" width="20px"></td>
			</c:if>	
		</tr>
	</c:forEach>
</table>
</body>
</html>