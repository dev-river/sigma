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
.header {
	background : linear-gradient(#DB9700, #5D5D5D 40%, black);
	position: relative;
	margin: auto;
	width: auto;
	height: 180px;
}

.head {
	position: relative;
	left: 0%;
	width: 1070px;
	margin: 0;
}

.menu {
	width: 100%;
	margin: 0;
}

.ser {
	position: relative;
	left: 28%;
	top: 10%;
	width: 440px;
}

#se {
	width: 400px;
	height: 50px;
	border-radius: 70px;
}

.nva {
	width: auto;
	margin: 0;
}
.login{
	position: relative;
	left: 100%;
	width: 58px;
	margin: 0;
}
.menubar {
	position: relative;
	left: 22%;
	top : 30px;
	border: none;
	border: 0px;
	margin-right: auto;
	padding: 0px;
	font-size: 17px;
	font-weight: 1500;
	width: 700px;
	font: italic;

}

.menubar ul {
	background: write;
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
	width: 700px;
}

.menubar li {
	float: left;
	padding: 0px;
}

.menubar li a { /*메뉴*/
	background: linear-gradient(gray, orange 50%, gray);
	color: black;
	display: block;
	font-size: 1em;
	font-weight: normal;
	line-height: 50px;
	border: 3px solid black;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
	border-radius: 0;
}
#me2{
	border-radius: 0px 90px 90px 0px;
}
#me1{
	border-radius: 90px 0px 0px 90px;
}
.menubar li a:hover, .menubar ul li:hover a { /*드랍 마우스*/
	background: orange;
	color: black;
	text-decoration: none;
}

.menubar li ul {
	display: none; /* 평상시에는 드랍메뉴가 안보이게 하기 */
	height: auto;
	padding: 0px;
	margin: 0px;
	border: 0px;
	position: absolute;
	width: 150px;
	z-index: 200;
}

.menubar li:hover ul {
	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	background: orange;
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	height: 50px;
	width: 150px;
	border-radius: 50px;
}

.menubar li:hover li a {
	background: none;
}

.menubar li ul a {
	display: block;
	height: 50px;
	font-size: 14px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
}

.menubar li ul a:hover, .menubar li ul li:hover a {
	background: black;
	border: 0px;
	color: #ffffff;
	text-decoration: none;
	border-radius: 50px;
}

.img {
	position: absolute;
	width: 200px;
	height: 80px;
}

.img2 {
	position: relative;
	left: 15px;
	width: 1070px;
	height: 500px;
}
</style>
</head>
<body>
	<div class="header">

		<!-- 메뉴 상단 -->
		<div class="container">
			<div class="head"><!-- 전체 -->
				<div class="menu"> <!-- 로그인 로고 검색 -->
					<div class="img">
						<a href="/"><img alt="..." src="/resources/main/로고2.png"></a>
					</div>
					<div class="login">
						<a class="glyphicon glyphicon-user" href="#">로그인</a>
					</div>
					<div class="ser">

							<form class="form-inline m-auto" action="#">
								<input class="form-control" type="text"
									placeholder="검색어를 입력하세요." aria-label="Search" id="se">
								<a class="material-icons" href="#">search</a>
							</form>
					
					</div>
				</div><!-- menu -->



				<div class="nav"><!-- 메뉴 -->
					<div class="menubar">
						<ul>
							<li><a href="#" id="me1">새소식</a>
								<ul>
									<li><a href="/event">이벤트</a></li>
									<li><a href="#">새 게임 소식</a></li>
								</ul></li>

							<li><a href="#" id="current">게임 추천</a>
								<ul>
									<li><a href="#">게임추천</a></li>
									<li><a href="#">무료게임</a></li>
									<li><a href="#">이벤트게임</a></li>
									<li><a href="#">할인게임</a></li>
								</ul>
							<li><a href="#">카테고리</a>
								<ul>
									<li><a href="#">RPG</a></li>
									<li><a href="#">전쟁</a></li>
									<li><a href="#">스포츠</a></li>
									<li><a href="#">기타</a></li>
								</ul></li>
							<li><a href="#">커뮤니티</a>
								<ul>
									<li><a href="/mainboard">자유게시판</a></li>
								</ul></li>
							<li><a href="#" id="me2">고객센터</a>
								<ul>
									<li><a href="#">1:1 문의</a></li>
									<li><a href="#">Q and A</a></li>
									<li><a href="#">환불신청</a></li>
								</ul></li>
						</ul>
					</div>
				</div> <!-- nav -->
			</div> <!--head -->
		</div><!-- container -->
	</div><!-- header -->


</body>
</html>