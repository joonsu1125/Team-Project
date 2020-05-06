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
	function reset() {
		window.close();
	}
</script>
<style>
#questionForm {
	margin: 0;
	padding: 0;
	position: fixed;
	background-color: #fff;
	z-index: 5;
	font-size: 12px;
	width: 640px;
	border: 1px solid #111111;
	display: block;
}

th {
	width: 120px;
	padding: 18px 15px;
	vertical-align: top;
	border-right: 1px solid #cccccc;
	border-bottom: 1px solid #cccccc;
}

td {
	border-bottom: 1px solid #cccccc;
	padding: 10px 20px;
}

h2 {
	margin: 0;
	padding: 25px 20px;
	background: #eee;
	font-size: 16px;
}

#questionForm .question_content {
	font-size: 12px;
	margin: 0;
	padding: 30px 20px 0;
}

#questionForm .question_content table {
	font-size: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border-top: 2px solid #707070;
}

#questionForm .question_content table tbody {
	font-size: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

#questionForm .question_content table tbody tr {
	font-size: 100%;
	border-collapse: collapse;
	border-spacing: 0;
} 
#questionForm .question_content .question_info{
	font-size : 12px;
	padding: 0;
	margin: 20px 0;
}
#questionForm .question_content_footer {
font-size: 12px;
text-align: center;
margin-bottom: 20px;
}
</style>
</head>
<body>
	<c:if test="${not empty modifyQnaResult }">
		<script>
			var modifyQnaResult = "문의가 수정 되었습니다."
			alert(modifyQnaResult);
			opener.location.href = 'product.do?method=detailProduct&pcode=${param.pcode }&pagenum=${param.pagenum}';
			window.close();
		</script>
	</c:if>
	<c:if test="${not empty deleteQnaResult }">
	<script>
			var deleteQnaResult = "문의가 삭제 되었습니다."
			alert(deleteQnaResult);
			opener.location.href = 'product.do?method=detailProduct';
			window.close();
		</script>
	</c:if>
	<div id="questionForm">
		<form action="${conPath }/product_qna.do?method=modifyQna">
			<input type="hidden" name="method" value="modifyQna">
			<input type="hidden" name="pqcode" value="${modifyQnaForm.pqcode }">
			<input type="hidden" name="pcode" value="${param.pcode }">
			<input type="hidden" name="pagenum" value="${param.pagenum}">
			<div class="question_content">
				<h2>상품 문의</h2>
				<table>
					<tbody>
						<tr>
							<th>제목</th>
							<td><input type="text" name="pqtitle" style="width: 300px;" value="${modifyQnaForm.pqtitle }"></td>
						<tr>
							<th>문의내용</th>
							<td><textarea name="pqcontent" cols="40" rows="10" style="resize: none">${modifyQnaForm.pqcontent }</textarea></td>
						</tr>
						<tr>
							<th>비밀글 여부</th>
							<td>
								<input type="radio" name="pqsecret" value="1" 
									<c:if test="${modifyQnaForm.pqsecret eq 1 }">checked="checked"</c:if>>YES
								<input type="radio" name="pqsecret" value="0" 
									<c:if test="${modifyQnaForm.pqsecret eq 0 }">checked="checked"</c:if>>NO
							</td>
						</tr>
					</tbody>
				</table>
				<div class="question_info">
					* 개인정보(주민번호, 연락처, 주소, 계좌번호, 카드번호등)가 포함되지 않도록 유의해주세요.
				</div>
			</div>
			<div class="question_content_footer">
					<input type="submit" class="btn2" value="확인" style="width: 100px;"> 
					<input type="button" class="btn1" value="삭제" style="width: 100px;" 
								onclick="location.href='${conPath}/product_qna.do?method=deleteQna&pqcode=${modifyQnaForm.pqcode }'">
			</div>
		</form>
	</div>
</body>
</html>