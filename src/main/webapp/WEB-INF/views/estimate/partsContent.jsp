<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>부품상세페이지</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
	html, body {margin:10px; padding:10px; font-family: "맑은 고딕";}
</style>
<style>
.partsContent{
	font-size:13px; 
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	
}
.partsContent td {
	padding: 5px;
	text-align:center;
}

.button {
	margin: 10px;
	padding: 10px 30px 10px 30px;
	text-decoration: none;
	font: 15px solid;
	/*Change the em value to scale the button*/
	display: inline-block;
	text-align: center;
	font-fmaily: "맑은 고딕"; color : #fff;
	border: 1px solid #4374D9; /* Fallback style */
	border: 1px solid rgba(0, 0, 0, 0.3);
	box-shadow: 0 0 .05em rgba(0, 0, 0, 0.4);
	-moz-box-shadow: 0 0 .05em rgba(0, 0, 0, 0.4);
	-webkit-box-shadow: 0 0 .05em rgba(0, 0, 0, 0.4);
	color: #fff
}

.button, .button span {
	-moz-border-radius: .3em;
	border-radius: .3em;
}

.button span {
	border-top: 1px solid #fff; /* Fallback style */
	border-top: 1px solid rgba(255, 255, 255, 0.5);
	display: block;
	padding: 0.5em 2.5em;
	/* The background pattern */
	background-image: -webkit-gradient(linear, 0 0, 100% 100%, color-stop(.25, rgba(0, 0, 0,
		0.05)), color-stop(.25, transparent), to(transparent)),
		-webkit-gradient(linear, 0 100%, 100% 0, color-stop(.25, rgba(0, 0, 0,
		0.05)), color-stop(.25, transparent), to(transparent)),
		-webkit-gradient(linear, 0 0, 100% 100%, color-stop(.75, transparent),
		color-stop(.75, rgba(0, 0, 0, 0.05))),
		-webkit-gradient(linear, 0 100%, 100% 0, color-stop(.75, transparent),
		color-stop(.75, rgba(0, 0, 0, 0.05)));
	background-image: -moz-linear-gradient(45deg, rgba(0, 0, 0, 0.05) 25%,
		transparent 25%, transparent),
		-moz-linear-gradient(-45deg, rgba(0, 0, 0, 0.05) 25%, transparent 25%,
		transparent),
		-moz-linear-gradient(45deg, transparent 75%, rgba(0, 0, 0, 0.05) 75%),
		-moz-linear-gradient(-45deg, transparent 75%, rgba(0, 0, 0, 0.05) 75%);
	/* Pattern settings */
	-moz-background-size: 3px 3px;
	-webkit-background-size: 3px 3px;
}

.button:hover {
	box-shadow: 0 0 .1em rgba(0, 0, 0, 0.4);
	-moz-box-shadow: 0 0 .1em rgba(0, 0, 0, 0.4);
	-webkit-box-shadow: 0 0 .1em rgba(0, 0, 0, 0.4);
}

.button:active {
	/* When pressed, move it down 1px */
	position: relative;
	top: 1px;
}

.button-blue {
	background: #4477a1;
	background: -webkit-gradient(linear, left top, left bottom, from(#81a8cb),
		to(#4477a1));
	background: -moz-linear-gradient(-90deg, #81a8cb, #4477a1);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr='#81a8cb', endColorstr='#4477a1');
}

.button-blue:hover {
	background: #81a8cb;
	background: -webkit-gradient(linear, left top, left bottom, from(#4477a1),
		to(#81a8cb));
	background: -moz-linear-gradient(-90deg, #4477a1, #81a8cb);
	filter: progid:DXImageTransform.Microsoft.gradient(GradientType=0,
		startColorstr='#4477a1', endColorstr='#81a8cb');
}

.button-blue:active {
	background: #4477a1;
}

.button-red {
	background: #D82741;
	background: -webkit-gradient(linear, left top, left bottom, from(#E84B6E),
		to(#D82741));
	background: -moz-linear-gradient(-90deg, #E84B6E, #D82741);
	filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,
		StartColorStr='#E84B6E', EndColorStr='#D82741');
}

.button-red:hover {
	background: #E84B6E;
	background: -webkit-gradient(linear, left top, left bottom, from(#D82741),
		to(#E84B6E));
	background: -moz-linear-gradient(-90deg, #D82741, #E84B6E);
	filter: progid:DXImageTransform.Microsoft.Gradient(GradientType=0,
		StartColorStr='#D82741', EndColorStr='#E84B6E');
}

.button-red:active {
	background: #D82741;
}
</style>
<script>
function orderCheck(pnum,pfix){
	if (memberId.value == "null") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	} else {
		var repnum = pnum + "," + "/" + pfix;
		location.href="./esmain.do?es_page=/orderList?p_num=" + repnum;
	}
}
function cartCheck(){
	if (memberId.value == "null") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	} else {
		document.partsContent.action = "./cartInsert";
		document.partsContent.submit();
	}
}

</script>
</head>
<body>
<input type="hidden" name="memberId" id="memberId" value="<%=session.getAttribute("memberId")%>">

<form name="partsContent" id="partsContent">
<input type="hidden" id="p_num" name="p_num" value="${partsContent.p_num}"/> 
	<table class="partsContent" width="900px">
		<tr bgcolor="#000000"> 
			<td colspan='2' height="25px"> <font color="#EAEAEA" size="4px">[${partsContent.c_name}] ${partsContent.p_name} </font></td>
		</tr>
		<tr>
			<td width="50%">
				<br>
				<img src="http://168.126.146.37/20132397/parts/${partsContent.p_img}" width="350px" height="450px">
			</td>	
			<td width="50%">
			<br><br><br><br><br><br><br>
			<table width="100%" style="border:2px solid;">
					<tr>
						<td bgcolor="#000000" width="100%"><font color="#EAEAEA" size="4px">상세 내용</font></td>
					</tr>
			</table>
			<br>
				<table width="100%" style="border:2px solid;">
					<tr>
						<td style="font-weight:bold"><font size="3px"> 판매가격 </font></td>
						<td><font size="3px"><fmt:formatNumber value="${partsContent.p_fixed}" type="number"/>원 </font></td>
					</tr>
					<tr>
						<td style="font-weight:bold"><font size="3px">제품번호 </font></td>
						<td><font size="3px">${partsContent.p_num} </font></td>
					</tr>
					<tr>
						<td style="font-weight:bold"><font size="3px"> 배송정보 </font></td>
						<td><font size="3px">택배비/2,500원 </font></td>
					</tr>
					<tr>
						<td style="font-weight:bold"><font size="3px"> 재고량 </font></td>
						<td><font size="3px"> ${partsContent.p_amount}개 </font></td>
					</tr>
				</table>
				<center>
				<br>
				<table>
					<tr>
						<td> 
							<a href="#" class="button button-blue" onclick="orderCheck('${partsContent.p_num}','${partsContent.p_fixed}')">바로구매</a> 
							<a href="#" class="button button-red" onclick="cartCheck()">장바구니</a>
						</td>
					</tr>
				</table>
				</center>
			</td>
		</tr>
		<tr>
			<td colspan='2'> 상세설명 1</td>
		</tr>
	</table>
</form>

</body>
</html>