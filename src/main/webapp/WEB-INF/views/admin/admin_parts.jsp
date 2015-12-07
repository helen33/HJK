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
<title>상품관리</title>
<style type="text/css">
.adminPartsTable {
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 5px;
	width: 890px;
}
.adminPartsTable th {
	padding: 5px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.adminPartsTable td{
	font-size:13px; 
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.insertBtn {
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	border-top-left-radius:20px;
	border-top-right-radius:20px;
	border-bottom-right-radius:20px;
	border-bottom-left-radius:20px;
	border:1px solid #dcdcdc;
	color:#666166;
	font-size:12px;
	font-weight:bold;

	height:28px;
	line-height:28px;
	width:82px;
	text-decoration:none;
	text-align:center;
}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<script>
var num = 0;
$(document).ready(function(){
    $('#btn').click(function(){
    	$("#adminParts tr:not(:first)").remove();
        var hyesu = $('#combobox option:selected').val();
        $.ajax({
            type:'post',
            url: 'adminPartsSearch',
            dataType : "json",
            data : "pc_code=" + hyesu ,
            success: function (result) {
    			for(num=0; num<result.partsList.length; num++){
    				$("#adminParts").append(
    					"<tr>" + 
    						"<td>" + "<a href='adminpage?admin_page=/adminPartsContent?p_num=" + result.partsList[num].P_NUM + "'>" +
    							"[" + result.partsList[num].C_NAME + "]" + result.partsList[num].P_NAME + 
    						"</td>" +
    						"<td>" + result.partsList[num].P_FIXED + "원" + "</td>" +
    						"<td>" + result.partsList[num].P_DIS + "원" + "</td>" +
    						"<td>" + result.partsList[num].P_AMOUNT + "개" + "</td>" +
    						"<td>" + "<input type='button' name='del' id='del' value='삭제' onclick='del(" + result.partsList[num].P_NUM + ")'>" + "</td>" +
    					"<tr>"	
    				)
    			}
            }
    	});
    });
});

function del(pnum){

	if (confirm("정말 삭제하시겠습니까?") == true){    //확인
		location.href="./adminPartsDel?p_num=" + pnum;
	}else{   //취소
	    return;
	}
}
</script>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/images/5.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<hr>
<br>
부품 분류 선택 : 
	<select id="combobox">
		<option value="">전체</option>
	<c:forEach var="result" items="${partsCode}">
		<option value="${result.PC_CODE}">${result.PC_NAME}</option>
	</c:forEach>
		
	</select>
	
	<input type="button" id="btn" name="btn" value="검색"/>
	<span onclick="location.href='adminpage?admin_page=/adminPartsInsert'" class="insertBtn" style="float:right; margin:5px 5px 5px 1px;">상품등록</span>
	
	<table id="adminParts" name="adminParts" class="adminPartsTable">
		<tr>
			<th scope="col">부품명</th>
			<th scope="col">정가</th>
			<th scope="col">할인가</th>
			<th scope="col">재고수량</th>
			<th scope="col">삭제</th>
		</tr>
		
	</table>

</body>
</html>