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
	<div class="row" style="float: right; width: 870px; border-left: double 1px white; height: 700px; padding-left: 30px; padding-right: 30px;">
	<form action="/admin/main/setting/chargeManage" method="post" style="min-height: 700px; max-height: auto; padding-top: 30px;">
		<div class="form-group">
			<label for="regiCharge">게임 등록수수료 설정(원)</label>
			<input class="form-control" id="regiCharge" name="regiCharge" value="${updatevo.regiCharge}">
		</div>
		<div class="form-group">
			<label for="buyCharge">게임 판매수수료 설정(%)</label>
			<input class="form-control" id="buyCharge" name="buyCharge" value="${updatevo.buyCharge}">
		</div>
		
		<div class="form-group" style=" float:right;">
			<button class="btn btn-warning modify updatebtn">수정</button>
		</div>
	</form>	
</div>
</div>
	<script type="text/javascript">
	$(document).ready(function(){
		
		$(".updatebtn").on("click",function(){
			location.href="/admin/userManage/update";
		});
		
	});
	</script>
</body>
</html>