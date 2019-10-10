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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
		<div class="row">
			
			<h1>글 자세히 보기</h1>
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
					<textarea  class="form-control" id="content" readonly="readonly">${readvo.content}</textarea>
				</div>
				<div>
					<input type="button" value="수정" class="btn update">
					<input type="button" value="목록" class="btn" onclick="location.href='/board/boardFR/list'">
					<input type="button" value="삭제" class="btn" onclick="location.href='/board/boardFR/delete?num=${readvo.num}'">
				</div>
		</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".update").on("click",function(){
			location.href="/board/boardFR/update?num=${readvo.num}";
		})
	});
</script>
</body>
</html>