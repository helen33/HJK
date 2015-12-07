<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="import" href="index.jsp">
<link rel="import" href="main.jsp">
<style type="text/css">
.login-popup{
	display:none;
	background: #333;
	padding: 10px; 	
	border: 2px solid #ddd;
	float: left;
	font-size: 1.2em;
	position: fixed;
	top: 37%; left: 40.5%;
	z-index: 99999;
	box-shadow: 0px 0px 20px #999;
	-moz-box-shadow: 0px 0px 20px #999; /* Firefox */
    -webkit-box-shadow: 0px 0px 20px #999; /* Safari, Chrome */
	border-radius:3px 3px 3px 3px;
    -moz-border-radius: 3px; /* Firefox */
    -webkit-border-radius: 3px; /* Safari, Chrome */
}

img.btn_close {
	float: right; 
	margin: -28px -28px 0 0;
}

fieldset { 
	border:none; 
}

form.signin .textbox label { 
	display:block; 
	padding-bottom:7px; 
}

form.signin .textbox span { 
	display:block;
}

form.signin p, form.signin span { 
	color:#999; 
	font-size:11px; 
	line-height:18px;
} 

form.signin .textbox input { 
	background:#666666; 
	border-bottom:1px solid #333;
	border-left:1px solid #000;
	border-right:1px solid #333;
	border-top:1px solid #000;
	color:#fff; 
	border-radius: 3px 3px 3px 3px;
	-moz-border-radius: 3px;
    -webkit-border-radius: 3px;
	font:13px Arial, Helvetica, sans-serif;
	padding:6px 6px 4px;
	width:200px;
}
</style>
<style>
.loginCss{
	margin-top:10px;
	font-size:13px;
}
#out{
	position:absolute;
	height:1000px;
	width:100%;
	z-index:10000;
 }
#login-box{
height:350;
}

</style>
<script type="text/javascript">
state_gyun = 0;
function gyun() {
	if (state_gyun == 0) {
		state_gyun = 1;
		document.getElementById('image_gyun').src = "./resources/images/header_gyun_check.png";
	} else {
		state_gyun = 0;
		document.getElementById('image_gyun').src = "./resources/images/header_gyun_ncheck.png";
	}
}
state_gyung = 0;
function gyung() {
	if (state_gyung == 0) {
		state_gyung = 1;
		document.getElementById('image_gyung').src = "./resources/images/header_gyung_check.png";
	} else {
		state_gyung = 0;
		document.getElementById('image_gyung').src = "./resources/images/header_gyung_ncheck.png";
	}
}

$(document).ready(function(){
	var memberId = member.value;
	var managerId = manager.value;
	if(memberId == "null" && managerId == "null"){
		document.getElementById('login').innerHTML = "<span class='loginCss' onclick=\"lightbox()\">로그인</span>";
		document.getElementById('loginout').innerHTML = "<span class='loginCss' onclick=\"location.href='./meminsert.do'\">회원가입</span>";
	}
	else{
		if(memberId == "undefined" || memberId == null){
			document.getElementById('login').innerHTML = "<span class='loginCss' onclick=\"lightbox()\">로그인</span>";
			document.getElementById('loginout').innerHTML = "<span class='loginCss' onclick=\"location.href='./meminsert.do'\">회원가입</span>";
		
		}else {
			if(managerId == "null"){
				document.getElementById('login').innerHTML = "<span class='loginCss'>" + memberId +"님 </span>";
			} else {
				document.getElementById('login').innerHTML = "<span class='loginCss' onclick=\"location.href='./adminpage'\">" + managerId +"님 </span>";
			}
			document.getElementById('loginout').innerHTML = "<span class='loginCss' onclick=\"location.href='./logout'\">로그아웃</span>";
		}
	}
});
function cartChk(){
	var memberId = member.value;
	if (memberId == "null") {
		alert("로그인 후 이용 가능합니다.");
		return false;
	} else {
		location.href="./esmain.do?es_page=/cartList2";
	}
}
function start(){
	$('#out').hide();
	$('#in').hide();
}
function lightbox(){
	$('#out').show();
	$('#login-box').show();
}
function loginajax(){
	var m_id = document.checklogin.username.value;
	var m_pass = document.checklogin.password.value;
	$.ajax({
		url : "idlogin", //컨트롤러에서 받을 url 적자
		type : "post",
		data: "m_id="+ m_id +"&&m_pass=" + m_pass , //전송할 data
		dataType : "json", //반환받을 데이터 타입
		cache : false, //해킹우려 캐쉬 삭제
		success: function(result){ //성공시 실행되는 펑션
			if(result.one == 1){
				alert(result.two);
				return false;
			}else{
			alert(result.two);
			$('#out').hide();
			$('#in').hide();
			location.reload();
			}
		},
		error:function(request,status,error){
		       alert("code:");
		}
	});
}
function idfind(){
	$('#out').hide();
	$('#in').hide();
	browsing_window = window
	.open(
			'idsearchFrom?',
			'window',
			"height=320, width=320, toolbar=auto, menubar=no, location=no");
	browsing_window.focus();
}
function passfind(){
	$('#out').hide();
	$('#in').hide();
	browsing_window = window
	.open(
			'pwsearchFrom',
			'window',
			"height=320, width=320, toolbar=auto, menubar=no, location=no");
	browsing_window.focus();

}
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
</head>
<body onload="start()">
<div id="out">
<br>
<div id="login-box" class="login-popup">
        <a onclick="start()"><img src="${pageContext.request.contextPath}/resources/images/close_pop.png" class="btn_close" title="Close Window" alt="Close" /></a>
          <form method="post" class="signin" action="#" id="checklogin" name="checklogin">
                <fieldset class="textbox">
            	<label class="username">
                <span>UserID</span>
                <input id="username" name="username" value="" type="text" autocomplete="on" placeholder="Username">
                </label>
                
                <label class="password">
                <span>Password</span>
                <input id="password" name="password" value="" type="password" placeholder="Password">
                </label>
                
                <button class="submit button" type="button" onclick="loginajax()">Sign in</button>
                
                <p>
                <a onclick="idfind()">Forgot your id?</a><br>
                <a onclick="passfind()">Forgot your password?</a>
                </p>
                
                </fieldset>
          </form>
		</div>
</div>
	<div style="width:900px;">
		<span style="margin-left:200px;">
			<a onClick="gyun()" href="index.do?main_page=./estimate/esmain.jsp" style="border:0px">
			<img src="./resources/images/header_gyun_check.png" width="128px"
				height="29"  style="margin: 0px" id="image_gyun">
			</a> 
		
			<a onClick="gyung()" href="index.do?main_page=./auction/aumain.jsp" style="border:0px">
			<img src="./resources/images/header_gyung_check.png" width="128px"
				height="29"  style="margin: 0px" id="image_gyung">
			</a>
		</span>
		
		<span class="loginCss" style="float:right;"> 
			<span id="login"></span>
			<span id="loginout"></span>
			<span class="loginCss" onclick="cartChk()">장바구니</span>
		</span>
	</div>

	<center>
		<div id="line" style="width: 900px; height: 1px; background-color: #999; margin: 0px"></div>
	</center>
	<input type="hidden" id="member" name="member" value="<%=session.getAttribute("memberId")%>">
	<input type="hidden" id="manager" name="manager" value="<%=session.getAttribute("managerId")%>">
</body>
</html>