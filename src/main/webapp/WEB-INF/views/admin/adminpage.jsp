<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자페이지</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
</style>
</head>
<body>
<%
	String admin_pagefile = request.getParameter("admin_page");
	if (admin_pagefile == null) {
		admin_pagefile = "#";
	}
%>
<center>
	<table width="900px">
		<tr>
			<td>
				<!-- jsp:include 대신 JSTL 문으로 바꿈 include는 정적인 화면인 반면에 import는 조건문으로 동적으로 할 수 있다. -->
				<!-- http://wonminst.blog.me/90096031417 참고 -->
				<c:import url="/adminpage_navi" />
			</td>
		</tr>
		<tr>
			<td>
				<c:import url="<%=admin_pagefile%>" />
			</td>
		</tr>
	</table>
</center>
</body>
</html>