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

<style type="text/css">
.list {
	position: relative;
	width: 1070px;
	height: auto;
	margin: 0;
	right: 45px;
	
}

.bodymain {
	position: relative;
	margin: auto;
	height: auto;
	width: 1070px;
}
#keyword{
	width: 765px;
}
#searchBtn{
	position: relative;
	right: 100px;
}
</style>
</head>
<body>
	<br>
	<br>
<div class="bodymain">
	<div class="container">
		<div class="list">
		
			<div class="row">
				<div class="col-xs-push-10 col-xs-2">
					<select id="perPageSel" class="form-control">
						<option disabled>페이지당 글 수</option>
						<option ${dbTO.perPage == 10? 'selected':''}>10</option>
						<option ${dbTO.perPage == 20? 'selected':''}>20</option>
					</select>
				</div>
			</div>

			<a href="/mainboardinsert" class="btn btn-primary">글쓰기</a>
			<table class="table">
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
			</table>
		
			<div class="row text-center" style="text-align: center">
				<ul class="pagination">
					<!-- ul에 pagination 클래스를 주면 예쁘다 -->

					<c:if test="${dbTO.curPage>1}">
						<li><a
							href="/mainboard?curPage=${dbTO.curPage-1}&perPage=${dbTO.perPage}">&laquo;</a></li>
					</c:if>
					<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

					<c:forEach begin="${dbTO.bpn}" end="${dbTO.spn}" var="idx">
						<li class="${dbTO.curPage == idx?'active':''}"><a
							href="/mainboard?curPage=${idx}&perPage=${dbTO.perPage}">${idx}</a></li>
						<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
					</c:forEach>

					<c:if test="${dbTO.curPage<dbTO.totalPage}">
						<li><a
							href="/mainboard?curPage=${dbTO.curPage+1}&perPage=${dbTO.perPage}">&raquo;</a></li>
					</c:if>

				</ul>
			</div>
			<div class="row">
				<div class="input-group">
					<span class="input-group-addon"> <select id="searchSel">
							<option disabled>검색 기준</option>
							<option value="writer">작성자</option>
							<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
							<option value="title">제목</option>
							<option value="content">내용</option>
					</select>
					</span> <input class="form-control" id="keyword"> <span
						class="input-group-btn">
						<button id="searchBtn" class="btn btn-info">검색</button>
					</span>
				</div>
			</div>
		</div>
	</div>
	</div>
	<br>
	<br>
	<script type="text/javascript">
			   $(document).ready(function() {
				      $("#perPageSel").change(function() {
				         var perPage = $("#perPageSel option:selected").val();
				         $.ajax({
				            type:'GET',
				            url: '/board/boardFR/amount/'+perPage,
				            dataType:'text',
				            success: function(totalPage) {
				               if(${dbTO.curPage}>totalPage){
				                  location.assign("/mainboard?perPage="+perPage+"&curPage="+totalPage);
				               }else {
				                  location.assign("/mainboard?perPage="+perPage+"&curPage=${dbTO.curPage}");
				               }
				            }
				         });
				      });
				      
					   $("#searchBtn").on("click", function() {
							var searchType = $("#searchSel option:selected").val();
							var keyword = $("#keyword").val();
							var url = "/sboard/list? searchType = "+searchType+"&keyword="+keyword;
							window.open(url);
						});
				   });
			</script>

</body>
</html>