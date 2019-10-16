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
			<h3>${usercash.nickname}(${usercash.id})님의 캐쉬 충전</h3>
			<br>
			<div  style="position: relative; left:5%; width:85%;">
				<h3>결제하실 금액을 선택해주세요.</h3> <br>
				<button style="position: relative; left: 5%; height:50px; width: 20%; rgb(200,200,200)" class="btn one" name="one" value="1000">1,000원</button>
				<button style="position: relative; left: 5%; height:50px; width: 20%; rgb(200,200,200)" class="btn two" name="two" value="5000">5,000원</button>
				<button style="position: relative; left: 5%; height:50px; width: 20%; rgb(200,200,200)" class="btn three" name="three" value="10000">10,000원</button>
				<button style="position: relative; left: 5%; height:50px; width: 20%; rgb(200,200,200)" class="btn four" name="four" value="50000">50,000</button>
			</div>
			<hr>
			<form action="/myPage/cash/charge" method="post">
				<div style="position: relative; width: 40%;" class="pull-right">
					<h3 style="width: 90%">현재 잔액 : ${usercash.cash}원</h3><br>
					<h3 style="width: 90%">충전후 잔액 : 원</h3>
					<button type="reset" style="position: relative; left:5px; width:25%; height: 18px; rgb(200,200,200)" class="btn pull-left">리셋</button>
				</div>
				<br>
				<div style="position: relative; width:70%" class="pull-right">
					<button style="margin: 5px; padding:5px; width:28%" class="btn return pull-right">취소</button>
					<button style="margin: 5px; padding:5px; width:28%" class="btn charge pull-right">충전</button>
				</div>
			</form>
		</div>
	</div>
	
<script type="text/javascript">

	$(document).ready(function() {
		
		$(".return").click(function(event) {
			event.preventDefault();
			location.href = "/myPage/myPage/mypage";
		});
		
		
	});
	
</script>
</body>
</html>