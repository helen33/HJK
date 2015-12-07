<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의하기리스트</title>
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<style type="text/css">
/* 리스트 타이틀 */
.qnatitle{
	font-family: 'Nanum Gothic', sans-serif;
	font-size: 11pt;
	color: #000000;
	font-weight: bold;
	text-align:center;
	height: 25px;
	width: 900px;
}

/* 리스트 테이블 */
.qnaListtable {
	BORDER-TOP: #1A90D8 2px solid;
	BORDER-bottom: #BABABA 1px solid;
	font-size: 9pt;
	border-collapse: collapse;
	width: 900px;
}

.qnaListtable td {
	BORDER-bottom: #E0E0E0 1px solid;
	padding-left: 2px;
	padding-right: 2px;
	background-color: #F7F7F7;
	height: 40px;
	text-align:center;
	vertical-align: middle;
}

/* 버튼 */
.wbutton {
   border: 1px solid #0a3c59;
   background: #828282;
   background: -webkit-gradient(linear, left top, left bottom, from(#fafafa), to(#828282));
   background: -webkit-linear-gradient(top, #fafafa, #828282);
   background: -moz-linear-gradient(top, #fafafa, #828282);
   background: -ms-linear-gradient(top, #fafafa, #828282);
   background: -o-linear-gradient(top, #fafafa, #828282);
   background-image: -ms-linear-gradient(top, #fafafa 0%, #828282 100%);
   padding: 6.5px 13px;
   -webkit-border-radius: 5px;
   -moz-border-radius: 5px;
   border-radius: 5px;
   -webkit-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   -moz-box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   box-shadow: rgba(255,255,255,0.4) 0 1px 0, inset rgba(255,255,255,0.4) 0 1px 0;
   text-shadow: #7ea4bd 0 1px 0;
   color: #000000;
   font-size: 11px;
   font-family: 'Nanum Gothic', sans-serif;
   text-decoration: none;
   vertical-align: middle;
   }
.wbutton:hover {
   border: 1px solid #0a3c59;
   text-shadow: #1e4158 0 1px 0;
   background: #3e779d;
   background: -webkit-gradient(linear, left top, left bottom, from(#65a9d7), to(#3e779d));
   background: -webkit-linear-gradient(top, #65a9d7, #3e779d);
   background: -moz-linear-gradient(top, #65a9d7, #3e779d);
   background: -ms-linear-gradient(top, #65a9d7, #3e779d);
   background: -o-linear-gradient(top, #65a9d7, #3e779d);
   background-image: -ms-linear-gradient(top, #65a9d7 0%, #3e779d 100%);
   color: #fff;
   }
.wbutton:active {
   text-shadow: #1e4158 0 1px 0;
   border: 1px solid #0a3c59;
   background: #65a9d7;
   background: -webkit-gradient(linear, left top, left bottom, from(#3e779d), to(#3e779d));
   background: -webkit-linear-gradient(top, #3e779d, #65a9d7);
   background: -moz-linear-gradient(top, #3e779d, #65a9d7);
   background: -ms-linear-gradient(top, #3e779d, #65a9d7);
   background: -o-linear-gradient(top, #3e779d, #65a9d7);
   background-image: -ms-linear-gradient(top, #3e779d 0%, #65a9d7 100%);
   color: #fff;
   }

</style>

<script type="text/javascript">
function check(q_num,scret) {
	var member = document.qnaList.member.value;
	if(member == "null"){
		alert ("로그인 후 이용해주세요.");
		return false;
	}else{
			alert("비밀번호 입력 후 볼 수 있습니다.");
			browsing_window = window
			.open(
					"scret?q_num=" + q_num,
					"scret",
					"height=200,width=500, menubar=no,directories=no,resizable=no,status=no,scrollbars=yes");
			browsing_window.focus();
			
		}
	}
function Write(){
	var member = document.qnaList.member.value;
	if(member == "null"){
		alert("로그인 후 이용가능합니다.");
	}
	else{
		location.href= "./esmain.do?es_page=/qnaWrite.do"
	}
}

</script>

</head>
<body>
<center>
<form id="qnaList" name="qnaList">
	<font style="text-decoration:underline; font-size:20px; font-weight:bold;">문의하기 리스트 </font><br><br>
	<input type="hidden" id="q_num" name="q_num">
	
	<table class="qnatitle">
		<tr>
			<td width="50">번호</td>
			<td width="400">제목</td>
			<td width="120">작성자</td>
			<td width="120">날짜</td>
			<td width="50">조회</td>
		</tr>
	</table>

	<table class="qnaListtable">
	<c:forEach var="result" items="${qnaList}" varStatus="status">
		<tr>
			<td width="50">${result.Q_NUM}</td>
			<td width="400">
				<c:if test="${result.Q_SCRETPASS != null}">
					<a href="#" id="scret" name="scret" Onclick="check(${result.Q_NUM},${result.Q_SCRETPASS})">
						${result.Q_NAME}</a>
					<img src="./resources/lock.png"/>
				</c:if>
				<c:if test="${result.Q_SCRETPASS eq null}">
					<a href="esmain.do?es_page=/qnaContent.do?q_num=${result.Q_NUM}">
						${result.Q_NAME}</a>
					&nbsp;
				</c:if>
			</td>
			<td width="120">${result.M_ID}</td>
			<td width="120">${result.Q_DATE}</td>
			<td width="50">${result.Q_HITS}</td>
		</tr>
	</c:forEach>
		<tr style="border:1px 0px 0px 0px;">
			<td colspan="3">
			</td>
			<td colspan="2" align='right'>
				<a href='#' id="write" name="write" Onclick="Write()" class='wbutton'>글쓰기</a>
<!-- 				<input type="button" id="write" name="write" value="글쓰기" Onclick="Write()" class="ct-btn white large" style="float:right; margin:10px 100px 0px 0px;"> -->
			</td>
		</tr>
	</table>
	
	<input type="hidden" id="member" name="member" value="<%=session.getAttribute("memberId")%>">

	<br />
	<!-- 10페이지 이후 다음 페이지로 넘겨준다. -->
	${paging}
	<br /><br />
</form>
</center>
</body>
</html>