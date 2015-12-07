<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
#au_navi {
	background: #ffffff;
	height: 50px;
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 20px;
	font-weight:bold;
	margin:0 auto;
	width: 900px;
	margin-left:0 auto;
	margin-right:0 auto;
}

#au_navi > ul {
	background: #4b4b4b;
	height: 49px;
	float: left;
	list-style: none;
	margin: 0;
	padding: 0;
	width: 900px;
}
#au_navi > ul > li {
	float: left;
	position: relative;
	width: 300px;
}
#au_navi > ul > li > a {
	color: #ffffff;
	display: block;
	letter-spacing: 0.1em;
	line-height: 49px;
	text-align: center;
	text-decoration: none;
}
#au_navi > ul > li.current > a,
#au_navi > ul > li.current > a:hover,
#au_navi ul li ul li.current a,
#au_navi ul li ul li.current a:hover {
	background: #000000;
	color: #ffffff;
}
#au_navi ul li a:hover {
	background: #ffffff;
	color: #000000;
}
    </style>
</head>
<body>
		<div id="au_navi">
			<ul>
				<li>
					<a href="aumain.do?au_page=/aucend" border="0px">경매종료</a>
				</li>
				<li>
					<a href="aumain.do?au_page=/aucing" border="0px">경매중</a>
				</li>
				<li>
					<a href="aumain.do?au_page=/aucschedule" border="0px">경매예정</a>
				</li>
			</ul>
		</div>
</body>
</html>