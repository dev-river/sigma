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
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
	label{
	color: white;
	
	}
</style>
</head>
<body>
<div class="bodymain">
	<div class="container">
	<div class="row">
		<h2 style="color: white;">게임 등록</h2>
	</div>
	<div class="row body">
		<form action="/compManage/main/gameinsert" method="post">
			<input type="hidden" id="writer" name="writer" value="${login.id}">
			<input type="hidden" id="cash" name="cash" value="${cash}">
			<!-- 이름 -> 회사명으로 -->
			<div class="form-group">
				<label>게임 이름</label>
				<input id="title" name="title" placeholder="게임 이름을 작성하세요." class="form-control">
			</div>
			<div class="form-group">
				<label>가격</label>
				<input id="price" name="price" placeholder="가격을 작성하세요." class="form-control">
			</div>
			<div class="form-group">
				<label>카테고리</label>
				<select id="category" name="category" class="select">
					<option value="rpg" selected="selected">RPG</option>
					<option value="sportsracing">스포츠/레이싱</option>
					<option value="strategysimulation">전략/시뮬레이션</option>
					<option value="actionadventure">액션/어드벤쳐</option>
					<option value="etc">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label>게임정보</label>
				<textarea rows="5" id="content" name="content" class="form-control"></textarea>
			</div>
			<div class="form-group">
				<label for="dcrate">할인율</label>
				<input id="dcrate" name="dcrate" placeholder="할인율을 작성해주세요." class="form-contorl">
			</div>
			<div class="form-group">
				<label for="gamefilepath">게임 파일 경로</label>
				<input id="gamefilepath" name="gamefilepath" class="form-contorl" placeholder="파일경로" style="width: 80px;">
			</div>
			<div>
				<button class="btn insert">등록</button>
				<input type="button" class="btn" value="취소" onclick="location.href='/compManage/main/gamelist?writer=${login.id}'">
			</div>
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".select").change(function(){
			var select = $(".select option:selected").val();
			if(select == 4){
				$(".test").css("display", "block");
			}else{
				$(".test").css("display", "none");
			}
		});
		
		$(".insert").on("click",function(){
			var cash = $("input[id='cash']").val();
			var writer = $("input[id='writer']").val();
			if(cash < 1000){
				var check = confirm("캐시 충전하시겠습니까?");
				if(check==true){
					location.href="/myPage/main/cash?id="+writer;
					return false;
				}else{
					alert("리스트로 돌아갑니다.");
					location.href="/compManage/main/gamelist?writer="+writer;
					return false;
				}
			}else{
				location.href="/compManage/main/gameinsert";
			}	
		});
	});
</script>
</body>
</html>