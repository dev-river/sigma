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
			<h3 style="position: relative; top:100px;">${myInfo.nickname}(${myInfo.id})님의 장바구니</h3>
			
			<br>
			
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 150px; ">
							<div style="position: relative; left:83%; width: 15%;">
								<h5 style="width:70%;" class="pull-left">전체 선택</h5>
								<input style="position: relative; top:6px; width:29%;" class="pull-right" type="checkbox" name="check_all">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${basket}" var="basket">
						<tr>
							<td>
								<img alt="" src="/resources/gameDetailFile/${img}" style="width:25%; padding-right: 5px;" class="pull-left">
								<p style="position:relative; top:20px; width:35%" class="pull-left gn">게임 이름 : ${basket.title}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">배급사 : ${basket.writer}</p> 
								<p style="position:relative; top:20px; width:35%" class="pull-left">출시일 : ${basket.gregidate}</p>
								<p style="position:relative; top:20px; width:38%;" class="pull-right">등록 날짜 : ${basket.sregidate}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">가격 : ${basket.price}</p>
								<input style="position: relative; left: 145px; bottom: 14px; width: 200px;" type="checkbox" name="input_check" value="${basket.gdnum}">
								
								<input type="hidden" class="hiddengn" value="${basket.title}">
								<input type="hidden" class="hiddenpr" value="${basket.price}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<button class="btn btn-primary buy">체크 된 상품 구매</button>
			<button class="btn del">체크 된 상품 장바구니에서 제거</button>
			<button class="btn mypage" onclick="location.href='/myPage/myPage/mypage'">마이페이지로 돌아가기</button>
		</div>
	</div>
	<input type="hidden" class="hiddenid" value="${myInfo.id}">
<script type="text/javascript">
	$(document).ready(function() {
		
		//구매 버튼 눌렀을 때 체크된 상품 구매
		$(".buy").on("click", function() {
			$("input:checkbox:checked").each(function(index) {  
				var gdnum = $(this).val();
				var id = $(".hiddenid").val();
				
				$.ajax({
					type : 'get',
					url : '/myPage/shopBasket/gameInfo',
					data : {
						gdnum : gdnum
					},
					dataType : 'text',
					success : function(vo) {
						var gamename = JSON.parse(vo);
						
						confirm("["+gamename.title+"]는 "+gamename.price+"원 입니다. 구매하시겠습니까?")
						
						$.ajax({
							type : 'post',
							url : '/myPage/shopBasket/buyGame',
							data : {
								gdnum : gdnum,
								id : id
							},
							dataType : 'text',
							success : function(event) {
								alert("["+gamename.title+"]를 구매 완료 했습니다.");
								window.location.reroad();
							}
						});	
					}
				});
		    });
			
		});
		
		//삭제 버튼 눌렀을 때 장바구니에서 체크된 상품 제거
		$(".del").on("click", function() {
			$("input:checkbox:checked").each(function (index) {  
				var gdnum = $(this).val(); 
				var id = $(".hiddenid").val();
				
				$.ajax({
					type : 'get',
					url : '/myPage/shopBasket/gameInfo',
					data : {
						gdnum : gdnum
					},
					dataType : 'text',
					success : function(vo) {
						var gamename = JSON.parse(vo);
						
						$.ajax({
							type : 'post',
							url : '/myPage/shopBasket/delete',
							data : {
								gdnum : gdnum,
								id : id
							},
							dataType : 'text',
							success : function() {
								alert("["+gamename.title+"]이(가) 장바구니에서 제거 되었습니다.");
								window.location.reload();
							}
						})
						
					}
				});
		    });
		});
		
		//게임 전체 선택
		$("input[name=check_all]").click(function() {
			var chk = $(this).is(":checked");
			if(chk){
				$("input[name='input_check']").prop("checked", true); // 체크박스 전체 선택
			} else{
				$("input[name='input_check']").prop("checked", false); //전체 해제
			}
		});
		
	});
</script>
</body>
</html>