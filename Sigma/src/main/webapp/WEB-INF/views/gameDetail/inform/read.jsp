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
	p{
	color: white;
	}
		img {
			border-radius: 10px;
 			box-shadow: 15px 15px 20px black;
			}
</style>
</head>
<body>

<hr>
<div class="container">
	<h3>게임이름: ${vo.title}</h3>
	<h5>배급사: ${vo.writer}</h5>
	<h5>가격: <c:choose>
				<c:when test="${vo.dcrate eq 0}">
					${vo.price}
				</c:when>
				<c:when test="${vo.dcrate ne 0}">
					${vo.price * (1 - vo.dcrate / 100)} <span style="color:red">(${vo.dcrate}%off)</span>
				</c:when>
	</c:choose></h5>
	<h5>출시일: ${vo.regidate}</h5>
	<hr>
	<div class="row">
	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 700px; height: 400px; margin: 10px; ">
		<ol class="carousel-indicators">
			<li class="active" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
			<c:forEach items="${filepath}" varStatus="i">
				<li data-target="#carouselExampleIndicators" data-slide-to="${i.index+1}"></li>
			</c:forEach>
		</ol>
		<div class="carousel-inner" style="width: 700px; height: 400px; margin: 0;">
			<div class="carousel-item active">
				<img class="d-block w-100" src="/resources/gameDetailFile/${firstfilepath}" alt="">
			</div>
			
			<c:forEach items="${filepath}" var="filename">
				<div class="carousel-item">
					<img class="d-block w-100" src="/resources/gameDetailFile/${filename}" alt="">
				</div>
			</c:forEach>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
		</div>
		<div style="width: 400px; margin: 10px">
			<img class="" src="/resources/gameDetailFile/${firstfilepath}" alt="" height="180px" width="180px" style="margin: 5px;" data-target="#carouselExampleIndicators" data-slide-to="0">
			<c:forEach items="${filepath}" var="file" varStatus="i">
				<img class="" src="/resources/gameDetailFile/${file}" alt="" height="180px" width="180px" style="margin: 5px;" data-target="#carouselExampleIndicators" data-slide-to="${i.index+1}">
			</c:forEach>
		</div>
		</div>
		<hr>
		
		<h5>카테고리: ${vo.category}</h5>
		<h5>게임정보: ${vo.content}</h5>
		
		<hr>

		<div class="row pull-right" style="width: 30%;">
			<input class="pull-left shopBasket" style="width: 45%; margin: 5px;"
				type="button" value="장바구니에 추가"> <input
				class="pull-left zzim_list" style="width: 45%; margin: 5px;"
				type="button" value="찜목록에 추가">
		</div>

		<hr>
		나이대, 성별 그래프 적용해야함
		<hr>
		
		<div>
			<jsp:useBean id="now" class="java.util.Date" />
			<fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
			<c:choose>
				<c:when test="${empty dcvo}">
				</c:when>
				<c:when test="${dcvo.goal <= dcvo.joinclick && dcvo.dcenddate > today}">
					<p>할인 요청을 달성하여 ${dcvo.dcstartdate}부터 ${dcvo.dcenddate}까지 ${dcvo.dcrate}% 할인이 적용됩니다.</p>
				</c:when>
				<c:when test="${today <= dcvo.rqstartdate && dcvo.joinclick == 0}">
					${dcvo.rqstartdate}에 ${dcvo.dcrate}%의 할인이 시작됩니다!
				</c:when>
				<c:when test="${dcvo.rqstartdate <= today && today <= dcvo.rqenddate && dcvo.goal > dcvo.joinclick}">
					<p>할인요청 종료: ${dcvo.rqenddate}</p>
					<p>할인요청 목표수: ${dcvo.joinclick} / ${dcvo.goal}</p>
					<p>달성 시 할인율: ${dcvo.dcrate}</p>
					<a class="btn btn-primary" href="/gameDetail/inform/dcCountAdd?num=${vo.num}"
					onclick="return confirm('할인 요청에 동참하시겠습니까 ?');">동참하기</a>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
		
		<!-- 판매자만 보이게 할 버튼 -->
		<c:if test="${author eq 'seller'}">
			<a class="btn btn-primary" href="/gameDetail/inform/update?num=${vo.num}">게임정보수정</a>
	      	<a class="btn btn-primary" href="/gameDetail/inform/DCRqSet?num=${vo.num}&title=${vo.title}" target="_blank">할인 요청 등록</a>
      		<hr>
      	</c:if>
      	
      	<!-- 긍정리뷰 최다글 및 부정리뷰 최다글 -->
      	<div>
      		<c:choose>
      			<c:when test="${empty maxYesReview.assistyes}">
      				<p>아직 추천 공감 리스트가 없습니다!</p>
      			</c:when>
      			<c:when test="${maxYesReview.assistyes eq 0}">
      				<p>아직 추천 공감 리스트가 없습니다!</p>
      			</c:when>
      			<c:otherwise>
      				<h5>추천 최다 리뷰</h5>
		      		<p>작성자: ${maxYesReview.writer}</p>
		      		<p>내용: ${maxYesReview.content}</p>
		      		<p>수정일: ${maxYesReview.updatedate}</p>
		      		<p>좋아요: ${maxYesReview.assistyes} <button class="yesorno btn btn-success" id="assistYes" value="${maxYesReview.num}">좋아요</button></p>
		      		<p>싫어요: ${maxYesReview.assistno} <button class="yesorno btn btn-danger" id="assistNo" value="${maxYesReview.num}">싫어요</button></p>
		      		
		      		<c:if test="${id eq maxYesReview.writer}">
		      		
		      			<%-- <button class="reviewupdate btn btn-warning" value="${maxYesReview.num}">수정</button> <button class="reviewdelete btn btn-danger" value="${maxYesReview.num}">삭제</button> --%>
		      		</c:if>
      			</c:otherwise>
      		</c:choose>

			<c:choose>
				<c:when test="${empty maxNoReview.assistyes}">
					<p>아직 비추천 공감 리스트가 없습니다!</p>
				</c:when>
				<c:when test="${maxNoReview.assistyes eq 0}">
					<p>아직 비추천 공감 리스트가 없습니다!</p>
				</c:when>
				<c:otherwise>
					<h5>비추천 최다 리뷰</h5>
		      		<p>작성자: ${maxNoReview.writer}</p>
		      		<p>내용: ${maxNoReview.content}</p>
		      		<p>수정일: ${maxNoReview.updatedate}</p>
		      		<p>좋아요: ${maxNoReview.assistyes} <button class="yesorno btn btn-success" id="assistYes" value="${maxNoReview.num}">좋아요</button></p>
		      		<p>싫어요: ${maxNoReview.assistno} <button class="yesorno btn btn-danger" id="assistNo" value="${maxNoReview.num}">싫어요</button></p>
		      		<c:if test="${id eq maxNoReview.writer}">
		      			<a href="/gameDetail/inform/reviewupdate?num=${maxNoReview.num}" target="_blank" class="btn btn-warning">수정</a>
		      			<%-- <button class="reviewupdate btn btn-warning" value="${maxNoReview.num}">수정</button> <button class="reviewdelete btn btn-danger" value="${maxNoReview.num}">삭제</button> --%>
		      		</c:if>
				</c:otherwise>
			</c:choose>
      	</div>
      	
      	<hr>
      	
      	<!-- 리뷰 등록 -->
      	<div>
	      	<label for="reviewContent">리뷰 등록: </label>
	      	<input id="reviewContent" type="text" required="required">
	      	<select id="likeselect">
	      		<option value="추천">추천</option>
	      		<option value="비추천">비추천</option>
	      	</select>
	      	<button class="reviewInsert btn btn-primary">등록</button>
      	</div>
      	
      	<hr>
      	
      	<!-- 리뷰글 최신순 리스트 -->
      	<div>
      		<c:forEach items="${reviewlist}" var="review">
      			<div style="border: 1px dashed black">
      				<p>-${review.recommend} 리뷰-</p>
		      		<p>작성자: ${review.writer}</p>
		      		<p>내용: ${review.content}</p>
		      		<p>수정일: ${review.updatedate}</p>
		      		<p>좋아요: ${review.assistyes} <button class="yesorno btn btn-success" id="assistYes" value="${review.num}">좋아요</button></p>
		      		<p>싫어요: ${review.assistno} <button class="yesorno btn btn-danger" id="assistNo" value="${review.num}">싫어요</button></p>
		      		<c:if test="${id eq review.writer}">
		      			<a href="/gameDetail/inform/reviewupdate?num=${review.num}" target="_blank" class="btn btn-warning">수정</a>
		      			<%-- <button class="reviewupdate btn btn-warning" value="${review.num}">수정</button> <button class="reviewdelete btn btn-danger" value="${review.num}">삭제</button> --%>
		      		</c:if>
      			</div>
      		</c:forEach>
      	</div>
   </div>
   <br>
   <script type="text/javascript">
   	$(document).ready(function(){
   		$(".yesorno").on("click", function(){
   			var reviewnum = $(this).val();
   			var assist = $(this).attr("id");
   			
   			$.ajax({
   				type: 'get',
   				url: '/gameDetail/inform/reviewadd',
   				data: {
   					'num': reviewnum,
   					'assist': assist
   				},
   				datatype: 'text',
   				success: function(result){
   					alert('적용 되었습니다!');
   					window.location.reload();
   				}
   			});
   		});
   		
   		$(".reviewInsert").on("click", function(){
			var reviewContent = $("#reviewContent").val();
			var obj = document.getElementById("likeselect");
			var likeselect = obj.options[obj.selectedIndex].value;
			
   			$.ajax({
   				type: 'post',
   				url: '/gameDetail/inform/reviewinsert',
   				data: {
   					'gdnum': "${vo.num}",
   					'reviewContent': reviewContent,
   					'likeselect': likeselect
   				},
   				datatype: 'text',
   				success: function(){
   					alert('등록 되었습니다!');
   					window.location.reload();
   				},
   				error: function(){
   					alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
   				}
   			});
   		});
   		
   		$(".reviewupdate").on("click", function(){
			var num = $(this).val();
			
   			$.ajax({
   				type: 'get',
   				url: '/gameDetail/inform/reviewupdate',
   				data: {
   					'num': num,
   				},
   				datatype: 'text',
   				success: function(){
   					alert('등록 되었습니다!');
   					window.location.reload();
   				},
   				error: function(){
   					alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
   				}
   			});
   		});
   		
   		$(".reviewdelete").on("click", function(){
			var num = $(this).val();
			
   			$.ajax({
   				type: 'get',
   				url: '/gameDetail/inform/reviewdelete',
   				data: {
   					'num': num,
   				},
   				datatype: 'text',
   				success: function(){
   					alert('삭제 되었습니다!');
   					window.location.reload();
   				},
   				error: function(){
   					alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
   				}
   			});
   		});
   		
   		
   		
   	//장바구니에 추가
		$(".shopBasket").click(function() {
			var gdnum = ${vo.num};
			$.ajax({
				type : 'post',
				url : '/myPage/shopBasket/regiBasket',
				data : {
					gdnum : gdnum
				},
				dataType : 'text',
				success : function(event) {
					if(event=='failed'){
						var con = confirm("해당 상품이 이미 장바구니에 들어있습니다. 장바구니로 이동하시겠습니까?")
						if(con){
							location.href = "/myPage/shopBasket/regiBasket";
						}
					} else{
						var con = confirm("해당 상품을 장바구니에 집어넣었습니다. 장바구니로 이동하시겠습니까?")
						if(con){
							location.href = "/myPage/shopBasket/regiBasket";
						}
					}
				}
			});
		});
		
		//찜목록에 추가
		$(".zzim_list").click(function() {
			var gdnum = ${vo.num};
			$.ajax({
				type : 'post',
				url : '/myPage/zzimList/list',
				data : {
					gdnum : gdnum
				},
				dataType : 'text',
				success : function(event) {
					if(event=='failed'){
						var con = confirm("해당 상품이 이미 찜목록에 들어있습니다. 찜목록으로 이동하시겠습니까?")
						if(con){
							location.href = "/myPage/zzimList/list";
						}
					} else{
						var con = confirm("해당 상품을 찜목록에 집어넣었습니다. 찜목록으로 이동하시겠습니까?")
						if(con){
							location.href = "/myPage/zzimList/list";
						}
					}
				}
			});
		});
		
   	});
   </script>
</body>
</html>