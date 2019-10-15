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
<style type="text/css">
.head{
	width: 400px;
	margin: 10px auto;
}
.body{
	width: 400px;
	margin: 10px auto;
}
</style>
</head>
<body>
<div>
	<div class="row head">
		<h2>게임 등록</h2>
	</div>
	<div class="row body">
		<form action="/compManage/gameList/gameInsert" method="post">
			<input type="hidden" id="writer" name="writer" value="idid">
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
					<option value="a" selected="selected">RPG</option>
					<option value="b">스포츠/레이싱</option>
					<option value="c">전략/시뮬레이션</option>
					<option value="d">액션/어드벤쳐</option>
					<option value="e">기타</option>
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
				<button class="btn">등록</button>
				<input type="button" class="btn" value="취소" onclick="location.href='/compManage/gameList/gameList?writer=kihoon'">
			</div>
		</form>
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
		
	});
</script>
</body>
</html>