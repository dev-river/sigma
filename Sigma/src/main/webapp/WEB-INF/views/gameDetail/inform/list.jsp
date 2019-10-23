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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
			img { display: block; margin: 0px auto;
			text-align: center;
			border-radius: 10px;
 			box-shadow: 15px 15px 20px black;
			}
			checkbox{
				position: relative;
				left: 100%;
			}
			p{
			color: white;
	
		</style>
</head>
<body>

<hr>
		<div class=bodymain>
			
<div class=container>
	<!-- 검색 파트 -->
			<div class="row ">
				<div class="input-group" style="padding-right: 10px;">
					<span class="input-group-addon">
					<select id="searchSel">
							<option disabled>검색 기준</option>
							<option value="writer">배급사</option>
							<!-- value : 서버로 넘어가는거, 작성자 : JSP에 보이는거 -->
							<option value="title">게임이름</option>
							<option value="price">이하 가격</option>
							<option value="regidate">이하 출시일</option>
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

			<!-- 게임 리스트 파트 -->
	<c:forEach items="${vo.list}" var="gvo">
	<div style="width: 33%; margin: 0; float: left;">
			
			<a href="/gameDetail/main/maincategoryread?num=${gvo.num}">
			<c:choose>
				<c:when test="${gvo.filepath eq null}">
					<img alt="No image" src="/resources/gameDetailFile/noimage.png" width="280px" height="280px">
				</c:when>
				<c:when test="${gvo.filepath ne null}">
					<img alt="Game image" src="/resources/gameDetailFile/${gvo.filepath}" width="280px" height="280px">
				</c:when>
			</c:choose>
			<p style="text-align: center; margin-top: 5px; margin-bottom: 0px">Title: ${gvo.title}</p>
			<p style="text-align: center; margin-bottom: 10px;">Price: 
			<c:choose>
				<c:when test="${gvo.dcrate eq 0}">
					${gvo.price}
				</c:when>
				<c:when test="${gvo.dcrate ne 0}">
					${gvo.price * (1 - gvo.dcrate / 100)} <span style="color:red">(${gvo.dcrate}%off)</span>
				</c:when>
			</c:choose>
			</p>
			</a>
			<hr>
	</div>
	</c:forEach>
	
	<!-- 게임 리스트 페이징 파트 -->
			<div>
				<div class="row text-center" style="text-align: center">
					<ul class="pagination">
						<!-- ul에 pagination 클래스를 주면 예쁘다 -->

						<c:if test="${vo.curPage>1}">
							<li><a
								href="/gameDetail/main/maincategory?category=${category}&curPage=${vo.curPage-1}&perPage=${vo.perPage}">&laquo;</a></li>
						</c:if>
						<!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

						<c:forEach begin="${vo.bpn}" end="${vo.spn}" var="idx">
							<li class="${vo.curPage == idx?'active':''}"><a
								href="/gameDetail/main/maincategory?category=${category}&curPage=${idx}&perPage=${vo.perPage}">${idx}</a></li>
							<!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
						</c:forEach>

						<c:if test="${vo.curPage<vo.totalPage}">
							<li><a
								href="/gameDetail/main/maincategory?category=${category}&curPage=${vo.curPage+1}&perPage=${vo.perPage}">&raquo;</a></li>
						</c:if>

					</ul>
				</div>
			</div>
		</div>
</div>
<script type="text/javascript">
$(document).ready(function() {
   $("#searchBtn").on("click", function() {
		var searchType = $("#searchSel option:selected").val();
		var keyword = $("#keyword").val();
		var url = "/board/main/slist/searchboardlist?searchType="+searchType+"&keyword="+keyword;
		window.open(url);
	});
});

function movepage(page)
{
window.document.location.href=page;
return;
}
</script>
</body>
</html>