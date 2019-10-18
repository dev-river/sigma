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
			
				<div class="form-group">
					<label for="id">ID</label>
					<input class="form-control" id="ID" name="id" value="${readvo.id}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="nickname">닉네임</label>
					<input class="form-control" id="nickname" name="nickname" value="${readvo.nickname}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="name">이름</label>
					<input class="form-control" id="name" name="name" value="${readvo.name}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="writer">권한</label>
					<input class="form-control" id="author" name="author" value="${readvo.author}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="content">생년월일</label>
					<textarea  class="form-control" id="birth" name="birth" readonly="readonly">${readvo.birth}</textarea>
				</div>
				
				<div class="form-group">
					<label for="content">연락처</label>
					<textarea  class="form-control" id="phone" name="phone" readonly="readonly">${readvo.phone}</textarea>
				</div>
				
				<div class="form-group">
					<label for="content">이메일</label>
					<textarea  class="form-control" id="email" name="email" readonly="readonly">${readvo.email}</textarea>
				</div>
				
				<div class="form-group">
					<label for="content">가입일</label>
					<textarea  class="form-control" id="joindate" name="joindate" readonly="readonly">${readvo.joindate}</textarea>
				</div>
				
				<div class="form-group">
					<button class="btn btn-warning modify updatebtn">수정</button>
				    <!-- <input type="submit" value="수정" class="btn updatebtn"> -->
					<input type="button" value="삭제" class="btn deletebtn">
					<input type="button" value="닫기" class="btn closebtn">
				</div>
				
				<div class="row">
					<c:forEach items="${buylist}" var="vo">
						<div>
						</div>
					</c:forEach>
				</div>
		</div>
		
</div>


<script type="text/javascript">

	$(document).ready(function(){
		
		$(".updatebtn").on("click",function(){
			location.href="/admin/userManage/update?id=${readvo.id}";
		});
		
		$(".deletebtn").on("click",function(){
			var test = confirm("정말로 삭제하시겠습니까?");
			if(test==true){	
				location.href="/admin/userManage/delete?id=${readvo.id}";
				self.close();
				opener.location.reload();
			}else{
				location.reload();
			}
		});
		
		$(".closebtn").on("click",function(){
			self.close();
		});
		
	});
	
	
</script>
</body>
</html>