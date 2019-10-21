<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<form action="/gameDetail/inform/reviewupdate" method="post">
	<input type="hidden" name="num" value="${vo.num}">
	<input name="writer" value="${vo.writer}" readonly="readonly">
	<input name="content" value="${vo.content}">
	<select id="likeselect">
   		<option value="추천">추천</option>
   		<option value="비추천">비추천</option>
 	</select>
 	<button class="btn btn-warning">수정</button>
 	<a href="javascript:window.close()" class="btn btn-danger">취소</a>
</form> 	
 	
 	<script type="text/javascript">
 		$("select").val("${vo.recommend}").attr("selected", "selected");

 		$("button").on("click", function(){
 			var obj = document.getElementById("likeselect");
			var recommend = obj.options[obj.selectedIndex].value;
			
 			$.ajax({
   				type: 'post',
   				url: '/gameDetail/inform/reviewupdate',
   				data: {
   					num: num,
   					writer: writer,
   					content: content,
   					recommend: recommend
   				},
   				datatype: 'text',
   				success: function(){
   					alert('적용 되었습니다!');
   					window.close();
   				},
   				error: function(){
   	   				alert('예외가 발생했습니다.')
   	   				}
   			});
 	 	});
 	</script>
</body>
</html>