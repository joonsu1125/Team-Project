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
</head>
<body>
	
	<div id="content">
		<form action="${conPath }/notice.do?method=noticeReply" method="post">
			<input type="hidden" name="ncode" value="${noticeReply.ncode }">
			<input type="hidden" name="ngroup" value="${noticeReply.ngroup }">
			<input type="hidden" name="nstep" value="${noticeReply.nstep }">
			<input type="hidden" name="nindent" value="${noticeReply.nindent }">
			<input type="hidden" name="pagenum" value="${param.pagenum}">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="ntitle"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="50" cols="50" name="ncontent" style="resize:none "></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" class="btn1" value="확인">
									<input type="reset" class="btn2" value="취소">
									<input type="button" class="btn1" value="닫기" onclick="location.href='${conPath}/notice.do?method=noticeList'">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>