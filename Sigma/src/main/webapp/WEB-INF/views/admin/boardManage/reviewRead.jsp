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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<h3>관리자 - review 상세 페이지</h3>
	<hr>
	
	<div class="reviewRead">
		<label for="num">리뷰 번호</label><input id="num" name="num" value="${vo.num}">
		<label for="gdnum">게임 번호</label><input id="gdnum" name="gdnum" value="${vo.gdnum}" readonly="readonly">
		<label for="title">게임 이름</label><input id="title" name="title" value="${vo.title}" readonly="readonly">
		<label for="writer">작성자</label><input id="writer" name="writer" value="${vo.writer}" readonly="readonly">
		<label for="content">내용</label><input id="content" name="content" value="${vo.content}">
		<label for="regidate">등록일</label><input id="regidate" name="regidate" type="date" value="${vo.regidate}" readonly="readonly">
		<label for="updatedate">수정일</label><input id="updatedate" name="updatedate" type="date" value="${vo.updatedate}" readonly="readonly">
		<label for="recommend">추천/비추천</label><input id="recommend" name="recommend" value="${vo.recommend}" readonly="readonly">
		<label for="assistyes">좋아요 수</label><input id="assistyes" name="assistyes" value="${vo.assistyes}" readonly="readonly">
		<label for="assistno">싫어요 수</label><input id="assistno" name="assistno" value="${vo.assistno}" readonly="readonly">
	</div>
	
	<div class="button">
	</div>
</div>
</body>
</html>