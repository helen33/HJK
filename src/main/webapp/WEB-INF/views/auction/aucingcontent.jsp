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
<title>경매중상세</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
.aucingContable{
	font-size:13px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
	width:900px;
}
.aucingContable td{
	text-align:center;
}
.aucingtable{
	font-size:13px;
	border:1px solid #A6A6A6;
	border-collapse: collapse;
	width:900px;
}
.aucingtable td{
	text-align:center;
	padding:5px;
}
</style>

<style type="text/css">
    /* Popup Layer */
    .layer {display:none; position: absolute; top:0; left:0; z-index:90000;}
    .layer .bg {position: relative; top:0; left:0; width:100%; height:100%; background:#000; opacity:.5; filter:alpha(opacity=50);}
    .layer_area {position: absolute; left:50%; top:50%; background:#fff; padding:20px; border:4px solid #ddd;}
</style>
<!-- ligthBox 스크립트 -->
<script type="text/javascript">   
    $(document).ready(function() { 
        var winwidth = $(window).width();
        var winheight = $(document).height();
        $(".layer").css("width", winwidth);
        $(".layer").css("height", winheight);
         
        $(window).bind("resize", function() { 
            winwidth = $(window).width();
            winheight = $(document).height();
 
            $(".layer").css("width", winwidth);
            $(".layer").css("height", winheight);
        }); 
    });  
    function layer_open(el,id) {
        document.aucing.pass.value = "";
    	if(id == "null"){
    		alert("로그인 후 이용가능합니다.");
    		return false;
    	}else{
        $('.layer').fadeIn();
 
        var temp = $('#' + el);
        var docuHeight = $(document).height();
         
        if (temp.outerHeight() < docuHeight )   {
            temp.css('top', ($(window).height() / 2) - (temp.outerHeight() / 2));
        } else  {
            temp.css('top', '20px');
        }
 
        if (temp.outerWidth() < $(document).width() )   {
            temp.css('margin-left', '-' + temp.outerWidth() / 2 + 'px');
        } else  {
            temp.css('left', '0px');
        }
         
        temp.show();
    	}
    }
    function layer_close(el)    {
        $("#" + el).hide();
         
        $('.layer').fadeOut();
    }
</script>
<script type="text/javascript">
$(document).ready(function(){
	$('#second_form').hide();
	return false;
});
function pcimg(img) {
	browsing_window = window
	.open(
			'aucingimg?img=' + img,
			'window',
			"height=700, width=500, toolbar=auto, menubar=no, location=no");
	browsing_window.focus();
}
function ingnow(anum,anow,mId){
	if(mId == "null"){
		alert("로그인 후 사용가능합니다.");
		return false;
	}else{
	location.href = "aumain.do?au_page=/orderList?p_num=" + document.aucing.psum.value + "/" + anow;
	}
}
function next(){
	if(aucing.pass.value.length <= 0){
   		alert("비밀번호를 입력해 주세요.");
   		return false;
   	}
   	var pass = document.aucing.pass.value;
   	$.ajax({
		url : "idpass", //컨트롤러에서 받을 url 적자
		type : "post",
		data: "pass="+pass , //전송할 data
		dataType : "json", //반환받을 데이터 타입
		cache : false, //해킹우려 캐쉬 삭제
		success: function(result){
			if(result.one == 1){
				$("#" + "step01").hide();
		         
		        $('.layer').fadeOut();
		        
				$('#second_form').slideDown(); 
				
				return false;
			}else{
				alert(result.two);
				return false;
			}
		},
		error:function(request,status,error){
		       alert("code:");
		}
	});
}
function biding(now,a_num){
	now = Number(now);
	if(now < document.aucing.biding.value){
		var bestbid = document.aucing.biding.value;
		$.ajax({
			url : "bidbestUpdate", //컨트롤러에서 받을 url 적자
			type : "post",
			data: "bestbid="+ bestbid +"&&a_num=" + a_num , //전송할 data
			dataType : "json", //반환받을 데이터 타입
			cache : false, //해킹우려 캐쉬 삭제
			success: function(result){
				$('#second_form').slideUp();
				location.reload();
			},
			error:function(request,status,error){
			       alert("code:");
			}
		});
		
	}else{
		alert("현재가 보다 높은 금액을 입찰하셔야 합니다.");
	}
}

</script>
</head>
<body>
<form id="aucing" name="aucing">
<input type="hidden" id="pnum" name="pnum">
<center>
<table>
  <tr>
    <td rowspan="6">
    	<img src="http://sangque.iptime.org:7070/hjk_img/auctionimages/${auction.a_img}" width="450px" height="300px" > 
    </td>
    <td>
    	<c:import url="/autimer"></c:import>
    </td>
  </tr>
  <tr>
    <td>
    	<font size="7"><b>${auction.c_name}</b></font>
    </td>
  </tr>
  <tr>
    <td>
    	<font size="4"> ${auction.a_starttime} ~ ${auction.a_endtime}</font>
    </td>
  </tr>
  <tr>
    <td>
    	<img src="${pageContext.request.contextPath}/resources/images/detail_startp.png" width="50px" height="20px" >
    	<font size="3"><fmt:formatNumber value='${auction.a_start}' type='number'/>원</font>
    	<img src="${pageContext.request.contextPath}/resources/images/detail_ingp.png" width="65px" height="25px" > 
    	<font size="6" color="#0054FF"> <b><fmt:formatNumber value='${bidder.B_PRICE}' type='number'/>원</b></font>
    </td>
  </tr>
  <tr>
    <td>
    	<img src="${pageContext.request.contextPath}/resources/images/detail_now.png" width="75px" height="25px" >
    	<font size="5"><fmt:formatNumber value='${auction.a_now}' type='number'/>원</font>
    </td>
  </tr>
  <tr>
    <td>
    	<img src="${pageContext.request.contextPath}/resources/images/auc_now.png" onclick="ingnow('${auction.a_num}','${auction.a_now}','<%=session.getAttribute("memberId")%>')">
    	<img src="${pageContext.request.contextPath}/resources/images/auc_bid.png" onclick="layer_open('step01','<%=session.getAttribute("memberId")%>')"> 
    </td>
  </tr>
</table>
    <!-- 입찰하기 버튼을 눌렀을때 나오는 테이블(로그인확인) -->
    <div class="layer"style="width: 1263px; height: 1084px;">
        <div class="bg"></div>
         
        <div class="layer_area" id="step01" style="display: none;">
            <table width="300">
			  <tr>
			    <td colspan="2" width="300px"><h5>개인정보 보안을 위해 비밀번호를 한번더 <br>입력 해주세요.</h5></td>
			  </tr>
			  <tr>
			    <td bgcolor="#EAEAEA"  width="100px"><h5>ID</h5></td>
			    <td  width="200px"><h5><%=session.getAttribute("memberId")%></h5></td>
			  </tr>
			  <tr>
			    <td bgcolor="#EAEAEA"><h5>PASS</h5></td>
			    <td><input type="text" id="pass" name="pass"></td>
			  </tr>
			  <tr>
			    <td colspan="2" width="300px"><a onclick="next()">[확인]</a> <a onclick="layer_close('step01')" href="#none">[취소]</a></td>
			  </tr>
			</table>
        </div> 
         
    </div> 

<!-- 입찰하기 버튼을 눌렀을때 로그인 확인 후 나오는 테이블 -->
<div id="second_form">
	<br>
	<table bgcolor="#EAEAEA" class="aucingContable">
		<tr>
			<td colspan="2">
			<font size="4" color="red"><b>※현재가 이상의 금액을 입력하셔야 입찰가능합니다 </b></font>
			<font size="3"><b>현재가 : <fmt:formatNumber value='${bidder.B_PRICE}' type='number'/>원</b></font>
			</td>
		</tr>
		<tr><td colspan="2"><br></td></tr>
		<tr>
			<td width="300px"><font size="3"><b>ID : <%=session.getAttribute("memberId")%></b></font>
			</td>
			<td width="600px">
				<input type="text" id="biding" name="biding" size=60>
				<a onclick="biding('${bidder.B_PRICE}','${auction.a_num}')">입찰등록</a>
			</td>
		</tr>
		<tr><td colspan="2"><br></td></tr>
	</table>
	<br>
</div>
			
			<table class="aucingContable">
		<tr bgcolor="#EAEAEA">
			<td width="300"><b>입찰자</b></td>
			<td width="300"><b>입찰 일자</b></td>
			<td width="300"><b>입찰 가격</b></td>
		</tr>
		<c:forEach var="result" items="${bids}" varStatus="status">
		<c:if test="${bidder.B_PRICE == result.B_PRICE}">
		<tr bgcolor="#FFD8D8">
			<td>${result.M_NAME}</td>
			<td>${result.B_DATE}</td>
			<td><fmt:formatNumber value='${result.B_PRICE}' type='number'/>원</td>
		</tr>
		</c:if>
		<c:if test="${bidder.B_PRICE != result.B_PRICE}">
		<tr>
			<td>${result.M_NAME}</td>
			<td>${result.B_DATE}</td>
			<td><fmt:formatNumber value='${result.B_PRICE}' type='number'/>원</td>
		</tr>
		</c:if>
		</c:forEach>
	</table>
	<br>
<table class="aucingtable">
		<tr bgcolor="#000000">
			<td colspan="3" width="900px">
			<font color="#F6F6F6"><b>제품 사양</b></font>
			</td>
		</tr>
		<c:forEach var="result" items="${listP}" varStatus="status">
		<tr onclick="pcimg('${result.p_img}')">
				<td bgcolor="#EAEAEA">
					<b>${result.pc_name}</b>
				</td>
				<td>
					${result.p_name}
				</td>
		</tr>			
		</c:forEach>
</table>
<input type="hidden" id="psum" name="psum" value="${pnumsnum}">
<hr>
</center>
</form>
</body>
</html>