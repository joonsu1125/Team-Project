<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="conPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>S-Place</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/product/product.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script>
	function trClicked(pcode) {
		location.href = '${conPath}/product.do?method=detailProduct&pcode=' + pcode 
				+ '&pagenum=${paging.currentpage}';
	 }
</script>
</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="content">
		<div id="test">
			<table>
				<c:forEach var="product_product_option" items="${joinList }">
					<tr onclick="trClicked('${product_product_option.pcode}')">
						<th><img src="${conPath }/product_img/${product_product_option.pimage1 }" style="width: 100%;"><a href="${conPath }/product.do?method=productDetail&pcode=${product_product_option.pcode }&pagenum=${paging.currentpage }"></a>
						<br><br>
						상품명 : ${product_product_option.ptitle }<br>
						판매가격(최소가) : ${product_product_option.poprice}<br>
						<span class="mid">등록업체 : ${product_product_option.mid }</span></th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br>
	<br>
	<div class="paging">
		<c:if test="${paging.startpage>paging.blocksize }">
			[ <a href="${conPath }/main.do?pagenum=${paging.startpage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startpage }" end="${paging.endpage }">
			<c:if test="${paging.currentpage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentpage!=i }">
				[ <a href="${conPath }/main.do?pagenum=${i }">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endpage<paging.pagecnt }">
			[ <a href="${conPath }/main.do?pagenum=${paging.endpage+1}">다음</a> ]
		</c:if>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>