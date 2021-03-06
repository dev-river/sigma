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
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
	.row{
	color: white;
	}
			#test_btn1{
			 border-radius: 5px;
			 padding-right:10px;
			 margin-right:10px;
			 width: 100px;
			 position: relative;
			 left: 230px;
			 top: 3px;
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
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;" >
		<div class="row" style="padding-bottom: 30px;">
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 150px;">
							<h2 style="color: white;">내 환불 신청 목록</h2>
							<div style="position: relative; left:83%; width: 15%;">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${refund}" var="r">
						<tr>
							<td>
								<c:choose>
									<c:when test="${r.filepath eq null}">
										<img alt="" src="/resources/gameDetailFile/noimage.png" style="width:25%; padding-right: 5px;" class="pull-left">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/gameDetailFile/${r.filepath}" style="width:25%; padding-right: 5px;" class="pull-left">
									</c:otherwise>
								</c:choose>
								<p style="position:relative; top:20px; width:35%" class="pull-left gn">게임 이름 : ${r.title}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">배급사 : ${r.writer}</p> 
								<p style="position:relative; top:20px; width:35%" class="pull-left">출시일 : ${r.regidate}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">구매 날짜 : ${r.buydate}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">가격 : ${r.buyprice}</p>
								<p style="position:relative; top:20px; width:38%" class="pull-right">환불 결과 : ${r.status}</p>
								<div id="btn_group">
								<button class="pull-right del"  id="test_btn1" value="${r.num}">환불 취소</button>
								</div>
								<br>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			
		</div>
	</div>
	</div>
<script type="text/javascript">
	$(document).ready(function() {
		
		
		$(".del").click(function() {
			var num = $(this).val();
			var yes = confirm("환불신청을 취소하시겠습니까?");
			if(yes){
				$.ajax({
					type : 'post',
					url : '/myPage/buyList/refundDelete',
					data : {
						num : num,
					},
					dataType : 'text',
					success : function(event) {
						window.location.reload();
					}
				}); //ajax끝
			};
		});
		
	});
	
</script>
</body>
</html>