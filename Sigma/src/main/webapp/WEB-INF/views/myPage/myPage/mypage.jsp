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
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
	.row{
	color: white;
	}
	a{
		color: white;
	}
	#img1{
		border-radius: 10px;
 		box-shadow: 15px 15px 20px black;
	}
</style>
</head>
<body>
<div class="bodymain">
<br>
	<div class="container"  style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 730px; max-height: auto;">
		<br>
		<div class="row" style="padding-left: 30px; padding-right: 30px; padding-bottom: 30px;">
			<h3>${myinfo.nickname}(${myinfo.id})님의 마이페이지</h3>
			<br>
			<div  style="position: relative; left:5%; width:50%" class="pull-left">
					<button style="width:20%; color: black; float:right; position: relative; top: 120px;" class="pull-right update">프로필 수정</button>
					<p class="pull-left" style="width:50%">닉네임 : ${myinfo.nickname}</p>
					<p class="pull-right" style="width:30%">이름 : ${myinfo.name}</p>
					<br>
					<p class="pull-left" style="width:50%">ID : ${myinfo.id}</p>
					<p class="pull-right" style="width:50%">메일주소 : ${myinfo.email}</p>
					<br>
					<p class="pull-left" style="width:50%">보유 캐시 : ${myinfo.cash}원</p>
					<p class="pull-right" style="width:50%">작성 글 수 : ${writecount}개</p>
					<br>
					<p class="pull-left" style="width:50%">보유 게임 수 : ${gamecount}개</p>
					<p class="pull-right" style="width:50%">작성 리뷰 수 : ${reviewcount}개</p>
			</div>
			<div style="position: relative; left:5%; width:40%" class="pull-right">
				<a href="/myPage/main/zzim" style="text-decoration:none; color: #333333;"><button style="margin: 5px; padding:5px; width:80%" class="btn zzimList">찜목록</button></a>
				<a href="/myPage/main/Basket" style="text-decoration:none; color: #333333;"><button style="margin: 5px; padding:5px; width:80%" class="btn shopBasket">장바구니</button></a>
				<a href="/myPage/main/cash?id=${myinfo.id}" style="text-decoration:none; color: #333333;"><button style="margin: 5px; padding:5px; width:80%" class="btn cach">캐쉬 충전</button></a>
			</div>
		</div>
		
		
		<hr style="border: double; 1px; black;">
		
		<div class="row" style="width:65%; height:auto; padding-right:40px; border-right: double; 1px; black;">
			<h3 style="position: relative; left: 10%">게임</h3>
			<div style="height: 180px;">
				<h4 style="position: relative; left: 13%" class="pull-left">최근 구매 목록</h4>
				<a class="pull-right" href="/myPage/main/buylist">자세히 보기</a>
				<br>
				<c:forEach items="${buyList}" var="buylist" varStatus="status">
					<c:if test="${status.index < 4}">
						<a href="/gameDetail/main/maincategoryread?num=${buylist.gdnum}">
							<div style="width:18%; margin:2px; height:150px; text-align: center;" class="pull-left">
								<c:choose>
									<c:when test="${buylist.filepath eq null}">
										<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 80%; height: 70%; border: 1px solid black; position: relative; right: 30px; top: 30px;" id="img1">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/gameDetailFile/${buylist.filepath}" style="width: 80%; height: 70%; border: 1px; solid; black; position: relative; right: 30px; top: 30px;" id="img1">
									</c:otherwise>
								</c:choose>
								<br>
								<p style="position: relative; right: 30px; top: 35px;">${buylist.title}<p>
							</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
			
			<hr>
			
			<div style="height: 180px;">
				<h4 style="position: relative; left: 13%; top: -10px;" class="pull-left">단골 스토어 목록</h4>
				<a class="pull-right" href="/myPage/subscribe/ssubComp">자세히 보기</a>
				<br>
				<c:forEach items="${favComp}" var="favComp" varStatus="status">
					<c:if test="${status.index < 4}">
						<a href="/myPage/subscribe/subComp?writer=${favComp.id}">
							<div style="width:18%; margin:2px; height:150px; text-align: center;" class="pull-left">
								<c:choose>
									<c:when test="${favComp.filepath eq null}">
										<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 80%; height: 70%; border: 1px; solid; black;  position: relative; right: 30px; top: 30px;" id="img1">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/gameDetailFile/${favComp.filepath}" style="width: 80%; height: 70%; border: 1px; solid; black;  position: relative; right: 30px; top: 30px;" id="img1">
									</c:otherwise>
								</c:choose>
								<br>
								<p style="position: relative; right: 30px; top: 35px;">${favComp.id}</p>
							</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
			
			<hr>
			
			<div style="height: 180px;">
				<h4 style="position: relative; left: 13%; top: -10px;" class="pull-left">환불 신청 목록</h4>
				<a class="pull-right" href="/myPage/main/buy/refundlist">자세히 보기</a>
				<br>
				<c:forEach items="${refund}" var="refund" varStatus="status">
					<c:if test="${status.index < 4}">
						<a href="/gameDetail/main/maincategoryread?num=${refund.gdnum}">
							<div style="width:18%; margin:2px; height:150px; text-align: center;" class="pull-left">
								<c:choose>
									<c:when test="${refund.filepath eq null}">
										<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 80%; height: 70%; border: 1px; solid; black; position: relative; right: 30px; top: 30px;" id="img1">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/gameDetailFile/${refund.filepath}" style="width: 80%; height: 70%; border: 1px; solid; black; position: relative; right: 30px; top: 30px;" id="img1">
									</c:otherwise>
								</c:choose>
								<br>
								<p style="position: relative; right: 30px; top: 35px;">${refund.title}<p>
							</div>
						</a>
					</c:if>
				</c:forEach>
			</div>
			
			
		</div>
	</div>
	<br>
	<br>
	<input type="hidden" id="id" value="${myinfo.id}"></input>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		//프로필 수정
		var id = $("input[id='id']").val();
		$(".update").on("click",function(){
			location.href = "/myPage/main/myprofile?id="+id;
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