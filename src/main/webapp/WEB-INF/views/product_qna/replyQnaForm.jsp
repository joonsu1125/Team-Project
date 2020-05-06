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
<style>
#answerForm {
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

#answerForm .answer_content {
	font-size: 12px;
	margin: 0;
	padding: 30px 20px 0;
}

#answerForm .answer_content table {
	font-size: 100%;
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	border-top: 2px solid #707070;
}

#answerForm .answer_content table tbody {
	font-size: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

#answerForm .answer_content table tbody tr {
	font-size: 100%;
	border-collapse: collapse;
	border-spacing: 0;
} 
#answerForm .answer_content .question_info{
	font-size : 12px;
	padding: 0;
	margin: 20px 0;
}
#answerForm .answer_content_footer {
font-size: 12px;
text-align: center;
margin-bottom: 20px;
}
</style>
</head>
<body>
	<c:if test="${not empty replyQnaResult }">
		<script>
		opener.location.href = 'product.do?method=detailProduct&pcode=${param.pcode }&pagenum=${param.pagenum}';
			window.close();
		</script>
	</c:if>
	<div id="answerForm">
		<form action="${conPath }/product_qna.do?method=replyQna">
			<input type="hidden" name="method" value="replyQna">
			<input type="hidden" name="pqcode" value="${param.pqcode }">
			<input type="hidden" name="pcode" value="${param.pcode }">
			<input type="hidden" name="pagenum" value="${param.pagenum}">
			<div class="question_content">
				<h2>상품 문의</h2>
				<table>
					<tbody>
						<tr>
							<th>답변</th>
							<td>
								<textarea name="pqanswer" cols="40" rows="10" style="resize: none"></textarea>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="answer_content_footer">
					<input type="submit" class="btn2" value="확인" style="width: 100px;"> 
					<input type="button" class="btn1" value="취소" style="width: 100px;" onclick="window.close();">
			</div>
		</form>
	</div>
</body>
</html>