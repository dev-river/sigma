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
<body background="/resources/main/backgroundimg2.jpg">
<div class="container">
		<div class="row">
			<div class="col-xs-10 col-xs-offset-1">
			<h3 style="color: white;">회원정보</h3>
			
				<div class="form-group">
					<label class="badge badge-info"  for="id">ID</label>
					<input class="form-control" id="ID" name="id" value="${readvo.id}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="nickname">닉네임</label>
					<input class="form-control" id="nickname" name="nickname" value="${readvo.nickname}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="name">이름</label>
					<input class="form-control" id="name" name="name" value="${readvo.name}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="writer">권한</label>
					<input class="form-control" id="author" name="author" value="${readvo.author}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="content">성별</label>
					<textarea  class="form-control" id="sex" name="sex" readonly="readonly">${readvo.sex}</textarea>
				</div>

				<div class="form-group">
					<label class="badge badge-info"  for="content">생년월일</label>
					<textarea  class="form-control" id="birth" name="birth" readonly="readonly">${readvo.birth}</textarea>
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="content">연락처</label>
					<textarea  class="form-control" id="phone" name="phone" readonly="readonly">${readvo.phone}</textarea>
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="content">이메일</label>
					<textarea  class="form-control" id="email" name="email" readonly="readonly">${readvo.email}</textarea>
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="content">가입일</label>
					<textarea  class="form-control" id="joindate" name="joindate" readonly="readonly">${readvo.joindate}</textarea>
				</div>
				
				<div class="form-group">
					<label class="badge badge-info"  for="content">주소</label>
					<textarea  class="form-control" id="address" name="address" readonly="readonly">${readvo.address1}&nbsp;${readvo.address2}</textarea>
				</div>

				<div class="form-group">
					<label class="badge badge-info"  for="content">잔여캐쉬</label>
					<textarea  class="form-control" id="cash" name="cash" readonly="readonly">${readvo.cash}</textarea>
				</div>
				
				<c:if test="${readvo.author=='seller'}">
					
				<div class="form-group">
					<label class="badge badge-info"  for="content">판매자명</label>
					<textarea  class="form-control" id="compname" name="compname" readonly="readonly">${readvo.compname}</textarea>
				</div>
					
				<div class="form-group">
					<label class="badge badge-info"  for="content">판매자정보</label>
					<textarea  class="form-control" id="compdetail" name="compdetail" readonly="readonly">${readvo.compdetail}</textarea>
				</div>
					
				<div class="form-group">
					<label class="badge badge-info"  for="content">판매자번호</label>
					<textarea  class="form-control" id="compdetail" name="compdetail" readonly="readonly">${readvo.compdetail}</textarea>
				</div>
					
				<div class="form-group">
					<label class="badge badge-info"  for="content">판매자 주소</label>
					<textarea  class="form-control" id="compaddress" name="compaddress" readonly="readonly">${readvo.compaddress1}&nbsp;${readvo.compaddress2}</textarea>
				</div>
					
				<div class="form-group">
					<label class="badge badge-info"  for="content">판매자 연락처</label>
					<textarea  class="form-control" id="compphone" name="compphone" readonly="readonly">${readvo.compphone}</textarea>
				</div>
					
				<div class="form-group">
					<label class="badge badge-info"  for="content">등록이미지 경로</label>
					<textarea  class="form-control" id="filepath" name="filepath" readonly="readonly">${readvo.filepath}</textarea>
				</div>
					
					
				</c:if>
				
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