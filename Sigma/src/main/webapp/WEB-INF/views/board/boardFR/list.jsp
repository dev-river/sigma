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
		${login.nickname}(${login.id}) 님, 안녕하세요. <a href="/member/login/logout">로그아웃</a>
	</c:if>
	<!-- 미로그인시 뜨는 창 -->
	<c:if test="${empty login}">
		<a href="/member/login/login">로그인</a>
	</c:if>
	
<%-- 	  <div class="row">
         <div class="col-xs-push-10 col-xs-2">
            <select id="perPageSel" class="form-control">
               <option disabled>페이지당 글 수</option>
               <option ${to.perPage==5? 'selected':''}>5</option>
               <option ${to.perPage==10? 'selected':''}>10</option>
               <option ${to.perPage==20? 'selected':''}>20</option>
            </select>
         </div>
      </div> --%>
	
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
			<c:forEach items="${dbTO.list}" var="vo">
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
		<div class="row text-center" style="text-align: center">
				<ul class="pagination"> <!-- ul에 pagination 클래스를 주면 예쁘다 -->
				
					<c:if test="${dbTO.curPage>1}">
						<li><a href="/board/boardFR/list?curPage=${dbTO.curPage-1}&perPage=${dbTO.perPage}">&laquo;</a></li>
					</c:if> <!-- 주소창에서 perPage값을 조절하면서 확인할것 -->
					
					<c:forEach begin="${dbTO.bpn}" end="${dbTO.spn}" var="idx">
						<li class="${dbTO.curPage == idx?'active':''}"><a href="/board/boardFR/list?curPage=${idx}&perPage=${dbTO.perPage}">${idx}</a></li>
						<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
					</c:forEach>
					
					<c:if test="${dbTO.curPage<dbTO.totalPage}">
						<li><a href="/board/boardFR/list?curPage=${dbTO.curPage+1}&perPage=${dbTO.perPage}">&raquo;</a></li>
					</c:if>
					
				</ul>
			</div>
	
		
	
</body>

</html>