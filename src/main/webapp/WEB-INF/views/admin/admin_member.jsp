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
<title>회원관리</title>
<style>
.adminMemberTable {
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 5px;
	width: 890px;
}
.adminMemberTable th {
	padding: 5px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.adminMemberTable td{
	font-size:13px; 
	text-align:center;
	border-left:1px solid #EAEAEA;
}
</style>
<script>
function memDel(mnum){
	alert("회원번호 확1인 => " + mnum);
	
	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		location.href="./adminMemDel?m_num=" + mnum;
	}else{   //취소
	    return;
	}
}
</script>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/images/4.png" width="120px" style="position: relative; left: -390px; top: 0px;">

<form id="adminMember" name="adminMember">
<br>
	<table borer="1" class="adminMemberTable">
		<th width="30px">NO</th>
		<th width="80px">이름</th>
		<th width="100px">아이디</th>
		<th width="120px">생년월일</th>
		<th width="150px">연락처</th>
		<th width="120px">이메일</th>
		<th width="120px">가입일</th>
		<th width="180px">주소</th>
		<th width="50px">탈퇴</th>
	<c:forEach var="result" items="${memberAll}">
		
		<tr>
			<td>${result.M_NUM}</td>
			<td>${result.M_NAME}</td>
			<td>${result.M_ID}</td>
			<td>${result.M_BIRTH}</td>
			<td>${result.M_PHONE}</td>
			<td>${result.M_EMAIL}</td>
			<td>${result.M_REG}</td>
			<td>${result.ZIP_CODE}</td>
			<td>
				<input type="button" value="탈퇴" onclick="memDel('${result.M_NUM}')">
				
			</td>
		</tr>	
	
	</c:forEach>
		
	</table>
</form>
</body>
</html>