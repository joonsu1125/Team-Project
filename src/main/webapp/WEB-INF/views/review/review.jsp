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
<link href="${conPath }/css/review/review.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="../main/header.jsp"/>
	<div id="main">
	<div align="center">
		<hr width="500" color="#3a5485">
		<h2>리뷰작성</h2>
		<hr width="500" color="#3a5485">
		<form action="####.do" enctype="multipart/form-data" method="post">
			<input type="hidden" name="method" value="insertReview">
			<table>
				<tr><th>내용 </th><td><textarea rows="5" cols="22" name="rcontent" placeholder="내용"></textarea></td></tr>
				<tr><th>별점 </th><td><input type="text" name="rstar" value="insertReview"></td></tr>
				<tr><th>이미지 </th><td><input type="file" name="temprimage" value="insertReview"></td></tr>
				<tr><td colspan="2">
					<input type="submit" value="등록">
					</td>
				</tr>
			</table>
			<table>
				<tr>
					<td>
						<div class="content_v2">
							<button type="button" id="lv_1" class="rev_star" onclick="javascript:goInputValue('prdEvlPnt','tmpltCont','1')"><em>불만</em></button><!-- 클릭했을때 더블클래스 good 추가 -->
							<button type="button" id="lv_2" class="rev_star" onclick="javascript:goInputValue('prdEvlPnt','tmpltCont','2')"><em>보통</em></button>
							<button type="button" id="lv_3" class="rev_star" onclick="javascript:goInputValue('prdEvlPnt','tmpltCont','3')"><em>보통</em></button>
							<button type="button" id="lv_4" class="rev_star" onclick="javascript:goInputValue('prdEvlPnt','tmpltCont','4')"><em>만족</em></button>
							<button type="button" id="lv_5" class="rev_star" onclick="javascript:goInputValue('prdEvlPnt','tmpltCont','5')"><em>만족</em></button>
		                    <input type="hidden" name="prdEvlPnt" id="prdEvlPnt" value="0">
							<em class="rev_cont" name="tmpltCont" id="tmpltCont">별을 클릭하여 상품 만족도를 알려주세요.</em>
						</div>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
	
	<jsp:include page="../main/footer.jsp" />
</body>
</html>