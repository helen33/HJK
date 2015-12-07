<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자료실 수정화면</title>
<style>
.libInsertTable{
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 8px;
}
.libInsertTable th {
	padding: 8px;
	width:150px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.libInsertTable td{
	padding-left:10px;
	font-size:13px; 
	border-left:1px solid #EAEAEA;
}
</style>
</head>
<body>
<script>
function libModify(){
	alert("click!!!!!!");
}
</script>
<form name="libModify" id="libModify" action="adminLibModi" enctype="multipart/form-data" >

<img src="${pageContext.request.contextPath}/resources/images/2.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<hr>
<br>
<center>
	<table border="1" width="700px" class="libInsertTable" style="margin-top:15px;">
		<tr>
			<th scope="row">제목</th>
			<td>
				<input type="text" name="l_name" id="l_name" value="${library.l_name}" size="50" placeholder="제목을 입력하세요."/>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td>
				<input type="file" id="newFile" name="newFile" /><p>업로드된 파일: ${library.l_file}</p>
				<input type="hidden" id="orgFile" name="orgFile" value="${library.l_file}" />
			</td>
		</tr>

		<tr>
			<th scope="row">상세정보</th>
			<td>
				<textarea name="l_content" cols="60" rows="8">${library.l_content}</textarea>
		  </td>
		</tr>
	</table>
	
	<input type="reset" value="취소" />
	<input type='button' value='수정' onclick='libModify()'/>
		
</center>
</form>
</body>
</html>