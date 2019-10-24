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
<style type="text/css">
	label{
	font-size : 1em;
	font : bold;
	color: black;
	}
	#ba{
	background-color: white;
	}
</style>
</head>
<body>
	<div class="container" style="padding-top: 50px;" id="ba">
		<div class="row col-xs-push-1 col-xs-11" >
		
			<!-- 회원가입 창 -->
			<form name="info" method="post" action="/myPage/myProfile/update">
				<div class="form-group">
					<label id="id">아이디</label>
					<input required name="id" id="id" class="form-control" value="${updateUIInfo.id}" readonly="readonly">
				</div>
				
				<br>
					
				<label>성별</label> <br>
				<p style="color: red; font-size: large; font: bolder;">${updateUIInfo.sex}</p>
				
				<br>
				
				<div class="form-group">
					<label id="pw">비밀번호</label>
					<input required name="pw" id="pw" class="form-control" value="${updateUIInfo.pw}">
				</div>
				
				<br>
					
				<div class="form-group">
					<label for="name">이름</label>
					<input required name="name" id="name" class="form-control" value="${updateUIInfo.name}">
				</div>
					
				<br>
				
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<br>
					<input required name="nickname" id="nickname" class="form-control pull-left" value="${updateUIInfo.nickname}" style="width: 79%;">
					<input type="button" name="nickcheck" class="nickcheck pull-rigth" value="중복체크" style="width: 20%; height: 33.99px;">
				</div>
				
				<br>
					
				<div class="form-group">
					<label for="phone">연락처</label>
					<input required name="phone" id="phone" class="form-control" value="${updateUIInfo.phone}">
				</div>
				
				<br>
					
				<div class="form-group">
					<label for="email">이메일</label>
					<input required name="email" id="email" class="form-control" value="${updateUIInfo.email}">
				</div>
				
				<br>
					
				<div class="form-group">
					<label for="address1">주소</label>
					<br>
					<input name="address1" id="address1" class="form-control pull-left" value="${updateUIInfo.address1}" style="width: 80%;">
					<input type="button" class="search1 pull-rigth" value="찾기" style="width: 20%; height: 33.99px;">
					<input name="address2" id="address2" class="form-control" value="${updateUIInfo.address2}">
				</div>
				
				
				<!-- 정보수정 버튼 -->
				<input class="form-control btn btn-primary update" value="수정완료" type="submit">
				<input class="form-control btn btn-primary back" value="마이페이지로 돌아가기">
				<input class="form-control btn delete" value="회원탈퇴" style="width:20%; background-color: rgba(200,200,200,0.5); color: black; float: right;">
			</form>
		</div>
	</div>
	<br>
	
	
<script type="text/javascript">

	
	$(document).ready(function() {
		
		//마이페이지로 돌아가기
		$(".back").on("click", function(event) {
			event.preventDefault();
			location.href = "/myPage/main/mypage";
		});
		
		//회원 탈퇴
		var id = $("input[name='id']").val();
		var pw = $("input[name='pw']").val();
		$(".delete").click(function(event) {
			event.preventDefault();
			
			var del = confirm("정말로 회원 탈퇴하시겠습니까?");
			if (del) {
				var userpw = prompt("회원탈퇴를 위해서 비밀번호를 입력해주십시오."+"");
				if(${updateUIInfo.pw} == userpw){
					alert("탈퇴 완료 되었습니다.");
					location.href = "/myPage/myProfile/delete?id="+id+"&pw="+pw;
				} else{
					alert("비밀번호가 틀렸습니다.");
				}
			} else{
				alert("정말 잘 선택하셨습니다.");
			}
		});
		
		//닉네임 중복체크
		$(".nickcheck").on("click", function(event) {
			event.preventDefault();
			var nickname = $("input[name='nickname']").val();
			$.ajax({
				type : 'post',
				url : '/member/sign/nickcheck',
				data : {
					nickname : nickname
				},
				dataType : 'text',
				success : function(result) {
					alert(result)
				}
			});
		})
		
		
		$(".update").on("click", function(event) {
			event.preventDefault();
			var id = $("input[id='id']").val();
			var pw = $("input[id='pw']").val();
			var name = $("input[id='name']").val();
			var sex = $("input[name='sex']").val();
			var nickname = $("input[id='nickname']").val();
			var phone= $("input[id='phone']").val();
			var email = $("input[id='email']").val();
			var address1 = $("input[id='address1']").val();
			var address2 = $("input[id='address2']").val();


			$.ajax({
				type : 'post',
				url : '/myPage/main/myprofile',
				data : {
					id : id,
					pw : pw,
					name : name,
					sex : sex,
					nickname : nickname,
					phone : phone,
					email : email,
					address1: address1,
					address2 : address2
				},
				dataType : 'text',
				success : function() {
					alert("수정 완료 되었습니다.");
					location.href = "/myPage/main/mypage";
				}
			});
		});
		

		$(".search1").on("click",function(){
	         new daum.Postcode({
	            oncomplete: function(data) {
	               var addr = data.address;
	               document.getElementById("address1").value = addr;
	            }
	         }).open();
	    });
	});

</script>
</body>
</html>