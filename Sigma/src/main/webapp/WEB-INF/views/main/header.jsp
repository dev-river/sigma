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
	background-image : url(/resources/main/black.jpg);
	background-repeat: no-repeat; 
	background-position: center top;
	position: relative;
	margin: auto;
	width: auto;
	height: 180px;
}

.head {
	position: relative;
	left: 0%;
	width: auto;
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
	width: auto;
}

#se {
	width: 440px;
	height: 50px;
	border-radius: 70px;
}


.login{
	position: relative;
	left: 95%;
	width: 200px;
	margin: 0;
}
#user{
	position: relative;
	right: 60%;
	width: 200px;
	margin: 0;
}
#seller{
	position: relative;
	right: 60%;
	width: 200px;
	margin: 0;
}
.menubar {
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	position: relative;
	left: 22%;
	top : 45px;
	border: none;
	border: 0px;
	margin-right: auto;
	padding: 0px;
	font-size: 17px;
	font-weight: 1500;
	width: 600px;
	font: italic;
		

}

.menubar ul {
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	background: write;
	height: 50px;
	list-style: none;
	margin: 0;
	padding: 0;
	width: 600px;
	
}

.menubar li {
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	float: left;
	padding: 0px;
}

.menubar li a { /*메뉴*/
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	background: linear-gradient(orange);
	color: white;
	display: block;
	font-size: 1em;
	font-weight: normal;
	line-height: 50px;
	border: 0px solid black;
	margin: 0px;
	padding: 0px 25px;
	text-align: center;
	text-decoration: none;
	border-radius: 0;
	width: auto;
	
}

.menubar li a:hover, .menubar ul li:hover a { /*드랍 마우스*/
	transition : .30s ease-in-out;	/*천천히 반응 하게 하는거 transition*/
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	background: linear-gradient(30deg, orange,gray);
	color: black;
	text-decoration: none;
}

.menubar li ul {
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
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
	transition : .90s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	display: block; /* 마우스 커서 올리면 드랍메뉴 보이게 하기 */
}

.menubar li li {
	transition : .90s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	background: orange;
	display: block;
	float: none;
	margin: 0px;
	padding: 0px;
	height: 50px;
	width: 150px;
	
}

.menubar li:hover li a {
	transition : .90s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	background: none;
}

.menubar li ul a {
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	display: block;
	height: 50px;
	font-size: 14px;
	font-style: normal;
	margin: 0px;
	padding: 0px 10px 0px 15px;
}

.menubar li ul a:hover, .menubar li ul li:hover a {/*드랍 메뉴 마우스 올리면*/
	transition : .30s ease-in-out;
	transform : rotateX (-90deg) rotateY (0);
	transform-origin : 0 0;
	background: linear-gradient(30deg, orange,gray);
	border: 0px;
	color: #ffffff;
	text-decoration: none;
}

.img {
	position: absolute;
	width: auto;
	height: auto;
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
					
               		 <c:if test="${empty login}">
                		  <a class="glyphicon glyphicon-user" href="/member/login/login">로그인</a>
              		 </c:if>
              		
              		 <c:if test="${!empty login}">
              		 	 <div id="user">
             		     <c:if test="${login.author eq 'user'}">
                		     <a class="glyphicon glyphicon-user" href="/myPage/myPage/mypage">마이페이지</a>
                  			 <a class="glyphicon glyphicon-user" href="/member/login/logout">로그아웃</a>
                		 </c:if>
                		 </div>
                		 <div id="seller">
               		 	 <c:if test="${login.author eq 'seller'}">
                    		 <a class="glyphicon glyphicon-user" href="/compManage/compInform/read?id=${login.id}">판매자페이지</a>
                   			 <a class="glyphicon glyphicon-user" href="/member/login/logout">로그아웃</a>
                		 </c:if>
                		 </div>
              		 </c:if>
               	</div>
               
					<div class="ser">

							<form class="form-inline m-auto" action="#">
								<input class="form-control" type="text"
									placeholder="검색어를 입력하세요." aria-label="Search" id="se">
								<a class="material-icons" href="#">search</a>
							</form>
					
					</div>
				</div><!-- menu -->



				<!-- 메뉴 -->
					
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
							<li><a href="/gameDetail/inform/list?category=all">카테고리</a>
								<ul>
									<li><a href="/gameDetail/inform/list?category=rpg">RPG</a></li>
									<li><a href="/gameDetail/inform/list?category=sportsracing">스포츠/레이싱</a></li>
									<li><a href="/gameDetail/inform/list?category=strategysimulation">전략/시뮬레이션</a></li>
									<li><a href="/gameDetail/inform/list?category=actionadventure">액션/어드벤쳐</a></li>
									<li><a href="/gameDetail/inform/list?category=etc">기타</a></li>
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
				
			</div> <!--head -->
		</div><!-- container -->
	</div><!-- header -->


</body>
</html>