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
<h1>GameDetail list</h1>
<hr>

<div class=container>
	<c:forEach items="${vo}" var="gvo">
	<div style="width: 33%; margin: 0; float: left;">
			<c:choose>
				<c:when test="${gvo.filepath eq null}">
					<a href="#"><img alt="No image" src="/resources/gameDetail/noimage.png" width="280px" height="280px"><p style="text-align: center;">${gvo.title}</p></a>
				</c:when>
				<c:when test="${gvo.filepath ne null}">
					<a href="#"><img alt="Game image" src="/resources/gameDetail/${gvo.filepath}" width="280px" height="280px"><p style="text-align: center;">${gvo.title}</p></a>
				</c:when>
			</c:choose>
	</div>
	</c:forEach>
</div>
</body>
</html>