<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디찾기</title>
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
function popup_id(){
	if(document.idsearchForm.m_name.value.length < 1){
		document.getElementById('name').innerHTML = "<font color='red' size='1'><b>이름을 입력해주세요</b></font>";
		return false;
	}
	else if(document.idsearchForm.m_phone.value.length < 1){
		document.getElementById('name').innerHTML = "";
		document.getElementById('phone').innerHTML = "<font color='red' size='1'><b>휴배폰번호를 입력해주세요</b></font>";
	}else{
		document.idsearchForm.submit(); 
	}
	}
</script>

</head>
<body>
<form name='idsearchForm' Method='post' Action='idsearch'>

	<table border="0" style="border:2px solid #D5D5D5; padding:10px 10px 10px 10px;">
		
		<tr>
			<td><img src="${pageContext.request.contextPath}/resources/images/12.png" width="120px"></td>
		</tr>
		<tr>
			<td height="50px">&nbsp;</td>
		</tr>
		<tr>
			<td colspan='2'><font color="red">${no}</font></td>
		</tr>
		<tr>
			<td></td>
			<td><span id="name"></span></td>
		</tr>
		<tr>
			<td><label for="m_name">이름</label></td>
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
			<td></td>
			<td><span id="phone"></span></td>
		</tr>
		<tr>
			<td height="50px">&nbsp;</td>
		</tr>
		<tr>
			<td colspan='2' align="center">
				<input type="button" value="아이디찾기" class="idpwsearch" onclick="popup_id()"/>
			</td>
		</tr>
	</table>
	
</form>

</body>
</html>