<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

	<div id="Left">
		<div style="position: absolute; left: 30px; top: 0px;">
		<h4 class="h4_tit1_2">해당 페이지는 관리자만 이용 가능합니다.</h4>
		<ul>
			<li class="buCon1">
				<span id="countdown">초</span>
				후 사용자 메인페이지로 이동합니다.
				<a href="/" onclick="goMain()">[바로가기]</a>
			</li>
		</ul>
	</div>
	
</div>
<script type="text/javascript">
	var count = 10;
	var countdown = setInterval( function () {
		$( "#countdown" ).html( count + "초" );
		if ( count == 0 ) {
		clearInterval( countdown );
			goMain();
		}
		count--;
		} ,1000 );
	function goMain () {
		location.href = '/';
	}
	document.oncontextmenu = function () {
		return false;
	};
	document.ondragstart = function () {
		return false;
	};
	document.onselectstart = function () {
		return false;
	};
	document.onkeydown = function () {
		return false;
	};
	
</script>
</body>
</html>