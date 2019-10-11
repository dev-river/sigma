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
<style type="text/css">
.head{
	width: 400px;
	margin: 10px auto;
}
.body{
	width: 400px;
	margin: 10px auto;
}
</style>
</head>
<body>
	<div>
		<div class="row head">
			<h1>판매 관리</h1>
		</div>
		<div class="row body">
			<div>
				
			</div>
			<div>
				<h2>판매하는 게임</h2>
				<input type="button" value="게임 등록" class="btn" onclick="location.href='/compManage/gameList/gameInsert?writer=kihoon'">
			</div>
			<div>
				<c:if test="${empty gamelist}">
					<h4>등록한 게임이 없습니다.</h4>
				</c:if>
				<c:if test="${!empty gamelist}">
					<c:forEach items="${gamelist}" var="list">
						<p>${list.title}</p>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
	});
</script>
</body>
</html>