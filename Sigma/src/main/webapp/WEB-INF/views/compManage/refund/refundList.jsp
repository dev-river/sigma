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
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<div class="container">
	<div class="head">
		<h2>환불 신청 리스트</h2>
		<input type="button" value="뒤로" class="btn" onclick="location.href='/compManage/compInform/read?id=${login.id}'">
	</div>
	<div class="body">
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
						<td><a href="/compManage/refund/refundRead?id=${login.id}&num=${refundlist.num}">${refundlist.title}</a></td>
						<td>${refundlist.updatedate}</td>
						<td>${refundlist.status}</td>
					</tr>
					</c:forEach>
				</c:if>
				
			</tbody>
		</table>
	</div>
</div>
</body>
</html>