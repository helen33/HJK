<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
  <%@ page import = "java.util.ArrayList" %>
  <%@ page import = "java.io.*" %>
  <%@ page import = "java.util.*" %>
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
		String es_pagefile = request.getParameter("es_page");
		if (es_pagefile == null) {
			es_pagefile = "/partTab?pc_code=150";
		} 
	%>
	<!-- es_wrap : 웹 도큐멘트 전체 -->
	<div id="es_wrap" style="width: 754x; margin: auto;">

	<!-- header : 상단 -->
		<div id="header" name="header">
			<jsp:include page="../header.jsp" />
		<!-- top : 메인메뉴부분 -->
<!-- 		<div id="top" name="top"> -->
<%-- 			<jsp:include page="./top.jsp" /> --%>
<!-- 		</div> -->
		<!-- es_navi_menu : 상단 메뉴부분 -->
		<div id="es_navi_menu" name="es_navi_menu">
			<jsp:include page="./es_navi_menu.jsp" />
		</div>
		<!-- main : 중앙 main -->
		<div id="es_main" name="es_main" style="margin-top: 10px;">
			<c:import url='<%=es_pagefile%>' />
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
