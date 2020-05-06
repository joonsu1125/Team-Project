<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<link href="${conPath }/css/login/login.css" rel="stylesheet">
<script>
	$(document).ready(function(){		
		
		/* 아이디 중복 체크 ajax */
		$('.confirmKeyUp').keyup(function(){
			$.ajax({
				url : 'member.do?method=idConfirm',
				datatype : 'html',
				data : "cid="+$(this).val(),
				success : function(data, status){
					$('.idConfirm').html(data);
				}
			});
		});
		
		/* 이메일 체크 ajax+ 정규표현식 */
		$('.confirmMailKeyUp').keyup(function(){
		      var idPattern = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/);
		      if(idPattern.test($(this).val()) == false){
		    	  $('.emailConfirm').html("<span style='color:red;'>이메일 형식에 맞게 입력하세요.</span>");
		      }else{
		    	  $('.emailConfirm').html("<span style='color:blue;'>적합한 형식입니다.</span>");
		      }
		});
		
		/* 비밀번호 체크 정규표현식 */
		$('.pwchk').keyup(function(){
			var pwDegreeSafety = 0;
			var pwPatternNumber = /[0-9]/;
    		var pwPatternEnglish = /[a-zA-Z]/;
			var pwPatternSymbol = /[!@#$%^*+=-]/;
			/* 안전도 */
			
			
			var pw = $('.pw').val();
			var pwchk = $('.pwchk').val();
			if(pw != pwchk){
				$('.passwordConfirm').html('<span style="color:red;">불일치</span>');	
				$('.passWordSafety').html('');
			}else{
				if(pwPatternNumber.test($(this).val())){
					pwDegreeSafety++;
				}
				if(pwPatternEnglish.test($(this).val())){
					pwDegreeSafety++;
				}
				if(pwPatternSymbol.test($(this).val())){
					pwDegreeSafety++;
				}
				if(pwDegreeSafety < 2){
					$('.passWordSafety').html('<span style="color:red;"> 3자리 이상을 추천합니다. </span>');					
				}else if(pwDegreeSafety == 2){
					$('.passWordSafety').html('<span class="normal">  </span>');					
				}else if(pwDegreeSafety > 2){
					$('.passWordSafety').html('<span class="safety">  </span>');					
				}
				
				$('.passwordConfirm').html('<span style="color:blue;">일치</span>');
			}			
		});
		
		
	});
</script>
</head>
<body>
	<div id="contentWrap" class="userWrap">
		<section class="joinFormWrap">
			<h1 class="logo">
				<a href="main.do">G9</a>
			</h1>
			<form action="${conPath}/member.do?method=cutomerJoinResult" method="post">
			<input type="hidden" name="csnsid" value="${csnsid }" />
			<input type="hidden" name="cprovider" value="${provider }" />
			<input type="hidden" name="snsemail" value="${snsemail }" />

				
				<!-- user join form -->
				<table class="user">
					<tr>
						<th><h2>회원 기본 정보</h2></th>
					</tr>
					<tr>
						<td><input type="text" name="cid" placeholder="아이디를 입력하세요" required="required" class="confirmKeyUp"></td>
					</tr>
					<tr>
						<td>
							<p class="idConfirm">
							</p>
						</td>
					</tr>
					<tr>
						<td><input type="password" name="cpw" placeholder="비밀번호을 입력하세요." required="required" class="pw"></td>
					</tr>
					<tr>
						<td>
							<p class="passWordSafety">
							</p>
						</td>
					</tr>
					<tr>
					
						<td><input type="password" name="cpwChk" placeholder="다시한번 비밀번호를 입력하세요" required="required" class="pwchk"></td>
					</tr>
					<tr>
						<td>
							<p class="passwordConfirm">									
								
							</p>
						</td>
					</tr>
					<tr>
					<c:if test="${empty snsemail}">
						<td><input type="email" name="cemail" placeholder="이메일을 입력하세요" required="required" class="confirmMailKeyUp"></td>
					</c:if>
					<c:if test="${not empty snsemail}">
					<td><input type="email" name="cemail" readonly="readonly" class="confirmMailKeyUp" value="${snsemail }"></td>
					</c:if>
					</tr>
					<tr>
						<td>
							<p class="emailConfirm">
							</p>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="cname" placeholder="이름을 입력하세요." required="required"></td>
					</tr>
					<tr>
						<td><input type="text" name="ctel" placeholder="연락처를 입력하세요" required="required"></td>
					</tr>
					<tr>
						<td>
							<input type="text" id="sample4_postcode" name="cpost" class="postBox"  placeholder="우편번호">
							<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn1">
						</td>
					</tr>
					<tr>
						<td>
							<input type="text" id="sample4_roadAddress" name="caddr1"  placeholder="도로명주소">
							<input type="hidden" id="sample4_jibunAddress" placeholder="지번주소">
							<span id="guide"></span>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="caddr2" placeholder="상세주소를 입력하세요"></td>
					</tr>
					<tr>
						<th id="buttonWrap">
							<input type="submit" value="회원가입" class="btn1">
							<input type="reset" value="RESET" class="btn2">
							<input type="button" value="BACK" class="btn2">
						</th>
					</tr>
				</table>
			</form>
		</section>
	</div>

</body>
</html>