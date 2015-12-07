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
.adminTable{
	width:900px;
	border: 1px solid;
	border-collapse: collapse;
	padding : 5px;
}
.adminTable th {
	width:140px;
}
</style>
</head>
<body>
관리자 page : <%=session.getAttribute("managerId")%> <br>
<table border="1" class="adminTable">
	<th><a href="./index">HOME</a></th>
	<th><a href="./adminpage?admin_page=/adminMember">회원관리</a></th>
	<th><a href="./adminpage?admin_page=/adminParts">상품관리</a></th>
	<th><a href="./adminpage?admin_page=/adminAuction">경매관리</a></th>
</table>
</body>
</html>