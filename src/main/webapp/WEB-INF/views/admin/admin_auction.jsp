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
.adminAuctionTable {
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 5px;
	width: 890px;
}
.adminAuctionTable th {
	padding: 5px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.adminAuctionTable td{
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
    	$("#adminAuction tr:not(:first)").remove();
        var km = $('#combobox option:selected').val();
        $.ajax({
            type:'post',
            url: 'adminAuctionSearch',
            dataType : "json",
            data : "aucing=" + km ,
            success: function (result) {
    			for(num=0; num<result.aucList.length; num++){
    				$("#adminAuction").append(
    					"<tr>" + 
    						"<td>" + result.aucState + "</td>" +
    						"<td>" + "<a href='adminpage?admin_page=/admincontent?a_num=" + result.aucList[num].A_NUM + "'>" +
    							 result.aucList[num].C_NAME + 
    						"</td>" +
    						"<td>" + result.aucList[num].A_START + "원" + "</td>" +
    						"<td>" + result.aucList[num].A_STARTTIME + " ~ " + result.aucList[num].A_ENDTIME+ "</td>" +
    						"<td>" + "<input type='button' name='update' id='update' value='수정' onclick='update(" + result.aucList[num].A_NUM + ")'>" + "</td>" +
    					"<tr>"
    				)
    			}
            }
    	});
    });
});

function update(anum){
	if (confirm("상품을 수정하시겠습니까?") == true){    //확인
		location.href="adminpage?admin_page=/adminAucUp?a_num=" + anum;
	}else{   //취소
	    return;
	}

}
</script>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/images/6.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<hr>
<br>
경매 종류 선택 : 
	<select id="combobox">
		<option value="1">경매예정</option>
		<option value="2">경매중</option>
		<option value="3">경매 종료</option>
	</select>
	
	<input type="button" id="btn" name="btn" value="검색"/>
	<span onclick="location.href='adminpage?admin_page=/adminAucInsert'" class="insertBtn" style="float:right; margin:5px 5px 5px 1px;">상품등록</span>
	
	<table id="adminAuction" name="adminAuction" class="adminAuctionTable">
		<tr>
			<th scope="col">경매상태</th>
			<th scope="col">상품명</th>
			<th scope="col">시작가</th>
			<th scope="col">경매기간</th>
			<th scope="col">수정</th>
		</tr>
		
	</table>

</body>
</html>