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
	#img1{
	border-radius: 10px;
 	box-shadow: 15px 15px 20px black;
	}
</style>
</head>
<body>
	<div class="bodymain">
	<div class="container">
		<div class="row">
			<h3 style="position: relative; top:100px; color: white;">${myInfo.nickname}(${myInfo.id})님의 찜목록</h3>
			
			<br>
			
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 100px; ">
							<div style="position: relative; left:83%; width: 15%;">
								<h5 style="width:70%; color: white;" class="pull-left">전체 선택</h5>
								<input style="position: relative; top:6px; width:29%;" class="pull-right" type="checkbox" name="check_all">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${zzim}" var="zzim">
						<tr>
							<td style="min-height: 700px; max-height: auto;">
								<img alt="" src="/resources/gameDetailFile/${img}" style="width:25%; padding-right: 5px; position: relative; right: 10px;"  class="pull-left" id="img1">
								<p style="position:relative; top:20px; width:35%" class="pull-left">게임 이름 : ${zzim.title}</p>
								<p style="position:relative; top:20px; width:38%" class="pull-right">배급사 : ${zzim.writer}</p> 
								<p style="position:relative; top:20px; width:35%" class="pull-left">출시일 : ${zzim.gregidate}</p>
								<p style="position:relative; top:20px; width:38%" class="pull-right">등록 날짜 : ${zzim.sregidate}</p>
								<p style="position:relative; top:20px; width:35%" class="pull-left">가격 : ${zzim.price}</p>
								<input style="position: relative; left: 145px; bottom: 14px; width: 200px;" type="checkbox" name="input_check" value="${zzim.gdnum}">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row" style="text-align: center;">
			<button class="btn btn-primary buy">체크 된 상품 장바구니로 이동</button>
			<button class="btn del">체크 된 상품 찜목록에서 제거</button>
			<button class="btn mypage" onclick="location.href='/myPage/main/mypage'">마이페이지로 돌아가기</button>
		</div>
	</div>
	
	<input type="hidden" class="hiddenid" value="${myInfo.id}">
	</div>
	<br>
<script type="text/javascript">
	$(document).ready(function() {
		//장바구니로 이동
		$(".buy").on("click", function() {
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
							url : '/myPage/main/Basket',
							data : {
								gdnum : gdnum,
								id : id
							},
							dataType : 'text',
							success : function(event) {
								if(event=='failed'){
									var con = confirm("["+gamename.title+"]이(가)  이미 장바구니에 들어있습니다. 장바구니로 이동하시겠습니까?")
									if(con){
										location.href = "/myPage/main/Basket";
									}
								} else{
									var con = confirm("["+gamename.title+"]이(가)  장바구니에 집어넣었습니다. 장바구니로 이동하시겠습니까?")
									if(con){
										location.href = "/myPage/main/Basket";
									}
								}
							}
						})
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