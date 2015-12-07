<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의하기 비밀확인</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<script>
function check(scret){
var check = document.s.recheck.value;
	if(check == null ){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else {
		if(scret == check){
			var firstWin = window.opener; 
			 firstWin.method = "get"; //그냥넘기면 post방식으로 가니까 get방식 지정
			firstWin.location.href="esmain.do?es_page=/qnaContent?q_num=" + document.s.q_num.value; //q_num get방식으로 보내기
			window.close();//자식창닫기
		}else{
			alert("비밀번호가 맞지 않습니다.");
		}
	}
}
</script>
</head>
<body>
<center>
	게시글 비밀번호를 입력해 주세요.<br><br>
	<form id="s" name="s">
		<input type="hidden" id="q_num" name="q_num" value="${qnaContent.q_num}">
		<input type="text" id="recheck" name="recheck" value=""><br>
		<input type="button" id="s" value="확인" Onclick="check(${qnaContent.q_scretpass})">
	</form>
</center>
</body>
</html>