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

<div class="container" style="background-color: rgb(25,25,25,0.6); border-radius: 10px; padding-left: 20px; padding-right: 20px;">
	<div class="row head">
		<h2 style="color: white;">gameDetail update page</h2>
	</div>
	<div class="row body">
		<form action="/gameDetail/main/maincategoryupdate" method="post">
			<input name="num" type="hidden" value="${vo.num}">
			<input type="hidden" id="writer" name="writer" value="${vo.writer}">
			<div class="form-group">
				<label>게임 이름</label>
				<input id="title" name="title" placeholder="게임 이름을 작성하세요." class="form-control" value="${vo.title}">
			</div>
			<div class="form-group">
				<label>가격</label>
				<input id="price" name="price" placeholder="가격을 작성하세요." class="form-control" value="${vo.price}">
			</div>
			<div class="form-group">
				<label>카테고리</label>
				<select id="category" name="category" class="select">
					<option value="rpg">RPG</option>
					<option value="sportsracing">스포츠/레이싱</option>
					<option value="strategysimulation">전략/시뮬레이션</option>
					<option value="actionadventure">액션/어드벤쳐</option>
					<option value="etc">기타</option>
				</select>
			</div>
			<div class="form-group">
				<label>게임정보</label>
				<textarea rows="5" id="content" name="content" class="form-control">${vo.content}</textarea>
			</div>
			<div class="form-group">
				<label for="dcrate">할인율</label>
				<input id="dcrate" name="dcrate" placeholder="할인율을 작성해주세요." class="form-contorl" value="${vo.dcrate}">
			</div>
			<div class="form-group">
				<label for="gamefilepath">게임 파일 경로</label>
				<p style="color: white;">${vo.gamefilepath}</p>
				<div class="GameDrop"></div>
				<div class="GameList"></div>
			</div>
			<div class="form-group">
				<label>메인 그림파일 업로드</label>
				<p><img src="/gameDetail/imgfile?filename=s_${vo.filepath}"></p>
				<div class="ImgDrop"></div>
				<div class="ImgList"></div>
			</div>
			<div class="form-group">
				<label style="float: left;">그림파일 4개 업로드</label>
				<div class="ImgsrcDrop1"></div>
				<div class="ImgsrcList1"></div>
				<p><img src="/gameDetail/imgsrcfile1?filename=s_${str1}"></p>
				<div class="ImgsrcDrop2"></div>
				<div class="ImgsrcList2"></div>
				<p><img src="/gameDetail/imgsrcfile1?filename=s_${str2}"></p>
				<div class="ImgsrcDrop3"></div>
				<div class="ImgsrcList3"></div>
				<p><img src="/gameDetail/imgsrcfile1?filename=s_${str3}"></p>
				<div class="ImgsrcDrop4"></div>
				<div class="ImgsrcList4"></div>
				<p><img src="/gameDetail/imgsrcfile1?filename=s_${str4}"></p>
			</div>
			<div>
				<input type="submit" class="btn" value="수정">
				<input type="button" class="btn" value="취소" onclick="location.href='/gameDetail/main/maincategoryread?num=${vo.num}'">
			</div>
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$("option").each(function(){
		    if($(this).val()=="${vo.category}"){
		      $(this).attr("selected","selected"); // attr적용안될경우 prop으로 
		    }
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
					url : '/gameDetail/gameajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							str += "<div><p>'"+data+"'</p><input type='hidden' id='filename' name='filename' value='"+data+"'></div>";
						}else{
							if(data != null){
								str += "<div><img href='/gameDetail/gamefile?filename="+data+"'><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
							}else{
								str += "<input type='hidden' id='gamefilepath' name='gamefilepath' value='${vo.gamefilepath}'>"
							}
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
					url : '/gameDetail/imgajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							if(data != null){
								str += "<div><img src='/gameDetail/imgfile?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filepath' name='filepath' value='"+data+"'></div>";
							}else{
								str += "<div><input type='hidden' id='filepath' name='filepath' value='${vo.filepath}'></div>";
							}
						}else{
								str += "<div><img href='/gameDetail/displayfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
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
					url : '/gameDetail/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							if(data != null){
								str += "<div><img src='/gameDetail/imgsrcfile1?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename1' name='filename1' value='"+data+"'></div>";
							}else{
								str += "<div><input type='hidden' id='filename1' name='filename1' value='${str1}'></div>";
							}
						}else{
							str += "<div><img href='/gameDetail/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
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
					url : '/gameDetail/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							if(data != null){
								str += "<div><img src='/gameDetail/imgsrcfile2?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename2' name='filename2' value='"+data+"'></div>";
							}else{
								str += "<div><input type='hidden' id='filename2' name='filename2' value='${str2}'></div>";
							}
						}else{
							str += "<div><img href='/gameDetail/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
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
					url : '/gameDetail/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							if(data != null){
								str += "<div><img src='/gameDetail/imgsrcfile3?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename3' name='filename3' value='"+data+"'></div>";
							}else{
								str += "<div><input type='hidden' id='filename3' name='filename3' value='${str3}'></div>";
							}
						}else{
							str += "<div><img href='/gameDetail/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
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
					url : '/gameDetail/imgsrcajax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str = '';
						
						if(checkImageType(data)){
							if(data != null){
								str += "<div><img src='/gameDetail/imgsrcfile4?filename="+data+"' alt='게임파일 그림'/><p style='color: white;'>"+getOriginalName(data)+"</p><input type='hidden' id='filename4' name='filename4' value='"+data+"'></div>";
							}else{
								str += "<div><input type='hidden' id='filename4' name='filename4' value='${str4}'></div>";
							}
						}else{
							str += "<div><img href='/gameDetail/imgsrcfile?filename="+data+"'><img src='/resources/test.png' alt='일반파일 썸네일입니다.'/><input type='hidden' id='gamefilepath' name='gamefilepath' value='"+data+"'></div>"
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
</script>
</body>
</html>