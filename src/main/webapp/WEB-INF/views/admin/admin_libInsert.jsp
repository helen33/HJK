<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>자료실 등록화면</title>
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
<script>
function libInsert(){
	if(document.adminLibInsert.l_name.value.length <= 1 || document.adminLibInsert.l_name.value == "제목을 입력하세요."){
		alert("제목을 입력하세요!");
		return false;
	}
	if(document.adminLibInsert.l_content.value.length < 1){
		alert("상세정보를 입력하세요!");
		return false;
	}
	else{
		alert("zzz");
		document.adminLibInsert.action = "adminLibInsert";
	 	document.adminLibInsert.submit();
	}
	
}
</script>
</head>
<body>
<form name="adminLibInsert" id="adminLibInsert" enctype="multipart/form-data" method="post">

<img src="${pageContext.request.contextPath}/resources/images/1.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<hr>
<br>
<center>
	<table border="1" width="700px" class="libInsertTable" style="margin-top:15px;">
		<tr>
			<th scope="row">제목</th>
			<td>
				<input type="text" name="l_name" id="l_name" value="" size="50" placeholder="제목을 입력하세요."/>
			</td>
		</tr>
		<tr>
			<th scope="row">첨부파일</th>
			<td>
				<input type="file" name="uploadFile" id="uploadFile"/>
			</td>
		</tr>

		<tr>
			<th scope="row">상세정보</th>
			<td>
				<textarea name="l_content" cols="60" rows="8" ></textarea>
		  </td>
		</tr>
	</table>
	
	<input type="reset" value="취소" />
	<input type="button" value="등록" onclick="libInsert()"/>
		
</center>
</form>
</body>
</html>