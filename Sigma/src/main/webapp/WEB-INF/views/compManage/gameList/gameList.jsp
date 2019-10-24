
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
p,th,td{
	color: white;
}
.btn1{
	float: right;
	position: relative;
	bottom: 5px;
}
</style>
</head>
<body>

	<div class="bodymain">
		<div class="container">
			<div class="row">
				<h1 style="color: white;">판매 관리</h1>
			</div>
			<div class="row">
				<div>
					<h2 style="color: white;">성별 및 나이</h2>
					<div id="chart_div" style="width: 500px; height: 300px;"></div>
				</div>
				<div>
					<h2 style="color: white;">판매하는 게임</h2>
					<input type="button" value="게임 등록" class="btn"
						onclick="location.href='/compManage/main/gameinsert?writer=${login.id}'">
				</div>
				<br>
				<div>
					<c:if test="${empty gamelist}">
						<h4>등록한 게임이 없습니다.</h4>
					</c:if>
					<c:if test="${!empty gamelist}">
						<c:forEach items="${gamelist}" var="gamelist">
							<p>${gamelist.title}</p>
						</c:forEach>
					</c:if>
				</div>
			</div>
			<div class="row">
				<div>
					<h2 style="color: white;">할인 요청 버튼 활성화 된 게임</h2>
				</div>
				<div>
					<table class="table">
						<thead>
							<tr>
								<th>게임이름</th>
								<th>할인 날짜</th>
								<th>할인 요청 날짜</th>
								<th>할인율</th>
								<th>목표 요청 수</th>
							</tr>
						</thead>
						<tbody>

							<c:if test="${empty gameDetailDC}">
								<tr>
									<td colspan="5" align="center" style="color: white; height: 200px;">할인 요청이 활성화 된 게임이 없습니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty gameDetailDC}">
								<c:forEach items="${gameDetailDC}" var="DC">
									<tr>
										<td><a href="/maincategoryread?num=${DC.num}">${DC.gdnum}</a></td>
										<td>${DC.dcstartdate}- ${DC.dcenddate}</td>
										<td>${DC.rqstartdate}- ${DC.rqenddate}</td>
										<td>${DC.dcrate}</td>
										<td>${DC.goal}</td>
									</tr>
								</c:forEach>
							</c:if>
						</tbody>
					</table>
				</div>
				<div>
			<input type="button" value="뒤로" class="btn1"
					onclick="location.href='/compManage/main/manageread?id=${login.id}'">
			</div>
			</div>
			
		</div>
	</div>
	<!-- <script type="text/javascript">
	google.load('visualization', '1', {'packages' : ['corechart']});
	google.setOnLoadCallback(drawChart);
	function drawChart(){
		var writer = '<c:out value="${login.id}"/>';
		var jsonData = $.ajax({
			url : "/chart",
			data : {
				writer : writer
			},
			dataType : "json",
			async : false
		}).responseText;
		console.log(jsonData);
		var data = new google.visualization.DataTable(jsonData);
		var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
		chart.draw(data, {width: 400, height: 240});
	}
</script> -->
</body>
</html>