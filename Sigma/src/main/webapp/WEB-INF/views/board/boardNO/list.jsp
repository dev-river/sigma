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
#test_btn1 {
	border-radius: 5px;
	padding-right: 10px;
	margin-right: 10px;
	width: 100px;
	float: left;
	margin: 5px; padding:5px; width:80%;
	}


	#btn_group button {
		border: 1px solid white;
		background-color: rgba(0, 0, 0, 0);
		color: white;
		padding: 5px;
		position: relative;
		left:0%;
		width:7%;
		float: right;
	}

	#btn_group button:hover {
		color: white;
		background-color: black;
	}
</style>
</head>
<body>
	<br>
	<div class="bodymain">
<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px; max-height: auto;">
<%--   	<div class="row">
         <div class="col-xs-push-10 col-xs-2">
            <select id="perPageSel" class="form-control">
               <option disabled>페이지당 글 수</option>
               <option ${dbTO.perPage == 10? 'selected':''}>10</option>
               <option ${dbTO.perPage == 20? 'selected':''}>20</option>
            </select>
         </div>
      </div>  --%>
	
	
	<br>
	<div class="row" style="padding-left: 30px; padding-right: 30px;">
<!-- 	<a href="/board/boardFR/insert" class="btn btn-primary">글쓰기</a> -->
	<table class="table table-hover" style="color: white">
	<h3 style="color: white;">공지사항</h3>
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
			<c:forEach items="${dbnoTO.list}" var="vo">
				<tr>
					<td>${vo.num}</td>
					<td><a href="/board/main/notice/boardNOread?num=${vo.num}&curPage=${dbnoTO.curPage}&perPage=${dbnoTO.perPage}">${vo.title}</a></td>
					<td>${vo.writer}</td>
					<td>${vo.updatedate}</td>
					<td>${vo.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
					<div id="btn_group">
	<c:if test="${not empty login}">
	<c:if test="${login.author eq 'admin'}">
					<button id="test_btn1" onclick="location.href='/board/main/notice/boardNOinsert'">글쓰기</button>
					</c:if>
					</c:if>
					</div>
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

						<c:if test="${dbnoTO.curPage>1}">
							<li><a
								href="/board/main/notice/boardNO?curPage=${dbnoTO.curPage-1}&perPage=${dbnoTO.perPage}">&laquo;</a></li>
						</c:if>
						<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

						<c:forEach begin="${dbnoTO.bpn}" end="${dbnoTO.spn}" var="idx">
							<li class="${dbnoTO.curPage == idx?'active':''}"><a
								href="/board/main/notice/boardNO?curPage=${idx}&perPage=${dbnoTO.perPage}">${idx}</a></li>
							<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
						</c:forEach>

						<c:if test="${dbnoTO.curPage<dbnoTO.totalPage}">
							<li><a
								href="/board/main/notice/boardNO?curPage=${dbnoTO.curPage+1}&perPage=${dbnoTO.perPage}">&raquo;</a></li>
						</c:if>

					</ul>
				</div>
				
			<div class="row ">
				<div class="input-group" style="padding-right: 100px; padding-left: 100px; padding-bottom: 50px;">
					<span class="input-group-addon"> <select id="searchSel" style="height: 23px;">
							<option disabled>검색 기준</option>
							<option value="writer">작성자</option>
							<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
							<option value="title">제목</option>
							<option value="content">내용</option>
					</select>
					</span>

					<div class="w300" style="padding-right: 100px; ">
						<input type="text" style="height:40px; " class="form-control from-control-lg"
							id="keyword">
					</div>

					<span class="input-group-btn" >
						<button id="searchBtn" class="btn btn-sm btn-info" style="height: 40px;">검색</button>
					</span>
				</div>
			</div>
			</div>
		</div>

	<br><br>

		<script type="text/javascript">
			   $(document).ready(function() {
/* 				      $("#perPageSel").change(function() {
				         var perPage = $("#perPageSel option:selected").val();
				         $.ajax({
				            type:'GET',
				            url: '/board/boardNG/amount/'+perPage,
				            dataType:'text',
				            success: function(totalPage) {
				               if(${dbTO.curPage}>totalPage){
				                  location.assign("/board/main/list/boardNGlist?perPage="+perPage+"&curPage="+totalPage);
				               }else {
				                  location.assign("/board/main/list/boardNGlist?perPage="+perPage+"&curPage=${dbTO.curPage}");
				               }
				            }
				         });
				      }); */
				      
					   $("#searchBtn").on("click", function() {
							var searchType = $("#searchSel option:selected").val();
							var keyword = $("#keyword").val();
							var url = "/board/main/slist/searchboardNGList?searchType="+searchType+"&keyword="+keyword;
							window.open(url);
						});
				   });
			</script>
</body>
</html>