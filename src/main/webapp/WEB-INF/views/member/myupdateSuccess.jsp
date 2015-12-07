<%@ page contentType="text/html;charset=UTF-8"%>
<html>
<head>
<title>유저 등록 완료 화면</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
</head>
<body>
	<div align="center" class="body">
		<h2>유저 등록 완료 화면</h2>
		<b><font color="red">다음과 같이 회원 수정이 완료되었습니다.</font></b><br>

		<form:form modelAttribute="user" Name='joinForm' Method='post'
			Action='/doc/login'>

			<table border='1' width='600' cellpadding='0' cellspacing='0'>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>ID:</td>
					<td>${member.m_id}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>비밀번호</td>
					<td>${member.m_pass}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>이름</td>
					<td>${member.m_name}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>E-mail</td>
					<td>${member.m_email}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>핸드폰</td>
					<td>${member.m_phone}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>생일</td>
					<td>${member.m_birth}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>우편번호</td>
					<td>${member.zip_code}</td>
				</tr>
				<tr height="40px">
					<td bgcolor='cccccc' width='100' align='center'>나머지주소</td>
					<td>${member.m_addr}</td>
				</tr>

			</table>
		</form:form>
		<br>
		<p>
		<ul id="ullog">
			<li id="lilogb"><a href="/login.do">로그인</a></li>|
		</ul>
		</p>
	</div>

</body>
</html>
