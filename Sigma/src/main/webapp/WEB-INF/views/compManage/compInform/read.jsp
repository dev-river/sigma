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
			 border-radius: 10px;
			 padding-right:10px;
			 margin-right:10px;
			 padding-top:10px;
			 margin-top : 30px;
			 width: 150px;
			}
			#test_btn2{
			  border-radius: 10px;
			 padding-right:10px;
			 margin-right:10px;
			 width: 150px;
			 margin-top : 30px;
			 
			}

			#btn_group button{
			border: 1px solid white;
			background-color: rgba(0,0,0,0);
			color: white; 
			padding: 5px; 
			width: 400px;
			float: right;
			padding-top: 10px;
			} 
			#btn_group button:hover{
			 color:white; 
			 background-color: black; 
			}
</style>
</head>
<body>
<div class="bodymain">
<br>
<div class="container" style="background-color: rgb(25,25,25,0.6); border-radius: 10px; padding-left: 20px; padding-right: 300px;">

	<div class="row" style="padding-left: 30px; padding-right: 30px;">
		<h2 style="color: white; float: left;">판매자 페이지(${vo.id})</h2>
	</div><br>
	<div style="padding-left: 30px;">
	<div class="row" style="color: white; width: 400px; float: left;">
		<h4>ID : ${vo.id}</h4>
		<h4>대표자명 : ${vo.name}</h4><br>
		<h4>업체명 : ${vo.compname}</h4><br>
		<h4>판매중인 게임 수 : ${count}</h4><br>
		<h4>업체주소 : ${vo.compaddress1} ${vo.compaddress2}</h4><br>
		<h4>메일 주소 : ${vo.email}</h4><br>
		<h4>업체번호 : ${vo.compphone}</h4><br>
		<h4>대표자번호 : ${vo.phone}</h4><br>
	</div>
	<div  id="btn_group">
			<button class="update"   id="test_btn1">수정</button>
			<button class="gamelist"   id="test_btn1">판매 관리</button><br>
			<button class="refund"  id="test_btn1">환불 관리</button>
			<button class="cash"  id="test_btn2">캐시 충전</button>
	</div>
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