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
	.GameDrop{
		width: 100%;
		height: 100px;
		border: 1px dotted red;
	}
	.ImgDrop{
		width: 100%;
		height: 100px;
		border: 1px dotted red;
	}
	.ImgsrcDrop1{
		width: 20%;
		height: 100px;
		border: 1px dotted red;
	}
	.ImgsrcDrop2{
		width: 20%;
		height: 100px;
		border: 1px dotted red;
	}
	.ImgsrcDrop3{
		width: 20%;
		height: 100px;
		border: 1px dotted red;
	}
	.ImgsrcDrop4{
		width: 20%;
		height: 100px;
		border: 1px dotted red;
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
		<form action="/compManage/main/gameinsert" method="post" onsubmit="return check();">
			<input type="hidden" id="writer" name="writer" value="${login.id}">
			<input type="hidden" id="cash" name="cash" value="${cash}">
			<!-- 이름 -> 회사명으로 -->
			<div class="form-group">
				<label>게임 이름</label>
				<input id="title" name="title" placeholder="게임 이름을 작성하세요." class="form-control">
				<p class="titlecheck"></p>
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
				<label>게임파일 업로드</label>
				<div class="GameDrop"></div>
				<div class="GameList"></div>
			</div>
			<div class="form-group">
				<label>메인 그림파일 업로드</label>
				<div class="ImgDrop"></div>
				<div class="ImgList"></div>
			</div>
			<div class="form-group">
				<label style="float: left;">그림파일 4개 업로드</label>
				<div class="ImgsrcDrop1"></div>
				<div class="ImgsrcList1"></div>
				<div class="ImgsrcDrop2"></div>
				<div class="ImgsrcList2"></div>
				<div class="ImgsrcDrop3"></div>
				<div class="ImgsrcList3"></div>
				<div class="ImgsrcDrop4"></div>
				<div class="ImgsrcList4"></div>
			</div>
			<div style="float: left;">
				<p >
				<button class="btn insert">등록</button>
				<input type="button" class="btn" value="취소" onclick="location.href='/compManage/main/gamelist?writer=${login.id}'">
			</div>
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("#title").keyup(function(event){
			event.preventDefault();
			var title = $("input[id='title']").val();
			$.ajax({
				type : 'post',
				url : '/compManage/titlecheck',
				data : {
					title : title
				},
				dataType : 'text',
				success : function(result){
					if(result=='ok'){
						$(".titlecheck").text('게임 제목이 있습니다.').css("color", "red");
					}else{
						$(".titlecheck").text('게임 제목이 없습니다.').css("color", "blue");
					}
				}
			});
		});
		$(".GameDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		$(".GameDrop").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/gameajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><p>'"+data+"'</p><input type='hidden' id='filename' name='filename' value='"+data+"'></div>";
						}else{
							str += "<div><img href='/compManage/gamefile?filename="+data+"'><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
						}
						
						$(".GameList").append(str);
					}
				});
			}
		});
		
		$(".ImgDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		$(".ImgDrop").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/imgajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><img src='/compManage/imgfile?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filepath' name='filepath' value='"+data+"'></div>";
						}else{
							str += "<div><img href='/compManage/displayfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
						}
						
						$(".ImgList").append(str);
					}
				});
			}
		});
		
		$(".ImgsrcDrop1").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		$(".ImgsrcDrop1").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><img src='/compManage/imgsrcfile1?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename' name='filename1' value='"+data+"'></div>";
						}else{
							str += "<div><img href='/compManage/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
						}
						
						$(".ImgsrcList1").append(str);
					}
				});
			}
		});
		
		$(".ImgsrcDrop2").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		$(".ImgsrcDrop2").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><img src='/compManage/imgsrcfile2?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename' name='filename2' value='"+data+"'></div>";
						}else{
							str += "<div><img href='/compManage/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
						}
						
						$(".ImgsrcList2").append(str);
					}
				});
			}
		});
		
		$(".ImgsrcDrop3").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		$(".ImgsrcDrop3").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><img src='/compManage/imgsrcfile3?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename' name='filename3' value='"+data+"'></div>";
						}else{
							str += "<div><img href='/compManage/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
						}
						
						$(".ImgsrcList3").append(str);
					}
				});
			}
		});
		
		$(".ImgsrcDrop4").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		$(".ImgsrcDrop4").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files;
			
			for(var idx=0; idx<arr.length; idx++){
				var file = arr[idx];
				
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/compManage/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><img src='/compManage/imgsrcfile4?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename' name='filename4' value='"+data+"'></div>";
						}else{
							str += "<div><img href='/compManage/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
						}
						
						$(".ImgsrcList4").append(str);
					}
				});
			}
		});
	});
	
	function checkImageType(data){
		var pattern = /jpg|png|jpeg|gif/i;
		return data.match(pattern);
	}
	
	function getOriginalName(data){	
		
		var idx = data.lastIndexOf("_")+1;
		
		return data.substring(idx);
	}
	
	function check(){
		var cash = $("input[id='cash']").val();
		var writer = $("input[id='writer']").val();
		var title = $(".titlecheck").text();
		if(cash >= 0  && cash < 1000){
			var check = confirm("캐시 충전하시겠습니까?");
			if(check==true){
				location.href="/myPage/main/cash?id="+writer; 
				return false;
			}else{
				alert("리스트로 돌아갑니다.");
				location.href="/compManage/gameList/gameList?writer="+writer;
				return false;
			}
		}else if(title=='게임 제목이 있습니다.'){
			return false;
		}else{
			return true;
		}
	}
</script>
</body>
</html>