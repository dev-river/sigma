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
.Drop{
		width: 100%;
		height: 200px;
		border: 1px dotted red;
}
.uploadedList{
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<div class="container">
	<div class="row head">
		<h2>게임 등록</h2>
	</div>
	<div class="row body">
		<form action="/compManage/gameList/gameInsert" method="post" enctype="multipart/form-data">
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
				<input type="text" id="gamefilepath" name="gamefilepath" class="form-contorl" placeholder="파일경로" style="width: 80px;">
			</div>
			
			<div class="Drop"></div>
			<div class="uploadedList"></div>
							
			<div>
				<input type="submit" class="btn" value="등록">
				<input type="button" class="btn" value="취소" onclick="location.href='/compManage/gameList/gameList?writer=${login.id}'">
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".Drop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".Drop").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/uploadajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><img src='displayfile?filename="+data+"' alt='게임파일 그림'/><p>"+data+"</p></div>";
						}else{
							str += "<div><img src='/resouces/gameDetailFile/noimage.png' alt='일반파일 그림'/><p>"+data+"</p></div>";
						}
						
						$(".uploadedList").append(str);
					}
				});
			}
			
		});
	});
	
	function checkImageType(data){
		var pattern = /jpg|png|jpeg|gif/i;
		return data.match(pattern);
	}
	function check(form){
		var cash = $("input[id='cash']").val();
		var writer = $("input[id='writer']").val();
		alert(cash);
		if(cash >= 0  && cash < 1000){
			var check = confirm("캐시 충전하시겠습니까?");
			if(check==true){
				location.href="/myPage/cash/charge?id="+writer;
				return false;
			}else{
				alert("리스트로 돌아갑니다.");
				location.href="/compManage/gameList/gameList?writer="+writer;
				return false;
			}
		}else{
			return true;
		}
	}
</script>
</body>
</html>