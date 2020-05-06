<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 작성</title>
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
	<div id="main">
	<div align="center">
	<hr width="500" color="#3a5485">
	<h2>문의 내용</h2>
		<hr width="500" color="#3a5485">
	<table>
		<tr><th>작성자 : </th><td colspan="3">
		<c:if test="${not empty detail.cid }">
			${detail.cname }						
		</c:if>
		<c:if test="${not empty detail.aid }">
			관리자						
		</c:if>
		</td></tr>
		<tr>
			<th>제목</th>
			<td>${detail.cqtitle }</td>
		</tr>
		<tr><th>작성일</th>
			<td colspan="3">
				<fmt:formatDate value="${detail.cqrdate }" pattern="YY/MM/dd(E)"/>
		 	</td>
		</tr>
		<tr><th>문의 내용 : </th>
			<td colspan="3" >
				<pre>${detail.cqcontent }</pre>
		 	</td>
		</tr>
		<tr><td colspan="4">
			<c:if test="${detail.cid eq member.cid || detail.aid eq admin.aid }">
						<button onclick="location.href='${conPath}/customerQna.do?method=modifyForm&pageNum=${param.pageNum }&cqcode=${detail.cqcode}'" class="btn1">수정하기</button>			
						<button onclick="location.href='${conPath}/customerQna.do?method=delete&pageNum=${param.pageNum }&cqcode=${detail.cqcode}'" class="btn2">삭제하기</button>			
			</c:if>
			<button onclick="location.href='${conPath}/customerQna.do?method=qnaList&pageNum=${param.pageNum }'" class="btn2">목록으로</button>
			<%-- <c:if test="${not empty admin }"> --%>
				<button onclick="location.href='${conPath}/customerQna.do?method=replyForm&cqcode=${detail.cqcode }&pageNum=${param.pageNum }'" class="btn1">답변작성</button>
			<%-- </c:if> --%>
			</td>
		</tr>
	</table>
	</div>
	</div>
<jsp:include page="../main/footer.jsp"/>
</body>
</html>