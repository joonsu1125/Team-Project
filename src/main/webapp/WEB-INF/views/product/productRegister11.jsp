<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/product/productRegister.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
	<script>
			 $(document).ready(function() {
				 alert(1);
				 $('#summernote').summernote({
				        height: 300,
				        minHeight: null,
				        maxHeight: null,
				        lang : 'ko-KR',
				        onImageUpload: function(files, editor, welEditable) {
				                sendFile(files[0], editor, welEditable);
				            }

				    });
			 });
	</script>
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="main">
	<div align="center">
		<hr width="500" color="#3a5485">
		<h2>상품등록</h2>
		<hr width="500" color="#3a5485">
		<form action="${conPath }/product.do?method=pRegister" method="post" enctype="multipart/form-data">
			<input type="hidden" name="mid" value="aaa">
			<input type="hidden" name="typecode" value="1-1">
			<input type="hidden" name="pcode" value="1">
			<table>
				<tr><th>상품명 : </th><td colspan="3"><input type="text" name="ptitle" required="required"></td></tr>
				<tr><th>상품소개 : </th><td colspan="3"><textarea name="pcontent" id="summernote"></textarea>
				<script>
			 $(document).ready(function() {
				 $('#summernote').summernote({
				        height: 300,
				        minHeight: null,
				        maxHeight: null,
				        lang : 'ko-KR',
				        onImageUpload: function(files, editor, welEditable) {
				                sendFile(files[0], editor, welEditable);
				            }

				    });
			 });
		 </script>
				</td></tr>
				<tr><th>이미지1 : </th><td colspan="3"><input type="file" name="file1" required="required"></td></tr>
				<tr><th>이미지2 : </th><td colspan="3"><input type="file" name="file2"></td></tr>
				<tr><th>이미지3 : </th><td colspan="3"><input type="file" name="file3"></td></tr>
				<tr id="top">
					<td colspan="4">
						<a>원가</a><a>수량</a><a>판매가격</a><a>상품분류</a>
					</td>
				</tr>
				<tr id="option">
					<td colspan="4">
						<input type="text" name="ponet" required="required">
						<input type="text" name="postock" required="required">
						<input type="text" name="poprice" required="required">
						<select name="poname">
							<option>식품</option>
							<option>농산</option>
							<option>수산</option>
							<option>축산</option>
						</select>
					</td>
				</tr>
				<tr><td colspan="4">
					<input type="submit" value="상품등록">
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>