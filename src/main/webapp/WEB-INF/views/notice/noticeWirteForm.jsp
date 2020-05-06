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
<style>
#content #noticeCaption{
font-size: 12px;
color: #808080;
margin-left: 11px;
padding: 0;
word-break: break-all;
height: 40px;
background:#3a5485;
}
#content #noticeCaption h1{
color: white;
padding: 0;
font-size: 12px;
float: left;
margin: 11px 0 0 16px;
}
#condtent table, th, td {
    margin: 0;
    padding: 0;
}
#condtent table{
font-size: 12px;
color: #808080;
border-right-width: 0px;
border-left-width: 0px;
-webkit-border-horizontal-spacing: 0px;
-webkit-border-vertical-spacing: 0px;
width: 800px;
padding: 0;
border-collapse: collapse;
word-break: break-all;
margin: 10px; 0 0 -1px;
border-top: 2px solid #8e8e8e;
text-align: center;
border-bottom: 2px solid #b9b9b9;
}
#condtent .noticeHead{
font-size: 12px;
color: #808080;
border-collapse: collapse;
word-break: break-all;
text-align: center;
margin: 0;
padding: 0;
}
#condtent .noticeHead th{
font-size: 12px;
margin: 0;
padding: 0;
border-collapse: collapse;
word-break: break-all;
font-weight: normal;
border-bottom: 1px solid #e7e7e7;
background: #f9f9f9;
color: #4D4D4D;
height: 36px;
}
#condtent .noticeHead td{
font-size: 12px;
color: #808080;
margin: 0;
border-collapse: collapse;
word-break: break-all;
border-bottom: 1px solid #e7e7e7;
background: #ffffff;
height: 15px;
line-height: 14px;
text-align: left;
padding: 5px 0 5px 7px;
}
#condtent .btnClass{
	 padding:20px 0 20px 0;
}
#condtent .btn1,#condtent .btn2{
	width: 150px;
}
</style>
</head>
<body>
	<div id="condtent">
		<div id="noticeCaption">
			<h1>등록</h1>
		</div>
		<form action="${conPath }/notice.do?method=noticeWrite" method="post">
		<table>
			<tr class="noticeHead">
				<th>제목</th>
				<td><input type="text" name="ntitle" style="width: 750px;"></td>
				<td><fmt:formatDate value="${noticeDetail.nrdate }"
						pattern="yyyy/MM/dd" /></td>
			</tr>
			<tr>
				<td colspan="2">
						<textarea rows="30" cols="120" name="ncontent" style="resize:none "></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="btnClass">
					<input type="submit" value="확인" class="btn1">
				</td>
			</tr>
		</table>
		</form>
	</div>
</body>
</html>