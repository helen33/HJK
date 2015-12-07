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
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<title>관리자 상품 등록화면</title>
<style>
.insertTable{
	width:900px;
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 8px;
}
.insertTable th {
	padding: 8px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.insertTable td{
	padding-left:10px;
	font-size:13px; 
	border-left:1px solid #EAEAEA;
}
</style>
<script>
function partInsert(){
	if(document.adminPartsInsert.pccode.value.length <= 1 ){
		alert("부품분류를 선택해주세요!");
		return false;
	}
	if(document.adminPartsInsert.cnum.value.length < 1 ){
		alert("제조사를 선택해주세요!");
		return false;
	}
	if(document.adminPartsInsert.p_name.value.length <= 1 || document.adminPartsInsert.p_name.value == "부품명을 입력하세요."){
		alert("부품명을 입력하세요!");
		return false;
	}
	if(document.adminPartsInsert.p_fixed.value.length <= 1 || document.adminPartsInsert.p_fixed.value == "정가를 입력하세요."){
		alert("정가를 입력하세요!");
		return false;
	}
	if(document.adminPartsInsert.p_dis.value.length <= 1 || document.adminPartsInsert.p_dis.value == "할인가를 입력하세요."){
		alert("할인가를 입력하세요!");
		return false;
	}
	if(document.adminPartsInsert.p_amount.value.length <= 1 || document.adminPartsInsert.p_amount.value == "재고수량"){
		alert("재고수량을 입력하세요!");
		return false;
	}
	if(document.adminPartsInsert.uploadFile.value.length < 1){
		alert("이미지를 선택해주세요!");
		return false;
	}else{
		document.adminPartsInsert.pc_code.value = $('#pccode option:selected').val();
		document.adminPartsInsert.c_num.value = $('#cnum option:selected').val();
	 	document.adminPartsInsert.action = "adminPartsInsertProc";
	 	document.adminPartsInsert.submit();
	}
}
</script>
</head>
<body>
<form name="adminPartsInsert" id="adminPartsInsert" enctype="multipart/form-data" method="post">
<input type="hidden" id="pc_code" name="pc_code">
<input type="hidden" id="c_num" name="c_num">
<img src="${pageContext.request.contextPath}/resources/images/7.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<hr>
<center>
	<table border="1" width="700px" class="insertTable" style="margin-top:15px;">
		<tr>
			<th scope="row">부품분류</th>
			<td>
				<select id="pccode">
						<option value="">분류 선택</option>
					<c:forEach var="result" items="${partsCode}">
						<option value="${result.PC_CODE}">${result.PC_NAME}</option>
					</c:forEach>
				</select>
			</td>
			<th>제조사</th>
			<td>
				<select id="cnum">
					<option value="">제조사 선택</option>
				<c:forEach var="result" items="${companyList}">
					<option value="${result.C_NUM}">${result.C_NAME}</option>
				</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">부품명</th>
			<td colspan="3">
				<input type="text" name="p_name" id="p_name" value="" size="50" placeholder="부품명을 입력하세요."/>
			</td>
		</tr>
		<tr>
			<th scope="row">정가</th>
			<td>
				<input type="text" name="p_fixed" id="p_fixed" value="" size="15" placeholder="정가를 입력하세요."/> 원
			</td>
			<th>할인가</th>
			<td>
				<input type="text" name="p_dis" id="p_dis" value="" size="15" placeholder="할인가를 입력하세요."/> 원
			</td>
		</tr>
		<tr>
			<th scope="row">재고수량</th>
			<td colspan="3">
				<input type="text" name="p_amount" id="p_amount" value="" size="7" placeholder="재고수량"/> 개
			</td>
		</tr>
		<tr>
			<th scope="row">이미지</th>
			<td colspan="3">
				<input type="file" name="uploadFile" id="uploadFile"/>
			</td>
		</tr>
		<tr>
			<th scope="row">소켓</th>
			<td>
				<input type="text" name="p_socket" id="p_socket" value="" placeholder="CPU-메인보드 외 생략가능"/>
			</td>
			<th>파워</th>
			<td>
				<input type="text" name="p_power" id="p_power" value="" placeholder="파워-그래픽 외 생략가능"/>
			</td>
		</tr>
		<tr>
			<th scope="row">상세정보</th>
			<td colspan="3">
				<textarea name="p_memo" cols="50" rows="8"></textarea>
		  </td>
		</tr>
	</table>
	
	<input type="button" name="" id="" value="취소" />
	<input type="button" value="등록" onclick="partInsert()"/>
		
</center>
</form>
</body>
</html>