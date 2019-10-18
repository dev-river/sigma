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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h3>
	 imgManage test.  
</h3>

<hr>

	<!-- 로그인 되면 뜨는 창 -->
	<c:if test="${not empty login}">
		${login.nickname}(${login.id}) 님, 안녕하세요. <a href="/member/login/logout">로그아웃</a>
	</c:if>
	<!-- 미로그인시 뜨는 창 -->
	<c:if test="${empty login}">
		<a href="/member/login/login">로그인</a>
	</c:if>
	
	
	<script type="text/javascript">
	$(document).ready(function(){
		
		
	});
	</script>
</body>
</html>