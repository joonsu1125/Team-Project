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
<link href="${conPath }/css/product/unAnswerList.css" rel="stylesheet">
<style></style>
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function trClicked(pqcode) {
		location.href = '####.do?pqcode=' + pqcode
				+ '&pagenum=${paging.currentpage}';
	}
</script>
</head>
<body>
	<input type="hidden" name="mid" value="aaa">
	<div id="content">
		<h2>답변 필요한 Q&A</h2>
		<table>
			<tr>
				<th style="width: 70px;">번호</th>
				<th>제목</th>
				<th>문의자</th>
				<th>등록일</th>
			</tr>
			<c:forEach var="list" items="${unAnswerList }">
				<tr onclick="trClicked('${list.pqcode }')">
					<td>${list.pqcode }</td>
					<td>${list.pqtitle}</td>
					<td>${list.cid }</td>
					<td><fmt:parseDate value='${list.pqdate}' var='pqdate' pattern='yyyy-MM-dd' />
					<fmt:formatDate value="${pqdate}" pattern="yyyy-MM-dd" /></td>
					<!-- String형을 날짜로 변경하여 변수에 넣고 그 넣은 변수를 날짜 패턴으로 노출 -->
				</tr>
			</c:forEach>
		</table>
	</div>
	<br>
	<br>
	<div class="paging">
		<c:if test="${paging.startpage>paging.blocksize }">
			[ <a href="${conPath }/market.do?method=unAnswerList&mid=aaa&pagenum=${paging.startpage-1}">이전</a> ]
		</c:if>
		<c:forEach var="i" begin="${paging.startpage }" end="${paging.endpage }">
			<c:if test="${paging.currentpage==i }">
				[ <b> ${i }</b> ]
			</c:if>
			<c:if test="${paging.currentpage!=i }">
				[ <a href="${conPath }/market.do?method=unAnswerList&mid=aaa&pagenum=${i }">${i }</a> ]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endpage<paging.pagecnt }">
			[ <a href="${conPath }/market.do?method=unAnswerList&mid=aaa&pagenum=${paging.endpage+1}">다음</a> ]
		</c:if>
	</div>
</body>
</html>