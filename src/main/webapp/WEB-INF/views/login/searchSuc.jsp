<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script>
function re(){
	window.close();
}
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디&비밀번호찾기 결과창</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
</head>
<body>
<br><br><br><br><br>
<center><b>${what}</b><br><br><br><br><br>

<a onclick="re()">[닫기]</a></center>
</body>
</html>