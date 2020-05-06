<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자로그인</title>
<!-- jQuery api -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<script src="${conPath }/js/login.js" type="text/javascript"></script>
<link href="${conPath }/css/login/login.css" rel="stylesheet">
<style>
h2 {
	text-align: center;
}
</style>
</head>
<body>
	<div class="contaner">
		<div class="login_content">
			<h1 class="logo">
				<a href="main.do">G9</a>
			</h1>
			<h2>관리자 로그인</h2>
<form action="login.do" id="frm" method="post">
	
	<input type="hidden" name="method" value="adminLogin">
	<div class="group">
		<input type="text" name="id"><span class="highlight"></span><span class="bar"></span>
		<label>아이디</label>
	</div>
	<div class="group">
	  <input type="password" name="pw"><span class="highlight"></span><span class="bar"></span>
	  <label>비밀번호</label>
	</div>
	<div class="btn_wrap">
		<button type="submit" class="btn1">로그인</button>
  	</div>
  	
	<div class="link_group">
		<a href="main.do" class="alink">쇼핑홈으로</a>
	</div>
  
</form>
		</div>
	</div>
	
	<!-- <script type="text/javascript">
	// 카카오 로그인 함수
	// input your appkey
	Kakao.init('3153b15ee605504fc683c26e15e2324a')
	console.log('kakao init : '+Kakao.isInitialized());
	
	// 버튼생성하기
	Kakao.Auth.createLoginButton({
	   container: '#kakao-login-btn',
	   success: function(authObj) {
	     Kakao.API.request({
	    	 url: '/v2/user/me',	       
	       success: function(res) {
	    	   var obj = JSON.stringify(res);
	         //alert(JSON.stringify(res));
	         //alert(obj);
	         console.log(res);
	         console.log("id : "+res.id);
	         console.log("email : "+res.kakao_account.email);
	         console.log("nicknamel : "+res.nickname);
	         
	         $('input[name=snsid]').val(res.id);
	         $('input[name=provider]').val('kakao');
	         $('input[name=snsemail]').val(res.kakao_account.email);
	         
	         // 카카오로 로그인
	         
	         //location.href='${conPath}/login.do?method=kakao';
	         document.getElementById('frm').submit();
	
	       },
	       fail: function(error) {
	         alert(
	           'login success, but failed to request user information: ' +
	             JSON.stringify(error)
	         );
	         $('input[name=snsid]').val('');
             $('input[name=provider]').val('');
	         $('input[name=snsemail]').val('');
	       },
	     })
	   },
	   fail: function(err) {
	     alert('failed to login: ' + JSON.stringify(err));
	     $('input[name=snsid]').val('');
         $('input[name=provider]').val('');
         $('input[name=snsemail]').val('');
	   },
	 });
	
	/*
	구글로그인이 이상동작해서 잠시 막아둠
	// google login
	function onSignIn(googleUser) {
	    var profile = googleUser.getBasicProfile();
	    console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	    console.log('Name: ' + profile.getName());
	    console.log('Email: ' + profile.getEmail());
	    
	    $('input[name=snsid]').val(profile.getId());
        $('input[name=provider]').val('google');
        $('input[name=snsemail]').val(profile.getEmail());
        
        // google로 로그인
        //location.href='${conPath}/login.do?method=google';
        document.getElementById('frm').submit();
        
	}
	*/
	</script> -->
	
</body>
</html>