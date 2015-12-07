<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>A jQuery Countdown Timer | Tutorialzine Demo</title>
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jquery.countdown.css" />
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
</style>
</head>
<body>
	<input type="hidden" id="aday" name="aday" value="${aday}" />
	<input type="hidden" id="ahour" name="ahour" value="${ahour}" />
	<input type="hidden" id="aminute" name="aminute" value="${aminute}" />
	<input type="hidden" id="a_num" name="a_num" value="${a_num}" />
	<div id="countdown"></div>

	<p id="note"></p>

	<!-- JavaScript includes -->
	<script src="http://code.jquery.com/jquery-1.7.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.countdown.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/countdown_script.js"></script>

</body>
</html>