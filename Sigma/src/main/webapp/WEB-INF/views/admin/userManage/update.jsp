<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="/resources/js/uploadutils.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
		<div class="row">
			<h1>회원정보 자세히 보기</h1>
			
			<form action="/admin/userManage/update" method="post">
				<div class="form-group">
					<label for="id">ID</label>
					<input class="form-control" id="ID" name="id" value="${updatevo.id}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<input class="form-control" id="nickname" name="nickname" value="${updatevo.nickname}">
				</div>
				
				<div class="form-group">
					<label for="name">이름</label>
					<input class="form-control" id="name" name="name" value="${updatevo.name}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="writer">권한</label>
					<select name="author" class="form-control" >
						<option>user</option>
						<option>seller</option>
						<option>admin</option>
					</select>
				</div>
				
				<div class="form-group">
					<label for="content">생년월일</label>
					<textarea  class="form-control" id="birth" name="birth" readonly="readonly">${updatevo.birth}</textarea>
				</div>
				
				<div class="form-group">
					<label for="content">연락처</label>
					<textarea  class="form-control" id="phone" name="phone" readonly="readonly">${updatevo.phone}</textarea>
				</div>
				
				<div class="form-group">
					<label for="content">이메일</label>
					<textarea  class="form-control" id="email" name="email" readonly="readonly">${updatevo.email}</textarea>
				</div>
				
				<div class="form-group">
					<label for="content">가입일</label>
					<textarea  class="form-control" id="joindate" name="joindate" readonly="readonly">${updatevo.joindate}</textarea>
				</div>
				
				<div class="form-group">
					<button class="btn btn-warning modify updatebtn">수정</button>
				    <!-- <input type="submit" value="수정" class="btn updatebtn"> -->
					<input type="button" value="닫기" class="btn closebtn">
				</div>
			</form>
		</div>
		
</div>


<script type="text/javascript">

	$(document).ready(function(){
		
		$(".updatebtn").on("click",function(){
			location.href="/admin/userManage/update?id=${updatevo.id}";
			opener.parent.location.reload();
		});/* 뭔가 작동 이상함 */
		
		$(".closebtn").on("click",function(){
			self.close();
		});
		
		$("option").each(function(){
		    if($(this).val()=="${updatevo.author}"){
		      $(this).attr("selected","selected");
		    }
		  });
	});
	
	
</script>
</body>
</html>