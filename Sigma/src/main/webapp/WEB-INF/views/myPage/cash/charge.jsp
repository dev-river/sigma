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
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
	.bodymain{
	color: white;
	}
	button{
	color: black;
	}

</style>
</head>
<body>
	<div class="bodymain">
	<br>
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 730px; max-height: auto;">
		<div class="row" style="padding-left: 30px; padding-right: 30px;">
			<h3>${usercash.nickname}(${usercash.id})님의 캐쉬 충전</h3>
			<br>
			<div style="position: relative; left:5%; width:85%;" class="cash">
				<h3>결제하실 금액을 선택해주세요.</h3> <br>
				<button style="position: relative; left: 5%; height:50px; width: 20%; color: black;" class="btn num" value="1000" onclick="plus(thie)">1,000원</button>
				<button style="position: relative; left: 5%; height:50px; width: 20%; color: black;" class="btn num" value="5000" onclick="plus(thie)">5,000원</button>
				<button style="position: relative; left: 5%; height:50px; width: 20%; color: black;" class="btn num" value="10000" onclick="plus(thie)">10,000원</button>
				<button style="position: relative; left: 5%; height:50px; width: 20%; color: black;" class="btn num" value="50000" onclick="plus(thie)">50,000</button>
			</div>
			<hr>
			<br><br><br><br><br>
			<form action="/myPage/main/cash" method="post">
				<div style="position: relative; width: 40%;" class="pull-right">
					<h3>현재 잔액 : ${usercash.cash}원</h3>
					<br>
					<h3 class="pull-left" style="width:43%;">충전 후 잔액 :</h3>
					<input class="pull-left after_cash"  style="width: 35%; height: 24px; margin-top: 20px; color: black;" name="cash" value="${usercash.cash}" readonly="readonly"><h3 class="pull-right" style="position: relative; right: 70px;">원</h3>
					<button type="reset" style="position: relative; top: 13px; left:20px; color: black;" class="btn pull-right">리셋</button>
				</div>
				<br>
				<div style="position: relative; width:70%" class="pull-right">
					<button style="margin: 5px; padding:5px; width:28%; color: black;" class="btn return pull-right">취소</button>
					<button style="margin: 5px; padding:5px; width:28%; color: black;" class="btn charge pull-right">충전</button>
				</div>
				
				<input type="hidden" id="id" name="id" value="${usercash.id}"></input>
			</form>
		</div>
	</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".num").click(function() {
			var after = $(".after_cash").val();
			var val = $(this).val();
			
			after = (Number(after)+Number(val));
			$(".after_cash").val(after);
		});
		
		
		$(".return").click(function(event) {
			event.preventDefault();
			location.href = "/myPage/main/mypage";
		});
		
		$(".cash").children("button").click(function() {
			var cash = $(this).val();
			$.ajax({
				type : 'post',
				url : '/myPage/main/cash',
				data : {
					cash : cash
				}, 
				dataType : 'text',
				success : function(result) {
				}
			});
		});
		
	});
	
</script>
</body>
</html>