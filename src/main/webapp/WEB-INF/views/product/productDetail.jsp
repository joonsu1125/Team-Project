<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/product/style.css" rel="stylesheet">
</head>
<body>
	<div id="content">
		<table>
			<caption>${productDetail.pcode }번 상품 상세보기</caption>
				<tr><th>상품명</th><td colspan="3">${productDetail.ptitle }</td></tr>
				<tr><th>상품소개</th><td colspan="3">${productDetail.pcontent }</td></tr>
				<tr><th>상품이미지</th>
					<td><img src="${conPath }/productUpload/${productDetail.pimage1 }"></td>
					<td><img src="${conPath }/productUpload/${productDetail.pimage2 }"></td>
					<td><img src="${conPath }/productUpload/${productDetail.pimage3 }"></td>
				</tr>
				<tr><th>상품분류</th><td colspan="3">${product_option.poname }</td></tr>
				<tr><th>등록업체</th><td colspan="3">${productDetail.mid }</td></tr>
				<tr><td colspan="4">
				
 		</table>
 	</div>
</body>
</html>