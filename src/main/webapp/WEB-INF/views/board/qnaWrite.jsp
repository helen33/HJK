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
function publi(chk){
	if (chk == 1){
		alert("공개글로 설정되었습니다.");
		return false;
	}
	if( chk == 2 ){
			browsing_window = window
			.open(
					"qnaPass",
					"qnaPass",
					"height=200,width=500, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
			browsing_window.focus();
			return false;
	}
	
}
function check(){
	var radio = $('input:radio[name="radio"]:checked').val();
	var text = document.getElementById('q_content').innerHTML;
	if (document.qnawrite.q_name.value.length < 1) {
		alert("제목을 입력해 주세요.");
		document.qnawrite.q_name.focus();
		return false;
	}
	if (text.value < 1) {
		alert("내용을 입력해 주세요.");
		document.qnawrite.q_content.focus();
		return false;
	}
	if(radio == 2){
			alert("비공개글로 등록되었습니다.");
			document.qnawrite.submit();
	}else{
	alert("공개글로 등록되었습니다.");
	document.qnawrite.submit();
	}
}

</script>
</head>
<body>
<font size="5"><b>문의 하기</b></font>
<hr>
<form id="qnawrite" name="qnawrite" action="write.do" method="post" enctype="multipart/form-data" onSubmit="return check(this)">
	<div>
		  작성자 : &nbsp;<%=session.getAttribute("memberId")%>
	<hr>
		  제  목  :&nbsp; <input type="text" id="q_name" name="q_name" size="100" maxlength="25">
		<input name="radio" type="radio" value="1" OnClick="publi('1')" checked >공개글
		<input name="radio" type="radio" value="2" OnClick="publi('2')">비공개
		<input type="hidden" name="q_scretpass" id="q_scretpass">
	</div><br>
 	<textarea style="width:900px;" name = "q_content" id="q_content" class ="ckeditor" cols = "67" rows = "15" onKeyUp="checkLength(this);"></textarea>
	<label for="file">파일</label>
		<input type="file" id="uploadFile" name="uploadFile"/><span class="date">&nbsp;&nbsp;*&nbsp;임의로 파일명이 변경될 수 있습니다.</span>	
		<input type="submit" value="등록" > 
</form>
</html>
