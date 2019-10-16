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
	<div class="container" style="padding-top: 50px;">
		<div class="row col-xs-push-1 col-xs-11" >
		
			<h2>일반 회원 가입</h2>
			<!-- 회원가입 창 -->
			<form name="info" action="/member/sign/signNorm" method="post" >
				<div class="form-group">
					*<label id="id">아이디</label>
					<input required name="id" id="id" class="form-control" placeholder="아이디를 입력해주세요.">
				</div>
				
				<br>
				
				<div class="form-group">
					*<label id="pw">비밀번호</label>
					<input required type="password" name="pw" id="pw" class="form-control" placeholder="비밀번호를 입력해주세요.">
				</div>
				
				<br>
					
				<div class="form-group">
					*<label for="name">이름</label>
					<input required name="name" id="name" class="form-control" placeholder="이름을 입력해주세요.">
				</div>
				
				<br>
					
				<label>성별</label> <br>
				<label for="man">남성</label>
				<input type="radio" name="sex" id="man" value="남자" checked="checked">
				<label for="woman">여성</label>
				<input type="radio" name="sex" id="woman" value="여자">
					
				<br>
				<br>
					
				
				<div class="form-group">
					*<label for="nickname">닉네임</label>
					<input required name="nickname" id="nickname" class="form-control" placeholder="닉네임을 입력해주세요.">
				</div>
				
				<br>
					
				<div class="form-group">
					<label for="birth">생년월일</label>
					<input type="date" name="birth" id="birth" class="form-control" placeholder="yyyy/mm/dd">
				</div>
				
				<br>
					
				<div class="form-group">
					*<label for="phone">연락처</label>
					<input required name="phone" id="phone" class="form-control" placeholder="핸드폰 번호를 입력해주세요.">
				</div>
				
				<br>
					
				<div class="form-group">
					*<label for="email">이메일</label>
					<input required name="email" id="email" class="form-control" placeholder="이메일을 입력해주세요.">
				</div>
				
				<br>
					
				<div class="form-group">
					<label for="address1">주소</label>
					<br>
					<input name="address1" id="address1" class="form-control pull-left" placeholder="주소를 입력해주세요." style="width: 80%;">
					<input type="button" class="search1 pull-rigth" value="찾기" style="width: 20%; height: 33.99px;">
					<input name="address2" id="address2" class="form-control" placeholder="상세주소를 입력해주세요.">
				</div>
				
				
				<!-- 회원가입 버튼 -->
				<div class="form-group">
					<input class="signIn" value="회원가입" type="submit" class="form-control btn btn-primary">
				</div>
				
			</form>
		</div>
	</div>
	
	
	
	
<script type="text/javascript">

	/* 빈 칸 있으면 알림 해 줌 .. 사용 안 할 예정 */
	/* function check() {
		if(info.id.value==""){
			alert("아이디를 입력해주세요.");
			info.id.focus();
			return false;
		} else if(info.pw.value==""){
			alert("패스워드를 입력해주세요.");
			info.pw.focus();
			return false;
		} else if(info.age.value==""){
			alert("나이를 입력해주세요.");
			info.pw.focus();
			return false;
		} else if(info.pw.value==""){
			alert("패스워드를 입력해주세요.");
			info.pw.focus();
			return false;
		} else if(info.pw.value==""){
			alert("패스워드를 입력해주세요.");
			info.pw.focus();
			return false;
		}
		return true;
	} */
	
	$(document).ready(function() {
		
	    $(".signIn").click(function() {
	    	alert("가입 완료 되었습니다.")
	        window.close();
	    });

		$(".search").on("click",function(){
	         new daum.Postcode({
	            oncomplete: function(data) {
	               var addr = data.address;
	               document.getElementById("compaddress1").value = addr;
	            }
	         }).open();
	    });
	});

</script>
</body>
</html>