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
<link href="${conPath }/css/product/product.css" rel="stylesheet">
<style></style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	function trClicked(pcode) {
		location.href = '${conPath}/product.do?method=detailProduct&pcode=' + pcode 
				+ '&pagenum=${paging.currentpage}';
	 }
</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="content">
		<h2>상품 목록</h2>
		<p><a href="${conPath }/product.do?method=productRegister">상품 등록</a></p>
		<div id="test">
			<table>
				<c:forEach var="product_product_option" items="${joinList }">
					<tr onclick="trClicked('${product_product_option.pcode}')">
<<<<<<< HEAD
						<th><img src="${conPath }/product_img/${product_product_option.pimage1 }">
						<a href="${conPath }/product.do?method=productDetail&pcode=${product_product_option.pcode }&pagenum=${paging.currentpage }"></a>
=======
						<th><img src="${conPath }/productUpload/${product_product_option.pimage1 }" style="width: 100%; height:290px;"><a href="${conPath }/product.do?method=detailProduct&pcode=${product_product_option.pcode }&pagenum=${paging.currentpage }"></a>
>>>>>>> refs/remotes/origin/taehun7737
						<br><br>
						상품명 : ${product_product_option.ptitle }<br>
						판매가격(최소가) : ${product_product_option.poprice}<br>
						등록업체 : ${product_product_option.mid }</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<br>
	<br>
	<div class="paging">
		<c:if test="${paging.startpage>paging.blocksize }">
			[ <a href="${conPath }/product.do?method=joinList&pagenum=${paging.startpage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startpage }" end="${paging.endpage }">
			<c:if test="${paging.currentpage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentpage!=i }">
				[ <a href="${conPath }/product.do?method=joinList&pagenum=${i }">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endpage<paging.pagecnt }">
			[ <a href="${conPath }/product.do?method=joinList&pagenum=${paging.endpage+1}">다음</a> ]
		</c:if>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>