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

#keyword {
	width: 800px;
}

#searchBtn {
	position: relative;
	right: 100px;
}
</style>
</head>
<body>
	<br>
	<br>
	<div class="bodymain">
		<div class="list">
<div class="container">
<%--   	<div class="row">
         <div class="col-xs-push-10 col-xs-2">
            <select id="perPageSel" class="form-control">
               <option disabled>페이지당 글 수</option>
               <option ${dbTO.perPage == 10? 'selected':''}>10</option>
               <option ${dbTO.perPage == 20? 'selected':''}>20</option>
            </select>
         </div>
      </div>  --%>
	
	
	
<!-- 	<a href="/board/boardFR/insert" class="btn btn-primary">글쓰기</a> -->
	<table class="table table-hover" style="color: white">
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
			<c:forEach items="${dboTO.list}" var="vo">
				<tr>
					<td>${vo.num}</td>
					<td><a href="/board/main/One/OneRead?num=${vo.num}&curPage=${dboTO.curPage}&perPage=${dboTO.perPage}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.updatedate}</td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<a href="/board/main/One/OneInsert" class="btn btn-primary" style="float: right;">글쓰기</a>
<%-- 		<div class="row text-center" style="text-align: center">
				<ul class="pagination"> <!-- ul에 pagination 클래스를 주면 예쁘다 -->
				
					<c:if test="${dbTO.curPage>1}">
						<li><a
							href="/mainboard?curPage=${dbTO.curPage-1}&perPage=${dbTO.perPage}">&laquo;</a></li>
					</c:if> --%>
					<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

<%-- 				<a href="/mainboardinsert" class="btn btn-primary">글쓰기</a>
				<!-- 	<a href="/board/boardFR/insert" class="btn btn-primary">글쓰기</a> -->
				<table class="table table-hover" style="color: white">
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
						<c:forEach items="${dbTO.list}" var="vo">
							<tr>
								<td>${vo.num}</td>
								<td><a
									href="/mainboardread?num=${vo.num}&curPage=${dbTO.curPage}&perPage=${dbTO.perPage}">${vo.title}</a></td>
								<td>${vo.writer}</td>
								<td>${vo.updatedate}</td>
								<td>${vo.viewcnt}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table> --%>

				<div class="row text-center" style="text-align: center">
					<ul class="pagination">
						<!-- ul에 pagination 클래스를 주면 예쁘다 -->

						<c:if test="${dboTO.curPage>1}">
							<li><a
								href="/board/main/One/One?curPage=${dboTO.curPage-1}&perPage=${dboTO.perPage}">&laquo;</a></li>
						</c:if>
						<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

						<c:forEach begin="${dboTO.bpn}" end="${dboTO.spn}" var="idx">
							<li class="${dboTO.curPage == idx?'active':''}"><a
								href="/board/main/One/One?curPage=${idx}&perPage=${dboTO.perPage}">${idx}</a></li>
							<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
						</c:forEach>

						<c:if test="${dboTO.curPage<dboTO.totalPage}">
							<li><a
								href="/board/main/One/One?curPage=${dboTO.curPage+1}&perPage=${dboTO.perPage}">&raquo;</a></li>
						</c:if>

					</ul>
				</div>
				
				<div class="row ">
					<div class="input-group" style="padding-right: 10px;">
						<span class="input-group-addon"> <select id="searchSel">
								<option disabled>검색 기준</option>
								<option value="writer">작성자</option>
								<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
								<option value="title">제목</option>
								<option value="content">내용</option>
						</select>
						</span>

						<div class="w300" style="padding-right: 10px;">
							<input type="text" class="form-control from-control-sm"
								id="keyword">
						</div>

						<span class="input-group-btn" style="padding-right: 10px;">
							<button id="searchBtn" class="btn btn-sm btn-primary">검색</button>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br>

		<script type="text/javascript">
			   $(document).ready(function() {
				      
					   $("#searchBtn").on("click", function() {
							var searchType = $("#searchSel option:selected").val();
							var keyword = $("#keyword").val();
							var url = "/board/main/slist/searchboardlist?searchType="+searchType+"&keyword="+keyword;
							window.open(url);
						});
				   });
			</script>
</body>
</html>