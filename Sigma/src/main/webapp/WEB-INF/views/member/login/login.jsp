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
    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 40%; /* Could be more or less, depending on screen size */                          
            height: 450px;
        }
 
</style>
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
					<!-- 회원 가입 버튼 // 모달 창 띄워서 선택 -->
					<div class="form-group">
						<input name="회원가입" value="회원 가입" type="button" class="form-control btn btn-primary" data-target="#signModal">
					</div>
					
					<!-- 아이디 비밀번호 찾기 버튼 // 모달로 창 띄워서 선택 -->
					<div class="form-group">
						<input value="아이디/비밀번호 찾기" type="button" class="form-control btn btn-primary" data-target="#searchModal">
					</div>
					
					<!-- 로그인 버튼 // 로그인 포스트로 넘어감 -->
					<div class="form-group">
						<input value="로그인" type="submit" class="form-control btn btn-primary">
					</div>
				</div>
				
				
			</form>
			
			<!-- 회원가입 모달 시작 -->
		    <div id="signModal" class="modal">
		 
		      <!-- 모달 내용 -->
		      <div class="modal-content" id="signModal">
		                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">회원가입 유형을 선택해주세요.</span></b></span></p>
		                	<div>
			                	<a href="/member/sign/signNorm" class="pull-left" style="font-size: 24px; width: 50%; height: 300px; padding:5px; background-color: rgb(180, 200, 220); border: 1px; text-align: center;">일반</a>
			                </div>
			                <div>
			                	<a href="/member/sign/signComp" class="pull-right" style="font-size: 24px; width: 50%; height: 300px; padding:5px; background-color: rgb(222, 200, 180); border: 1px; text-align: center;">판매자</a>
			                </div>
		                <p><br></p>
		            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
		                <span class="pop_bt" style="font-size: 13pt;" >
		                	<div>
		                    	 닫기
		                   	</div>
		                </span>
		            </div>
		      </div>
		 
		    </div>
		    <!-- 회원가입 모달 끝 -->
		    
		    
		    <!-- 아디비번 찾기 모달 시작 -->
		    <div id="searchModal" class="modal">
		 
		      <!-- 모달 내용 -->
		      <div class="modal-content" id="searchModal">
		                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">찾으실 유형을 선택해주세요.</span></b></span></p>
		                	<div>
			                	<a href="/member/login/searchID" class="pull-left" style="font-size: 24px; width: 50%; height: 300px; padding:5px; background-color: rgb(180, 200, 220); border: 1px; text-align: center;">아이디</a>
			                </div>
			                <div>
			                	<a href="/member/login/searchPW" class="pull-right" style="font-size: 24px; width: 50%; height: 300px; padding:5px; background-color: rgb(222, 200, 180); border: 1px; text-align: center;">비밀번호</a>
			                </div>
		                <p><br></p>
		            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop2();">
		                <span class="pop_bt" style="font-size: 13pt;" >
		                	<div>
		                    	 닫기
		                   	</div>
		                </span>
		            </div>
		      </div>
		 
		    </div>
		    <!-- 아디비번 찾기 모달 끝 -->
			
		</div>
	</div>
	
	
	
	
<script type="text/javascript">

	$(document).ready(function() {
		//회원가입 모달 부르기
		$("input[value='회원 가입']").click(function() {
			$("#signModal").show();
		});
		//아디비번찾기 모달 부르기
		$("input[value='아이디/비밀번호 찾기']").click(function() {
			$("#searchModal").show();
		});
	});
	
	//회원가입 팝업 Close 기능
	function close_pop(flag) {
	     $('#signModal').hide();
	};
	//아디비번찾기 팝업 Close 기능
	function close_pop2(flag) {
	     $('#searchModal').hide();
	};
	

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