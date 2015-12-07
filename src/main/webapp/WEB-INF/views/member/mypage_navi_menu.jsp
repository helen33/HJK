<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>마이페이지 네비게이션</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet"	media="all" />
<style type="text/css">
#my_navi {
	background: #ffffff;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 14px;
	margin: 0 auto;
	margin-left:0 auto;
	margin-right:0 auto;
}

#my_navi>ul {
	background: #4b4b4b;
	height: 49px;
	float: left;
	list-style: none;
	margin: 0;
	padding: 0;
}

#my_navi>ul>li {
	float: left;
	position: relative;
	width: 150px;
}

#my_navi>ul>li>a {
	color: #ffffff;
	display: block;
	letter-spacing: 0.1em;
	line-height: 49px;
	text-align: center;
	text-decoration: none;
}

#my_navi>ul>li.current>a, #my_navi>ul>li.current>a:hover, #my_navi ul li ul li.current a,
	#my_navi ul li ul li.current a:hover {
	background: #000000;
	color: #ffffff;
}

#my_navi ul li a:hover {
	background: #ffffff;
	color: #000000;
}
</style>
</head>
<body>
	<div id="my_navi">
	
		<ul>
			<li class="current">
				<a href="#">My Page</a>
			</li>
		</ul>
		<ul>
			<li>
			</li>
		</ul>
		<ul>
			<li>
				<a href="esmain.do?es_page=/mypage?my_page=/myupdateForm">회원 정보 수정</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="esmain.do?es_page=/mypage?my_page=/mytotalOders">전체 주문 내역</a>
			</li>
		</ul>
		<ul>
			<li>
				<a href="esmain.do?es_page=/mypage?my_page=/myQnaList">내가 쓴 문의글</a>
			</li>
		</ul>
		<ul>
			<li>
			<a href="esmain.do?es_page=/mypage?my_page=/myauction">입 / 낙찰 내역</a>
		</li>
		</ul>
		<c:forEach begin="1" end="9">
		<ul>
			<li>
			</li>
		</ul>
		</c:forEach>
	</div>
	<%-- 	<center> --%>
<!-- 		<table class="#"> -->
<!-- 			<tr> -->
<!-- 				<td> -->
<%-- 					<img src="${pageContext.request.contextPath}/resources/memtree.PNG" /> --%>
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 			<tr> -->
<!-- 				<td> -->
<!-- 				<br> -->
<!-- 				<a href="esmain.do?es_page=/mypage?my_page=/myupdateForm"> -->
<!-- 				-  회원 정보 수정</a><br><br> -->
<!-- 				<a href="esmain.do?es_page=/mypage?my_page=/mytotalOders"> -->
<!-- 				-  전체 주문 내역<br><br></a> -->
<!-- 				<a href="esmain.do?es_page=/mypage?my_page=/myQnaList"> -->
<!-- 				-  내가 쓴 문의글<br><br></a> -->
<!-- 				<a href="esmain.do?es_page=/mypage?my_page=/myestimateList"> -->
<!-- 				-  입 / 낙찰 내역<br></a> -->
<!-- 				</td> -->
<!-- 			</tr> -->
<!-- 		</table> -->
<%-- 	</center> --%>
</body>
</html>