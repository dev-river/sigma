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
	p{
	color: white;
	}
</style>
</head>
<body>
	<div class="bodymain">
	<div class="container"  style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
		<div class="row">
			
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 150px; ">
						<h2 style="color: white;">내 최근 구매 목록</h2>
							<div style="position: relative; left:83%; width: 15%;">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${buyList}" var="b">
						<tr>
							<td>
								<c:choose>
									<c:when test="${b.filepath eq null}">
										<img alt="" src="/resources/gameDetailFile/noimage.png" style="width:180px; height:180px; padding-right: 5px;" class="pull-left">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/gameDetailFile/${b.filepath}" style="width:180px; height:180px; padding-right: 5px;" class="pull-left">
									</c:otherwise>
								</c:choose>
								<div style="position: relative; left: 10px;">								
								<p style="position:relative; top:20px; width:35%" class="pull-left gn">게임 이름 : ${b.title}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">배급사 : ${b.writer}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">출시일 : ${b.regidate}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">구매 날짜 : ${b.buydate}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">가격 : ${b.buyprice}</p>
								<button class="pull-right del">삭제</button>
								<input type="hidden" class="hgdnum" value="${b.gdnum}">
								<input type="hidden" class="hid" value="${id}">
								</div>
								
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<button class="btn mypage" onclick="location.href='/myPage/main/mypage'" style="position: relative; left: 70%">마이페이지로 돌아가기</button>
		</div>
	</div>
</div>
<br>
<script type="text/javascript">
	$(document).ready(function() {
		
		$(".del").click(function() {
			var gdnum = $(this).next().val();
			var id = $(this).next().next().val();
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