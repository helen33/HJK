<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>문의하기작성</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<script>
function focus(){
	document.Pass.elements[0].focus();
}
function Check() {
	if (document.Pass.qnaPass.value.length < 3) {
		alert("비밀번호를 다시 입력 바랍니다.");
		document.Pass.qnaPass.focus();
		return false;
	}else {
		opener.document.qnawrite.q_scretpass.value= Pass.qnaPass.value;
		window.close();
	}

}
</script>
</head>
<body onload="focus()">
<form id="Pass" name="Pass">
<center>
	<h3>비밀글지정</h3><br>
	패스워드를 입력 해주세요.(3자이상)<br>
	<input type="text" name="qnaPass" id="qnaPass" ><br>
	<input type="button" name="ok" id="ok" value="확인" OnClick="Check()">
</center>
</form>
</body>
</html>