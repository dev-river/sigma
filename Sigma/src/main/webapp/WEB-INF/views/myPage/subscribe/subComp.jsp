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
			<div>
				<h4>${comp.title}</h4>
				<c:choose>
					<c:when test="${comp.filepath eq null}">
						<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 80%; height: 80%; border: 1px; solid; black;">
					</c:when>
					<c:otherwise>
						<img alt="" src="/resources/gameDetailFile/${comp.filepath}" style="width: 80%; height: 80%; border: 1px; solid; black;">
					</c:otherwise>
				</c:choose>
			</div>
			<br>
			<div>
				<c:forEach items="${comp}" var="comp">
					<c:choose>
						<c:when test="${comp.gamefilepath eq null}">
							<img alt="" src="/resources/gameDetailFile/noimage.png" style="width: 80%; height: 80%; border: 1px; solid; black;">
						</c:when>
						<c:otherwise>
							<img alt="" src="/resources/gameDetailFile/${comp.gamefilepath}" style="width: 80%; height: 80%; border: 1px; solid; black;">
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>