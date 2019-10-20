<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<div class="container">
		
		<div class="row">
			<h3>${myinfo.nickname}(${myinfo.id})님의 마이페이지</h3>
			<br>
			<div  style="position: relative; left:5%; width:50%" class="pull-left">
					<button style="width:20%" class="pull-right update">프로필 수정</button>
					<p class="pull-left" style="width:50%">닉네임 : ${myinfo.nickname}</p>
					<p class="pull-right" style="width:30%">이름 : ${myinfo.name}</p>
					<br>
					<p class="pull-left" style="width:50%">ID : ${myinfo.id}</p>
					<p class="pull-right" style="width:50%">메일주소 : ${myinfo.email}</p>
					<br>
					<p class="pull-left" style="width:50%">보유 캐시 : ${myinfo.cash}원</p>
					<p class="pull-right" style="width:50%">작성 글 수 : 개</p>
					<br>
					<p class="pull-left" style="width:50%">보유 게임 수 : 개</p>
					<p class="pull-right" style="width:50%">작성 리뷰 수 : 개</p>
			</div>
			<div style="position: relative; left:5%; width:40%" class="pull-right">
				<a href="/myPage/zzimList/list" style="text-decoration:none; color: #333333;"><button style="margin: 5px; padding:5px; width:80%" class="btn zzimList">찜목록</button></a>
				<a href="/myPage/shopBasket/regiBasket" style="text-decoration:none; color: #333333;"><button style="margin: 5px; padding:5px; width:80%" class="btn shopBasket">장바구니</button></a>
				<a href="/myPage/cash/charge?id=${myinfo.id}" style="text-decoration:none; color: #333333;"><button style="margin: 5px; padding:5px; width:80%" class="btn cach">캐쉬 충전</button></a>
			</div>
		</div>
		
		
		<hr style="border: double; 1px; black;">
		
		<div class="row" style="width:65%; height:500px; padding-right:40px; border-right: double; 1px; black;">
			<h4 style="position: relative; left: 10%">게임</h4> <a class="pull-right">자세히 보기</a>
			<div  style="position: relative; left: 13%">
				<h5>최근 구매 목록</h5>
				<c:forEach items="${buyList}" var="buylist" varStatus="status">
					<c:if test="${status.index < 5}">
						<a>
							<div style="width:18%; margin:2px; height:150px; text-align: center;" class="pull-left">
								<img alt="" src="/resources/gameDetailFile/${img}" style="width: 80%; height: 80%;">
								<br>
								${buylist.title}
							</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
			
			<hr>
			
		</div>
	</div>
	<input type="hidden" id="id" value="${myinfo.id}"></input>
	
	
<script type="text/javascript">
	$(document).ready(function() {
		
		//프로필 수정
		var id = $("input[id='id']").val();
		$(".update").on("click",function(){
			location.href = "/myPage/myProfile/update?id="+id;
		});
		
		//캐쉬 충전 ---- 페이지 이동이 안 되서 버튼 안에 a 태그 넣음
		//$(".cash").click(function(event) {
		//	event.preventDefault();
		//	location.href = "/myPage/cash/charge?id="+id;
		//});
	});
	
	
	

</script>
</body>
</html>