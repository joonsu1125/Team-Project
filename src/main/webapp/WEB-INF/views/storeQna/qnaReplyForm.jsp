<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>답글 작성</title>
	<link href="${conPath }/css/product/productRegister.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


</head>
<body>
	<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/storeQna.do?method=reply" method="post">
	<input type="hidden" name="pageNum" id="pageNum" value="${param.pageNum }"/>
    <input type="hidden" name="sqcode" id="sqcode" value="${detail.sqcode }"/>
    <input type="hidden" name="sqgroup" id="sqgroup" value="${detail.sqgroup }"/>
    <input type="hidden" name="sqstep" id="sqstep" value="${detail.sqstep }"/>
    <input type="hidden" name="sqindent" id="sqindent" value="${detail.sqindent }"/>
	<div id="main">
	<div align="center">
	<hr width="500" color="#3a5485">
	<h2>답글 작성</h2>
		<hr width="500" color="#3a5485">
	<table>
		<tr><th>작성자 : </th><td colspan="3">
		<c:if test="${not empty market }">
			<input type="hidden" name="mid" readonly="readonly" value="${market.mid }">
			<input type="text" readonly="readonly" value="${market.mname }">
		</c:if>
		<c:if test="${not empty member }">
			<input type="hidden" name="cid" readonly="readonly" value="${member.cid }">
			<input type="text" readonly="readonly" value="${member.cname }">
		</c:if>
		</td></tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="sqtitle"></td>
		</tr>
		<tr><th>답변 내용 : </th><td colspan="3"><textarea name="sqcontent" id="summernote"></textarea>
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
		 </td>
		 </tr>
		<tr><td colspan="4">
					<input type="button" value="취소" onclick="location.href='${conPath}/storeQna.do?method=qnaList&pageNum=${param.pageNum }'" class="btn2">
							<input type="submit" value="등록" class="btn1">
					</td>
				</tr>
	</table>
	</div>
	</div>
</form>

<jsp:include page="../main/footer.jsp"/>
</body>
</html>