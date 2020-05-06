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
<link href="${conPath }/" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	
});
</script>
</head>
<body>
	<div align="center">
		<hr width="500" color="green">
		<h2>상품등록</h2>
		<hr width="500" color="green">
		<form action="${conPath }/product_option.do?method=RProduct_option" method="post">
			<div>상품옵션명:
				<select name="poname">
						<option>식품</option>
						<option>농산</option>
						<option>수산</option>
						<option>축산</option>
				</select>
			</div>
			<table>
				<tr><th>원가 : </th><td><input type="text" name="ponet" required="required"></td></tr>
				<tr><th>수량 : </th><td><input type="text" name="postock" required="required"></td></tr>
				<tr><th>판매가격 : </th><td><input type="text" name="poprice" required="required"></td></tr>
				<tr><th>소분류코드 : </th><td><input type="text" name="typecode" required="required"></td></tr>
				<tr><th>대분류코드 : </th><td><input type="text" name="pcode" required="required"></td></tr>
				<tr><td colspan="2">
					<input type="submit" value="상품등록">
				</td>
			</table>
		</form>
	</div>
</body>
</html>