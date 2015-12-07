<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자부품상세페이지</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<style>
.partsContent{
	font-size:13px; 
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	width:900;
	margin-top:10px;
}
.partsContent td {
	padding: 5px;
}

.button-blue {
	margin: 10px;
	padding: 10px 30px 10px 30px;
	text-decoration: none;
	display: inline-block;
	font-fmaily: "맑은 고딕";
	text-align: center;
	border: 1px solid #4374D9; /* Fallback style */
	border: 1px solid rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 .05em rgba(0, 0, 0, 0.4);
	-moz-box-shadow: 0 0 .05em rgba(0, 0, 0, 0.4);
	-webkit-box-shadow: 0 0 .05em rgba(0, 0, 0, 0.4);
	background: #4477a1;
	background: -webkit-gradient(linear, left top, left bottom, from(#81a8cb),
		to(#4477a1));
	background: -moz-linear-gradient(-90deg, #81a8cb, #4477a1);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr='#81a8cb', endColorstr='#4477a1');
	-moz-border-radius: .3em;
	border-radius: .3em;
}

</style>
<script>
$(document).ready(function(){
	var pnum = document.partsContent.p_num.value;
	if(pnum > 390){
		document.getElementById('images').innerHTML = "<img src='${pageContext.request.contextPath}/resources/partsInsert/${partsContent.p_img}' height='400'>";
	}else{
		document.getElementById('images').innerHTML = "<img src='http://168.126.146.37/20132397/parts/${partsContent.p_img}' height='400'>";
	} 
});
function adminPartsModi(pnum){
	location.href="./adminpage?admin_page=/adminPartsModiForm?p_num=" + pnum;
}
</script>
</head>
<body>
<img src="${pageContext.request.contextPath}/resources/images/16.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<hr>
<center>
<form name="partsContent" id="partsContent">
<input type="hidden" id="p_num" name="p_num" value="${partsContent.p_num}"/> 
	<table class="partsContent" width="900px">
		<tr>
			<td width="50%" style="border:1px solid #A6A6A6;"> 
				<span id="images"></span>
				
			</td>
			<td width="50%"> 
				<table width="100%" style="border:2px solid;">
					<tr>
						<td>부품번호</td>
						<td>${partsContent.p_num}</td>
					</tr>
					<tr>
						<td>부품분류</td>
						<td>${partsContent.pc_name}</td>
					</tr>
					<tr>
						<td>부품명</td>
						<td>[${partsContent.c_name}] ${partsContent.p_name}</td>
					</tr>
					<tr>
						<td>제조사</td>
						<td>${partsContent.c_name}</td>
					</tr>
					<tr>
						<td> 정가 </td>
						<td> ${partsContent.p_fixed} 원 </td>
					</tr>
					<tr>
						<td> 할인가 </td>
						<td> ${partsContent.p_dis} 원 </td>
					</tr>
					<tr>
						<td> 배송정보 </td>
						<td> 택배비/2500원 </td>
					</tr>
					<tr>
						<td> 재고량 </td>
						<td> ${partsContent.p_amount}  </td>
					</tr>
				</table>
				<table>
					<tr>
						<td><a href="#" class="button button-blue" onclick="adminPartsModi('${partsContent.p_num}')">수정</a></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>