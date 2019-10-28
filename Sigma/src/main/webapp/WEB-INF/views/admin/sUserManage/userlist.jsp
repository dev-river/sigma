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
	bodymain{
	color: white;
	}
</style>
</head>
<body>


<br>
	<div class="bodymain">
	<div class="container">

	
	<div class="row">
				<div class="input-group">
					<span class="input-group-addon">
						<select id="searchSel">
							<option disabled>검색 기준</option>
							<option value="id">아이디</option>
								<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
							<option value="name">이름</option>
							<option value="nickname">닉네임</option>
						</select>
					</span>
					
					<input class="form-control" id="keyword">
					
					<span class="input-group-btn">
						<button id="searchBtn" class="btn btn-info">검색</button>
					</span>
				</div>
	</div>
	
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
					<td><a class="userclick" href="${vo.id}">${vo.id}</a></td>
					<td><a class="userclick" href="${vo.id}">${vo.nickname}</a></td>
					<td><a class="userclick" href="${vo.id}">${vo.name}</a></td>
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
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(".userclick").on("click", function(event) {
			event.preventDefault();
			var data=$(this).attr("href");
			window.open("/admin/userManage/read?id="+data, "_child", "width=596px, height=700px").focus();
		});
		
		$("#searchBtn").on("click", function(){
			var searchType = $("#searchSel option:selected").val();
			var keyword = $("#keyword").val();
			location.href = "/admin/sUserManage/userlist?searchType="+searchType+"&keyword="+keyword;
		});
		
	});
	</script>
</body>
</html>