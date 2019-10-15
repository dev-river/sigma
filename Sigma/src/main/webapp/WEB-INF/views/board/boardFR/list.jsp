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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
.list {
	position: relative;
	left: 0%;
	width: 1070px;
}

.bodymain {
	position: relative;
	margin: auto;
	height: 800px;
	width: auto;
}
</style>
</head>
<body>
	<hr>
	<div class="container">
		<div class="list">
			<div class="bodymain">
				<a href="/board/boardFR/insert" class="btn btn-primary">글쓰기</a>
				<table class="table table-dark">
					<thead class="thead-dark">
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
			</div>
		</div>
		</div>
</body>
</html>