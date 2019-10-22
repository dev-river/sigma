<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
	<div class="container">
		<div class="row">
			<h2>내 최근 구매 목록</h2>
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 150px; ">
							<div style="position: relative; left:83%; width: 15%;">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${buyList}" var="b">
						<tr>
							<td>
								<img alt="" src="/resources/gameDetailFile/${img}" style="width:25%; padding-right: 5px;" class="pull-left">
								<p style="position:relative; top:20px; width:35%" class="pull-left gn">게임 이름 : ${b.title}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">배급사 : ${b.writer}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">출시일 : ${b.regidate}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">구매 날짜 : ${b.buydate}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">가격 : ${b.buyprice}</p>
								<button class="pull-right del">삭제</button>
								<input type="hidden" class="hgdnum" value="${r.gdnum}">
								<input type="hidden" class="hid" value="${id}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

<script type="text/javascript">
	$(document).ready(function() {
		
		$(".del").click(function() {
			var gdnum = $(".hgdnum").val();
			var id = $(".hid").val();
			var yes = confirm("구매 기록을 삭제하시면 환불이 불가능 해지는 등의 불이익이 있을 수 있습니다. 삭제하시겠습니까?");
			if(yes){
				$.ajax({
					type : 'post',
					url : '/myPage/buyList/delete',
					data : {
						gdnum : gdnum,
						id : id
					},
					dataType : 'text',
					success : function(event) {
						window.location.reload();
					}
				}); //ajax끝
			}; //if문 끝
		});
		
	});
	
</script>
</body>
</html>