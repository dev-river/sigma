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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">

label{
	color: white;
}
</style>
</head>
<body>
<br>
	<div class="bodymain">
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
		<div class="update" style="padding-left: 30px; padding-right: 30px;">
		<br>
		<h3 style="color: white;">게시글 수정</h3><br/>
		
		<form action="/board/main/event/eventUpdate" method="post">
			<input type="hidden" name="curPage" value="${to.curPage}">
			<input type="hidden" name="perPage" value="${to.perPage}">
			
			<div class="form-group">
				<label for="title">글번호</label>
				<input class="form-control" id="num" name="num" value="${updatevo.num}" readonly="readonly">
			</div>
			
			<div class="form-group">
				<label for="writer">작성자</label>
				<input class="form-control" id="writer" name="writer" value="${updatevo.writer}">
			</div>
			
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" id="title" name="title" value="${updatevo.title}">
			</div>
			
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="13">${update.content}</textarea>
			</div>
			<div class="form-group">
				<button class="btn btn-warning modify">수정</button>
			</div>
		</form>
	</div>
	</div>
	</div>
		<br>
		<br><br><br><br><br><br><br><br><br><br>
</body>
</html>