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
</head>
<body>
	상품금액 <b><fmt:formatNumber value="${cart.cartcount * cart.poprice }" groupingUsed="true"/></b>원 + 배송비 <b>3000</b>원 = 주문합계 
	<b><fmt:formatNumber value="${cart.cartcount * cart.poprice +3000}" groupingUsed="true"/></b>원
</body>
</html>