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
<style type="text/css">
			img { display: block; margin: 0px auto;
			text-align: center;
			}
		</style>
</head>
<body>
<h1>GameDetail category list page</h1>
<hr>

<div class=container>
	<c:forEach items="${vo}" var="gvo">
	<div style="width: 33%; margin: 0; float: left;">
			<a href="/gameDetail/inform/read?num=${gvo.num}">
			<c:choose>
				<c:when test="${gvo.filepath eq null}">
					<img alt="No image" src="/resources/gameDetailFile/noimage.png" width="280px" height="280px">
				</c:when>
				<c:when test="${gvo.filepath ne null}">
					<img alt="Game image" src="/resources/gameDetailFile/${gvo.filepath}" width="280px" height="280px">
				</c:when>
			</c:choose>
			<p style="text-align: center; margin-top: 5px; margin-bottom: 0px">Title: ${gvo.title}</p>
			<p style="text-align: center; margin-bottom: 10px;">Price: 
			<c:choose>
				<c:when test="${gvo.dcrate eq 0}">
					${gvo.price}
				</c:when>
				<c:when test="${gvo.dcrate ne 0}">
					${gvo.price * (1 - gvo.dcrate / 100)} <span style="color:red">(${gvo.dcrate}%off)</span>
				</c:when>
			</c:choose>
			</p>
			</a>
			<hr>
	</div>
	</c:forEach>
</div>
</body>
</html>