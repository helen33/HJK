<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<HTML>
<HEAD>
<TITLE>회원 정보</TITLE>
<style>
.updateTable td{
	padding : 10px;
}
</style>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<SCRIPT>

function ZipCode() {
	browsing_window = window
	.open(
			"checkpost",
			"_zipinput",
			"height=300,width=600, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
browsing_window.focus();
}
	
	
function next(){
	if(myupdate.m_pass.value.length <= 0){
   		alert("비밀번호를 입력해 주세요.");
   		return false;
   	}
	if (myupdate.m_pass.value != myupdate.m_pass2.value) {
   		alert("비밀번호와 비밀번호 확인이 맞지 않습니다.");
   		myupdate.pass.focus();
   		return false;
   	}
   	myupdate.m_birth.value=$('#birthy').val() + '-' + $('#birthm').val() + '-' + $('#birthd').val();
   	var formData = $("#myupdate").serialize();
   	$.ajax({
		url : "myupdate", //컨트롤러에서 받을 url 적자
		type : "post",
		data: formData , //전송할 data
		dataType : "json", //반환받을 데이터 타입
		cache : false, //해킹우려 캐쉬 삭제
		success: function(result){ //성공시 실행되는 펑션
			$("#second").find("[id=id]").text(result.mem.m_id);
			$("#second").find("[id=name]").text(result.mem.m_name);
			$("#second").find("[id=email]").text(result.mem.m_email);
			$("#second").find("[id=phone]").text(result.mem.m_phone);
			$("#second").find("[id=birth]").text(result.mem.m_birth);
			$("#second").find("[id=zip]").text(result.mem.zipcode);
			$("#second").find("[id=addr]").text(result.mem.m_addr);
		             $('#first_form').slideUp();
		             $('#second_form').slideDown();  
				return false;
		},
		error:function(request,status,error){
		       alert("code:");
		}
	});
}
$(document).ready(function(){
	var bir = document.myupdate.bir.value;
	var year = bir.substring(0,4);
	var month = bir.substring(5,7);
	var day = bir.substring(8,10);
	document.myupdate.birthy.value = year;
	document.myupdate.birthm.value = parseInt(month);
	document.myupdate.birthd.value = day;
	$('#second_form').hide();
	return false;
});

</SCRIPT>

</HEAD>
<BODY>
	<center>
		<font size='3'><b> 회원정보 </b></font>
		<hr size='1' noshade width='600' align="center">
		<div id = "first_form">
		<form name="myupdate" id="myupdate" action="" method="post">
			<input type="hidden" id="m_birth" name="m_birth" value="m_birth" />
			<TABLE border='2' width='600' cellSpacing=0 cellPadding=5 align=center class="updateTable">
				<TR>
					<TD align='center'>
						<font size='2'>아 이 디</font>
					</TD>
					<TD>
						<input id="m_id" name="m_id" maxLength='20' size='10' value="${member.m_id}" readonly="false" />
						<span class="fieldError">
						<form:errors path="m_id" /></span>
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>비 밀 번 호</font>
					</TD>
					<TD>
						<input type="password" id="m_pass" name="m_pass" maxlength="20" size='10' showPassword="true" value="" />
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>비밀번호확인</font></TD>
					<TD>
						<input type="password" id="m_pass2" name="m_pass2" path="m_pass2" maxlength="20" size='10' value="" showPassword="true" />
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>이 름</font>
					</TD>
					<TD>
						<input id="m_name" name="m_name" maxlength="20" size='10' value="${member.m_name}"/>
						<span class="fieldError">
						<form:errors path="m_name" /></span>
					</TD>
				</TR>
								<TR>
					<TD align='center'>
						<font size='2'>E - M a i l</font>
					</TD>
					<TD>
						<input type='text' maxlength='50' size='50' id="m_email" name="m_email" value="${member.m_email}" />
						<span class="fieldError">
						<form:errors path="m_email" /></span>
					</TD>
				</TR>
								<TR>
					<TD align='center'>
						<font size='2'>핸 드 폰</font>
					</TD>
					<TD>
						<input type='text' maxlength='20' size='20' id="m_phone" name="m_phone" value="${member.m_phone}"/>
						<span class="fieldError">
						<form:errors path="m_phone" /></span>
					</TD>
				</TR>
				<TR>
					<TD width='100' align='center'>
						<font size='2'>생 일</font>
					</TD>
					<TD>
						<input type="hidden" id="bir" name="bir" value="${member.m_birth}">
						<input type="text" name="birthy" id="birthy" value="" maxlength="4" class="birth" placeholder="YYYY"/>
                    	<select id="birthm" name="birthm" >
	                        <option value="0">월</option>
	                        <option value="1">01</option>
	                        <option value="2">02</option>
	                        <option value="3">03</option>
	                        <option value="4">04</option>
	                        <option value="5">05</option>
	                        <option value="6">06</option>
	                        <option value="7">07</option>
	                        <option value="8">08</option>
	                        <option value="9">09</option>
	                        <option value="10">10</option>
	                        <option value="11">11</option>
	                        <option value="12">12</option>
	                    </select>
	                    <input type="text" name="birthd" id="birthd" value="" class="birth" placeholder="DD"/>
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>우 편 번 호</font>
						<span class="fieldError">
					</TD>
					<TD>
						<input name="zip_code" id="zip_code" maxlength='7' size='7' value="${member.zip_code}" />
						<input OnClick='ZipCode()' type='button' value='우편번호검색'>
						<span class="fieldError">
						<form:errors path="zip" /></span>
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>주 소</font>
					</TD>
					<TD>
						<input maxlength='50' size='50' id="m_addr" name="m_addr" value="${member.m_addr}" />
						<span class="fieldError">
						<form:errors path="m_addr" /></span><BR>
					</TD>
				</TR>
			</TABLE>
			<hr size='1' noshade width='600' align="center">

			<TABLE>
				<TR>
					<TD colspan='2' align='center'>
						<input type='button' value='수정' OnClick='next()'>
					</TD>
				</TR>
			</TABLE>

		</form>
		</div>
		<div id="second_form">
					<TABLE border='2' id="second" name="second" width='600' cellSpacing=0 cellPadding=5 align=center class="updateTable">
				<TR>
					<TD align='center'>
						<font size='2'>아 이 디</font>
					</TD>
					<TD id="id">
						
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>비 밀 번 호</font>
					</TD>
					<TD>
						*****
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>이 름</font>
					</TD>
					<TD id="name">
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>E - M a i l</font>
					</TD>
					<TD id="email">
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>핸 드 폰</font>
					</TD>
					<TD id="phone">
					</TD>
				</TR>
				<TR>
					<TD width='100' align='center'>
						<font size='2'>생 일</font>
					</TD>
					<TD id="birth">
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>우 편 번 호</font>
						<span class="fieldError">
					</TD>
					<TD id="zip">
					</TD>
				</TR>
				<TR>
					<TD align='center'>
						<font size='2'>주 소</font>
					</TD>
					<TD id="addr">
					</TD>
				</TR>
			</TABLE>
		</div>
</BODY>
</HTML>





