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
						<!-- <a href="/"><img alt="..." src="/resources/main/로고2.png"></a> -->
						<a href="/"><img alt="..." src="/resources/main/SIGMA로고.png" id="logo"></a>
					</div>
					<div class="login">
					
               		 <c:if test="${empty login}">
                		  <a class="glyphicon glyphicon-user" href="/member/login/login">로그인</a>
              		 </c:if>
              		
              		 <c:if test="${!empty login}">
              		 	 <div id="user">
             		     <c:if test="${login.author eq 'user'}">
                		     <a class="glyphicon glyphicon-user" href="/myPage/main/mypage">마이페이지</a>
                  			 <a class="glyphicon glyphicon-user" href="/member/login/logout">로그아웃</a>
                		 </c:if>
                		 </div>
                		 <div id="seller">
               		 	 <c:if test="${login.author eq 'seller'}">
                    		 <a class="glyphicon glyphicon-user" href="/compManage/main/manageread?id=${login.id}">판매자페이지</a>
                   			 <a class="glyphicon glyphicon-user" href="/member/login/logout">로그아웃</a>
                		 </c:if>
                		 </div>
                		 <div id="admin">
               		 	 <c:if test="${login.author eq 'admin'}">
                    		 <a class="glyphicon glyphicon-user" href="/admin/main/user/adminlist?id=${login.id}">관리자페이지</a>
                   			 <a class="glyphicon glyphicon-user" href="/member/login/logout">로그아웃</a>
                		 </c:if>
                		 </div>
              		 </c:if>
               	</div>
               
					<div class="ser">
							<form class="form-inline m-auto" action="/gameDetail/main/maincategory" method="get">
								<input type="hidden" name="category" value="all">
								<input type="hidden" name="curPage" value="1">
								<input type="hidden" name="perPage" value="6">
								<input type="hidden" name="searchType" value="title">
								<input class="form-control" type="text"
									placeholder="검색어를 입력하세요." aria-label="Search" id="se" name="keyword">
								<button type="submit" class="btn btn-warning" id="a"><span class="glyphicon glyphicon-search"></span></button>
							</form>
					</div>
				</div><!-- menu -->
				
					<div class="menubar"><!-- 메뉴 -->
						<ul>
							<li><a href="#" id="me1">새소식</a>
								<ul>
									<li id="st"><a href="/board/main/event/event">이벤트</a></li>
									<li id="end"><a href="/board/main/newgame/NewGame">새 게임 소식</a></li>
								</ul></li>

							<li><a href="/recommand/main/hotgameRec?curPage=1&perPage=9" id="current">맞춤 게임</a>
								<ul>
									<li><a href="/recommand/main/hotgameRec?curPage=1&perPage=9">인기게임</a></li>
									<li><a href="/recommand/main/freegameRec?curPage=1&perPage=6">무료게임</a></li>
									<li><a href="/recommand/main/newgameRec?curPage=1&perPage=6">신작게임</a></li>
									<li><a href="/recommand/main/dcgameRec?curPage=1&perPage=6">할인게임</a></li>
								</ul>
							<li><a href="/gameDetail/main/maincategory?category=all&curPage=1&perPage=6">카테고리</a>
								<ul>
									<li id="st"><a href="/gameDetail/main/maincategory?category=rpg">RPG</a></li>
									<li><a href="/gameDetail/main/maincategory?category=sportsracing">스포츠/레이싱</a></li>
									<li><a href="/gameDetail/main/maincategory?category=strategysimulation">전략/시뮬레이션</a></li>
									<li><a href="/gameDetail/main/maincategory?category=actionadventure">액션/어드벤쳐</a></li>
									<li id="end"><a href="/gameDetail/main/maincategory?category=etc">기타</a></li>
								</ul></li>
							<li><a href="/board/main/list/boardlist">커뮤니티</a>
								<ul>
									<li id="free"><a href="/board/main/list/boardlist">자유게시판</a></li>
								</ul></li>
							<li><a href="#" id="me2">고객센터</a>
								<ul>
									<li><a href="/board/main/notice/boardNO">공지사항</a></li>
									<li><a href="/board/main/One/One">1:1 문의</a></li>
									<li><a href="/QnA">Q and A</a></li>
									<li id="end"><a href="/myPage/main/refundInsert">환불신청</a></li>
								</ul>
              </li>
						</ul>
					</div>
					
			</div> <!--head -->
		</div><!-- container -->
		<hr style="border: solid 3px rgba(244,244,244,.3); position: relative; top: 33px; ">
	</div><!-- header -->


</body>
</html>