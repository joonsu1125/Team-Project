<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/order/order.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready(function() {
		
	})
</script>
<style>
#content #mypagewrap{
	width: 1000px;
	height: 60px;
	display:block;
	margin-top: 20px;
}
#content #mypagewrap .menu_list{
width: 1000px;
height: 60px;
font-size: 12px;
color: #676767;
vertical-align: top;
border: 0;
margin:160px 0 0 0;
padding: 0;
position: absolute;
top: 0;
}
#content .menu1 ,#content .menu2,#content .menu3,#content .menu4{
width: 240px;
height: 60px;
font-size: 0;
border: 0;
margin: 0 auto;
padding: 0;
list-style: none;
display: inline-block;
vertical-align: top;
background: #fff;
 border-radius: 10px;
 border: 3px solid #3a5485;
box-sizing: border-box; 
cursor: pointer;
text-align: center;
}
#content .menu1{
	margin-left: 15px;
}
#content .menu1 a,#content .menu2 a,#content .menu3 a,#content .menu4 a{
width: 240px;
height: 60px;
font-size: 23px;
font-weight:bold;
line-height: 60px;
margin: 0 auto;
 color: #3a5485;
 display: block;
}
/* 최근주문내역 ****************************************************************** */
/* 진행중인 주문 */
#content #order_info{
width:1000px;
margin-top: 60px;
padding: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
}

#content #order_info .order_title{
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
margin: 0 0 0 0;
padding: 0 0 10px 0;
font-size: 16px;
}
#content #order_info .order_info_content{
width:1000px;
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
margin: 0 0 30px 0;
padding: 35px 0 35px 0;
font-size: 0;
border: 1px solid #e3e3e3;
border-top: 1px solid #999999;
text-align: center;
}
#content #order_info .order_info_content ol{
text-align: center;
margin: 0;
padding: 0;
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
list-style: none;
display: inline-block;
width: 80%;
font-size: 0;
border-right: 1px solid #e3e3e3;
vertical-align: middle;
}
#content #order_info .order_info_content ol li:nth-child(1){
margin: 0;
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
list-style: none;
display: inline-block;
width: 10%;
min-width: 66px;
padding: 0 10px 0 30px;
font-size: 13px;
text-align: center;
padding-left: 10px;
background: none 0;
}
#content #order_info .order_info_content ol li:nth-child(2),
#content #order_info .order_info_content ol li:nth-child(3),
#content #order_info .order_info_content ol li:nth-child(4),
#content #order_info .order_info_content ol li:nth-child(5),
#content #order_info .order_info_content ol li:nth-child(6){
margin: 0;
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
list-style: none;
display: inline-block;
width: 10%;
min-width: 66px;
padding: 0 10px 0 30px;
font-size: 13px;
text-align: center;
}
#content #order_info .order_info_content ol li:nth-child(1) b,
#content #order_info .order_info_content ol li:nth-child(2) b,
#content #order_info .order_info_content ol li:nth-child(3) b,
#content #order_info .order_info_content ol li:nth-child(4) b,
#content #order_info .order_info_content ol li:nth-child(5) b,
#content #order_info .order_info_content ol li:nth-child(6) b{
list-style: none;
text-align: center;
margin: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: block;
padding: 0 0 15px 0;
}
#content #order_info .order_info_content ol li:nth-child(1) strong,
#content #order_info .order_info_content ol li:nth-child(2) strong,
#content #order_info .order_info_content ol li:nth-child(3) strong,
#content #order_info .order_info_content ol li:nth-child(4) strong,
#content #order_info .order_info_content ol li:nth-child(5) strong,
#content #order_info .order_info_content ol li:nth-child(6) strong{
letter-spacing: -0.6px;
list-style: none;
font-weight: 500;
display: inline-block;
width: 52px;
height: 52px;
color: #ffffff;
font-size: 18px;
background-color:#cccccc;
border-radius:100px;
text-align: center;
vertical-align: middle;
box-sizing: border-box;
line-height: 52px;
}
#content #myCouponContent{
margin: 0;
padding: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
}
#content #myCouponContent span{
margin: 0;
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: block;
padding: 20px 0 10px 0;
font-size: 14px;
}
#content #myCouponContent span strong {
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
font-size: 14px;
font-weight: 500;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div id="mypagewrap">
			<div id="mainmenu">
				<ul class="menu_list">
					<li class="menu1">
						<a href="Order_detail_product.do?method=listOrder_detailByCid&cid=${member.cid }">전체 주문 내역</a>
					</li>
					<li class="menu2">
						<a href="cart.do?method=cart&cid=${member.cid }">장바구니</a>
					</li>
					<li class="menu3">
						<a href="${conPath }/coupon.do?method=myCoupon&cid=${member.cid}">쿠폰</a>
					</li>
					<li class="menu4">
						<a href="${conPath }/myAddressList.do?method=myAddress&cid=${member.cid}">주소지 설정</a>
					</li>
				</ul>
			</div>	
		</div>
		<div id="ordertitle">
				<p>최근 주문내역</p>
		</div>
		<div id="myorderlist">
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
							<input type="hidden" name="pagenum" value="${paging.currentpage }">
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
		<div id="order_info">
				<div class="order_title">
					<h3>진행 중인 주문</h3>
				</div>
				<div class="order_info_content">
					<ol>
						<li><b>임금대기</b><strong>0</strong></li>
						<li><b>결제완료</b><strong>0</strong></li>
						<li><b>상품준비중</b><strong>0</strong></li>
						<li><b>배송중</b><strong>0</strong></li>
						<li><b>배송완료</b><strong>0</strong></li>
						<li><b>구매확정</b><strong>0</strong></li>
					</ol>
					<div class="order_case_list">
						<ul>
							<li>
								<b>▶  취소</b>
								<span>0</span>건
							</li>
							<li>
								<b>▶  교환</b>
								<span>0</span>건
							</li>
							<li>
								<b>▶  반품</b>
								<span>0</span>건
							</li>
						</ul>
					</div>
				</div>
			</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>