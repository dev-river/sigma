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
			<h3 style="position: relative; top:100px;">${myInfo.nickname}(${myInfo.id})님의 찜목록</h3>
			
			<br>
			
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 150px; ">
							<h5 style="width:70%;" class="pull-left">전체 선택</h5>
							<input style="position: relative; top:6px; width:29%;" class="pull-right" type="checkbox" name="check_all">
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${zzim}" var="zzim">
						<tr>
							<td>
								<p style="width:45%; font-weight: bold;" class="pull-left">게임 이름 : ${zzim.title}</p><p style="width:54%;" class="pull-right">배급사 : ${zzim.writer}</p> 
								<p style="width:45%" class="pull-left">출시일 : ${zzim.gregidate}</p><p style="width:54%;" class="pull-right">등록 날짜 : ${zzim.sregidate}</p>
								<p style="width:45%" class="pull-left">가격 : ${zzim.price}</p>
								<input style="position: relative; left: 250px; bottom: 30px; width: 200px;" type="checkbox" name="input_check" value="${zzim.gdnum}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<button class="btn btn-primary buy">체크 된 상품 장바구니로 이동</button>
			<button class="btn del">체크 된 상품 찜목록에서 제거</button>
			<button class="btn mypage" onclick="location.href='/myPage/myPage/mypage'">마이페이지로 돌아가기</button>
		</div>
	</div>
	<input type="hidden" class="hiddenid" value="${myInfo.id}">
<script type="text/javascript">
	$(document).ready(function() {
		//장바구니로 이동
		$(".buy").on("click", function() {
			$("input:checkbox:checked").each(function (index) {  
				var gdnum = $(this).val(); 
				var id = $(".hiddenid").val();
				$.ajax({
					type : 'post',
					url : '/myPage/shopBasket/regiBasket',
					data : {
						gdnum : gdnum,
						id : id
					},
					dataType : 'text',
					success : function() {
						alert("찜한 상품이 장바구니에 추가 되었습니다.");
					}
				})
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
							url : '/myPage/zzimList/delete',
							data : {
								gdnum : gdnum,
								id : id
							},
							dataType : 'text',
							success : function() {
								alert("["+gamename.title+"]이(가) 찜목록에서 제거 되었습니다.");
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