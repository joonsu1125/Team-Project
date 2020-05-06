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
#content #list_content {
	width: 1200px;
	margin: 30px;
}

#content #list_content table {
	font-size: 12px;
	margin: 0;
	padding: 0;
	color: #676767;
	table-layout: fixed;
	width: 1000px;
	border-collapse: collapse;
	border-top: 1px solid #a4a9b0;
	border-bottom: 1px solid #ececec;
}

#content #list_content tr:hover {
	cursor: pointer;
}

#content #list_content td, #content #list_content th {
	text-align: center;
	padding: 5px;
	border-bottom: 1px solid #cccccc;
}
#content #list_content table .list_head{
font-size: 12px;
color: #676767;
border-collapse: collapse;
margin: 0;
padding: 0;
}
#content #list_content table .list_body{
color: #333;
letter-spacing: -1px;
border-collapse: collapse;
border-spacing: 0;
}
#content #list_content th {
	background-color: #f5f5f5;
}

#content #list_content .left {
	text-align: left;
}
#content #list_content #list_wrap .paging {
	width: 1000px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="content">
		<div id="list_content">
			<div id="list_wrap">
				<table>
					<caption>회원별 주문리스트</caption>
					<tr class="list_head">
						<th>번호</th>
						<th>이름</th>
						<th>상품</th>
						<th>수량</th>
						<th>총금액</th>
						<th>주문일</th>
						<th>배송상황</th>
					</tr>
					<c:forEach var="list" items="${list }">
						<tr class="list_body">
							<td>${list.ocode }</td>
							<td>${list.cid }</td>
							<td>${list.poname }</td>
							<td>${list.odcount }</td>
							<td>${list.osum }</td>
							<td>${list.otime }</td>
							<td>${list.odelivery }</td>
						</tr>
					</c:forEach>
				</table>
				<div class="paging">
					<c:if test="${paging.startpage>paging.blocksize }">
						[<a
							href="${conPath }/Order_detail_product_mid.do?method=listOrder_detailByCid&pagenum=${paging.startpage-1}">이전</a>]
					</c:if>
					<c:forEach var="i" begin="${paging.startpage }"
						end="${paging.endpage }">
						<c:if test="${paging.currentpage==i }">
							[<b>${i }</b>]
						</c:if>
						<c:if test="${paging.currentpage!=i }">
							[<a
								href="${conPath }/Order_detail_product_mid.do?method=listOrder_detailByCid&pagenum=${i}">${i }</a>]
						</c:if>
					</c:forEach>
					<c:if test="${paging.endpage<paging.pagecnt }">
						[<a
							href="${conPath }/Order_detail_product_mid.do?method=listOrder_detailByCid&pagenum=${paging.endpage+1}">다음</a>]
					</c:if>
				</div>
			</div>
		</div>
	</div>
</body>
</html>