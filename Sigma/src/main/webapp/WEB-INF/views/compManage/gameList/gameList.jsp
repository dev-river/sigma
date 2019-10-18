
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
	width: 500px;
	margin: 10px auto;
}
.body{
	width: 500px;
	margin: 10px auto;
}
.footer{
	width: 500px;
	margin: 10px auto;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
	<div class="container">
		<div class="row head">
			<h1>판매 관리</h1>
			<input type="button" value="뒤로" class="btn" onclick="location.href='/compManage/compInform/read?id=${login.id}'">
		</div>
		<div class="row body">
			<div>
				<h2>판매하는 게임</h2>
				<input type="button" value="게임 등록" class="btn" onclick="location.href='/compManage/gameList/gameInsert?writer=${login.id}'">
			</div>
			<div>
				<c:if test="${empty gamelist}">
					<h4>등록한 게임이 없습니다.</h4>
				</c:if>
				<c:if test="${!empty gamelist}">
					<c:forEach items="${gamelist}" var="gamelist">
						<p>${gamelist.title}</p>
					</c:forEach>
				</c:if>
			</div>
		</div>
		<div class="row footer">
			<div>
				<h2>할인 요청 버튼 활성화 된 게임</h2>
			</div>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>게임이름</th>
							<th>할인 날짜</th>
							<th>할인 요청 날짜</th>
							<th>할인율</th>
							<th>목표 요청 수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
						<c:if test="${empty gameDetailDC}">
							<td colspan="5" align="center">할인 요청이 활성화 된 게임이 없습니다.</td>
						</c:if>
						<c:if test="${!empty gameDetailDC}">
							<c:forEach items="${gameDetailDC}" var="gameDetailDC">
								<td><a href="/gameDetail/inform/read?num=${gameDetailDC.num}">${gameDetailDC.gdnum}</a></td>
								<td>${gameDetailDC.dcstartdate} - ${gameDetailDC.dcenddate}</td>
								<td>${gameDetailDC.rqstartdate} - ${gameDetailDC.rqenddate}</td>
								<td>${gameDetailDC.dcrate}</td>
								<td>${gameDetailDC.goal}</td>
							</c:forEach>
						</c:if>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>