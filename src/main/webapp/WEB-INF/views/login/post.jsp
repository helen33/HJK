<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>우편번호 찾기 결과창</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
</head>
<style>
.ordertable {
	width: 565px;
	padding: 5px;
	font-size:15px; 
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	text-align:left;
}
.ordertd {
	padding: 5px;
}
</style>
<script>
	//main페이지로 값 전달: 부모로 값전달하기 위해서는 opener사용
	function sendAdd(sido, gugun, dong, bunji, zipcode){
		var ch = document.f.ch.value;
	    var address = " "+sido+" "+gugun+" "+dong+" "+bunji;
		if(ch == 0){
			opener.document.sign.Zip_code.value = zipcode; 
			opener.document.sign.m_addr.value = address;
			opener.document.sign.m_addr.focus();
			window.close();
		} else {
			opener.document.orders.Zip_code.value = zipcode; 
			opener.document.orders.zip_addr.value = address;
			opener.document.orders.o_addr.focus();
			window.close();
		}
		
	}
	
	//널값체크
	function Check_jj() {
		
		var checkValue = document.f.dong.value;
		
		if(checkValue == ""){
			alert("동이름을 입력하세요.");
			document.f.address.focus();
			return false;
		}
		document.f.action = 'checkpost_Bean';
		document.joinForm.submit();
	}
</script>

<body>
	<form name="f" method="post" onsubmit="check()">
	<input type="hidden" value="${ch}" id="ch" name="ch">
	<table border="1" width="50px" class="ordertable">
	<tr align="center">
		<td bgcolor="#FAF4C0"><b>동이름 검색 :</b> <input type="text" name="dong" size="15">
			<input type="submit" OnClick="Check_jj()" value="검색">
		</td>
	</tr>
	<tr>
		<!-- 안내문 -->
		<td align=center bgcolor="#FAF4C0"><font color="red" style="font-weight:bold">※ 동이름을 입력하시고 검색 후, 아래
				부분의<br> 우편번호를 클릭하시면 자동으로 주소가 입력됩니다.
		</font></td>
	</tr>
	
	<c:forEach items="${postcheck}" var="post">
	<tr>
		<td><a href="javascript:sendAdd(
				'${post.sido}',
			 	'${post.gugun}', 
			 	'${post.dong}', 
			 	'${post.bunji}',
			 	'${post.zipcode}')" > 
			 	
			 				${post.zipcode}
							${post.sido} 
						 	${post.gugun} 
						 	${post.dong} 
						 	${post.bunji}

						</a></td>
				</tr>
			</c:forEach>
		</table>
	</form>
</body>
</html>