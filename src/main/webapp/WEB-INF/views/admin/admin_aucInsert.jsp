<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
<title>Insert title here</title>
	<script>
		function search(pccode,pcname){
			browsing_window = window
			.open(
					'partSearch?pccode=' + pccode + "&pcname=" + pcname,
					'window',
					"height=500, width=500, toolbar=auto, menubar=no, location=no");
			browsing_window.focus();
		}
		function adminAucInPro() {
			alert("상품이 등록되었습니다.");
			document.adminAucModi.action = "adminAucInPro";
		 	document.adminAucModi.submit();
		}
	</script>
</head>
<style>
.insertTable{
	
	border:1px solid #A6A6A6;	
	border-collapse: collapse;
	padding: 8px;
}
.insertTable th {
	padding: 8px;
	background-color:#FAECC5;
	text-align:center;
	border-left:1px solid #EAEAEA;
}
.insertTable td{
	padding-left:10px;
	font-size:13px; 
	border-left:1px solid #EAEAEA;
}
</style>
<body>
<form name="adminAucModi" id="adminAucModi" enctype="multipart/form-data" method="post" action="adminPartsModi">
<img src="${pageContext.request.contextPath}/resources/images/9.png" width="120px" style="position: relative; left: -390px; top: 0px;">
<center>
	<table border="1" width="900px" id="aumodi" class="insertTable" style="margin-top:15px;">
		<tr>
			<th scope="row">상품이름</th>
			<td colspan="3">
				<input type="text" name="c_name" id="c_name">
			</td>
		<tr>
			<th scope="row">즉시구매가</th>
			<td><input type="text" name="a_buy" id="a_buy"></td>
			<th scope="row">시작가</th>
			<td><input type="text" name="a_start" id="a_start"></td>
		</tr>
		<tr>
			<th scope="row" width="200px">시작일</th>
			<td width="250px"><input type="text" name="a_starttime" id="a_starttime" placeholder="0000-00-00 형식을 유지해주세요" size="30"></td>
			<th scope="row" width="200px">마감일</th>
			<td width="250px"><input type="text" name="a_endtime" id="a_endtime" placeholder="0000-00-00 형식을 유지해주세요" size="30"></td>
		</tr>
		<tr>
			<th colspan="4"><b>제품 사양</b></th>
		</tr>
		<tr>
			<th><b>CPU</b></th>
			<td colspan="2"><input id="cpu" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('140','CPU')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<th><b>CPU쿨러</b></th>
			<td colspan="2"><input id="cpucl" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('150','CPU쿨러')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<th><b>메인보드</b></th>
			<td colspan="2"><input id="mainb" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('160','메인보드')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<th><b>메모리</b></th>
			<td colspan="2"><input id="memory" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('170','메모리')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>
			<th><b>SSD</b></th>
			<td colspan="2"><input id="ssd" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('180','SSD')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>하드디스크</b></th>
			<td colspan="2"><input id="hardD" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('190','하드디스크')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>그래픽카드</b></th>
			<td colspan="2"><input id="grapc" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('200','그래픽카드')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>CD드라이브</b></th>
			<td colspan="2"><input id="cdD" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('210','CD드라이브')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>사운드</b></th>
			<td colspan="2"><input id="sound" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('220','사운드')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>랜카드</b></th>
			<td colspan="2"><input id="lanC" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('230','랜카드')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>케이스</b></th>
			<td colspan="2"><input id="casec" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('240','케이스')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>파워</b></th>
			<td colspan="2"><input id="power" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('250','파워')">검색&nbsp;&nbsp;</td>
		</tr>
		<tr>	
			<th><b>윈도우</b></th>
			<td colspan="2"><input id="window" name="auction_goods" size="50" style="border:0px;"/></td>
			<td width="100px" align="right"  onclick="search('260','윈도우')">검색&nbsp;&nbsp;</td>
		</tr>

	</table>
	<input type="reset" name="" id="" value="취소" />
	<input type="button" value="등록" onclick="adminAucInPro()"/>
		
</center>
</form>

</body>
</html>