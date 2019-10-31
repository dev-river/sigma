<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	.row{
	padding-right: 30px;
	padding-left: 30px;
	}
	label{
	color: white;
	}
</style>
</head>
<body>
<br><br><br>
	<div class="bodymain">
		<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 730px; max-height: auto;">
			<div class="insert">
				<div class="row">
					<h2 style="color: white;">${id}님의환불 요청</h2>
					<br><hr>
					<h3 style="color: red;">환불 신청은 구매한지 24시간 이내의 게임만 가능합니다.</h3>
					<form action="/myPage/main/buy/refundinsert" method="post">
						<div class="form-group">
							<label for="game">환불 게임</label> <select name="buynum">
								<option value="" selected disabled hidden>게임 목록</option>
								<c:forEach items="${gamelist}" var="gamelist">
									<option value="${gamelist.num}">${gamelist.title}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="content">환불사유</label> 
							<select name="content">
								<option value="" selected disabled hidden>사유 선택</option>
								<option value="잘못 구매해서">잘못 구매해서</option>
								<option value="게임 실행이 되지 않아서">게임 실행이 되지 않아서</option>
								<option value="게임의 취향이 맞지 않아서">게임의 취향이 맞지 않아서</option>
								<option value="기타">기타</option>
							</select>
						</div>
						<div class="form-group" style="position: relative; left: 300px;">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
						<input type="hidden" value="${id}" name="id">
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>