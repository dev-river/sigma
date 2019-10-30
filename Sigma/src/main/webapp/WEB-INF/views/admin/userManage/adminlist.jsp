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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
th, td {
	color: white;
}
</style>
</head>
<body>

	<br>
	<div class="bodymain">
		<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px; max-height: auto;">

			<div style="float: left;">
				<jsp:include page="/WEB-INF/views/admin/adminSetting/adminLeft.jsp"></jsp:include>
			</div>
			
			<br>
			<div class="row" >
				<div class="d" style="float: right; width: 870px; border-left: double 1px white; height: 700px; padding-left: 30px; padding-right: 30px;">
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
				</div>
			</div>
		</div>
	</div>
</body>
</html>