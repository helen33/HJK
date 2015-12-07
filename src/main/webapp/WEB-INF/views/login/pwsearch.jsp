<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호찾기</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
.idpwsearch {
	-moz-box-shadow:inset 0px 39px 0px -24px #e67a73;
	-webkit-box-shadow:inset 0px 39px 0px -24px #e67a73;
	box-shadow:inset 0px 39px 0px -24px #e67a73;
	background-color:#e4685d;
	-moz-border-radius:4px;
	-webkit-border-radius:4px;
	border-radius:4px;
	border:1px solid #ffffff;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	padding:6px 15px;
	text-decoration:none;
	text-shadow:0px 1px 0px #b23e35;
}
.idpwsearch:hover {
	background-color:#eb675e;
}
.idpwsearch:active {
	position:relative;
	top:1px;
}
</style>

<script type="text/javascript">
function popup_pw(){
	if(document.pwsearchForm.m_id.value.length < 1){
		alert("아이디를 입력해 주세요");
	}
	if(){
		
	}
	document.pwsearchForm.submit();
}
</script>

</head>
<body>
<form name='pwsearchForm' Method='post' Action='pwsearch'>

	<table border="0" style="border:2px solid #D5D5D5; padding:10px 10px 10px 10px;">
		
		<tr>
			<td><img src="${pageContext.request.contextPath}/resources/images/13.png" width="120px"></td>
		</tr>
		<tr>
			<td height="50px">&nbsp;</td>
		</tr>
		<tr>
			<td colspan='2'><font color="red">${no}</font></td>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" id="m_id" name="m_id" maxlength="20" placeholder="아이디를 입력하세요." style="height:25px;"/>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" id="m_name" name="m_name" maxlength="20" placeholder="이름을 입력하세요." style="height:25px;"/>
			</td>
		</tr>
		<tr>
			<td>휴대폰 번호</td>
			<td>
				<input type="text" id="m_phone" name="m_phone" maxlength="20" placeholder="(-)포함하여 입력하세요." style="height:25px;"/>
			</td>
		</tr>
		<tr>
			<td height="50px">&nbsp;</td>
		</tr>
		<tr>
			<td colspan='2' align="center"><input type="submit" value="비밀번호찾기" class="idpwsearch" onclick="popup_pw()"/></td>
		</tr>
	</table>
	
</form>

</body>
</html>