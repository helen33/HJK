<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
	
<title>견적리스트</title>

<style type="text/css">
html, body {
	font-family: "맑은 고딕";
}

.ex1 caption {
	font-weight: 700;
	font-size: 15px;
	color: #8C8C8C;
	text-align: left;
	margin-bottom: 5px
}

table.ex1 {
	width: 98%;
	margin: 0 auto;
	text-align: right;
	border-collapse: collapse;
}

.ex1 th, .ex1 td {
	padding: 5px 10px
}

.ex1 thead th {
	background: #191919;
	color: #C6C6C6;
	text-align: center;
	border-right: 1px solid #fff
}

.ex1 tbody th {
	text-align: left;
	width: 25%
}

.ex1 tbody td.date1 {
	text-align: center;
	width: 50%;
	border-bottom: 1px solid #C6C6C6;
}

.ex1 tbody td.date2 {
	text-align: center;
	width: 25%;
	border-bottom: 1px solid #C6C6C6;
}

.ex1 tbody td.desc {
	text-align: left;
	width: 35%
}

.ex1 tbody tr.odd {
	border-bottom: 1px solid #C6C6C6;
}

.ex1 tbody tr.odd th {
	background: #D9E5FF;
	border-bottom: 1px solid #C6C6C6;
	text-align: center;
}

.ex1 tbody tr:hover {
	background: #D9E5FF;
	cursor: pointer;
}

.ex1 tbody tr:hover th {
	background: #C7D3ED;
	color: #FF6C6C;
	cursor: pointer;
}

.ex1 tfoot tr {
	border-top: 6px solid #E9F7F6;
	color: #1BA6B2
}

.ex1 tfoot th {
	text-align: left;
	padding-left: 10px
}

/* 미리보기 스타일 셋팅 */
#preview{
    z-index: 9999;
    position:absolute;
    border:0px solid #ccc;
    background:#333;
    padding:1px;
    display:none;
    color:#fff;
}
</style>
<script>
// $(document).ready(function() {
	
	function cont(sot){$("input[name=slot]").val(sot);};

    $(document).on("mouseover",".odd",function a(e){ //마우스 오버시
    	 var sot = $("input[name=slot]").val();
    	 img = $("input[name=p_img"+sot+"]").val();
   		 var xOffset = 10;
		 var yOffset = 30;
        $("body").append("<p id='preview'><img src='http://168.126.146.37/20132397/parts/" + img + "' /></p>"); //보여줄 이미지를 선언                       
        $("#preview")
            .css("top",(e.pageY - xOffset) + "px")
            .css("left",(e.pageX + yOffset) + "px")
            .fadeIn("fast"); //미리보기 화면 설정 셋팅
    });                 
    $(document).on("mouseout",".odd",function(){ //마우스 아웃시
        $("#preview").remove();
    });
// });
function gyun_rename(sot,pccode){
	var rename = document.getElementById("p_name" + sot).innerHTML;
	var refixed = document.getElementById("p_fixed" + sot).innerHTML;
	var rep_num = $("input[name=p_num"+sot+"]").val();
	
	var vpower;
	var vsocekt;
	
	$.ajax({
		url : "gyun_vaild", //컨트롤러에서 받을 url 적자
		type : "post",
		data : "rename=" + rename,
		dataType : "json",
		cache : false,
		success : function(vaild){
			vpower = vaild.power;
			vsocket = vaild.socket;
			
			if(pccode == 140 || pccode == 160){
				$("#gyun").find("input[id=socket]").val(vsocket);
			}
			else if(pccode == 200 || pccode == 250){
				$("#gyun").find("input[id=power]").val(vpower);
			}			
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	       }			
	})
	$("#gyun").find("[id=" + pccode + "_p_num]").val(rep_num);
	$("#gyun").find("[id=" + pccode + "_name]").text(rename);
	$("#gyun").find("[id=" + pccode + "_fixed]").text(refixed);
	
	////////////견적 total 금액 //////////////
	cpup = $("#gyun").find("[id=140_fixed]").text();
	coolerp = $("#gyun").find("[id=150_fixed]").text();
	mainboardp = $("#gyun").find("[id=160_fixed]").text();
	memoryp = $("#gyun").find("[id=170_fixed]").text();
	ssdp = $("#gyun").find("[id=180_fixed]").text();
	hardp = $("#gyun").find("[id=190_fixed]").text();
	graphicp = $("#gyun").find("[id=200_fixed]").text();
	cdp = $("#gyun").find("[id=210_fixed]").text();
	soundp = $("#gyun").find("[id=220_fixed]").text();
	lanp = $("#gyun").find("[id=230_fixed]").text();
	casep = $("#gyun").find("[id=240_fixed]").text();
	powerp = $("#gyun").find("[id=250_fixed]").text();
	osp = $("#gyun").find("[id=260_fixed]").text();
	
	
	total = parseInt(cpup);
	total = total + parseInt(coolerp);
	total = total + parseInt(mainboardp);
	total = total + parseInt(memoryp);
	total = total + parseInt(ssdp);
	total = total + parseInt(hardp);
	total = total + parseInt(graphicp);
	total = total + parseInt(cdp);
	total = total + parseInt(soundp);
	total = total + parseInt(lanp);
	total = total + parseInt(casep);
	total = total + parseInt(powerp);
	total = total + parseInt(osp);
	$("#gyun").find("[id=totalp]").text(total);
	$("#gyun").find("[id=total]").val($("#gyun").find("[id=totalp]").text());
	}
</script>
</head>
<body>
	<form id="estiList2" name="estiList2">
		<table class="ex1" id="list2" name="list2" width='450px'>
			<caption>조립 PC견적 내기</caption>
			<thead>
				<tr>
					<input type='hidden' id='slot' name='slot' />
					<th scope="col">품목</th>
					<th scope="col">품명 / 가격</th>
					<th scope="col">선택</th>
				</tr>
			</thead>
			<tfoot>
			<tbody>
				<tr>
					<td colspan="3" align='center' valign='middle'>
						<img src='${pageContext.request.contextPath}/resources/images/gyun_miss.jpg' width='450px' />
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</body>
</html>