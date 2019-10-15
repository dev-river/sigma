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
		<div class="col-xs-push-1 col-xs-11">
			<button style="width: 40%; height: 300px; margin : 25px 10px; padding: 25px 5px; background-color: rgba(70,140,140,0.7);" class="btn btn-primary id">아이디 찾기</button>
			<button style="width: 40%; height: 300px; margin : 25px 10px; padding: 25px 5px; background-color: rgba(140,70,70,0.7);" class="btn btn-primary pw">비밀번호 찾기</button>
		</div>
<script type="text/javascript">

	$(document).ready(function() {
		$(".id").click(function() {
			location.href = "/member/login/searchID";
		});
		$(".pw").click(function() {
			location.href = "/member/login/searchPW";
		});
	});

</script>
</body>
</html>