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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
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
				

				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100"
								src="/resources/slideBanner/${firstfilepath}" alt=""
								id="mainimg">
						</div>

						<c:forEach items="${filepath}" var="filename" begin="0" end="3">
							<div class="carousel-item">
								<img class="d-block w-100"
									src="/resources/slideBanner/${filename.filepath}" alt="" id="mainimg">
							</div>
						</c:forEach>
					</div>
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span class=""></span></a> 
					<a class="right carousel-control" href="#myCarousel" data-slide="next" >
						<span class=""></span></a>
				</div>

				<!-- 순위 -->
				<div class="table0">
					<table class="table">
						<thead>
							<tr>
								<th>게임순위<a href="#" style="position: relative; left: 205px;">
								<img src="/resources/main/icon_more.gif"></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.&nbsp;&nbsp;<a href="#">배틀오브<img src="/resources/main/TOP.jpg"
										alt="#" id="img1"></a></td>
							</tr>
							<tr>
								<td>2.&nbsp;&nbsp;<a href="#">메이플 스토리</a></td>
							</tr>
							<tr>
								<td>3.&nbsp;&nbsp;<a href="#">던전 앤 파이터</a></td>
							</tr>
							<tr>
								<td>4.&nbsp;&nbsp;<a href="#">하스 스톤</a></td>
							</tr>
							<tr>
								<td>5.&nbsp;&nbsp;<a href="#">리그 오브 레전드</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table1">
					<table class="table">
						<thead>
							<tr>
								<th>최신 순위&nbsp;&nbsp;<a href="#" style="position: relative; left: 205px;"><img
										src="/resources/main/icon_more.gif"></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.&nbsp;&nbsp;<a href="#">배틀오브<img src="/resources/main/TOP.jpg"
										alt="#" id="img2"></a></td>
							</tr>
							<tr>
								<td>2.&nbsp;&nbsp;<a href="#">메이플 스토리</a></td>
							</tr>
							<tr>
								<td>3.&nbsp;&nbsp;<a href="#">던전 앤 파이터</a></td>
							</tr>
							<tr>
								<td>4.&nbsp;&nbsp;<a href="#">하스 스톤</a></td>
							</tr>
							<tr>
								<td>5.&nbsp;&nbsp;<a href="#">리그 오브 레전드</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table2">
					<table class="table">
						<thead>
							<tr>
								<th>무료 순위&nbsp;&nbsp;<a href="#" style="position: relative; left: 205px;"><img
										src="/resources/main/icon_more.gif"></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.&nbsp;&nbsp;<a href="#">배틀오브<img src="/resources/main/TOP.jpg" alt="#" id="img3"></a></td>
							</tr>
							<tr>
								<td>2.&nbsp;&nbsp;<a href="#">메이플 스토리</a></td>
							</tr>
							<tr>
								<td>3.&nbsp;&nbsp;<a href="#">던전 앤 파이터</a></td>
							</tr>
							<tr>
								<td>4.&nbsp;&nbsp;<a href="#">하스 스톤</a></td>
							</tr>
							<tr>
								<td>5.&nbsp;&nbsp;<a href="#">리그 오브 레전드</a></td>
							</tr>
						</tbody>
					</table>
				</div><!-- table2 -->
			</div><!-- main -->
		</div>	<!-- container -->
	</div><!-- bodymain -->
	
</body>
</html>