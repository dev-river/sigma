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
th,td,p{
	color: white;
}
.btn1{
	float: right;
	position: relative;
	top: 500px;
}
</style>
</head>
<body>
<div class="bodymain">
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; height: 100%;">
	<div class="col-xs-10 col-xs-offset-1">
	<br>
	<h2 style="color: white;">환불 리스트</h2>
	<div class="row">
		<table class="table">
			<thead>
				<tr>
					<th>아이디</th>
					<th>환불 게임</th>
					<th>환불 신청 날짜</th>
					<th>환불 상태</th>
				</tr>
			</thead>
			<tbody>
				
				<c:if test="${empty list}">
				<tr>
					<td colspan="4"><p>신청한 리스트가 없습니다.</p></td>
				</tr>
				</c:if>
				<c:if test="${!empty list}">
					<c:forEach items="${list}" var="refundlist">
					<tr>
						<td>${refundlist.id}</td>		
						<td><a href="/compManage/main/refundread?id=${login.id}&num=${refundlist.num}">${refundlist.title}</a></td>
						<td>${refundlist.updatedate}</td>
						<td>${refundlist.status}</td>
					</tr>
					</c:forEach>
				</c:if>
				
			</tbody>
		</table>
	</div>
	<div class="roe">
		<input type="button" value="뒤로" class="btn1" onclick="location.href='/compManage/main/manageread?id=${login.id}'">
	</div>
</div>
</div>
</div>
</body>
</html>