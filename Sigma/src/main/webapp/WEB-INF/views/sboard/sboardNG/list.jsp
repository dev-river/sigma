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

th,td {
	color: white;
}

</style>
</head>
<body>
<br>
<div class="bodymain">
<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
	
	<div class="row" style="padding-left: 30px; padding-right: 30px;">
	<br>
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
			<c:forEach items="${to.list}" var="no">
				<tr>
					<td>${no.num}</td>
					<td><a href="/board/main/slist/searchboardNGRead?num=${no.num}&searchType=${to.searchType}&keyword=${to.keyword}&curPage=${to.curPage}&perPage=${to.perPage}">${no.title}</a></td>
					<td>${no.writer}</td>
					<td>${no.updatedate}</td>
					<td>${no.viewcnt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
		<div class="row text-center" style="text-align: center">
				<ul class="pagination"> <!-- ul에 pagination 클래스를 주면 예쁘다 -->
				
					<c:if test="${to.curPage>1}">
						<li><a href="/board/main/slist/searchboardNGList?searchType=${to.searchType}&keyword=${to.keyword}&curPage=${to.curPage-1}&perPage=${to.perPage}">&laquo;</a></li>
					</c:if> <!-- 주소창에서 perPage값을 조절하면서 확인할것 -->
					
					<c:forEach begin="${to.bpn}" end="${to.spn}" var="idx">
						<li class="${to.curPage == idx?'active':''}"><a href="/board/main/slist/searchboardNGList?searchType=${to.searchType}&keyword=${to.keyword}&curPage=${idx}&perPage=${to.perPage}">${idx}</a></li>
						<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
					</c:forEach>
					
					<c:if test="${to.curPage<dbTO.totalPage}">
						<li><a href="/board/main/slist/searchboardNGList?searchType=${to.searchType}&keyword=${to.keyword}&curPage=${to.curPage+1}&perPage=${to.perPage}">&raquo;</a></li>
					</c:if>
					
				</ul>
			</div>
			</div>
			</div>
			</div>
			<script type="text/javascript">
			   $(document).ready(function() {
				      $("#perPageSel").change(function() {
				         var perPage = $("#perPageSel option:selected").val();
				         
				         $.ajax({
				            type:'GET',
				            url: '/sboard/sboardNG/amount/'+perPage,
				            data:{
				            	'searchType' : '${to.searchType}',
				            	'keyword' : '${to.keyword}'
				            },
				            dataType : 'text',
				            success: function(totalPage) {
				            	alert(totalPage);
				            	var curPage = ${to.curPage}
				            	
				               if(curPage>totalPage){
				                  location.assign("/board/main/searchboardNGList?perPage="+perPage+"&curPage="+totalPage+"&searchType=${to.searchType}&keyword=${to.keyword}");
				               }else {
				                  location.assign("/board/main/searchboardNGList?perPage="+perPage+"&curPage=${dbTO.curPage}&searchType=${to.searchType}&keyword=${to.keyword}");
				               }
				            }
				         });
				      });
				      
				   });
			</script>
</body>
</html>