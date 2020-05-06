<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
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
#content #mycouponwrap{
display: block;
}
#content #mycouponwrap  #top_info{
padding: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: table;
width: 100%;
margin: 0 0 35px 0;
border: 1px solid #e3e3e3;
background: #f7f9f8;
border-top: 1px solid #999;
}
#content #mycouponwrap #top_info .mygrade{
margin: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: table-cell;
width: 30%;
padding: 20px 0 20px 0;
text-align: center;
vertical-align: middle;
background: #f7f9f8;
}
#content #mycouponwrap #top_info .mygrade .grade_txt{
text-align: center;
margin: 0;
padding: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
}
#content #mycouponwrap #top_info .myCouponCount{
margin: 0;
padding: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: table-cell;
width: 69%;
vertical-align: middle;
background: #ffffff;
}
#content #mycouponwrap #top_info .myCouponCount ul{
margin: 0;
font-weight: 400;
color: #333;
letter-spacing: -0.6px;
list-style: none;
width: 100%;
padding: 27px 10px 27px 10px;
font-size: 0;
line-height: 1;
}
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(1),
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(2){
margin: 0;
padding: 0;
font-weight: 400;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
list-style: none;
display: inline-block;
width: 33%;
font-size: 14px;
text-align: center;
border-left: none 0;


}
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(1) span:nth-child(1),
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(1) span:nth-child(2) {
list-style: none;
text-align: center;
margin: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: block;
padding: 0 10px 0 10px;	
}
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(1) span:nth-child(2) em,
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(2) span:nth-child(2) em{
list-style: none;
text-align: center;
margin: 0;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
font-style: normal;
display: block;
padding: 15px 0 15px 0;
font-weight: bold;
}
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(1) span:nth-child(2) strong,
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(2) span:nth-child(2) strong
{
list-style: none;
text-align: center;
line-height: 1.3;
letter-spacing: -0.6px;
font-weight: 500;
padding: 0 3px 0 0;
font-size: 24px;
color: red;
}
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(2) span:nth-child(1),
#content #mycouponwrap #top_info .myCouponCount ul li:nth-child(2) span:nth-child(2) {
list-style: none;
text-align: center;
margin: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
display: block;
padding: 0 10px 0 10px;
}
/* 쿠폰내역 */
#content #myCouponContent {
display: block;
margin-bottom: 20px;
}
#content #myCouponContent table{
border-collapse: collapse;
}
#content #myCouponContent table tr{
font-weight: 400;
font-size: 14px;
line-height: 1.3;
color: #333;
letter-spacing: -0.6px;
border-spacing: 0;
text-align: center;
}
#content #myCouponContent table tr th {
border-spacing: 0;
border-collapse: collapse;
margin: 0;
font-weight: 400;
font-size: 14px;
line-height: 1.3;
letter-spacing: -0.6px;
color: #333;
padding: 9px 10px 10px 10px;
border-top: 1px solid #999999;
border-bottom: 1px solid #dbdbdb;
background: #f7f7f7;
height: 40px;	
}
#content #myCouponContent table tr th:nth-child(1){
width: 280px;
}
#content #myCouponContent table tr th:nth-child(2){
width: 175px;
border-right: 1px solid #999999;
border-left: 1px solid #999999;
}
#content #myCouponContent table tr th:nth-child(3){
width: 140px;
}
#content #myCouponContent table tr td{
border: 1px solid #cccccc;
}
</style>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div id="mypagewrap">
			<div id="mainmenu">
				<ul class="menu_list">
					<li class="menu1"><a href="Order_detail_product.do?method=listOrder_detailByCid&cid=${member.cid }">전체 주문 내역</a></li>
					<li class="menu2"><a href="cart.do?method=cart&cid=${member.cid }">장바구니</a>
					<li class="menu3"><a href="coupon.do?method=myCoupon&cid=${member.cid}">쿠폰</a></li>
					<li class="menu4"><a href="${conPath }/myAddressList.do?method=myAddress&cid=${member.cid}">주소지 설정</a>
					</li>
				</ul>
			</div>	
		</div>
		<div id="mycouponwrap">
			<div id="top_info">
				<div class="mygrade">
					<div class="grade_txt">
						<p>XXX님의</p>
						<p>회원등급은<span>'일반회원'</span>입니다.</p>
					</div>
				</div>
				<div class="myCouponCount">
					<ul>
						<li>
							<span>
								<img src="${conPath }/img/coupon.PNG" width="68" height="68" />
							</span>
							<span>
								<em>쿠폰</em>
								<strong>${count }</strong>장
							</span>
						</li>
						<li>
							<span>
								<img src="${conPath }/img/amount.PNG" width="68" height="68" />
							</span>
							<span>
								<em>적립금</em>
								<strong>${member.cpoint }</strong>원
							</span>
						</li>
					</ul>
				</div>
			</div>
			<div id="myCouponContent">
				<span>
					<strong>쿠폰 내역</strong>
				</span>
				<table>
					<tr>
						<th>쿠폰명</th>
						<th>혜택</th>
					</tr>
					<c:forEach var="list" items="${couponList }">
						<tr>
						<td>${list.cuname }</td>
						<td>${list.cusale }% 할인</td>
						</tr>
					</c:forEach>

				</table>
			</div>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>