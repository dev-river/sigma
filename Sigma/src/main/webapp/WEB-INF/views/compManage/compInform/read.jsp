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
	#test_btn1{
			 border-radius: 5px;
			 padding-right:10px;
			 margin-right:10px;
			 width: 100px;
			}
			#test_btn2{
			 border-radius: 5px;
			 margin-left:0px; 
			 width: 100px;
			}

			#btn_group button{
			border: 1px solid white;
			background-color: rgba(0,0,0,0);
			color: white; 
			padding: 5px; 
			} 
			#btn_group button:hover{
			 color:white; 
			 background-color: black; 
			}
</style>
</head>
<body>
<div class="bodymain">
<div class="container">
	<div class="row">
		<h2 style="color: white; float: left;">판매자 페이지(${vo.id})</h2>
	</div><br>
	<div class="row" style="color: white; text-align: center;">
		<h2>ID : ${vo.id}</h2>
		<h2>대표자명 : ${vo.name}</h2><br>
		<h2>업체명 : ${vo.compname}</h2><br>
		<h2>판매중인 게임 수 : ${count}</h2><br>
		<h2>업체주소 : ${vo.compaddress1} ${vo.compaddress2}</h2><br>
		<h2>메일 주소 : ${vo.email}</h2><br>
		<h2>업체번호 : ${vo.compphone}</h2><br>
		<h2>대표자번호 : ${vo.phone}</h2><br>
	</div><br>
	<div  id="btn_group" style="float: right; padding-bottom: 30px;">
			<button class="update"   id="test_btn1">수정</button>
			<button class="gamelist"   id="test_btn1">판매 관리</button>
			<button class="refund"  id="test_btn1">환불 관리</button>
			<button class="cash"  id="test_btn2">캐시 충전</button>
	</div>
</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".update").on("click",function(){
			location.href="/compManage/main/manageupdate?id=${vo.id}";
		});
		
		$(".gamelist").on("click", function(){
			location.href="/compManage/main/gamelist?writer=${vo.id}";
		});
		
		$(".refund").on("click", function(){
			location.href="/compManage/main/refundlist?id=${vo.id}";
		});
		$(".cash").on("click", function(){
			location.href="/myPage/main/cash?id=${vo.id}";
		});
	});
</script>
</body>
</html>