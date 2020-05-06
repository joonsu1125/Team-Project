<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sp마켓</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${conPath }/js/cart/cart.js"></script>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/cart/cart.css" rel="stylesheet">
</head>
<body>
<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div id="cart_head">
			<div id="cart_head_left">
				장바구니
			</div>
			<ul id="cart_head_right">
				<li>주문완료</li>
				<li> > </li>
				<li>주문/결제</li>
				<li> > </li>
				<li id="status_now">장바구니</li>
			</ul>
		</div>
		<hr>
		<form action="cart.do">
			<input type="hidden" name="method" value="orderView">
			<input type="hidden" name="cid" value="${member.cid }">
			<table>
				<tr>
					<th>
						<span id="wholecheck">
							<input type="checkbox" class="checkall" checked="checked" name="checkall"> 전체선택
							(<span class="num_count"></span>/<span class="num_total"></span>)
						</span>
						상품정보
					</th><th>수량</th><th>금액</th><th>배송비</th><th>주문</th>
				</tr>
				<c:forEach var="cart" items="${list }">
					<tr class="list">
						<td>
							<div class="list_left">
								<input type="checkbox" name="cartno" value="${cart.cartno }" id="check${cart.cartno }" class="check" checked="checked">
								<img src="${conPath }/product_img/${cart.pimage}">
							</div>
							<div class="list_right">
								<a><b>${cart.poname }</b></a>
								<hr>
								<span>주문 후 3일 이내에 배송 예정. (휴일 제외)</span>
							</div>
						</td>
						<td>
							<input type="hidden" value="${cart.cartno }" id="cartno${cart.cartno}">
							<input type="hidden" value="${cart.cartcount }" id="cartcount${cart.cartno}">
							<input type="hidden" value="${cart.poprice }" id="cartpoprice${cart.cartno}">
							<input type="hidden" value="${cart.cartcount * cart.poprice}" name="price_cell" id="price_cell${cart.cartno}">	
							<input type="text" name="cartcount" readonly="readonly" maxlength="5" value="${cart.cartcount }" id="cartcount_text${cart.cartno}"><br>
							<button type="button" class="btn_count_minus" value="${cart.cartno }">-</button>
							<button type="button" class="btn_count_plus" value="${cart.cartno }">+</button>
						</td>
						<td>
							<span id="cart_price_ajax1${cart.cartno}" class="cart_price_ajax">
							<fmt:formatNumber value="${cart.cartcount * cart.poprice }" groupingUsed="true"/>원
							</span>
						</td>
						<td>
							<fmt:formatNumber value="3000" groupingUsed="true"/>원
						</td>
						<td>
							<a href="cart.do?method=orderView&cartno=${cart.cartno }&cid=${member.cid}">주문하기</a>
							<a href="cart.do?method=deleteCart&cartno=${cart.cartno }&cid=${member.cid}" onclick="return confirm('선택한 상품을 삭제 하시겠습니까?');">삭제하기</a>
						</td>
					</tr>
					<tr class="price">
						<td colspan="5" class="xx">
							<span id="sum${cart.cartno }">
								상품금액 <b><fmt:formatNumber value="${cart.cartcount * cart.poprice }" groupingUsed="true"/></b>원 + 배송비 <b>3000</b>원 = 주문합계 
								<b><fmt:formatNumber value="${cart.cartcount * cart.poprice +3000}" groupingUsed="true"/></b>원
							</span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<div id="total_price">
				총 상품가격 <b id="total_products"></b>원 + 총 배송비 <b id="shiping"></b>원 = 총 주문금액 <b id="result"></b>원
			</div>
			<div id="btns_order">
				<button type="button" class="btn2" onclick="location.href='main.do'">계속 쇼핑하기</button>
				<input type="submit" value="주문하기" class="btn1">
			</div>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>