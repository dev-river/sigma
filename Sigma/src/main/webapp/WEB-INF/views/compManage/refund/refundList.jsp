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
</head>
<body>
<div>
	<div class="head">
		<h2>환불 신청 리스트</h2>
	</div>
	<div class="body">
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>환블 게임</th>
					<th>환불 신청 날짜</th>
					<th>환불 상태</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				<c:forEach items="${refundlist}" var="list">
					<td>${list.id}</td>
					<td>${list.buynum}</td>
					<td>${list.updatedate}</td>
					<td>${list.status}</td>
				</c:forEach>
				</tr>
			</tbody>
		</table>
	</div>
</div>
</body>
</html>