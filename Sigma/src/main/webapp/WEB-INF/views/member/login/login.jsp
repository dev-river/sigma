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
	<div class="container" style="padding-top: 200px;">
		<div class="row col-xs-push-4 col-xs-4" >
			<h2>로그인</h2>
			<c:if test="${not empty login_failed}">
				<p style="color: red">${login_failed}</p>
			</c:if>
			<!-- 로그인 창 -->
			<form name="info" action="/member/login/loginpost" method="post" onsubmit="return check()">
				<div class="form-group">
					<label id="id">아이디</label>
					<input name="id" id="id" class="form-control">
				</div>
				
				<br>
				
				
				<div class="form-group">
					<label id="pw">비밀번호</label>
					<input name="pw" id="pw" class="form-control">
				</div>
				
				
				<!-- 자동 로그인 아직 안 만듬 -->
				<div class="checkbox">
					<label>
						<input type="checkbox" value="true" name="useCookie">자동 로그인
					</label>
				</div>
				
				
				
				<div class="pull-right form-inline">
					<!-- 회원 가입 버튼 // 팝업창 띄워서 선택 -->
					<div class="form-group">
						<input id="sign" name="회원가입" value="회원 가입" type="button" class="form-control btn btn-primary">
					</div>
					
					<!-- 아이디 비밀번호 찾기 버튼 // 팝업 창 띄움 -->
					<div class="form-group">
						<input id="search" value="아이디/비밀번호 찾기" type="button" class="form-control btn btn-primary">
					</div>
					
					<!-- 로그인 버튼 // 로그인 포스트로 넘어감 -->
					<div class="form-group">
						<input value="로그인" type="submit" class="form-control btn btn-primary">
					</div>
				</div>
				
				
			</form>
			
		</div>
	</div>
	
	
	
	
<script type="text/javascript">

	$(document).ready(function() {
		
		$("#sign").click(function popup() {
			
			var url = "/member/sign/signSelect";
			var name = "회원가입 유형";
			var option = "width = 500, height = 400, top = 100, left = 200, location = no";
			window.open(url, name, option);
		});
		
		
		$("#search").click(function popup() {
			
			var url = "/member/login/searchSelect";
			var name = "찾기 유형";
			var option = "width = 500, height = 400, top = 100, left = 200, location = no";
			window.open(url, name, option);
		});
	});
	
	
	

	/* 빈 칸 있으면 알림 해 줌 */
	function check() {
		if(info.id.value==""){
			alert("아이디를 입력해주세요.");
			info.id.focus();
			return false;
		} else if(info.pw.value==""){
			alert("패스워드를 입력해주세요.");
			info.pw.focus();
			return false;
		}
		return true;
	}

</script>
</body>
</html>