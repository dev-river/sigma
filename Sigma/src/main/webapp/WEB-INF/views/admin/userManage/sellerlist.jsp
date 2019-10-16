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
<h3>
	 sellerlist test.  
</h3>

<hr>

	<!-- 로그인 되면 뜨는 창 -->
	<c:if test="${not empty login}">
		${login.nickname}(${login.id}) 님, 안녕하세요. <a href="/member/login/logout">로그아웃</a>
	</c:if>
	<!-- 미로그인시 뜨는 창 -->
	<c:if test="${empty login}">
		<a href="/member/login/login">로그인</a>
	</c:if>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>ID</th>
				<th>닉네임</th>
				<th>이름</th>
				<th>권한</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>가입일</th>
				<th>잔여캐시</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vo}" var="vo">
				<tr>
					<td><a href="/admin/userManage/read?id=${vo.id}">${vo.id}</a></td>
					<td><a href="/admin/userManage/read?id=${vo.id}">${vo.nickname}</a></td>
					<td><a href="/admin/userManage/read?id=${vo.id}">${vo.name}</a></td>
					<td>${vo.author}</td>
					<td>${vo.phone}</td>
					<td>${vo.email}</td>
					<td>${vo.joindate}</td>
					<td>${vo.cash}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>