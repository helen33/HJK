<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>경매 바탕</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<link rel="import" href="header.jsp">
<link rel="import" href="main.jsp">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
<center>
	<%
		String au_pagefile = request.getParameter("au_page");
		if (au_pagefile == null) {
			au_pagefile = "/aucing";
		}
	%>
	<!-- wrap : 웹 도큐멘트 전체 -->
	<div id="wrap" style="width: 900px; margin: auto;">
		<!-- header : 상단 -->
		<div id="header" name="header">
			<jsp:include page="../header.jsp" />
		</div>
		<!-- auction-header : 2상단 -->
		<div id="aheader" name="aheader">
			<jsp:include page="./auhead.jsp" />
		</div>
		<!-- au_navi_menu: 상단메인메뉴부분 -->
		<div id="top" name="top">
			<jsp:include page="./au_navi_menu.jsp" />
		</div>

		<div id="main" name="main">
			<c:import url='<%=au_pagefile%>' />
		</div>


		<!-- footer div가 메인안에 div에있는 정렬의 영향을 받지 않도록 함-->
		<div style="clear: both">
			
		</div>
				<!-- footer : 하단 -->
		<div id="footer" style="height: 50px; margin-top: 10px;">
			<jsp:include page="../footer.jsp" />
		</div>

	</div>
</center>
</body>
</html>
