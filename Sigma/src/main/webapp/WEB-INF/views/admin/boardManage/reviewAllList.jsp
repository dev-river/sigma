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
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

#keyword {
	width: 765px;
}

#searchBtn {
	position: relative;
	right: 100px;
}
</style>
</head>
<body>
	<br>
<div class="bodymain">
		<div class="list">
			<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px; max-height: auto;">
			
			<div style="float: left;">
				<jsp:include page="/WEB-INF/views/admin/adminSetting/adminLeft.jsp"></jsp:include>
			</div>
			
			<br>
			<div class="row" >
			<div class="d" style="float: right; width: 870px; border-left: double 1px white; height: 700px; padding-left: 30px; padding-right: 30px;">
				<div class="secondMenu">
					<a target="_blank" href="/board/main/event/event">이벤트</a> <a
						target="_blank" href="/board/main/newgame/NewGame">새게임소식</a> <a
						target="_blank" href="/board/main/list/boardlist">자유게시판</a> <a
						target="_blank" href="#">공지사항적용예정</a>
				</div>

				<hr>

					<div class="row">
						<h3 style="color: white;">전체 리뷰 목록</h3>
					
						<div class="input-group" style="padding-right: 10px;">
							<span class="input-group-addon"> <select id="searchSel">
									<option disabled>검색 기준</option>
									<option value="writer">작성자</option>
									<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
									<option value="content">내용</option>
									<option value="title">게임제목</option>
							</select>
							</span>

							<div class="w300" style="padding-right: 10px;">
								<input type="text" class="form-control from-control-sm"
									id="keyword" style="width: 85%;">
							</div>

							<span class="input-group-btn" style="padding-right: 10px;">
								<button id="searchBtn" class="btn btn-sm btn-primary">검색</button>
							</span>
						</div>
					</div>
					<div class="allBoardList container">
					<table class="table table-hover" style="width: 800px; color: white;">
						<thead>
							<tr>
								<th>리뷰번호</th>
								<th>게임이름</th>
								<th>작성자</th>
								<th>작성일</th>
								<th>추천/비추천</th>
								<th>좋아요 수</th>
								<th>싫어요 수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${to.list}" var="vo">
								<tr>
									<td>${vo.num}</td>
									<td>${vo.title}</td>
									<td>
										<a href="/gameDetail/main/maincategoryreviewupdate?num=${vo.num}" target="_blank"
		      							onclick="window.open(this.href, 'reviewUpdate', 'width=1100, height=600'); return false;">${vo.writer}</a>
		      						</td>
									<td>${vo.regidate}</td>
									<td>${vo.recommend}</td>
									<td>${vo.assistyes}</td>
									<td>${vo.assistno}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
							<div class="row text-center" style="text-align: center">
			<ul class="pagination">
				<!-- ul에 pagination 클래스를 주면 예쁘다 -->

				<c:if test="${to.curPage>1}">
					<li><a
						href="/admin/main/board/ReviewManage?curPage=${to.curPage-1}&perPage=${to.perPage}&searchType=${to.searchType}&keyword=${to.keyword}">&laquo;</a></li>
				</c:if>
				<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

				<c:forEach begin="${to.bpn}" end="${to.spn}" var="idx">
					<li class="${to.curPage == idx?'active':''}"><a
						href="/admin/main/board/ReviewManage?curPage=${idx}&perPage=${to.perPage}&searchType=${to.searchType}&keyword=${to.keyword}">${idx}</a></li>
					<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
				</c:forEach>

				<c:if test="${to.curPage<to.totalPage}">
					<li><a
						href="/admin/main/board/ReviewManage?curPage=${to.curPage+1}&perPage=${to.perPage}&searchType=${to.searchType}&keyword=${to.keyword}">&raquo;</a></li>
				</c:if>
			</ul>
		</div>
				</div>
			</div>
		</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							/* 				      $("#perPageSel").change(function() {
							 var perPage = $("#perPageSel option:selected").val();
							 $.ajax({
							 type:'GET',
							 url: '/board/boardFR/amount/'+perPage,
							 dataType:'text',
							 success: function(totalPage) {
							 if(${dbTO.curPage}>totalPage){
							 location.assign("/mainboardNG?perPage="+perPage+"&curPage="+totalPage);
							 }else {
							 location.assign("/mainboardNG?perPage="+perPage+"&curPage=${dbTO.curPage}");
							 }
							 }
							 });
							 }); */

							$("#searchBtn").on("click", function() {
												var searchType = $("#searchSel option:selected").val();
												var keyword = $("#keyword").val();
												var url = "/admin/main/board/ReviewManage?searchType="
														+ searchType
														+ "&keyword=" + keyword;
												window.open(url);
											});
						});
	</script>
</body>
</html>