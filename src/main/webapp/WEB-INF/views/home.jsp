<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Home</title>
<style type="text/css">
	html, body {margin:10px; padding:10px; font-family: "맑은 고딕";}
</style>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<h1> 회원 : <%=session.getAttribute("memberId")%> </h1> <br>

<a href="./index.do">메인페이지 가기</a><br>
<a href="./mydelete">회원탈퇴</a><br>
</body>
</html>
