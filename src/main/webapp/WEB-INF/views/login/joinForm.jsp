<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/login/login.css" rel="stylesheet">
</head>
<style>

.login_content {
    margin: 0 auto 160px;
    padding-top : 50px;
    width: 380px;
    text-align: center;
}

table {
	margin: auto;
}
</style>
<body>
<jsp:include page="../main/header.jsp" />
	<div class="contaner">
		<section class="login_content">
			<h2 class="logo">회원종류를 선택해 주세요.</h2>
			<table>
				<tr>
					<th id="buttonWrap">
							<a href="member.do?method=memberJoin" class="btn1">일반회원가입</a>&nbsp;&nbsp;
							<a href="market.do?method=marketJoin" class="btn2">입점상점가입</a>
					</th>
				</tr>
			</table>
		</section>
	</div>
	<jsp:include page="../main/footer.jsp" />	
</body>
</html>