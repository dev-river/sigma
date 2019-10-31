<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/body.css">
<link rel="stylesheet" type="text/css" href="/resources/css/side.css">
<style type="text/css">
a :hover{
	color: white;
}
</style>
</head>
<body>
	<div class="bodymain">
		<br>
		<!-- 메인 이미지-->
		<div class="container">
			<div class="main">
				<div class="row">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<!--슬라이드1-->
							<div class="item active">
								<img src="/resources/main/main.jpg"
									style="width: 100%" alt="First slide" id="mainimg">
								<div class="container">
									<div class="carousel-caption">
										<h1>Slide 1</h1>
										<p>텍스트 1</p>
									</div>
								</div>
							</div>
							<!--슬라이드1-->

							<!--슬라이드2-->
							<div class="item">
								<img src="http://www.blueb.co.kr/SRC2/_image/w02.jpg"
									style="width: 100%" data-src="" alt="Second slide" id="mainimg">
								<div class="container">
									<div class="carousel-caption">
										<h1>Slide 2</h1>
										<p>텍스트 2</p>
									</div>
								</div>
							</div>
							<!--슬라이드2-->

							<!--슬라이드3-->
							<div class="item">
								<img src="http://www.blueb.co.kr/SRC2/_image/w03.jpg"
									style="width: 100%" data-src="" alt="Third slide" id="mainimg">
								<div class="container">
									<div class="carousel-caption">
										<h1>Slide 3</h1>
										<p>텍스트 3</p>
									</div>
								</div>
							</div>
							<!--슬라이드3-->
						</div>

						<!--이전, 다음 버튼-->
						<a class="left carousel-control" href="#myCarousel" data-slide="prev" id="mainimg">
						<span class=""></span></a> 
						<a class="right carousel-control" href="#myCarousel" data-slide="next" id="mainimg">
						<span class=""></span></a>
					</div>
				</div>

				<!-- 순위 -->
				<div class="table0">
					<table class="table">
						<thead>
							<tr>
								<th>인기 순위&nbsp;&nbsp;<a href="/recommand/main/hotgameRec" style="position: relative; left: 205px;"><img
										src="/resources/main/icon_more.gif"></a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${hgame}" var="h" begin="0" end="0">
								<tr>
									<td>1.&nbsp;&nbsp;<a href="/gameDetail/main/maincategoryread?num=${h.num}&curPage=1&perPage=5">${h.title}
									<c:choose>
										<c:when test="${h.filepath eq null}">
											<img alt="No image" src="/resources/gameDetailFile/noimage.png"
												width="280px" height="140px" id="img1">
										</c:when>
										<c:when test="${h.filepath ne null}">
											<img alt="Game image"
												src="/resources/gameDetailFile/${h.filepath}" width="280px"
												height="180px" id="img1">
										</c:when>
									</c:choose></a>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${hgame}" var="h" begin="1" end="4" varStatus="status">
								<tr>
									<td>
										${status.index + 1}.&nbsp;&nbsp;<a href="/gameDetail/main/maincategoryread?num=${h.num}&curPage=1&perPage=5">${h.title}</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="table1">
					<table class="table">
						<thead>
							<tr>
								<th>최신 순위&nbsp;&nbsp;<a href="/recommand/main/newgameRec" style="position: relative; left: 205px;"><img
										src="/resources/main/icon_more.gif"></a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${ngame}" var="h" begin="0" end="0">
								<tr>
									<td>1.&nbsp;&nbsp;<a href="/gameDetail/main/maincategoryread?num=${h.num}&curPage=1&perPage=5">${h.title}
									<c:choose>
										<c:when test="${h.filepath eq null}">
											<img alt="No image" src="/resources/gameDetailFile/noimage.png"
												width="280px" height="180px" id="img1">
										</c:when>
										<c:when test="${h.filepath ne null}">
											<img alt="Game image"
												src="/resources/gameDetailFile/${h.filepath}" width="280px"
												height="180px" id="img1">
										</c:when>
									</c:choose></a>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${ngame}" var="h" begin="1" end="4" varStatus="status">
								<tr>
									<td>
										${status.index + 1}.&nbsp;&nbsp;<a href="/gameDetail/main/maincategoryread?num=${h.num}&curPage=1&perPage=5">${h.title}</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="table2">
					<table class="table">
						<thead>
							<tr>
								<th>할인 순위&nbsp;&nbsp;<a href="/recommand/main/dcgameRec" style="position: relative; left: 205px;"><img
										src="/resources/main/icon_more.gif"></a></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${dcgame}" var="h" begin="0" end="0">
								<tr>
									<td>1.&nbsp;&nbsp;<a href="/gameDetail/main/maincategoryread?num=${h.num}&curPage=1&perPage=5">${h.title}
									<c:choose>
										<c:when test="${h.filepath eq null}">
											<img alt="No image" src="/resources/gameDetailFile/noimage.png"
												width="280px" height="180px" id="img1">
										</c:when>
										<c:when test="${h.filepath ne null}">
											<img alt="Game image"
												src="/resources/gameDetailFile/${h.filepath}" width="280px"
												height="180px" id="img1">
										</c:when>
									</c:choose></a>
									</td>
								</tr>
							</c:forEach>
							<c:forEach items="${dcgame}" var="h" begin="1" end="4" varStatus="status">
								<tr>
									<td>
										${status.index + 1}.&nbsp;&nbsp;<a href="/gameDetail/main/maincategoryread?num=${h.num}&curPage=1&perPage=5">${h.title}</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div><!-- table2 -->
			</div><!-- main -->
		</div>	<!-- container -->
	</div><!-- bodymain -->
	
</body>
</html>