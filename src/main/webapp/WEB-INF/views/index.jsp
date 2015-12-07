<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <%@ page import = "java.util.ArrayList" %>
  <%@ page import = "java.io.*" %>
  <%@ page import = "java.util.*" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=0, user-scalable=no, target-densitydpi=medium-dpi" />
<title>Insert title here</title>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
</head>
<body>
	<%
		String pagefile = request.getParameter("main_page");
		if (pagefile == null) {
			pagefile = "./estimate/esmain.jsp";
		}
	%>
	<div id="wrap" style="width: 754x; margin: auto;">
		<div id="main" name="main">
			<jsp:include page='<%=pagefile%>' />
		</div>
		<div style="clear: both">
		</div>
	</div>
</body>
</html>
