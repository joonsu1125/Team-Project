<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${conPath }/css/style.css" rel="stylesheet">
<link href="${conPath }/css/qna/qna.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" ></script>
<script type="text/javascript">
function trClicked(cqcode){
	location.href='${conPath}/customerQna.do?method=detail&cqcode='+cqcode+'&pageNum=${paging.currentpage}';
}
</script>
<style>
#qna_list td{
 word-break: break-all;
	height: 40px;
 border-bottom: 1px solid #cccccc;
}
#qna_list b{
 color: red;
}
#qna_list table{
	width: 1000px;
	border-collapse: collapse;
}
#qna_list .list_Menu{
font-size: 12px;
color: #808080;
border-collapse: collapse;
word-break: break-all;
margin: 0;
padding: 0;
background: #fefdf4;
}
#qna_list .list_Wrap:hover{
	cursor: pointer;
}
#qna_list .list_Wrap{
font-size: 12px;
color: #808080;
border-collapse: collapse;
word-break: break-all;
margin: 0;
padding: 0;
}
#qna_list .list_Wrap .left{
	width: 500px;
}
#qna_list .btnwrite{
padding: 0;
text-align: center;
margin: 10px auto;
padding-top: 10px;
}

.qna_list {
    margin: 0 auto 160px;
    padding-top : 50px;
    width: 1000px;
    text-align: center;
}
h2{
	text-align: center;
}
table {
	margin: auto;
}
.paging{
	width:100%;
	text-align: center;
}
</style>
</head>
<body>
<c:if test="${not empty resultMsg }">
	<script>
		alert('${resultMsg }');
	</script>
</c:if>
<jsp:include page="../main/header.jsp"/>

<div id="qna_list">
	<h2>고객문의 게시판</h2>
	<table>
		<tr class="list_Menu">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회수</th>
		</tr>
		<c:if test="${paging.total==0 }">
			<tr>
				<td colspan="5">
					작성된 문의가 없습니다.
				</td>
			</tr>
		</c:if>
		<c:if test="${paging.total!=0 }">
			<c:forEach var="qna" items="${list }" >
				<tr class="list_Wrap" onclick="trClicked(${qna.cqcode})">
				<td class="center">${qna.cqcode }</td>
				<td class="content left" id="left">
				<c:forEach var="i" begin="1" end="${qna.cqindent }">
					<c:if test="${i==qna.cqindent }">
						&nbsp;└─
					</c:if>
					<c:if test="${i!=qna.cqindent }">
						&nbsp; &nbsp; &nbsp;
					</c:if>
				</c:forEach>
				${qna.cqtitle }
				</td>
				<td class="center">
					<c:if test="${not empty qna.cid }">
					${qna.cname }
					</c:if>
					<c:if test="${not empty qna.aid }">
					관리자
					</c:if>
				</td>
				<td class="center"><fmt:formatDate value="${qna.cqrdate }" pattern="YY/MM/dd(E)"/></td>
				<td class="center">${qna.cqhit }</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div class="paging">
		<c:if test="${paging.startpage>paging.blocksize }">
			[<a href="${conPath }/customerQna.do?method=qnaList&pageNum=${paging.startpage-1}">이전</a>]
			
		</c:if>
		<c:forEach var="i" begin="${paging.startpage }" end="${paging.endpage }">
			<c:if test="${paging.currentpage==i }">
				[<b>${i }</b>]
			</c:if>
			<c:if test="${paging.currentpage!=i }">
				[<a href="${conPath }/customerQna.do?method=qnaList&pageNum=${i}">${i }</a>]
			</c:if>
		</c:forEach>
		<c:if test="${paging.endpage<paging.pagecnt }">
			[<a href="${conPath }/customerQna.do?method=qnaList&pageNum=${paging.endpage+1}">다음</a>]
		</c:if>
</div>
	<div class="btnwrite">
	<c:if test="${not empty member || not empty admin }">
		<button onclick="location.href='${conPath}/customerQna.do?method=writeForm'" class="btn1">문의하기</button>
	</c:if>
	</div>
</div>


<jsp:include page="../main/footer.jsp"/>
</body>
</html>