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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<h2>할인 요청 등록</h2>
<hr>

<div class="container">
	<h3>[게임: ${title}] 최근 할인 요청 리스트</h3>
	<hr>
	
	<c:choose>
		<c:when test="${empty list}">
			<p>#기 등록된 할인 요청이 없습니다.</p>
		</c:when>
		<c:when test="${not empty list}">
			<table class="table table-dark">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">할인 요청 기간</th>
						<th scope="col">할인 실행 기간</th>
						<th scope="col">할인율</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="vo" varStatus="i">
						<tr>
							<th scope="row">${i.count}</th>
							<td>${vo.rqstartdate}~ ${vo.rqenddate}</td>
							<td>${vo.dcstartdate}~ ${vo.dcenddate}</td>
							<td>${vo.dcrate}%</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</c:when>
	</c:choose>
	
	
	<hr>
	<h3>할인 요청 등록</h3>
	<label for="dcrate">달성 시 할인율: </label> <input id="dcrate" required="required"><br/>
	<label for="goal">목표 동참수: </label> <input id="goal" required="required"><br/>
	<label for="rqstartdate">할인 요청 시작일: </label> <input id="rqstartdate" name="rqstartdate" type="date" min="${lastvo.dcenddate}" max="9999-12-31"><br/>
	<label for="rqenddate">할인 요청 종료일: </label> <input id="rqenddate" name="rqenddate" type="date" min="${lastvo.dcenddate}" max="9999-12-31"><br/>
	<label for="dcstartdate">할인 실행 시작일: </label> <input id="dcstartdate" name="dcstartdate" type="date" min="${lastvo.dcenddate}" max="9999-12-31"><br/>
	<label for="dcenddate">할인 실행 종료일: </label> <input id="dcenddate" name="dcenddate" type="date" min="${lastvo.dcenddate}" max="9999-12-31"><br/>
	<p>날짜 지정은 할인 요청 리스트의 마지막 할인이 끝난 날짜부터 가능합니다.</p>
	<button class="btn btn-primary">등록</button>
</div>

<script type="text/javascript">
document.getElementById('rqstartdate').value = new Date().toISOString().substring(0, 10);;
document.getElementById('rqenddate').value = new Date().toISOString().substring(0, 10);;
document.getElementById('dcstartdate').value = new Date().toISOString().substring(0, 10);;
document.getElementById('dcenddate').value = new Date().toISOString().substring(0, 10);;
</script>
<script type="text/javascript">
$(document).ready(function(){
	$("button").on("click", function(){
		var dcrate = $("#dcrate").val();
		var goal = $("#goal").val();
		var rqstartdate = $("#rqstartdate").val();
		var rqenddate = $("#rqenddate").val();
		var dcstartdate = $("#dcstartdate").val();
		var dcenddate = $("#dcenddate").val();
		$.ajax({
				type: 'post',
				url: '/gameDetail/inform/DCRqSet',
				data: {
					'gdnum': ${num},
					'dcrate': dcrate,
					'goal': goal,
					'rqstartdate': rqstartdate,
					'rqenddate': rqenddate,
					'dcstartdate' : dcstartdate,
					'dcenddate': dcenddate
					/* 'recommend': recommend */
				},
				datatype: 'text',
				success: function(){
					alert('적용 되었습니다!');
					window.opener.location.reload();
					window.close()
				},
				error: function(){
	  				alert('입력되지 않은 항목을 확인해주세요.')
	  				}
		});
	});
});


</script>
</body>
</html>