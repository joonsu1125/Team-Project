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
<link href="${conPath }/css/order/order.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<table>
			<tr>
				<th>주문일자</th><th>주문 상품 정보</th><th>상품금액(수량)</th><th>수령인(주소)</th><th>주문상태</th>
			</tr>
			<c:set var="temp" value=""/>
			<c:forEach var="order" items="${list }" varStatus="vs">
			<tr>
				<c:if test="${order.ocode  != temp}">
					<td>
						<fmt:formatDate value="${order.otime }" pattern="yyyy-MM-dd hh:mm:ss"/>
					</td>
				</c:if>
				<c:if test="${order.ocode  eq temp}"><td class="noborder"></td></c:if>
				<td>${order.poname}</td>
				<td><fmt:formatNumber value="${order.poprice }" pattern="#,###,###"/><br>(${order.odcount}개)</td>
				<td>${order.oname }<br>${order.oaddr1}<br>${order.oaddr2}</td>
				<c:if test="${order.ocode  != temp}">
					<td>
						<span>${order.odelivery }</span><br>
						<form action="Order_detail_product.do">
							<input type="hidden" name="method" value="updateSp_order">
							<input type="hidden" name="ocode" value="${order.ocode }">
							<input type="hidden" name="cid" value="${member.cid }">
							<c:if test="${order.ostatus != '구매확정'}">
								<input type="submit" value="구매확정">
							</c:if>
							<c:if test="${order.ostatus eq '구매확정'}">
								<span>구매확정</span>
							</c:if>
						</form>
					</td>
				</c:if>
				<c:if test="${order.ocode  eq temp}"><td class="noborder"></td></c:if>
			</tr>
				<c:set var="temp" value="${order.ocode }"/>
			</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${paging.startpage>paging.blocksize }">
				[ <a href="${conPath }/Order_detail_product.do?method=listOrder_detailByCid&pagenum=${paging.startpage-1}&cid=${member.cid}">이전</a> ]
			</c:if>
			<c:forEach var="i" begin="${paging.startpage }" end="${paging.endpage }">
				<c:if test="${paging.currentpage==i }">
					[ <b> ${i }</b> ]
				</c:if>
				<c:if test="${paging.currentpage!=i }">
					[ <a href="${conPath }/Order_detail_product.do?method=listOrder_detailByCid&pagenum=${i }&cid=${member.cid}">${i }</a> ]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endpage<paging.pagecnt }">
				[ <a href="${conPath }/Order_detail_product.do?method=listOrder_detailByCid&pagenum=${paging.endpage+1}&cid=${member.cid}">다음</a> ]
			</c:if>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>