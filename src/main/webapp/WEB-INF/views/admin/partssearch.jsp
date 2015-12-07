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
<title>Insert title here</title>
<script>
function choice(pnum,name){
	var pccode = document.search.code.value;
	if(pccode == 140){
		opener.document.adminAucModi.cpu.value=name;
	    window.close();
	}else if(pccode == 150){
		opener.document.adminAucModi.cpucl.value=name;
	    window.close();
	}else if(pccode == 160){
		opener.document.adminAucModi.mainb.value=name;
	    window.close();
	}else if(pccode == 170){
		opener.document.adminAucModi.memory.value=name;
	    window.close();
	}else if(pccode == 180){
		opener.document.adminAucModi.ssd.value=name;
	    window.close();
	}else if(pccode == 190){
		opener.document.adminAucModi.hardD.value=name;
	    window.close();
	}else if(pccode == 200){
		opener.document.adminAucModi.grapc.value=name;
	    window.close();
	}else if(pccode == 210){
		opener.document.adminAucModi.cdD.value=name;
	    window.close();
	}else if(pccode == 220){
		opener.document.adminAucModi.sound.value=name;
	    window.close();
	}else if(pccode == 230){
		opener.document.adminAucModi.lanC.value=name;
	    window.close();
	}else if(pccode == 240){
		opener.document.adminAucModi.casec.value=name;
	    window.close();
	}else if(pccode == 250){
		opener.document.adminAucModi.power.value=name;
	    window.close();
	}else{
		opener.document.adminAucModi.window.value=name;
	    window.close();
	}
}
</script>
<style>
.insertTable{
	
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 8px;
}
.insertTable th {
	padding: 8px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
	font-size:20px; 
}
.insertTable td{
	padding-left:10px;
	font-size:16px; 
	border-left:1px solid #EAEAEA;
	border-bottom:1px solid #EAEAEA;
}
</style>
</head>
<body>
<center>
<form id="search" name="search">
<input type="hidden" id="code" name="code" value="${pccode}">
<table class="insertTable" width="450px">
<tr>
	<th colspan="2"><font size="3"><b>${pcname}</b></font></th>
</tr>
<c:forEach var="result" items="${part}" varStatus="status">
<tr>
	<td width="350px">${result.P_NAME}</td>
	<td width="100px" onclick="choice('${result.P_NUM}','${result.P_NAME}')"><u>선택</u></td>
</tr>
</c:forEach>
</table>
</form>
</center>
</body>
</html>