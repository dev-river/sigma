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
			<div style="width: 100%; height: 250px; margin-top: 20px;">
				<div class="pull-left">
					<c:choose>
						<c:when test="${filepath eq null}">
							<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 100%; height: 100%; border: 1px; solid; black;">
						</c:when>
						<c:otherwise>
							<img alt="" src="/resources/gameDetailFile/${filepath}" style="width: 100%; height: 100%; border: 1px; solid; black;">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="pull-left" style="width: 20%;">
					<h2>${writer}</h2>
					<br>
					<h4>${content}</h4>
				</div>
				<c:choose>
					<c:when test="">
						<input type="button" value="단골 스토어 지정" style="width: 30%; margin-right: 50px;" class="pull-right btn in">
					</c:when>
					<c:otherwise>
						<input type="button" value="단골 스토어에서 제거" style="width: 30%; margin-right: 50px;" class="pull-right btn del">
					</c:otherwise>
				</c:choose>
			</div>
			<br>
			<c:forEach items="${comp}" var="com">
				<a href="/maincategoryread?num=${com.num}">
				<div  style="width: 120px; height: 120px; margin: 5px; padding: 5px; border: 10px; solid; black;" class="pull-left">
					<c:choose>
						<c:when test="${com.gamefilepath eq null}">
							<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 100px; height: 100px">
						</c:when>
						<c:otherwise>
							<img alt="" src="/resources/gameDetailFile/${com.gamefilepath}" style="width: 100px; height: 100px">
						</c:otherwise>
					</c:choose>
					${com.title}
				</div>
				</a>
			</c:forEach>
		</div>
	</div>
	<input type="hidden" value="${writer}" class="gamewriter">
<script type="text/javascript">
	$(document).ready(function() {
		var gamewriter = $(".gamewriter").val();
		$(".in").click(function() {
			$.ajax({
				type : 'post',
				url : '/myPage/subscribe/insert',
				data : {
					writer : gamewriter
				},
				success : function() {
					alert("성공");
				}
			})
		});
	});
</script>
</body>
</html>