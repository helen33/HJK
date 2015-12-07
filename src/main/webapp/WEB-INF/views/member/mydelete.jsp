<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원삭제</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<SCRIPT LANGUAGE="JavaScript">
function Check() {
	if (DeleteForm.m_pass.value.length < 1) {
		alert("비밀번호를 입력하세요.");
		DeleteForm.m_pass.focus();
		return false;
	}
	
	if (DeleteForm.pass2.value.length < 1) {
		alert("비밀번호 확인를 입력하세요.");
		DeleteForm.pass2.focus();
		return false;
	}
	
	if (DeleteForm.m_pass.value != DeleteForm.pass2.value) {
		alert("비밀번호와 비밀번호 확인이 맞지 않습니다.");
		DeleteForm.m_pass.focus();
		return false;
	}
	if (DeleteForm.m_pass.value != DeleteForm.re_pass.value) {
		alert("등록된 정보와 맞지 않습니다.");
		DeleteForm.m_pass.focus();
		return false;
	}
	
	alert("회원탈퇴 진행중.")
	document.DeleteForm.submit();
}
	
</SCRIPT>
</head>
<body>
<font size='3'><b> 회원탈퇴 </b></font>
<form Name='DeleteForm' Method='post' Action='memberDelete'>
	<TABLE border='2' width='600' cellSpacing=0 cellPadding=5
				align=center>
				<TR>
					<!-- readonly를 사용하여 사용자가 입력하지 못하게하여 해당 아이디를 DB에 저장시킨다 -->
					<TD bgcolor='cccccc' width='100' align='center'>
						<font size='2'>아 이 디</font>
					</TD>
					<TD bgcolor='cccccc'>
						<input type="text" id="m_id" name="m_id" maxLength='20' size='10' readonly='true' value="${member.m_id}" />
					</TD>
				</TR>
				<TR>
					<TD bgcolor='cccccc' align='center'>
						<font size='2'> 비 밀 번 호 </font>
					</TD>
					<TD bgcolor='cccccc'> 
					<!-- 유저가 입력하는 pass(비밀번호) 값 -->
					<input type="password" id="m_pass" name="m_pass" maxlength="20" size='10' showPassword="true" />
					<!-- 유저ID를 비교하여 DB에서 해당 유저의 비밀번호를 hidden으로 처리된 칸에 패스를 불러온다 -->
					<input type="hidden" id="re_pass" name="re_pass" value="${member.m_pass}" maxlength="20" size='10' showPassword="true" /> 
					</TD>
				</TR>
				<TR>
					<TD bgcolor='cccccc' align='center'>
						<font size='2'>비밀번호확인</font>
					</TD>
					<TD bgcolor='cccccc'>
						<input type="password" id="pass2" name="pass2" maxlength="20" size='10' value="" showPassword="true" />
					</TD>
				</TR>
			</TABLE>
			<hr size='1' noshade width='600' align="center">

			<TABLE>
				<TR>
					<TD colspan='2' align='center'>
					<input type='button' value='탈퇴하기' OnClick="Check()">
					</TD>
				</TR>
			</TABLE>
</form>

</body>
</html>