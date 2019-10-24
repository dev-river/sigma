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
</head>
<body>
<h3>
	 slideManage test.  
</h3>

<hr>

<div class="container">
	
	<c:forEach items="${vo}" var="vo" begin="0" end="4">
		<div style="width: 50%; margin: 0; float: left;">
			
			<c:choose>
				<c:when test="${vo.filepath eq null}">
					<img alt="No image" src="/resources/gameDetailFile/noimage.png" width="280px" height="280px">
				</c:when>
				<c:when test="${vo.filepath ne null}">
					<img alt="banner image" src="/resources/slideBanner/${vo.filepath}" width="280px" height="280px">
				</c:when>
			</c:choose>
			
			<p style="text-align: center; margin-top: 5px; margin-bottom: 0px">관리번호: ${vo.num}</p>
			<p style="text-align: center; margin-bottom: 10px;">이미지파일명: ${vo.filepath}</p> 
			<p style="text-align: center; margin-bottom: 10px;">연결 URL: ${vo.urlpath}</p>
			<p style="text-align: center; margin-bottom: 10px;">생성일: ${vo.regidate}</p>
			
			<div class="form-group">
				<a href="/admin/adminSetting/slideUpdate?num=${vo.num}"><input type="button" value="수정" class="btn updatebtn"></a>
				<a href="/admin/adminSetting/slideDelete?num=${vo.num}"><input type="button" value="삭제" class="btn deletebtn"></a>
			</div>
			
			<hr>
			
		</div>
	</c:forEach>
	<div class="row">
			<div class="pull-right">
			<input type="submit" class="btn btn-primary form-submit Insertbtn"
				value="배너등록">
			</div>
		</div>
	</div>	
	<script type="text/javascript">

	
	$(".Insertbtn").on("click",function(){
		location.href="/admin/adminSetting/slideInsert";
	});
	
	</script>
</body>
</html>