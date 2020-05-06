<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/cart/cart.css" rel="stylesheet">
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#content{
	text-align: center;
    height: 500px;
}
#content > div:nth-child(1){
	height: 180px;
    line-height: 180px;
    BORDER: 3px solid #3a5485;
    border-radius: 10px;
    font-size: 1.7em;
    font-weight: bold;
    margin: 30px;
}
#content > div:nth-child(1) > span{
	color: #ea2020;
}
#content > div:nth-child(2) > button.btn2, #content > div:nth-child(2) > button.btn1{
	    margin: 50px 40px;
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="cart_head">
			<div id="cart_head_left">
				주문결제
			</div>
			<ul id="cart_head_right">
				<li id="status_now">주문완료</li>
				<li> > </li>
				<li>주문/결제</li>
				<li> > </li>
				<li>장바구니</li>
			</ul>
		</div>
		<hr>
	<div id="content">
		
		<div>
			감사합니다. <span>결제가 완료</span> 되었습니다.
		</div>
		<div>
			<form action="Order_detail_product.do">
				<input type="hidden" name="method" value="listOrder_detailByCid">
				<input type="hidden" name="cid" value="${member.cid}">
				<button class="btn2">주문내역</button>
			<button type="button" class="btn1" onclick="location.href='main.do'">홈으로</button>		
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>