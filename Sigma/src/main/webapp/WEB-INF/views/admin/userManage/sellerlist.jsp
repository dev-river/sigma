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
td, th {
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
			<div class="row">
				<div class="hr" style="float: right; width: 870px; border-left: double 1px white; height: 700px; padding-left: 30px; padding-right: 30px;">

					<div class="input-group">
						<span class="input-group-addon"> <select id="searchSel">
								<option disabled>검색 기준</option>
								<option value="id">아이디</option>
								<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
								<option value="name">이름</option>
								<option value="nickname">닉네임</option>
						</select>
						</span> <input class="form-control" id="keyword"> <span
							class="input-group-btn">
							<button id="searchBtn" class="btn btn-info">검색</button>
						</span>
					</div>

					<br>
					
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
						<c:forEach items="${vo.list}" var="vo">
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
					<div class="row text-center" style="text-align: center">
						<ul class="pagination">
							<c:if test="${vo.curPage>1}">
								<li><a
									href="/admin/main/user/adminsellerlist?curPage=${vo.curPage-1}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${vo.bpn}" end="${vo.spn}" var="idx">
								<li class="${vo.curPage == idx?'active':''}"><a
									href="/admin/main/user/adminsellerlist?curPage=${idx}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">${idx}</a></li>
							</c:forEach>

							<c:if test="${vo.curPage<vo.totalPage}">
								<li><a
									href="/admin/main/user/adminsellerlist?curPage=${vo.curPage+1}&perPage=${vo.perPage}&searchType=${vo.searchType}&keyword=${vo.keyword}">&raquo;</a></li>
							</c:if>
						</ul>
					</div>

				</div>
			</div>
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
			var url = "/admin/main/user/adminsellerlist?searchType="+searchType+"&keyword="+keyword;
			window.open(url);
		});
		
	});
	</script>
</body>
</html>