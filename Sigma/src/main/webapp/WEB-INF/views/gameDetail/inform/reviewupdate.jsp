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

<style type="text/css">
label{
color: white;
}


.bodymain {
	position: relative;
	margin: auto;
	max-height: auto;
	min-height: 300px;
	width: auto;
}

</style>
</head>

<body background="/resources/main/backgroundimg2.jpg" style="height: 15px;">

		<div class="container">
		<br>
		<img alt="#" src="/resources/main/SIGMA로고.png">
		<br>
	<input type="hidden" name="num" id="num" value="${vo.num}">
	<label for="writer">작성자: </label><input name="writer" id="writer" value="${vo.writer}" readonly="readonly" style="border-radius: 10px;">
	<label for="likeselect">추천/비추천: </label><input name="likeselect" id="likeselect" value="${vo.recommend}" readonly="readonly" style="border-radius: 10px;"><br>
	<textarea rows="4" cols="100" style="border-radius: 10px; resize: none;" id="content">${vo.content}</textarea><br/>
	
	
	<!-- <select name="likeselect" id="likeselect">
   		<option value="추천">추천</option>
   		<option value="비추천">비추천</option>
 	</select> -->
 	<div style="float: right;">
 	<button class="reviewEdit btn btn-warning">수정</button>
 	<a href="javascript:window.close()" class="btn btn-danger">취소</a>
 	<!-- <button class="reviewDelete btn btn-danger" value="${vo.num}">삭제</button> -->
 	</div>
 	</div>
 	<script type="text/javascript">
 		$("select").val("${vo.recommend}").attr("selected", "selected");

 		$(".reviewEdit").on("click", function(){
 			var num = $("#num").val();
 			var writer = $("#writer").val();
 			var content = $("#content").val();
 			
 			/* var obj = document.getElementById("likeselect");
			var recommend = obj.options[obj.selectedIndex].value; */
			
 			$.ajax({
   				type: 'post',
   				url: '/gameDetail/main/maincategoryreviewupdate',
   				data: {
   					'num': num,
   					'writer': writer,
   					'content': content
   					/* 'recommend': recommend */
   				},
   				datatype: 'text',
   				success: function(){
   					alert('적용 되었습니다!');
   					window.opener.location.reload();
   					window.close()
   				},
   				error: function(){
   	   				alert('예외가 발생했습니다.')
   	   				}
   			});
 	 	});

 		$(".reviewDelete").on("click", function(){
			if(confirm("삭제 하시겠습니까?")){
				var num = $(this).val();
				
	   			$.ajax({
	   				type: 'get',
	   				url: '/gameDetail/inform/reviewdelete',
	   				data: {
	   					'num': num,
	   				},
	   				datatype: 'text',
	   				success: function(){
	   					alert('삭제 되었습니다!');
	   					window.opener.location.reload();
	   					window.close()
	   				},
	   				error: function(){
	   					alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
	   				}
	   			});
			}
   		});
 	</script>
</body>
</html>