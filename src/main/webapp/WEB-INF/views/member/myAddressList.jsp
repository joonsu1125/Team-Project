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
</style>
<script>
$(document).ready(function(){
	// 기본주소 설정하기
	$('#defaultSet').click(function() {
		var addrcode = $('input[name="addrcode"]:checked').val();
		var cid = $('input[name="cid"]').val();
		var temp = confirm('기본주소로 설정하시겠습니까?');
		if(temp){
			location.href="${conPath }/myAddressList.do?method=defaultAddr&addrcode="+addrcode+"&cid="+cid;
		}
	});
	
	
});
function deleteAddress(addrcode, cid){
	var selectCode = $('input[name="addrcode"]:checked').val();
	if(addrcode == selectCode){
		alert("기본설정주소는 삭제할수 없습니다.");
	} else {
		location.href="${conPath }/myAddressList.do?method=deleteAddr&addrcode="+selectCode+"&cid="+cid;
	}
}
</script>
</head>
<body>
<c:if test="${not empty addrMsg }">
	<script>
		alert('${addrMsg }');
	</script>
</c:if>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<div id="mypagewrap">
			<div id="mainmenu">
				<ul class="menu_list">
					<li class="menu1">
						<a href="Order_detail_product.do?method=listOrder_detailByCid&cid=${member.cid }">전체 주문 내역</a>
					</li>
					<li class="menu2">
						<a href="cart.do?method=cart&cid=${member.cid }">장바구니</a></li>
					<li class="menu3"><a href="coupon.do?method=myCoupon&cid=${member.cid}">쿠폰</a></li>
					<li class="menu4">
						<a href="${conPath }/myAddressList.do?method=myAddress&cid=${member.cid}">주소지 설정</a>
					</li>
				</ul>
			</div>	
		</div>
		<div id="addresstitle">
			<h3>주소설정</h3><h3>현재 ${addrCnt }개 주소목록 등록됨</h3>
		</div>	
		<div id="myaddresslist">
		<form action="${conPath}/myAddressList.do?method=modifyAddrForm" method="post">
		<input type="hidden" id="cid" name="cid" value="${member.cid }" />
			<table>
				<tr class="fieldname">
					<th>선택</th><th>배송지명</th><th>주소</th>
				</tr>
				<c:if test="${empty myAddrList }">
				<tr class="fieldvalue">
					<td colspan="3">현재 등록된 주소가 없습니다.</td>
				</tr>
				</c:if>
				<c:if test="${not empty myAddrList }">
					<c:forEach var="list" items="${myAddrList }">
						<tr class="fieldvalue">
						<c:if test="${member.addrcode eq list.addrcode }">
							<td><input type="radio" name="addrcode" value="${list.addrcode }" id="${list.addrcode }" class="check" checked="checked"></td>
						</c:if>
						<c:if test="${member.addrcode != list.addrcode }">
							<td><input type="radio" name="addrcode" value="${list.addrcode }" id="${list.addrcode }" class="check" ></td>
						</c:if>
						<td>${list.addrname }</td>
						<td>${list.caddr1 } ${list.caddr2 } ${list.cpost }</td>
						<td>
						<%-- <a href="${conPath }/myAddressList.do?method=deleteAddr&addrcode=${list.addrcode}&cid=${member.cid }" onclick="deleteAddress(${member.addrcode}, ${member.cid });">삭제하기</a> --%>
						<button type="button" name="button" class="btn2" onclick="deleteAddress('${member.addrcode}', '${member.cid }')">삭제하기</button>
						</td>
						</tr>
					</c:forEach>
				</c:if>
			</table>
			<div class="btnwrite">
			<a href="${conPath }/myAddressList.do?method=insertAddrForm" class="btn1">주소 추가하기</a>
			<input type="submit" value="주소 수정하기" class="btn1" />
			<%-- <a href="${conPath }/myAddressList.do?method=modifyAddrForm" class="btn1">주소 수정하기</a> --%>
			<!-- <a type="button" id="defaultSet" class="btn1">기본주소로 설정</a> -->
			<button type="button" name="defaultSet" id="defaultSet" class="btn1">기본주소로 설정</button>
			</div>
			</form>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp"/>
</body>
</html>