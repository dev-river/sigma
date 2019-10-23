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

</style>
</head>
<body>
<div class="bodymain">

<div class="container">
	<div class="row head">
		<h2>gameDetail update page</h2>
	</div>
	<div class="row body">
		<form action="/gameDetail/inform/update" method="post">
			<input name="num" type="hidden" value="${vo.num}">
			<input type="hidden" id="writer" name="writer" value="${vo.writer}">
			<div class="form-group">
				<label>게임 이름</label>
				<input id="title" name="title" placeholder="게임 이름을 작성하세요." class="form-control" value="${vo.title}">
			</div>
			<div class="form-group">
				<label>가격</label>
				<input id="price" name="price" placeholder="가격을 작성하세요." class="form-control" value="${vo.price}">
			</div>
			<div class="form-group">
				<label>카테고리</label>
				<select id="category" name="category" class="select">
					<option value="rpg">RPG</option>
					<option value="sportsracing">스포츠/레이싱</option>
					<option value="strategysimulation">전략/시뮬레이션</option>
					<option value="actionadventure">액션/어드벤쳐</option>
					<option value="etc">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label>게임정보</label>
				<textarea rows="5" id="content" name="content" class="form-control">${vo.content}</textarea>
			</div>
			<div class="form-group">
				<label for="dcrate">할인율</label>
				<input id="dcrate" name="dcrate" placeholder="할인율을 작성해주세요." class="form-contorl" value="${vo.dcrate}">
			</div>
			<div class="form-group">
				<label for="gamefilepath">게임 파일 경로</label>
				<input id="gamefilepath" name="gamefilepath" class="form-contorl" placeholder="파일경로" style="width: 80px;" value="${vo.gamefilepath}">
			</div>
			<div>
				<input type="submit" class="btn" value="수정">
				<input type="button" class="btn" value="취소" onclick="location.href='/gameDetail/main/maincategoryread?num=${vo.num}'">
			</div>
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("option").each(function(){
		    if($(this).val()=="${vo.category}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
		});
	});
</script>
</body>
</html>