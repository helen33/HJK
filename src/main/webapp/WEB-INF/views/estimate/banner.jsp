<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Responsive Accordion Slider::Demo 1</title>
    <link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style_benner.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/raccordion.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.min.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.raccordion.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/resources/js/jquery.animation.easing.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(window).load(function () {
            $('#accordion-wrapper').raccordion({
                speed: 1000,
                sliderWidth: 900,
                sliderHeight: 300,
                autoCollapse: false
            });

        }); 
    </script>
</head>
<body>
<!-- 배너 크기는 745x322로 하세요 -->
<div id="accordion-wrapper">
            <div class="slide">
                <img src="./resources/images/banner_1.png" />
                <div class="caption">
                    <a href="#">
                        <h1>관리자가 진행하는 이벤트나 공지를 이미지로 띠워줄 수 있습니다.</h1>
                    </a>
                    <p>간략한 부가 설명이 가능합니다. 이미들 클릭시 페이지 이동이 가능합니다.</p>
                </div>
            </div>
            <div class="slide">
                <img src="./resources/images/banner_2.png" />
                <div class="caption">
                    <a href="#">
                        <h1>관리자가 진행하는 이벤트나 공지를 이미지로 띠워줄 수 있습니다.</h1>
                    </a>
                    <p>간략한 부가 설명이 가능합니다. 이미들 클릭시 페이지 이동이 가능합니다.</p>
                </div>
            </div>
            <div class="slide">
                <img src="./resources/images/banner_3.png" />
                <div class="caption">
                    <a href="#">
                        <h1>관리자가 진행하는 이벤트나 공지를 이미지로 띠워줄 수 있습니다.</h1>
                    </a>
                    <p>간략한 부가 설명이 가능합니다. 이미들 클릭시 페이지 이동이 가능합니다.</p>
                </div>
            </div>
            <div class="slide">
                <img src="./resources/images/banner_4.png" />
                <div class="caption">
                    <a href="#">
                        <h1>관리자가 진행하는 이벤트나 공지를 이미지로 띠워줄 수 있습니다.</h1>
                    </a>
                    <p>간략한 부가 설명이 가능합니다. 이미들 클릭시 페이지 이동이 가능합니다.</p>
                </div>
            </div>
            <div class="slide">
                <img src="./resources/images/banner_5.png" />
                <div class="caption">
                    <a href="#">
                        <h1>관리자가 진행하는 이벤트나 공지를 이미지로 띠워줄 수 있습니다.</h1>
                    </a>
                    <p>간략한 부가 설명이 가능합니다. 이미들 클릭시 페이지 이동이 가능합니다.</p>
                </div>
            </div>
            <div class="slide">
                <img src="./resources/images/banner_6.png" />
                <div class="caption">
                    <a href="#">
                        <h1>관리자가 진행하는 이벤트나 공지를 이미지로 띠워줄 수 있습니다.</h1>
                    </a>
                    <p>간략한 부가 설명이 가능합니다. 이미들 클릭시 페이지 이동이 가능합니다.</p>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
