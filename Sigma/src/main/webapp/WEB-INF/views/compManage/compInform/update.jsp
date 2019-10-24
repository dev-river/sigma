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
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">

</style>
</head>
<body>
<div class="bodymain">
<div class="container">

	<div class="row">
		<h2>판매자 정보 수정</h2>
	</div>
	<div class="row">
		<form action="/compManage/main/manageupdate" method="post">
			<div class="form-group">
				<input type="hidden" id="id" name="id" value="${vo.id}">
				<label for="compname">회사 이름</label>
				<input id="compname" name="compname" placeholder="닉네임을 입력해주세요" value="${vo.compname}" class="form-control" >
			</div>
			
			<div class="form-group">
				<label for="compphone">회사 연락처</label>
				<input id="compphone" name="compphone" placeholder="닉네임을 입력해주세요" value="${vo.compphone}" class="form-control">
			</div>
			
			<div class="form-group">
				<label for="compdetail">회사 소개</label>
				<textarea id="compdetail" name="compdetail" rows="5" class="form-control">${vo.compdetail}</textarea>
			</div>
			
			<div class="form-group">
				<label for="compaddress1">회사 주소</label>
				<input id="compaddress1" name="compaddress1" value="${vo.compaddress1}" class="form-control" readonly="readonly">
				<input id="compaddress2" name="compaddress2" value="${vo.compaddress2}" class="form-control">
				<input type="button" class="btn compseach" value="주소 검색">
			</div>
			
			<div class="form-group">
				<button class="btn">변경 내용 저장</button>
				<input type="button" value="취소" onclick="location.href='/compManage/main/manageread?id=${vo.id}'" class="btn">
			</div>
		</form>
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){		
		$(".compseach").on("click", function(){
			new daum.Postcode({
				oncomplete: function(data) {
					var addr = data.address;
					document.getElementById("compaddress1").value = addr;
				}
			}).open();
		});
	});
</script>
</body>
</html>