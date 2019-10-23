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
<link rel="stylesheet" type="text/css" href="/resources/css/header.css">
<style type="text/css">

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
                		 <div id="admin">
               		 	 <c:if test="${login.author eq 'admin'}">
                    		 <a class="glyphicon glyphicon-user" href="/admin/userManage/userlist?id=${login.id}">관리자페이지</a>
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
				
					<div class="menubar"><!-- 메뉴 -->
						<ul>
							<li><a href="#" id="me1">새소식</a>
								<ul>
									<li><a href="/event">이벤트</a></li>
									<li><a href="/NewGame">새 게임 소식</a></li>
								</ul></li>

							<li><a href="#" id="current">게임 추천</a>
								<ul>
									<li><a href="#">게임추천</a></li>
									<li><a href="#">무료게임</a></li>
									<li><a href="#">이벤트게임</a></li>
									<li><a href="#">할인게임</a></li>
								</ul>
							<li><a href="/maincategory?category=all">카테고리</a>
								<ul>
									<li><a href="/maincategory?category=rpg">RPG</a></li>
									<li><a href="/maincategory?category=sportsracing">스포츠/레이싱</a></li>
									<li><a href="/maincategory?category=strategysimulation">전략/시뮬레이션</a></li>
									<li><a href="/maincategory?category=actionadventure">액션/어드벤쳐</a></li>
									<li><a href="/maincategory?category=etc">기타</a></li>
								</ul></li>
							<li><a href="/mainboard">커뮤니티</a>
								<ul>
									<li><a href="/mainboard">자유게시판</a></li>
								</ul></li>
							<li><a href="#" id="me2">고객센터</a>
								<ul>
									<li><a href="#">공지사항</a></li>
									<li><a href="#">1:1 문의</a></li>
									<li><a href="#">Q and A</a></li>
									<li><a href="/myPage/buyList/refundInsert">환불신청</a></li>
								</ul>
              </li>
						</ul>
					</div>
			</div> <!--head -->
		</div><!-- container -->
	</div><!-- header -->


</body>
</html>