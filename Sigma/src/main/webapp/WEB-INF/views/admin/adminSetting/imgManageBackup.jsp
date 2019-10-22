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
	
	.uploadedList{
	
	}
	
</style>

</head>
<body>
<h3>
	 imgManage test.  
</h3>

<hr>

	<!-- 로그인 되면 뜨는 창 -->
	<c:if test="${not empty login}">
		${login.nickname}(${login.id}) 님, 안녕하세요. <a href="/member/login/logout">로그아웃</a>
	</c:if>
	<!-- 미로그인시 뜨는 창 -->
	<c:if test="${empty login}">
		<a href="/member/login/login">로그인</a>
	</c:if>
	
	<c:forEach items="${savedNameList}" var="savedName">
		<c:if test="${not empty savedName}">
			<c:choose>
				<c:when test="${fn:endsWith(savedName,'.jpg')||fn:endsWith(savedName,'.png')||fn:endsWith(savedName,'.jpeg')||fn:endsWith(savedName,'.gif')}">
					<img alt="업로드된 파일" src="/admin/adminSetting/imgManage/displayfile100?filename=${savedName}">
				</c:when>
				<c:otherwise>
					<img alt="이미지 없음" src="/resources/main/black.jsp">
				</c:otherwise>
			</c:choose>
		</c:if>
	</c:forEach>
	
	<form action="/admin/adminSetting/imgManage" method = "post" enctype="multipart/form-data">
		<input type ="file" name="file"><br>
		<input type ="file" name="file"><br>
		<input type ="submit" value="등록">
	</form>
	
	<div class="fileDrop"></div>
	<div class="uploadedList"></div>
	
	<script type="text/javascript">
	
	$("document").ready(function(){
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
					url : '/admin/adminSetting/imgManage/uploadAjax',
					data : formData,
					dataType : 'text',
					contentType : false,
					processData : false,
					success : function(data){
						var str='';
						
						if(checkImageType(data)){
							str += "<div><img src='/admin/adminSetting/imgManage/displayfile?filename="+data+"' alt='일반파일 썸네일입니다' /><p>"+getOriginalName(data)+"</p></div>"
						}else{
							str += "<div><img src='/resources/test.png' alt='썸네일 안보임.'/><p>"+getOriginalName(data)+"</p></div>"
						}
						alert(str);						
						$(".uploadedList").append(str);
					}
				});
			} /* for문을 여기까지 돌려주면 다중 업로드가 가능하다 */
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