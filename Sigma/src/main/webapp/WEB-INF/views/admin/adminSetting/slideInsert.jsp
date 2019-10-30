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
	.fileDrop{
		width: 100%;
		height: 200px;
		border: 1px dotted red;
	}
	label{
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
	<div class="row" style="float: right; width: 870px; border-left: double 1px white; padding-left: 30px; padding-right: 30px; padding-top: 30px;  min-height: 700px; max-height: auto;">
			<div class="insert">
				<div class="row">
					<form action="/admin/main/setting/slidemanageinsert" method="post">
						<div class="form-group">
							<label>업로드할 로고이미지 파일을 드랍시키세요</label>
							<div class="fileDrop"></div>
						</div>
						
						<input type="text" readonly="readonly" class="uploadfilename" name="filepath">
						
						<div class="form-group">
							<label for="urlpath">URLpath</label> 
							<input id="urlpath" name="urlpath" class="form-control" placeholder="링크될 URL">
						</div>
						<div class="form-group">
							<div class="uploadedBNList clearfix"></div>
						</div>
						<div class="form-group">
							<button id="submitBoardBtn" class="btn btn-info">등록</button>
							<input type="button" class="btn btn-danger" id="cancel"
								value="취소" onclick="location.href='/admin/main/setting/slidemanage'">
						</div>
					</form>

				</div>
			</div>
	</div>
</div>	
	<script type="text/javascript">
	
	$(".fileDrop").on("dragenter dragover", function(event){
		event.preventDefault();
	});
	
	$(".fileDrop").on("drop", function(event){
		event.preventDefault();
		
		var arr = event.originalEvent.dataTransfer.files; /* 드래그&드롭 후 파일의 정보를 arr에 넣음 */
		
		for(var idx=0;idx<arr.length;idx++){
			
			var file = arr[idx];
		
			var formData = new FormData();
			formData.append("file", file);
			
			$.ajax({
				type : 'post',
				url : '/admin/main/setting/slidemanageinsert/uploadBNAjax',
				data : formData,
				dataType : 'text',
				contentType : false,
				processData : false,
				success : function(data){
					var str='';
					$(".uploadfilename").val(data);
					if(checkImageType(data)){
						str += "<label>업로드될 이미지</label><div><img src='/admin/main/setting/slidemanage/displayfile?filename="+data+"' alt='일반파일 썸네일입니다' /><p>"+getOriginalName(data)+"</p></div>"
					}else{
						str += "<div><img src='/resources/test.png' alt='썸네일 안보임.'/><p>"+getOriginalName(data)+"</p></div>"
					}

					$(".uploadedBNList").append(str);
				}
			});
		} /* for문을 여기까지 돌려주면 다중 업로드가 가능하다 */
	});
	
	</script>
</body>
</html>