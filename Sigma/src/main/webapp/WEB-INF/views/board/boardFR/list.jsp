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
	 boardFR list test.  
</h3>

<hr>


	<!-- 로그인 되면 뜨는 창 -->
	<c:if test="${not empty login}">
		${login.nickname}(${login.id}) 님, 안녕하세요. <a href="/myPage/myPage/mypage">마이페이지</a> /// <a href="/member/login/logout">로그아웃</a>
	</c:if>
	<!-- 미로그인시 뜨는 창 -->
	<c:if test="${empty login}">
		<a href="/member/login/login">로그인</a>
	</c:if>
	
	<a href="/board/boardFR/insert" class="btn btn-primary">글쓰기</a>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${vo}" var="vo">
				<tr>
					<td>${vo.num}</td>
					<td><a href="/board/boardFR/read?num=${vo.num}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.updatedate}</td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>