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
<link href="${conPath }/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function(){
	if($('input[name=insertResult]').val() == 1 ){
		alert('쿠폰이 등록 되었습니다.');
	}
	var giveResult = $('input[name=giveResult]').val()
	if(giveResult > 0 ){
		alert('쿠폰이 '+giveResult+'명에게 지급 되었습니다.');
	}
});
</script>
<style>
#content{
	height: 400px;
}
fieldset{
	padding: 20px;
    width: 400px;
    margin: 50px auto;
    font-size: 1.2em;
}
input, select{
	padding: 4px;
}
input[type=text]{
	width: 300px;
}
</style>
</head>
<body>
<input type="hidden" name="insertResult" value="${insertResult}">
<input type="hidden" name="giveResult" value="${giveResult}">
	<jsp:include page="../main/header.jsp" />
	<div id="content">
		<form action="coupon.do">
		<input type="hidden" name="method" value="insertCoupon">
			<fieldset> 
				<legend>쿠폰 등록 </legend>
				<label>쿠폰명 : <input type="text" name="cuname"></label><br>
				<label>할인율 : <input type="number" name="cusale" min="0" max="100">(%)</label>
				<input type="submit" value="등록">
			</fieldset>
		</form>
		<form action="coupon.do">
		<input type="hidden" name="method" value="giveCoupon">
			<fieldset> 
				<legend>쿠폰 지급 </legend>
				<label> 
					<select name="gcode">
						<c:forEach var="grade" items="${grade }">
							<option value="${grade.gcode }">${grade.grade}</option>
						</c:forEach>
					</select>
				</label><br>
				<label>지급쿠폰 : 
					<select name="cuid">
						<c:forEach var="coupon" items="${coupon }">
							<option value="${coupon.cuid }">${coupon.cuname}(${coupon.cusale}%)</option>
						</c:forEach>
					</select>
				</label>
				<input type="submit" value="쿠폰증정" >
			</fieldset>
		</form>
	</div>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>