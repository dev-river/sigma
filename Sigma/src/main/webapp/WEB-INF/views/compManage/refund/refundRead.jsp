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
</head>
<body>
<div class="bodymain">
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; height: 100%;">
	
	<div class="col-xs-10 col-xs-offset-1">
	<div class="row">
		<h2>환불 신청 자세히 보기</h2>
		<input type="hidden" id="num" value="${vo.num}">
		<input type="hidden" id="buynum" value="${vo.buynum}">
		<input type="hidden" id="id" value="${vo.id}">
		<input type="hidden" id="userid" value="${login.id}">
	</div>
	<c:if test="${vo.status eq '-'}">
		<div class="row">
			<div class="panel panel-primary">
				<label>신청자</label>
				<div class="panel-body">
					${vo.id}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>신청자</label>
				<div class="panel-body">
					${vo.updatedate}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>게임명</label>
				<div class="panel-body">
					${vo.title}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>가격</label>
				<div class="panel-body">
					${vo.buynum}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불상태</label>
				<div class="panel-body">
					${vo.status}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불 내용</label>
				<div class="panel-body">
					${vo.content}
				</div>
			</div>
		</div>
		<div>
			<input type="button" value="환불 승인" class="btn success">
			<input type="button" value="환불 거절" class="btn declined">
		</div>
	</c:if>
	<c:if test="${vo.status eq 'o'}">
		<div class="row">
			<div class="panel panel-primary">
				<label>신청자</label>
				<div class="panel-body">
					${vo.id}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>신청자</label>
				<div class="panel-body">
					${vo.updatedate}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>게임명</label>
				<div class="panel-body">
					${vo.title}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>가격</label>
				<div class="panel-body">
					${vo.buynum}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불상태</label>
				<div class="panel-body">
					${vo.status}
				</div>
			</div>

			<div class="panel panel-primary">
				<label>환불날짜</label>
				<div class="panel-body">
					${vo.refunddate}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불 내용</label>
				<div class="panel-body">
					${vo.content}
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${vo.status eq 'x'}">
		<div class="row">
			<div class="panel panel-primary">
				<label>신청자</label>
				<div class="panel-body">
					${vo.id}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>신청자</label>
				<div class="panel-body">
					${vo.updatedate}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>게임명</label>
				<div class="panel-body">
					${vo.title}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>가격</label>
				<div class="panel-body">
					${vo.buynum}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불상태</label>
				<div class="panel-body">
					${vo.status}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불 답변 내용</label>
				<div class="panel-body">
					${vo.compcontent}
				</div>
			</div>
			<div class="panel panel-primary">
				<label>환불 내용</label>
				<div class="panel-body">
					${vo.content}
				</div>
			</div>
		</div>
	</c:if>
		<div class="roe" style="float: right;">
			<input type="button" value="뒤로" class="btn" onclick="location.href='/compManage/main/refundlist?id=${login.id}'">
		</div>
	</div>
	</div>
</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".declined").on("click", function(event){
			event.preventDefault();
			var declined = confirm("환불 거절 하시겠습니까?");
			if(declined==true){
				var num = $("input[id='num']").val();
				var string = '';
				var inputString = prompt('문자열을 입력하세요',string);
				$.ajax({
					type : 'post',
					url : '/compManage/refund/refundReject',
					data : {
						num : num,
						inputString : inputString,
					},
					success : function(){
						location.href="/compManage/main/refundlist?id=${login.id}";
					}
				});
			}else{
				location.reload();
			}
		});
		
		$(".success").on("click", function(event){
			event.preventDefault();
			var num = $("input[id='num']").val();
			var buynum = $("input[id='buynum']").val();
			var id = $("input[id='id']").val();
			var userid = $("input[id='userid']").val();
			$.ajax({
				type : 'post',
				url : '/compManage/refund/refundOK',
				data : {
					num : num,
					buynum : buynum,
					id : id,
					userid : userid
				},
				dataType : 'text',
				success : function(result){
					if(result == 'wait'){
						alert("캐시가 부족합니다.");
						var str = confirm("충전하시겠습니까?");
						if(str==true){
							location.href="/myPage/main/cash?id=${login.id}";
						}else{
							location.reload();
						}
					}else{
						alert("환불이 완료 되었습니다.");
						location.href="/compManage/main/refundlist?id=${login.id}";
					}
					
				}
			});
		});
	});
</script>
</body>
</html>