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
<title>경매중</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<script>
function aucingD(aa){
	location.href = "aumain.do?au_page=/aucingD?a_num=" + aa;
}
</script>
</head>
<body>
		<!-- banner -->
        <div id='action banner'>
        	<center>
        	<jsp:include page="../estimate/banner.jsp" />
        	</center>
        </div>
        <center>
        <br>
<table>
			<tr>
				<c:forEach var="result" items="${aucing}" varStatus="status">
					<td><br>${result.A_STARTTIME} ~ ${result.A_ENDTIME}<br><br>
					<img src="http://sangque.iptime.org:7070/hjk_img/auctionimages/${result.A_IMG}" width="300px" height="250px" onclick="aucingD('${result.A_NUM}')"><br>
						${result.C_NAME}<br><br>
						 <font size="3" color="#8C8C8C">
						 	<img src='${pageContext.request.contextPath}/resources/images/Startp.png' width="45px" height="15px" />
						 		<del><fmt:formatNumber value='${result.A_START}' type='number'/>원</del>
						 </font><br> 
						 <font size="4">
						 	<img src='${pageContext.request.contextPath}/resources/images/nowp.png' width="55px" height="20px" />
						 		<b><fmt:formatNumber value='${result.A_NOW}' type='number'/></b>원
						 </font><br>
					</td>
					<c:if test="${ status.count%3 eq 0 }">
					</tr>
					<tr>
					</c:if>
				</c:forEach>
		</table>
</center>
</body>
</html>