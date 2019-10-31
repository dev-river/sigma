<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.list {
	position: relative;
	width: 1070px;
	height: auto;
	margin: 0;
	right: 45px;
}

.bodymain {
	position: relative;
	margin: auto;
	height: auto;
	width: 1070px;
}

#keyword {
	width: 765px;
}

#searchBtn {
	position: relative;
	right: 100px;
}
</style>
</head>
<body>
	<div class="bodymain">
		<div class="list">
			<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px; max-height: auto;">
			
			<div style="float: left;">
				<jsp:include page="/WEB-INF/views/admin/adminSetting/adminLeft.jsp"></jsp:include>
			</div>
			
			<br>
			<div class="row" >
			<div class="d" style="float: right; width: 870px; border-left: double 1px white; height: 700px; padding-left: 30px; padding-right: 30px;">
			<table class="table" style="color: #ffffff">
		<thead>
			<tr>
				<th> QnA 질문</th>
			</tr>
		</thead>
		
		<tbody>
		<tr>
		<td>
		<ul class="Leftmenulist"  style="width: 300px; color: white;">
		<div>
         <li style="width: 700px; list-style: none; ">
            <a href="#" id="boarddrop11" style="color: white;">Q.제 명의 휴대폰이 맞는데도 본인인증이 어렵네요...여길 한번 참고해보시길!</a>
            <ul id="boardsel11" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px;" >
               <li style="list-style: none; padding-left: 0px;"><p> A. 본인 명의의 휴대폰이 맞는데도 인증 과정에 문제가 있으시다면

간혹 이용 중이신 웹 브라우저 설정에 따라 인증이 어려울 수 있습니다.

 

번거로우시겠지만,

하단에 안내드리는 내용들을 참고하신 뒤 재시도 부탁 드립니다.
<hr>


1. 팝업 차단 해제
 - 인터넷 익스플로러 아이콘 > 마우스 오른쪽 클릭 > 관리자 권한 실행
 <br>
 

2. 인터넷 임시 파일 및 쿠키 삭제
 - 인터넷 익스플로러 > 도구 > 인터넷 옵션 > 일반 > 삭제
 <br>
 

3. 호환성 보기 설정 확인
 - 인터넷 익스플로러 > 도구 > 호환성 보기 설정 > 사이트 추가 여부 확인
 <br>
 

4. 관리자 권한 실행
 - 인터넷 익스플로러 아이콘 > 마우스 오른쪽 클릭 > 관리자 권한 실행​
 <br>
 

※ 다른 브라우저(크롬, 파이어폭스 등) 이용 후에도 확인해 주세요.
</p></li>
            </ul>   
         </li>
         </div>
         <br>
         <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop22" style="margin-bottom: 15px;">Q.휴대폰이 없는데, 비밀번호를 바꾸고 싶어요!</a>
            <ul id="boardsel22" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 비밀번호 변경 시 반드시 본인확인이 필요하며,
휴대폰으로만 본인인증을 할 수 있습니다.
<br>
안타깝게도 다른 방법은 마련되어 있지 않은 점 양해바랍니다. ​</p></li>
            </ul>   
         </li>
         </div>
          <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop33" style="margin-bottom: 30px;">Q.개명 후 정보 수정은 어떻게 하나요?</a>
            <ul id="boardsel33" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 던전앤파이터ID는 개명 여부와 관계없이
ID와 휴대폰 가입자가 일치하다면 본인인증이 가능합니다.
<br>
SIGMA ID는 SIGMA에서 개명된 정보가 반영되어야 하므로
 SIGMA에서 직접 변경 또는 넥슨 고객센터로 문의 부탁드립니다.
<br>
만약, 개명 후 본인인증이 되지 않는다면
휴대폰 통신사와 서울신용평가정보원에 문의하여
성함변경 신청을 하신 뒤, 다시 본인인증 시도 바랍니다.
<br>
※ 휴대폰 통신사 및 서울신용평가정보원에
    성함변경 신청을 하지 않을 시, 인증이 되지 않을 수 있습니다. ​</p></li>
            </ul>   
         </li>
         </div>
     <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop4">Q.네이버ID를 sigma 또는 던파ID로 변경할 수 있나요?</a>
            <ul id="boardsel4" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 던전앤파이터에서는 연동된 ID를 변경하거나
다른 ID로의 캐릭터 이동이 가능하지 않습니다.
<br>
이는, 네이버ID 뿐만아니라 SIGMA과 던파ID 모두 해당됩니다.​</p></li>
            </ul>   
         </li>
         </div>
         
            <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop5">Q.휴대폰이 없는데, 회원가입을 하고 싶어요!</a>
            <ul id="boardsel5" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 회원가입을 위해선 반드시 본인확인이 필요하며,
휴대폰으로만 본인인증을 할 수 있습니다.
<br>
안타깝게도 다른 방법은 마련되어 있지 않은 점 양해바랍니다. ​​</p></li>
            </ul>   
         </li>
         </div>
         
           <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop6">Q.불법 프로그램 사용으로 이용이 제한되었는데 어떤 불법 프로그램인지 알고싶어요.</a>
            <ul id="boardsel6" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 불법 프로그램 사용으로 이용이 제한되었을 경우,
어떤 프로그램을 사용하여 이용 제한이 적용되었는지 정확히 안내가 어렵습니다.
<br>
이는 불법 프로그램에 대한 정보가 퍼지지 않도록 하기 위함과
악용의 우려로 인한 부분인 점 양해 부탁드립니다.
<br>
※ 다만, 운영정책에 의거하여 아래 링크에서 확인이 가능한
   프로그램은 불법프로그램으로 간주될 수 있습니다.
   (링크 클릭 > Ctrl + F > '불법프로그램 사용이란?' 검색)
<br>
* 운영정책 페이지 바로가기 : [SIGMA 운영정책] ​​</p></li>
            </ul>   
         </li>
         </div>
         
           <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop7">Q.개인정보 이용내역 메일을 왜 받은거죠?</a>
            <ul id="boardsel7" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. [정보통신망 이용촉진 및 정보보호 등에 관한 법률] 제30조 2 "개인정보 이용내역의 통지" 규정에 따라
회원님의 개인정보 이용내역을 연 1회 통지하고 있습니다. 
<BR>
개인정보 이용내역 통지는 회원정보 내 등록된 이메일 주소로 안내를 드리고 있으며, 
상세한 이용내역은 로그인 > 마이페이지 > 내정보 > 개인정보이용내역에서 확인하실 수 있습니다.
 ​​</p></li>
            </ul>   
         </li>
         </div>
         
          <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop8">Q.보호자 동의가 필요한가요?</a>
            <ul id="boardsel8" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 만 18세 미만 청소년 회원의 경우 보호자(부모님) 동의를 진행해야만 회원 가입이 완료됩니다.
<BR>
동의가 완료되지 않을 경우 회원가입이 제한되며,
오류로 인해 진행에 문제가 있을 경우 1:1문의하기로 접수해 주시기 바랍니다.​
 ​​</p></li>
            </ul>   
         </li>
         </div>
         
                   <div>
           <li style="width: 700px;list-style: none;">
            <a href="#" id="boarddrop9">Q.알뜰폰으로는 본인인증이 불가능한가요?</a>
            <ul id="boardsel9" style="display: none; background-color: white; color: black; margin-top: 5px; border-radius: 10px; padding-top: 15px; padding-left: 15px; padding-right: 15px; padding-bottom: 15px; ">
               <li style="list-style: none;"><p>A. 6/27(목) 점검 이후 부터 신규가입 본인인증 수단에서 알뜰폰이 제외됩니다.
<BR>
다만, 보안서비스나 거래제한 해제 등
기타 본인인증은 정상적으로 하실 수 있으니 걱정마시길 바랍니다.​
 ​​</p></li>
            </ul>   
         </li>
         </div>
         
         <div>
         <li style="width: 700px; list-style: none; ">
            <a href="#" id="boarddrop10" style="color: white;">Q.외부 계정(구글, 페이스북)으로 던파에 가입하려는데 이미 3개의 ID가 등록되어 있다고 나와요.</a>
            <ul id="boardsel10" style="display: none; background-color: white; color: black; border-radius: 10px; padding: 15px; margin-top: 15px;" >
               <li style="list-style: none; padding-left: 0px;"><p> A. 외부 계정(구글, 페이스북)은 넥슨ID로 분류되기 때문에
기존의 SIGMA ID를 포함하여 총 3개까지만 던파 서비스 이용 동의가 가능합니다.
<BR>
그러니 던전앤파이터 서비스 이용 동의가 어려우시다면
기존에 던파에 가입된 SIGMA ID를 찾아보시기 바랍니다.
</p></li>
            </ul>   
         </li>
         </div>
         
      </ul>
      </td>
      </tr>
		</tbody>
	</table>
			
			
			</div>
		</div>
	</div>
	<br>
	<br>

<script type="text/javascript">
			   $(document).ready(function() {
				   
				   $("#boarddrop11").click(function() {
					$("#boardsel11").toggle("slow");
				});
				   
				   $("#boarddrop22").click(function() {
						$("#boardsel22").toggle("slow");
					}); 
				   
				   $("#boarddrop33").click(function() {
						$("#boardsel33").toggle("slow");
					}); 
				   $("#boarddrop4").click(function() {
						$("#boardsel4").toggle("slow");
					}); 
				   $("#boarddrop5").click(function() {
						$("#boardsel5").toggle("slow");
					}); 
				   $("#boarddrop6").click(function() {
						$("#boardsel6").toggle("slow");
					}); 
				   $("#boarddrop7").click(function() {
						$("#boardsel7").toggle("slow");
					}); 
				   $("#boarddrop8").click(function() {
						$("#boardsel8").toggle("slow");
					}); 
				   $("#boarddrop9").click(function() {
						$("#boardsel9").toggle("slow");
					}); 
				   $("#boarddrop10").click(function() {
						$("#boardsel10").toggle("slow");
					}); 
			   });
			   
			</script>
</body>
</html>