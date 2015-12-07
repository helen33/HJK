<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.gyun.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<title>견적리스트</title>

<style type="text/css">
.ex1 caption {font-weight:700; font-size:15px; color:#8C8C8C; text-align:left; margin-bottom:5px}
table.ex1 {width:98%; margin:0 auto; text-align:right; border-collapse:collapse;}
	.ex1 th, .ex1 td {padding:5px 10px}
	.ex1 thead th {background:#191919; color:#C6C6C6; text-align:center; border-right:1px solid #fff;}
	.ex1 tbody th {text-align:left; width:25%; valign:middle; align:center;}
	.ex1 tbody td.date1 {text-align:center; width:50%; border-bottom:1px solid #C6C6C6; valign:middle; align:center;}
	.ex1 tbody td.date2 {text-align:center; width:25%; border-bottom:1px solid #C6C6C6; valign:middle; align:center;}
	.ex1 tbody td.desc {text-align:left; width:35%; valign:middle; align:center;}
	.ex1 tbody tr.od {border-bottom:1px solid #C6C6C6;}
	.ex1 tbody tr.od th {background:#D9E5FF; border-bottom:1px solid #C6C6C6; text-align:center;}
	.ex1 tbody tr:hover {background:#D9E5FF;}
	.ex1 tbody tr:hover th {background:#C7D3ED; color:#FF6C6C; cursor: pointer;}
	.ex1 tfoot tr {border-top:6px solid #E9F7F6; color:#1BA6B2}
	.ex1 tfoot th {text-align:left; padding-left:10px}
	
	.totalt {
		font-size: 12px;
		color: #F00;
		font-weight: bold;
	}
	
	.totalp {
		font-size: 12px;
		font-weight: bold;
	}
	
	/* 버튼  */
.gyun_buy {
	-moz-box-shadow:inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f29c93;
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100) );
	background:-moz-linear-gradient( center top, #fe1a00 5%, #ce0100 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100');
	background-color:#fe1a00;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #d83526;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #b23e35;
}
.gyun_buy:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00) );
	background:-moz-linear-gradient( center top, #ce0100 5%, #fe1a00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00');
	background-color:#ce0100;
}.gyun_buy:active {
	position:relative;
	top:1px;
}

.gyun_cart {
	-moz-box-shadow:inset 0px 1px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 1px 0px 0px #ffffff;
	box-shadow:inset 0px 1px 0px 0px #ffffff;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ededed), color-stop(1, #dfdfdf) );
	background:-moz-linear-gradient( center top, #ededed 5%, #dfdfdf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#dfdfdf');
	background-color:#ededed;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #dcdcdc;
	display:inline-block;
	color:#777777;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:40px;
	line-height:40px;
	width:100px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #ffffff;
}
.gyun_cart:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #dfdfdf), color-stop(1, #ededed) );
	background:-moz-linear-gradient( center top, #dfdfdf 5%, #ededed 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#dfdfdf', endColorstr='#ededed');
	background-color:#dfdfdf;
}.gyun_cart:active {
	position:relative;
	top:1px;
}
</style>
</head>
<script type="text/javascript">
var psum = '';
function gyun_order(){
	if (document.estiList.memberId.value == "null") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	} else {
		var hhhh = document.getElementsByName("pnum");
		for(var i=0;i<hhhh.length;i++){
			if(hhhh[i].value != 0){
				psum += hhhh[i].value + ",";
			}
		}
		var total = document.estiList.total.value;
		var repnum = psum + "," + "/" + total;
		location.href="./esmain.do?es_page=/orderList?p_num=" + repnum;
	}	
}

function gyun_cart(){

	if (document.estiList.memberId.value == "null") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	} else {
		var inputString = prompt('장바구니 이름 : ', '');
		var hhhh = document.getElementsByName("pnum");
		for(var i=0;i<hhhh.length;i++){
			if(hhhh[i].value != 0){
				psum += hhhh[i].value + ",";
			}
		}
		var repnum = inputString + "/" + psum;
		location.href="./cartgyunInsert?p_num=" + repnum;
		//document.estiList.action = "./cartgyunInsert?p_num=" + repnum;
	}	
}
</script>
<body>
	<form id="estiList" name="estiList">
	<input type="hidden" name="memberId" id="memberId" value="<%=session.getAttribute("memberId")%>">
		<table class="ex1" id="gyun" height='650px'>
		<caption>조립 PC견적 내기</caption>
			<thead>
				<tr style='width:auto'>
					<th scope="col">품목</th>
					<th scope="col">선택한 상품</th>
					<th scope="col">가격</th>
				</tr>
			</thead>
			<tfoot>
			<tbody>
				<tr height='0px'>
					<td>
						<input type="hidden" id="socket" name="socket" value='' />
						<input type="hidden" id="power" name="power" value='' />
					</td>
				</tr>
				<c:forEach var="result" items="${code}" varStatus="status">
				<tr class="od"  onclick="ch('${result.PC_CODE}')">
					<th scope="row" id="${result.PC_CODE}" style='vertical-align:middle; margin:auto; font-weight: bold;'><a href="#" onclick="ch('${result.PC_CODE}')"><font size="-1">${result.PC_NAME}</font></a></th>
					<td class="date1" style='vertical-align:middle; margin:auto;'>
						<font size="-1"><span id="${result.PC_CODE}_name" name="${result.PC_CODE}_name">
							<-항목을 클릭하세요.
						</span></font>
					</td>
					<td class="date2" style='vertical-align:middle; margin:auto;'>
						<font size="-1">
							<span id="${result.PC_CODE}_fixed" name="${result.PC_CODE}_fixed"> 0 </span>원
						</font>
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td>
					</td>
					<td>
						<!-- id = jqurey에서 값을 받을때 name = p_num이라는 배열로 컨트롤러로 넘겨 갈 때 -->
						<input type='hidden' id='140_p_num' name='pnum' value='0'/>
						<input type='hidden' id='150_p_num' name='pnum' value='0'/>
						<input type='hidden' id='160_p_num' name='pnum' value='0'/>
						<input type='hidden' id='170_p_num' name='pnum' value='0'/>
						<input type='hidden' id='180_p_num' name='pnum' value='0'/>
						<input type='hidden' id='190_p_num' name='pnum' value='0'/>
						<input type='hidden' id='200_p_num' name='pnum' value='0'/>
						<input type='hidden' id='210_p_num' name='pnum' value='0'/>
						<input type='hidden' id='220_p_num' name='pnum' value='0'/>
						<input type='hidden' id='230_p_num' name='pnum' value='0'/>
						<input type='hidden' id='240_p_num' name='pnum' value='0'/>
						<input type='hidden' id='250_p_num' name='pnum' value='0'/>
						<input type='hidden' id='260_p_num' name='pnum' value='0'/>
						
						<p class="totalt">조립 견적 총 금액 : </p>
					</td>
					<td>
						<span id="totalp" name="totalp">0</Span>원
						<input type="hidden" id='total' name='total' value='' />
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td>
<!-- 						<input type="button" onClick="gyun_cart()" value="장바구니"> -->
						<a herf="#" class='gyun_cart' onClick="gyun_cart()">장바구니</a>
					</td>
					<td>
<!-- 						<input type="button"  class='gyun_buy' onClick="gyun_order()" value="바로구매"> -->
						<a herf="#" class='gyun_buy' onClick="gyun_order()">바로구매</a>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>