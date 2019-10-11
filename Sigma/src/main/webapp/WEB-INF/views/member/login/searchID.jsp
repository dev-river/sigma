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
	<div class="container" style="padding-top: 150px;">
		<div class="row col-xs-push-4 col-xs-4" >
			<h2>아이디 찾기</h2>
			<form name="info" action="/member/login/searchID" method="post" onsubmit="return check()">
				<div class="form-group">
					<label id="name">이름</label>
					<input name="name" id="name" class="form-control">
				</div>
				
				<br>
				
				
				<div class="form-group">
					<label id="phone">전화번호</label>
					<input name="phone" id="phone" class="form-control">
				</div>
						
				<!-- 찾기버튼 // 아이디 찾기 포스트로 넘어감 -->
					<div class="form-group">
						<input value="아이디 찾기" type="submit" class="form-control btn btn-primary">
					</div>
					<div class="form-group">
						<a href="/member/login/searchPW"><input value="비밀번호 찾으러 가기" type="button" class="form-control btn btn-primary"></a>
					</div>
					<div class="form-group">
						<a href="/member/login/login"><input value="로그인 화면으로 돌아가기" type="button" class="form-control btn btn-primary"></a>
					</div>
			</form>
			${err_searchID}
		</div>
	</div>

<script type="text/javascript">

	$(document).ready(function() {
		if(${vo.id} != null){
			alert("당신의 아이디는 ${vo.id} 입니다.");
		}

	});

	/* 빈 칸 있으면 알림 해 줌 */
	function check() {
		if(info.name.value==""){
			alert("이름을 입력해주세요.");
			info.name.focus();
			return false;
		} else if(info.phone.value==""){
			alert("전화번호를 입력해주세요.");
			info.phone.focus();
			return false;
		}
		return true;
	}

</script>
</body>
</html>