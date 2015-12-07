<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
        <title>zz</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <meta name="description" content="Slideshow with jmpress.js" />
        <meta name="keywords" content="jmpress, slideshow, container, plugin, jquery, css3" />
        <meta name="author" content="for Codrops" />
        
        <link rel="shortcut icon" href="../favicon.ico"> 
        
		<link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/demo.css" />
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style2.css" />
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jmpress.min.js"></script>

		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.jmslideshow.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr.custom.48780.js"></script>
		<noscript>
			<style>
			.step {
				width: 100%;
				position: relative;
			}
			.step:not(.active) {
				opacity: 1;
				filter: alpha(opacity=99);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(opacity=99)";
			}
			.step:not(.active) a.jms-link{
				opacity: 1;
				margin-top: 40px;
			}
			</style>
		</noscript>
    </head>
    <body>
        <div class="container">
			<section id="jms-slideshow" class="jms-slideshow">
				<div class="step" data-color="color-1">
					<div class="jms-content">
						
					</div>
					<img src="./resources/image/pc1.PNG" />
				</div>
				<div class="step" data-color="color-2" data-y="500" data-scale="0.4" data-rotate-x="30">
					<div class="jms-content">
						
					</div>
					<img src="./resources/image/2.png" />
				</div>
				<div class="step" data-color="color-3" data-x="2000" data-z="3000" data-rotate="170">
					<div class="jms-content">
						
					</div>
					<img src="./resources/image/3.png" />
				</div>
				<div class="step" data-color="color-4" data-x="3000">
					<div class="jms-content">
						
					</div>
					<img src="./resources/image/4.png" />
				</div>
				<div class="step" data-color="color-5" data-x="4500" data-z="1000" data-rotate-y="45">
					<div class="jms-content">
						
					</div>
					<img src="./resources/image/5.png" />
				</div>
			</section>
        </div><script type="text/javascript">
			$(function() {
			
				$( '#jms-slideshow' ).jmslideshow();
				
			});
		</script>
    </body>
</html>