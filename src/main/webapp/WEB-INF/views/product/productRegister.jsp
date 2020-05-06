<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="conPath" value="${pageContext.request.contextPath }"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="${conPath }/css/product/productRegister.css" rel="stylesheet">
	<link href="${conPath }/css/style.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<!-- include summernote css/js-->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>
<script>
	$(document).ready(function() {
		$('#summernote').summernote({
			height: 300,
			minHeight: null,
			maxHeight: null,
			lang : 'ko-KR'/* ,
			onImageUpload: function(files, editor, welEditable) {
			        sendFile(files[0], editor, welEditable);
			    } */
		   });
		//option 항목 추가
		var option_num=0;
		$('#btn_plus').click(function () {
			option_num++;
			$('#blank').before("<tr id='option"+option_num+"'>"+
				"	<td><input type='text' name='poname' required='required'>     </td>"+
				"	<td><input type='number' name='ponet' required='required' min='0'>    </td>"+
				"	<td><input type='number' name='postock' required='required' min='0'>  </td>"+
				"	<td><input type='number' name='poprice' required='required' min='0'>  </td>"+
				"	<td><select name='typecode'>"+
				"			<c:forEach var='type' items='${type }'>"+
				"				<option value='${type.typecode }'>${type.producttype }</option>"+
				"			</c:forEach>"+
				"		</select></td>"+
				"</tr>");
		});
		$('#btn_minus').click(function(){
			$('#option'+option_num).detach();
			option_num--;
		});
		//제품등록시 알람
		var result = $('input[name=result]').val();
		if(result > 0){
			alert(result+'개의 제품이 등록 되었습니다.');
		}
	
	});
</script>	

</head>
<body>
	<input type="hidden" name="result" value="${result }">
	<jsp:include page="../main/header.jsp"/>
<form action="${conPath }/product.do" method="post" enctype="multipart/form-data">
	<input type="hidden" name="method" value="pRegister">
	<div id="main">
	<div align="center">
	<hr width="500" color="#3a5485">
	<h2>상품등록</h2>
		<hr width="500" color="#3a5485">
		<input type="text" name="mid" value="${market.mid }">
		<input type="hidden" name="typecode" value="1-1">
	<table>
		<tr><th>상품명 : </th><td colspan="3"><input type="text" name="ptitle" required="required"></td></tr>
		<tr><th>상품소개 : </th><td colspan="3"><textarea name="pcontent" id="summernote"></textarea>
		 </td>
		 </tr>
		<tr><th>대표이미지1 : </th><td colspan="3"><input type="file" name="file1" required="required"></td></tr>
				<tr><th>대표이미지2 : </th><td colspan="3"><input type="file" name="file2"></td></tr>
				<tr><th>대표이미지3 : </th><td colspan="3"><input type="file" name="file3"></td></tr>
	</table>
	<table>
		<tr id="top">
				<th>옵션명</th><th>원가</th><th>수량</th><th>판매가격</th><th>상품분류</th><th>
		</tr>
		<tr id="option">
			<td><input type="text" name="poname" required="required">     </td>
			<td><input type="number" name="ponet" required="required" min="0">    </td>
			<td><input type="number" name="postock" required="required" min="0">  </td>
			<td><input type="number" name="poprice" required="required" min="0">  </td>
			<td><select name="typecode">
					<c:forEach var="type" items="${type }">
						<option value="${type.typecode }">${type.producttype }</option>
					</c:forEach>
				</select></td>
		</tr>
		<tr id="blank"></tr>
		<tr><td colspan="5">
			<button type="button" class="btn2" id="btn_minus">-</button>
			<button type="button" class="btn2" id="btn_plus">+</button>
			<input type="submit" value="상품등록" class="btn1">
			</td>
		</tr>
	</table>
	</div>
	</div>
</form>
	<jsp:include page="../main/footer.jsp" />
</body>
</html>