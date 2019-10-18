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

<style type="text/css">
.bodymain {
	position: relative;
	margin: auto;
	height: 900px;
	width: auto;
}

.main {
	position: relative;
	left: 0%;
	width: auto;
	height: 850px;
	margin: 0;
}


.img2 {
	position: relative;
	left: 15px;
	width: 1070px;
	height: 409px;
}

.table0 {
	width: 300px;
	position: relative;
	right: 10px;
}
.table0 a,.table1 a, .table2 a{
	color: white;
}
.table1 {
	width: 300px;
	position: relative;
	left: 415px;
	margin: 0px;
	bottom: 411px;
}

.table2 {
	width: 300px;
	position: relative;
	left: 830px;
	bottom: 822px;
	margin: 0px;
}
#img1,#img2,#img3{
 border-radius: 10px;
 
}
#img1,#img2,#img3 {
box-shadow: 15px 15px 20px black;
}
#mainimg{
	border-radius: 20px;
}
.table0 th, .table0 td , .table1 th, .table1 td , .table2 th  , .table2 td{
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
					<table class="table table-dark">
						<thead>
							<tr>
								<th>게임순위<a href="#"><img src="/resources/main/icon_more.gif"
										style="position: relative; left: 215px;"></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.&nbsp;&nbsp;<a href="#">배틀오브<img src="/resources/main/TOP.jpg"
										alt="#" id="img1"></a></td>
							</tr>
							<tr>
								<td>2.&nbsp;&nbsp;<a>메이플 스토리</a></td>
							</tr>
							<tr>
								<td>3.&nbsp;&nbsp;<a>던전 앤 파이터</a></td>
							</tr>
							<tr>
								<td>4.&nbsp;&nbsp;<a>하스 스톤</a></td>
							</tr>
							<tr>
								<td>5.&nbsp;&nbsp;<a>리그 오브 레전드</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table1">
					<table class="table">
						<thead>
							<tr>
								<th>최신 순위&nbsp;&nbsp;<a href="#"><img
										src="/resources/main/icon_more.gif"
										style="position: relative; left: 215px;"></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.&nbsp;&nbsp;<a href="#">배틀오브<img src="/resources/main/TOP.jpg"
										alt="#" id="img2"></a></td>
							</tr>
							<tr>
								<td>2.&nbsp;&nbsp;<a>메이플 스토리</a></td>
							</tr>
							<tr>
								<td>3.&nbsp;&nbsp;<a>던전 앤 파이터</a></td>
							</tr>
							<tr>
								<td>4.&nbsp;&nbsp;<a>하스 스톤</a></td>
							</tr>
							<tr>
								<td>5.&nbsp;&nbsp;<a>리그 오브 레전드</a></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="table2">
					<table class="table">
						<thead>
							<tr>
								<th>무료 순위&nbsp;&nbsp;<a href="#"><img
										src="/resources/main/icon_more.gif"
										style="position: relative; left: 215px;"></a></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>1.&nbsp;&nbsp;<a href="#">배틀오브<img src="/resources/main/TOP.jpg" alt="#" id="img3"></a></td>
							</tr>
							<tr>
								<td>2.&nbsp;&nbsp;<a>메이플 스토리</a></td>
							</tr>
							<tr>
								<td>3.&nbsp;&nbsp;<a>던전 앤 파이터</a></td>
							</tr>
							<tr>
								<td>4.&nbsp;&nbsp;<a>하스 스톤</a></td>
							</tr>
							<tr>
								<td>5.&nbsp;&nbsp;<a>리그 오브 레전드</a></td>
							</tr>
						</tbody>
					</table>
				</div><!-- table2 -->
			</div><!-- main -->
		</div>	<!-- container -->
	</div><!-- bodymain -->

</body>
</html>