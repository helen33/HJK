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
<title>관리자 상품 수정화면</title>
<style>
.insertTable{
	width: 900px
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
	padding: 8px;
	padding-left:10px;
	font-size:13px; 
	border-left:1px solid #EAEAEA;
}
</style>
<script>
function partsModify(){
	if(document.adminPartsModi.pccode.value.length < 1 ){
		alert("부품분류를 선택해주세요!");
		return false;
	}
	if(document.adminPartsModi.cnum.value.length < 1 ){
		alert("제조사를 선택해주세요!");
		return false;
	}
	if(document.adminPartsModi.p_name.value.length <= 1 || document.adminPartsModi.p_name.value == "부품명을 입력하세요."){
		alert("부품명을 입력하세요!");
		return false;
	}
	if(document.adminPartsModi.p_fixed.value.length <= 1 || document.adminPartsModi.p_fixed.value == "정가를 입력하세요."){
		alert("정가를 입력하세요!");
		return false;
	}
	if(document.adminPartsModi.p_dis.value.length < 1 || document.adminPartsModi.p_dis.value == "할인가를 입력하세요."){
		alert("할인가를 입력하세요!");
		return false;
	}
	if(document.adminPartsModi.p_amount.value.length <= 1 || document.adminPartsModi.p_amount.value == "재고수량"){
		alert("재고수량을 입력하세요!");
		return false;
	}

	document.adminPartsModi.p_num.value;
	document.adminPartsModi.pc_code.value = $('#pccode option:selected').val();
	document.adminPartsModi.c_num.value = $('#cnum option:selected').val();
 	document.adminPartsModi.submit();
}
</script>
</head>
<body>
<form name="adminPartsModi" id="adminPartsModi" enctype="multipart/form-data" method="post" action="adminPartsModi">
<input type="hidden" id="pc_code" name="pc_code">
<input type="hidden" id="c_num" name="c_num">
<input type="hidden" id="p_num" name="p_num" value="${parts.p_num}">
<img src="${pageContext.request.contextPath}/resources/images/8.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<center>
	<table border="1" width="900px" class="insertTable" style="margin-top:15px;">
		<tr>
			<th scope="row">부품분류</th>
			<td>
				<select id="pccode">
					<optgroup label="부품분류">
						<option value="${parts.pc_code}">${parts.pc_name}</option>
					<c:forEach var="result" items="${partsCode}">
						<option value="${result.PC_CODE}">${result.PC_NAME}</option>
					</c:forEach>
					</optgroup>
				</select>
			</td>
			<th>제조사</th>
			<td>
				<select id="cnum">
					<optgroup label="제조사">
						<option value="${parts.c_num}" selected="selected">${parts.c_name}</option>
					<c:forEach var="result" items="${companyList}">
						<option value="${result.C_NUM}">${result.C_NAME}</option>
					</c:forEach>
					</optgroup>
				</select>
			</td>
		</tr>
		<tr>
			<th scope="row">부품명</th>
			<td colspan="3">
				<input type="text" name="p_name" id="p_name" value="${parts.p_name}" size="50" placeholder="부품명을 입력하세요."/>
			</td>
		</tr>
		<tr>
			<th scope="row">정가</th>
			<td>
				<input type="text" name="p_fixed" id="p_fixed" value="${parts.p_fixed}" size="15" placeholder="정가를 입력하세요."/> 원
			</td>
			<th>할인가</th>
			<td>
				<input type="text" name="p_dis" id="p_dis" value="${parts.p_dis}" size="15" placeholder="할인가를 입력하세요."/> 원
			</td>
		</tr>
		<tr>
			<th scope="row">재고수량</th>
			<td colspan="3">
				<input type="text" name="p_amount" id="p_amount" value="${parts.p_amount}" size="7" placeholder="재고수량"/> 개
			</td>
		</tr>
		<tr>
			<th scope="row">이미지</th>
			<td colspan="3">
				<input type="file" id="newFile" name="newFile" /><p>업로드된 파일: ${parts.p_img}</p>
				<input type="hidden" id="orgFile" name="orgFile" value="${parts.p_img}" />
			</td>
		</tr>
		<tr>
			<th scope="row">소켓</th>
			<td>
				<input type="text" name="p_socket" id="p_socket" value="${parts.p_socket}" placeholder="CPU-메인보드 외 생략가능"/>
			</td>
			<th>파워</th>
			<td>
				<input type="text" name="p_power" id="p_power" value="${parts.p_power}" placeholder="파워-그래픽 외 생략가능"/>
			</td>
		</tr>
		<tr>
			<th scope="row">상세정보</th>
			<td colspan="3">
				<textarea name="p_memo" cols="50" rows="8" value="${parts.p_memo}"></textarea>
		  </td>
		</tr>
	</table>
	
	<input type="reset" name="" id="" value="취소" />
	<input type="button" value="수정" onclick="partsModify()"/>
		
</center>
</form>

</body>
</html>