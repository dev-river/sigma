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
	width: 300px;
	margin: 30px auto;
}
.body{
	width: 300px;
	margin: 30px auto;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/main/header.jsp"></jsp:include>
<div class="">
	<div class="row head">
		<h2>판매자 페이지(${vo.id})</h2>
		<input type="button" value="정보 수정" class="btn update">
	</div>
	<div class="row body">
		ID : ${vo.id}
		대표자명 : ${vo.name}<br>
		업체명 : ${vo.compname}
		판매중인 게임 수 : ${count}<br>
		업체주소 : ${vo.compaddress1} ${vo.compaddress2}
		메일 주소 : ${vo.email}<br>
		업체번호 : ${vo.compphone}
		대표자번호 : ${vo.phone}<br>
	</div>
	<div class="">
		<input type="button" value="판매 관리" class="btn gamelist">
		<input type="button" value="환불 관리" class="btn refund">
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".update").on("click",function(){
			location.href="/compManage/compInform/update?id=${vo.id}";
		});
		
		$(".gamelist").on("click", function(){
			location.href="/compManage/gameList/gameList?writer=${vo.id}";
		});
		
		$(".refund").on("click", function(){
			location.href="/compManage/refund/refundList?id=${vo.id}";
		});
	});
</script>
</body>
</html>