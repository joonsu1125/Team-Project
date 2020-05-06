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
	function noticeWrap(ncode) {
		window.open('notice.do?method=noticeDetailForm&ncode='+ncode+'&pagenum=${paging.currentpage}', '', 'width=1000,height=700,left=100,top=100');
	}
	function writeBtn() {
		window.open('notice.do?method=noticeWriteForm', '', 'width=1000,height=700,left=100,top=100');
	}
</script>
<style>
#content td{
 word-break: break-all;
	height: 40px;
 border-bottom: 1px solid #cccccc;
}
#content b{
 color: red;
}
#content table{
	width: 1000px;
	border-collapse: collapse;
}
#content .noticeMenu{
font-size: 12px;
color: #808080;
border-collapse: collapse;
word-break: break-all;
margin: 0;
padding: 0;
background: #fefdf4;
}
#content .noticeWrap:hover{
	cursor: pointer;
}
#content .noticeWrap{
font-size: 12px;
color: #808080;
border-collapse: collapse;
word-break: break-all;
margin: 0;
padding: 0;
}
#content .noticeWrap .left{
	width: 500px;
}
#content .btnwrite{
padding: 0;
text-align: center;
margin: 10px auto;
padding-top: 10px;
}
#content > h2{
	text-align: center;
}

</style>
</head>
<body>
	<jsp:include page="../main/header.jsp" />
	<c:if test="${not empty deleteResult }">
		<script>
			alert('${deleteResult}');
			opener.location.href='notice.do?method=noticeList';
			window.close();
		</script>
	</c:if>
	<c:if test="${not empty replyResult }">
		<script>
			var replyResult = "답변글 등록 완료";
			alert(replyResult);
			opener.location.href='notice.do?method=noticeList';
			window.close();
		</script>
	</c:if>
	<c:if test="${not empty writeResult }">
		<script>
			var writeResult = "공지사항 등록 성공";
			alert(writeResult); 
			opener.location.href='notice.do?method=noticeList';
			window.close();
		</script>
	</c:if>
	<c:if test="${not empty modifyResult }">
		<script>
			var modifyResult = "공지사항 수정 성공";
			alert(modifyResult);
			opener.location.href='notice.do?method=noticeList';
			window.close();
		</script>
	</c:if>
	<div id="content">
		<h2>공지사항</h2>
		<table>
			<tr class="noticeMenu">
				<th>번호</th><th>제목</th><th>등록일</th><th>조회수</th>
			</tr>
			<c:forEach var="notice" items="${noticeList}">
				<tr class="noticeWrap" onclick="noticeWrap('${notice.ncode}')">
					<td class="center">${notice.ncode }</td>
					<td class="left" id="ntitle">
						<c:forEach var="i" begin="1" end="${notice.nindent }">
							<c:if test="${i==notice.nindent }">
								┗─ ⓡ 
							</c:if>
							<c:if test="${i!=notice.nindent }">
								&nbsp; &nbsp;
							</c:if>
						</c:forEach>
						${notice.ntitle }
					</td>
					<td class="center"><fmt:formatDate value="${notice.nrdate }" pattern="yyyy/MM/dd"/></td>
					<td class="center">${notice.nhit}</td>
				</tr>
			</c:forEach>
		</table>
		<div class="paging">
			<c:if test="${paging.startpage>paging.blocksize }">
				[<a href="${conPath }/notice.do?method=noticeList&pagenum=${paging.startpage-1}">이전</a>]
			</c:if>
			<c:forEach var="i" begin="${paging.startpage }" end="${paging.endpage }">
				<c:if test="${paging.currentpage==i }">
					[<b>${i }</b>]
				</c:if>
				<c:if test="${paging.currentpage!=i }">
					[<a href="${conPath }/notice.do?method=noticeList&pagenum=${i}">${i }</a>]
				</c:if>
			</c:forEach>
			<c:if test="${paging.endpage<paging.pagecnt }">
				[<a href="${conPath }/notice.do?method=noticeList&pagenum=${paging.endpage+1}">다음</a>]
			</c:if>
		</div>
		<div class="btnwrite">
			<button class="btn1"  onclick="writeBtn()">공지사항 등록</button>
<%-- 			location.href='${conPath}/notice.do?method=noticeWriteForm' --%>
		</div>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>