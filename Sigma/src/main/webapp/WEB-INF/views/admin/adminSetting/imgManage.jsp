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

<style type="text/css">

	.LogofileDrop{
		width: 100%;
		height: 200px;
		border: 1px dotted red;
	}
	.BGfileDrop{
		width: 100%;
		height: 200px;
		border: 1px dotted blue;
	}
	.row{
	color: white;
	}
</style>

</head>
<body>
<br>


<div class="container"  style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px; max-height: auto;">
	<div style="float: left;">
	<jsp:include page="/WEB-INF/views/admin/adminSetting/adminLeft.jsp"></jsp:include>
	</div>
	<div class="row"  style="float: right; width: 870px; border-left: double 1px white; height: 700px; padding-left: 30px; padding-right: 30px;">
		<br>
		<div class="col col-xs-6">
				<div class="form-group">
					<label>업로드할 로고이미지 파일을 드랍시키세요</label>
					<div class="LogofileDrop"></div>
				</div>

				<div class="form-group">
					<label>업로드되어있는 로고이미지</label>
					<div>
						<img alt="등록이미지"
							src="/admin/adminSetting/imgManage/displayfile?filename=s_${LogoVo.logofilepath}">
					</div>
				</div>

				<div class="form-group">
					<div class="uploadedLogoList clearfix"></div>
				</div>
		</div>
		<div class="col col-xs-6">
				<div class="form-group">
					<label>업로드할 배경이미지 파일을 드랍시키세요</label>
					<div class="BGfileDrop"></div>
				</div>

				<div class="form-group">
					<label>업로드되어있는 배경이미지</label>
					<div>
						<img alt="등록이미지"
							src="/admin/adminSetting/imgManage/displayfile?filename=s_${BgVo.bgfilepath}">
					</div>
				</div>

				<div class="form-group">
					<div class="uploadedBGList clearfix"></div>
				</div>

		</div>
	
			<div class="pull-right" style="float: right;">
			<input type="submit" class="btn btn-primary form-submit submitbtn"
				value="적용">
			</div>

	</div>
	
</div>	
	<script type="text/javascript">
	
	$("document").ready(function(){
		
		$(".LogofileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".BGfileDrop").on("dragenter dragover", function(event){
			event.preventDefault();
		});
		
		$(".LogofileDrop").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files; /* 드래그&드롭 후 파일의 정보를 arr에 넣음 */
			
			for(var idx=0;idx<arr.length;idx++){
				
				var file = arr[idx];
			
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/admin/adminSetting/imgManage/uploadLogoAjax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str='';
						
						if(checkImageType(data)){
							str += "<label>업로드될 로고이미지</label><div><img src='/admin/adminSetting/imgManage/displayfile?filename="+data+"' alt='일반파일 썸네일입니다' /><p>"+getOriginalName(data)+"</p></div>"
						}else{
							str += "<div><img src='/resources/test.png' alt='썸네일 안보임.'/><p>"+getOriginalName(data)+"</p></div>"
						}

						$(".uploadedLogoList").append(str);
					}
				});
			} /* for문을 여기까지 돌려주면 다중 업로드가 가능하다 */
		});
		
		$(".BGfileDrop").on("drop", function(event){
			event.preventDefault();
			
			var arr = event.originalEvent.dataTransfer.files; /* 드래그&드롭 후 파일의 정보를 arr에 넣음 */
			
			for(var idx=0;idx<arr.length;idx++){
				
				var file = arr[idx];
			
				var formData = new FormData();
				formData.append("file", file);
				
				$.ajax({
					type : 'post',
					url : '/admin/adminSetting/imgManage/uploadBGAjax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str='';
						
						if(checkImageType(data)){
							str += "<label>업로드될 배경이미지</label><div><img src='/admin/adminSetting/imgManage/displayfile?filename="+data+"' alt='일반파일 썸네일입니다' /><p>"+getOriginalName(data)+"</p></div>"
						}else{
							str += "<div><img src='/resources/test.png' alt='썸네일 안보임.'/><p>"+getOriginalName(data)+"</p></div>"
						}

						$(".uploadedBGList").append(str);
					}
				});
			} /* for문을 여기까지 돌려주면 다중 업로드가 가능하다 */
		});
		
		$(".submitbtn").on("click",function(){
			location.href="/admin/adminSetting/imgManage";
		});

	});
	
	function checkImageType(data){
		var pattern = /jpg|png|jpeg|gif/i; /* 확장자 확인 (i를 쓰면 대소문자 구분없어짐)*/
		return data.match(pattern);
	}
	
	function getOriginalName(data){
		var idx = data.lastIndexOf("_new_")+5;
		
		return data.substring(idx)
	}
	
	</script>
</body>
</html>