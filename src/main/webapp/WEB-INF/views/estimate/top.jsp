<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로고랑 검색</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" media="all" />
</head>
<body>

<div style="margin-top:20px;">
<center>
	<a href=./index.do border="0">
		<img src="${pageContext.request.contextPath}/resources/images/logo.png" style="margin-bottom:5px;"/>
	</a>
	<input type="text" size="50" />
	<input type="button" value="검색" />
</center>
</div>

</body>
</html>