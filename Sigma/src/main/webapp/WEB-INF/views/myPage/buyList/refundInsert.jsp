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

</head>
<body>
<br><br><br>
	<div class="container">
		<div class="insert">
		<div class="row" style="text-align: center;">
			<h3 style="color: white;">${id}님의 환불 요청</h3>
			<h4 style="color: red;">환불 신청은 구매한지 24시간 이내의 게임만 가능합니다.</h4>
			<form action="/myPage/buyList/refundInsert" method="post">
				<div class="form-group">
					<label for="game" style="color: white;">환불 게임</label>
					<select name="buynum">
						<option value="" selected disabled hidden>게임 목록</option>
						<c:forEach items="${gamelist}" var="gamelist">
							<option value="${gamelist.num}">${gamelist.title}</option>
						</c:forEach>
					</select>
				</div>
				<div class="form-group">
					<label for="content" style="color: white;">환불사유</label>
					<select name="content">
						<option value="" selected disabled hidden>사유 선택</option>
						<option value="잘못 구매해서">잘못 구매해서</option>
						<option value="게임 실행이 되지 않아서">게임 실행이 되지 않아서</option>
						<option value="게임의 취향이 맞지 않아서">게임의 취향이 맞지 않아서</option>
						<option value="기타">기타</option>
					</select>
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-primary" value="등록">
				</div>
				<input type="hidden" value="${id}" name="id">
			</form>
		</div>
	</div>
</div>
</body>
</html>