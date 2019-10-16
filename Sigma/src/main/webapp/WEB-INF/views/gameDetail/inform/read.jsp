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
</head>
<body>
<h1>GameDetail read page</h1>
<hr>

<div class="container">
	<h3>${vo.title}</h3>
	<h5>${vo.writer}</h5>
	<h5><c:choose>
				<c:when test="${vo.dcrate eq 0}">
					${vo.price}
				</c:when>
				<c:when test="${vo.dcrate ne 0}">
					${vo.price * (1 - vo.dcrate / 100)} <span style="color:red">(${vo.dcrate}%off)</span>
				</c:when>
	</c:choose></h5>
	<h5>${vo.regidate}</h5>
	<hr>

	<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 400px; height: 300px; margin: 0;">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		</ol>
		<div class="carousel-inner" style="width: 400px; height: 300px; margin: 0;">
			<div class="carousel-item active" style="width: 400px; height: 300px; margin: 0;">
				<img class="d-block w-100" src="/resources/gameDetailFile/${mainfilepath}" alt="">
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
</div>
</body>
</html>