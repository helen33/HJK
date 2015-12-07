<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>회원가입</title>
	<link type="text/css" href="./resources/css/basic.css" rel="stylesheet" media="all" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" media="all" />
	
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.6/jquery-ui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.inputfocus-0.9.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.main.js"></script>
    
    <script type="text/javascript">
    $(document).ready(	function(){
		
 		$("input[name=m_id]").focusout(function(){
			$.ajax({
				url : "checkid_Bean", //컨트롤러에서 받을 url 적자
				type : "post",
				data: "m_id=" + $('#m_id').val() , //전송할 data
				dataType : "json", //반환받을 데이터 타입
				cache : false, //해킹우려 캐쉬 삭제
				success: function(result){ //성공시 실행되는 펑션
					$("span[name=one]").text(result.one).css({color:'blue'}); //해당 내용을 spen에 뿌려줌
					$("input[name=c_id]").val(result.two);
					if(document.sign.c_id.value == 1){
						$("input[name=m_id]").val("");
						document.sign.c_id.focus();
						return false;
					}
				},
				error:function(request,status,error){
			        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			       }			
			})
		});
	});
	
	
</script>

</head>
<body>
	
	<div id="container">
        <form id="sign" name="sign" action="meminsert" method="post">
	
            <!-- #first_step -->
            <div id="first_step">
                <h1>HJK <span>Shopping Center</span> Sign up</h1>

                <div class="form">
                	<!-- 아이디 -->
                    <input type="text" name="m_id" id="m_id" value="" placeholder="ID"/>
                    <input type="hidden" name="c_id" id="c_id" value="" />
<!--                     <label for="Id">사용 할 아이디를 적어주세요.</label> -->
					<label for="Id"><span name="one">
						사용 할 아이디를 적어주세요.</span></label>
                    <!-- 비밀번호 -->
                    <input type="password" name="m_pass" id="m_pass" value="" placeholder="PASSWROD"/>
                    <label for="pass">사용할 비밀번호를 적어주세요.</label>
                    
                    <!-- 비밀번호 확인 -->
                    <input type="password" name="m_pass2" id="m_pass2" value="" placeholder="RE_PASSWROD" />
                    <label for="pass2">사용할 비밀번호를 다시한번 적어주세요.</label>
                </div>      
                <!-- clearfix -->
                	<div class="clear"></div>
                <!-- /clearfix -->
                <!-- Second_step으로 넘어가는 버튼 -->
                <input class="submit" type="submit" name="submit_first" id="submit_first" value="" />
            </div>  
            	 <!-- clearfix -->
                 	<div class="clear"></div>
                 <!-- /clearfix -->

        <!-- #second_step -->
            <div id="second_step">
                <h1>HJK <span>Shopping Center</span> Sign up</h1>

                <div class="form">
               	  <!-- 이름 -->
                    <input type="text" name="m_name" id="m_name" value="" placeholder="NAME"/>
                    <label for="name">이름을 입력해 주세요. </label>
                    
                  <!-- 이메일 -->
                    <input type="text" name="m_email" id="m_email" value="" placeholder="E-MAIL" />
                    <label for="email">이메일을 입력해 주세요. </label>
                   	
                    <!-- 핸드폰 -->
                  <input type="text" name="m_phone" id="m_phone" value="" placeholder="PHONE NUMBER(010-0000-0000)" />
                  <label for="phone">연락처를 입력해 주세요. </label>                             
              </div>
                
                <!-- clearfix -->
                	<div class="clear"></div>
            <!-- /clearfix -->
            	 <!-- third_step으로 넘어가는 버튼 -->
                <input class="submit" type="submit" name="submit_second" id="submit_second" value="" />
            </div>
            
            	<!-- clearfix -->
                	<div class="clear"></div>
        <!-- /clearfix -->


            <!-- #third_step -->
            <div id="third_step">
                <h1>HJK <span>Shopping Center</span> Sign up</h1>

                <div class="form">
               	  <!-- 생년월일 -->
                  <input type="text" name="birthy" id="birthy" value="" maxlength="4" class="birth" placeholder="YYYY"/>
                    <select id="birthm" name="birthm" >
                        <option>월</option>
                        <option>01</option>
                        <option>02</option>
                        <option>03</option>
                        <option>04</option>
                        <option>05</option>
                        <option>06</option>
                        <option>07</option>
                        <option>08</option>
                        <option>09</option>
                        <option>10</option>
                        <option>11</option>
                        <option>12</option>
                    </select>
                    <input type="text" name="birthd" id="birthd" value="" class="birth" placeholder="DD"/>
                    <label for="birth">생일을 입력해 주세요. </label>
                    <!-- clearfix -->
                    	<div class="clear"></div>
                  <!-- /clearfix -->

					<!-- 우편번호 -->
              		<input type="text" name="Zip_code" id="Zip_code" value="" class="post" placeholder="000-000"/>
                    <input OnClick='ZipCode()' name="zip_code" id="zip_code" type='button' value='' class="button">
                    <label for="post">우편번호를 검색해 주세요. </label>
                    <!-- clearfix -->
                   	 <div class="clear"></div>
                <!-- /clearfix -->
                    
                    <!-- 나머지주소 -->
                    <input type="text" name="m_addr" id="m_addr" value="" placeholder="나머지 주소"/>
                    <label for="addr">나머지 주소를 입력해 주세요. </label>   
                    
                    <!-- clearfix -->
                    	<div class="clear"></div>
                  <!-- /clearfix -->
                    
                </div>
                <!-- clearfix -->
                	<div class="clear"></div>
            <!-- /clearfix -->
            	<!-- fourth_step으로 넘어가는 버튼 -->
                <input class="submit" type="submit" name="submit_third" id="submit_third" value=""/>
                
            </div>
            <!-- clearfix -->
            	<div class="clear"></div>
        <!-- /clearfix -->
            
            
            <!-- #fourth_step -->
            <div id="fourth_step">
                <h1>HJK <span>Shopping Center</span> Sign up</h1>

                <div class="form">
                    <h2>Summary</h2>
                    
                    <table>
                        <tr><td>Id</td><td></td></tr>
                        <tr><td>Password</td><td></td></tr>
                        <tr><td>Email</td><td></td></tr>
                        <tr><td>Name</td><td></td></tr>
                        <tr><td>Phone</td><td></td></tr>
                        <tr><td>Birth</td><td></td></tr>
                        <tr><td>Zip</td><td></td></tr>
                        <tr><td>Addr</td><td></td></tr>
                    </table>
                </div>
                 <!-- clearfix -->
                 	<div class="clear"></div>
            <!-- /clearfix -->
            	<!-- jquery.main.js의 submit_fourth으로 넘어가는 버튼 -->
                <input class="send submit" type="submit" name="submit_fourth" id="submit_fourth" value=""/>            
            </div>
            
        
	</div>
	<div id="progress_bar">
        <div id="progress"></div>
        <div id="progress_text">0% Complete</div>
	</div>
	<input type="hidden" id="m_birth" name="m_birth" value="m_birth"></input>
</form>
</body>
</html>