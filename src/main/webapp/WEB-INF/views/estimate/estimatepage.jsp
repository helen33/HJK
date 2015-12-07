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
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<%
		String es_pagefile = request.getParameter("es_page");
		if (es_pagefile == null) {
			es_pagefile = "#";
		}
	%>
	<center>
		<table width="900px">
			<tr>
				<td width="50%">
					<!-- jsp:include 대신 JSTL 문으로 바꿈 include는 정적인 화면인 반면에 import는 조건문으로 동적으로 할 수 있다. -->
					<!-- http://wonminst.blog.me/90096031417 참고 --> 
					<c:import url="/estimatePartsMainForm" />
				</td>
				<td width="50%">
					<div style="overflow: auto; height:650px">
						<c:import url="/estimatePartsListForm" />
					</div>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>