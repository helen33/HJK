<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" media="all" />
<style type="text/css">
.es_header {
	background: #ffffff;
	height: 50px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	margin:0 auto;
	width: 900px
}

.es_header > ul {
	background: #4b4b4b;
	height: 49px;
	float: left;
	list-style: none;
	margin: 0;
	padding: 0;
	width: 900px;
}
.es_header > ul > li {
	float: left;
	position: relative;
	width: 150px;
}
.es_header > ul > li > a {
	color: #ffffff;
	display: block;
	letter-spacing: 0.1em;
	line-height: 49px;
	text-align: center;
	text-decoration: none;
}
.es_header > ul > li.current > a,
.es_header > ul > li.current > a:hover,
.es_header ul li ul li.current a,
.es_header ul li ul li.current a:hover {
	background: #000000;
	color: #ffffff;
}
.es_header ul li a:hover {
	background: #ffffff;
	color: #000000;
}

</style>
</head>
<script>
function chek(mid){
	if(mid == "null"){
		alert("로그인 후 이용가능합니다.");
		return false;
	}else{
		location.href="esmain.do?es_page=/mypage";
	}
}
</script>
<body>
	<div class="es_header">
		<ul>
			<li class="current">
				<a href="index.do" border="0px">Home</a>
			</li>
			<li>
				<a href="esmain.do?es_page=./estimatepage.jsp">Estimate</a>
			</li>
			<li>
				<a href="esmain.do?es_page=/libraryForm" border="0px">Library</a>
			</li>
			<li>
				<a href="esmain.do?es_page=/qnaForm" border="0px">QnA</a>
			</li>
			<li>
				<a onclick="chek('<%=session.getAttribute("memberId")%>')" border="0px">My Page</a>
			</li>
			<li>
				<a href="esmain.do?es_page=/loding">HJK</a>
			</li>
		</ul>
	</div>
</body>
</html>