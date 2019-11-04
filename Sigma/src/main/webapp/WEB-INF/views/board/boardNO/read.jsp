<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/uploadutils.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
label {
	color: white;
}
</style>
</head>
<body>
	<br>
	<div class="bodymain">
<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">	

		<div class="read" style="padding-left: 30px; padding-right: 30px;">
		
			<div class="row">
				<form action="">
					<input type="hidden" name="num" value="${readvo.num}">
					<input type="hidden" name="curPage" value="${to.curPage}">
					<input type="hidden" name="perPage" value="${to.perPage}">
					<input type="hidden" name="perPage" value="${vo.nickname}">
				</form>
			<br>
				<div class="form-group">
					<label for="num">글번호</label>
					<input class="form-control" id="num" value="${readvo.num}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="viewcnt">조회수</label>
					<input class="form-control" id="viewcnt" value="${readvo.viewcnt}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" id="title" value="${readvo.title}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="writer">작성자</label>
					<input class="form-control" id="writer" value="${readvo.writer}" readonly="readonly">
				</div>
				
				
				<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="13">${readvo.content}</textarea>
			</div>
				<div>
					<c:if test="${login.author eq 'admin'}">
				    <input type="button" value="수정" class="btn update btn-primary">
					<input type="button" value="목록" class="btn btn-info" onclick="location.href='/board/main/notice/boardNO?curPage=${to.curPage}&perPage=${to.perPage}'">
					<input type="button" value="삭제" class="btn btn-warning" onclick="location.href='/board/boardNO/delete?num=${readvo.num}&curPage=${to.curPage}&perPage=${to.perPage}'">
					</c:if>
					<c:if test="${login.author ne 'admin'}">
					<input type="button" value="목록" class="btn btn-info" onclick="location.href='/board/main/notice/boardNO?curPage=${to.curPage}&perPage=${to.perPage}'">
					</c:if>
				</div>
			</div>
		<hr>
</div>
</div>
</div>
<br>
<script type="text/javascript">

 

	$(document).ready(function(){
		var frnum = ${readvo.num}; /* 계속 사용될것이므로 전역변수로 지정 */
		/* var replyPage = 1; */
		
/* 		$(".pagination").on("click","li a", function(event) {
			event.preventDefault();
			replyPage =$(this).attr("href");
			getAllList(frnum);
		}); */


		
		/* boardUpdate 부분 */
		$(".update").on("click",function(){
			location.href="/board/main/notice/boardNOupdate?num=${readvo.num}&curPage=${to.curPage}&perPage=${to.perPage}";
		});
	});
	
	
</script>
</body>
</html>