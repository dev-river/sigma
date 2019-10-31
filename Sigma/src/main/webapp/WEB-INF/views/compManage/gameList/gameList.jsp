
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
p, th, td {
	color: white;
}



#test_btn1 {
	border-radius: 5px;
	padding-right: 10px;
	margin-right: 10px;
	width: 100px;
	float: left;
}


#btn_group button {
	border: 1px solid white;
	background-color: rgba(0, 0, 0, 0);
	color: white;
	padding: 5px;
}

#btn_group button:hover {
	color: white;
	background-color: black;
}
</style>
</head>
<body>
	<div class="bodymain">
		<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
			<div class="row" style="padding-left: 30px; padding-right: 30px;">
				<h1 style="color: white;">판매 관리</h1>
				<hr>
			</div>
			<div class="row" style="padding-left: 30px; padding-right: 30px;">
				<div>
					<h2 style="color: white;">성별 및 나이</h2>
					<div id="chart_sex"
						style="width: 500px; height: 300px; float: left; padding-left: 200px;"></div>
					<div id="chart_age"
						style="width: 500px; height: 300px; float: right; padding-right: 200px;"></div>
				</div>
			</div>
			<hr>
			<div style="padding-left: 15px; padding-right: 30px;">
				<h2 style="color: white;">판매하는 게임</h2>
			</div>
			<div id="btn_group" style="float: right; padding-bottom: 30px; padding-left: 30px; padding-right: 30px;">
				<button class="update" id="test_btn1"
					onclick="location.href='/compManage/main/gameinsert?writer=${login.id}'">등록</button>

			</div>
			<br>
			<div style="padding-left: 30px; padding-right: 30px;">
				<c:if test="${empty gamelist}">
					<h4>등록한 게임이 없습니다.</h4>
				</c:if>
				<c:if test="${!empty gamelist}">
					<c:forEach items="${gamelist}" var="gamelist" begin="0" end="4">
						<div style="display: inline-block;">
							<p>
								<a href="/gameDetail/main/maincategoryread?num=${gamelist.num}"><img
									src="/compManage/imgfile?filename=s_${gamelist.filepath}"
									width="50%;"></a>
							</p>
							<p>${gamelist.title}</p>
						</div>
					</c:forEach>
				</c:if>
			</div>

		

		<div style="padding-left: 15px; padding-right: 30px;">
			<h2 style="color: white;">할인 요청 버튼 활성화 된 게임</h2>
		</div>
		<div style="padding-left: 15px; padding-right: 30px;">
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
							<td colspan="5" align="center"
								style="color: white; height: 200px;">할인 요청이 활성화 된 게임이 없습니다.</td>
						</tr>
					</c:if>
					<c:if test="${!empty gameDetailDC}">
						<c:forEach items="${gameDetailDC}" var="DC">
							<tr>
								<td><a
									href="/gameDetail/main/maincategoryread?num=${DC.num}">${DC.title}</a></td>
								<td>${DC.dcstartdate}-${DC.dcenddate}</td>
								<td>${DC.rqstartdate}-${DC.rqenddate}</td>
								<td>${DC.dcrate}</td>
								<td>${DC.goal}</td>
							</tr>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
		<div>
	</div>
</div>
</div>

	<script type="text/javascript">
		google.load('visualization', '1', {'packages' : ['corechart']});
		google.setOnLoadCallback(chart_sex);
		
		function chart_sex() {
		
		  var data = google.visualization.arrayToDataTable([
		    ['Task', 'Hours per Day'],
		    ['남', ${man}],
		    ['여', ${woman}]
		  ]);
		
		  var options = {
		    title: '성별',
		   	backgroundColor: { fill:'transparent' },
	        titleTextStyle: {color: 'white', fontSize: 15 },
	        legend:'none',
	        pieSliceText: 'label'
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById('chart_sex'));
		
		  chart.draw(data, options);
		}

 		google.load('visualization', '1', {'packages' : ['corechart']});
		google.setOnLoadCallback(chart_age);
		
		function chart_age() {
		
		  var data = google.visualization.arrayToDataTable([
		    ['Task', 'Hours per Day'],
		    ['10대', ${s10}],
		    ['20대', ${s20}],
		    ['30대', ${s30}],
		    ['40대이상', ${s40}]
		  ]);
		
		  var options = {
		    title: '나이',
		   	backgroundColor: { fill:'transparent' },
	        titleTextStyle: {color: 'white', fontSize: 15 },
	        legend:'none',
	        pieSliceText: 'label'
		  };
		
		  var chart = new google.visualization.PieChart(document.getElementById('chart_age'));
		
		  chart.draw(data, options);
		}
</script>
</body>
</html>