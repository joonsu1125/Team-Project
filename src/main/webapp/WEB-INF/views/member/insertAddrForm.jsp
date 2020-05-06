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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="${conPath }/js/address.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<link href="${conPath }/css/style.css" rel="stylesheet">
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
#content  #addresstitle{
display: block;
color: #444;
vertical-align: top;
border: 0;
margin: 20px 0 0 0;
padding: 0;
padding-top: 14px;
overflow: hidden;
}
#content #addresstitle p{
font-weight:bold;
font-size: 1.5em;
float: left;
}
#content #addresstitle button{
float: left;
margin-left: 60px;
} 
#content #myaddresslist{
color: #444;
display: block;
}
#content #myaddresslist table{
border-collapse: collapse;
margin: 0 auto;
}
#content #myaddresslist .fieldname{
color: #676767;
border-collapse: collapse;
border-spacing: 0;
margin: 0;
padding: 0;
}
#content #myaddresslist .fieldname th:nth-child(1) {
text-align:center;
width:130px;
border-collapse: collapse;
border-spacing: 0;
margin: 0;
line-height: 18px;
color: #777;
font-size: 11px;
border-top: 1px solid #666;
border-bottom: 1px solid #bbb;
background: #f7f7f7;
border-left: none;
text-align: center;
}
#content #myaddresslist .fieldname th:nth-child(2){
text-align:center;
width:130px;
border-collapse: collapse;
border-spacing: 0;
margin: 0;
line-height: 18px;
color: #777;
font-size: 11px;
text-align: center;
border-top: 1px solid #666;
border-bottom: 1px solid #bbb;
border-left: 1px solid #dedede;
background: #f7f7f7;
}
#content #myaddresslist .fieldname th:nth-child(3){
text-align:center;
width:500px;
border-collapse: collapse;
border-spacing: 0;
margin: 0;
line-height: 18px;
color: #777;
font-size: 11px;
text-align: center;
border-top: 1px solid #666;
border-bottom: 1px solid #bbb;
border-left: 1px solid #dedede;
background: #f7f7f7;
}
#content #myaddresslist .fieldname th:nth-child(4){
text-align:center;
width:120px;
border-collapse: collapse;
border-spacing: 0;
margin: 0;
line-height: 18px;
color: #777;
font-size: 11px;
text-align: center;
border-top: 1px solid #666;
border-bottom: 1px solid #bbb;
border-left: 1px solid #dedede;
background: #f7f7f7;
}
#content #myaddresslist .fieldname th:nth-child(5){
text-align:center;
width:120px;
border-collapse: collapse;
border-spacing: 0;
margin: 0;
line-height: 18px;
color: #777;
font-size: 11px;
text-align: center;
border-top: 1px solid #666;
border-bottom: 1px solid #bbb;
border-left: 1px solid #dedede;
background: #f7f7f7;
}
#content #myaddresslist table .fieldvalue td{
text-align: center;
border-collapse: collapse;
border-spacing: 0;
border: 1px solid #cccccc;
}
.btn1{
	background: #3a5485;
    color: #fff;
	font-size: 12px;
    font-weight: 700;
    display: inline-block;
    position: relative;
    width: 100px;
    line-height: 50px;
    height:30px;
    border: 2px solid #3a5485;
    border-radius: 10px;
    text-align: center;
}
.btnwrite{
padding: 0;
text-align: center;
margin: 10px auto;
padding-top: 10px;
}
form {
	width: 380px;
	margin: 4em auto;
	padding: 3em 2em 2em 2em;
	background: #fafafa;
	border: 1px solid #ebebeb;
	box-shadow: rgba(0,0,0,0.14902) 0px 1px 1px 0px,rgba(0,0,0,0.09804) 0px 1px 2px 0px;
}
table {
	margin: 0 auto;
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
						<a href="">정보수정</a>
					<li class="menu3"><a href="${conPath }/coupon.do?method=myCoupon&cid=${member.cid}">쿠폰</a></li>
					<li class="menu4">
						<a href="${conPath }/myAddressList.do?method=myAddress&cid=${member.cid}">주소지 설정</a>
					</li>
				</ul>
			</div>	
		</div>
		<div>
		<form action="${conPath}/myAddressList.do?method=insertAddr" method="post">
			<input type="hidden" name="cid" value="${member.cid }" />
				<h2>회원 주소 입력</h2>
			<table>
				<tr>
					<td>
						<input type="text" id="addrname" name="addrname" placeholder="배송지이름">
					</td>
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
			</table>
			<div class="btnwrite">
			<input type="submit" value="주소 추가" class="btn1" />
			<a href="${conPath }/myAddressList.do?method=myAddress&cid=${member.cid}" class="btn1">취소</a>
			</div>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>