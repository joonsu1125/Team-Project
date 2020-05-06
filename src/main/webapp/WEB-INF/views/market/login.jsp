<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상점로그인</title>
<!-- jQuery api -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<script src="${conPath }/js/login.js" type="text/javascript"></script>
<link href="${conPath }/css/login/login.css" rel="stylesheet">
<style>
h2{
	text-align: center;
}
</style>
</head>
<body>
	<c:if test="${not empty joinResult }">
		<script>
		alert('${joinResult}');
		</script>
	</c:if>
	<c:if test="${not empty errMsg }">
		<script>
			alert('${errMsg}');
		</script>
	</c:if>
	
	<div class="contaner">
		<div class="login_content">
			<h1 class="logo">
				<a href="main.do">G9</a>
			</h1>
			<h2>상점로그인</h2>
<form action="market.do" id="frm" method="post">
	
	<input type="hidden" name="method" value="login">
	<input type="hidden" name="snsid" value="">
	<input type="hidden" name="provider"  value="">
	<input type="hidden" name="snsemail"  value="">

	<div class="group">
	<c:if test="${not empty mid }">
		<input type="text" name="id" value="${mid }" class="used" ><span class="highlight"></span><span class="bar"></span>
	</c:if>
	<c:if test="${empty mid }">
		<input type="text" name="id"><span class="highlight"></span><span class="bar"></span>
	</c:if>
	  <label>아이디</label>
	</div>
	<div class="group">
	  <input type="password" name="pw"><span class="highlight"></span><span class="bar"></span>
	  <label>비밀번호</label>
	</div>
	<div class="btn_wrap">
<!-- 	<a href="login.do?method=login" class="btn1">로그인</a> -->
	<!-- <a type="submit" class="btn1">로그인</a> -->
		<button type="submit" class="btn1">로그인</button>
	<!-- <button type="button" class="button buttonBlue">로그인
	  <div class="ripples buttonRipples"><span class="ripplesCircle"></span></div>
	</button> -->
	<!-- <p>
	<a id="kakao-login-btn" class="kakao-login-btn" ></a>
	<p> -->
	<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-width="220" data-longtitle="true"></div> -->
  	</div>
  	
	<div class="link_group">
		<a href="market.do?method=marketJoin" class="alink">회원가입</a> <span class="bar">|</span>
		<a href="javascript:Popup('ID');" class="alink">아이디 찾기</a> <span class="bar">|</span>
		<a href="javascript:Popup('PWD');" class="alink">비밀번호 찾기</a>
	</div>
  
</form>

		</div>
	</div>
	
	<script type="text/javascript">
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
	</script>
	
</body>
</html>