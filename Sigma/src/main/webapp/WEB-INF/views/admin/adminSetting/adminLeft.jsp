<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<div id="Left">
	<div id="LeftMenu">
		<div id="LeftMenuLogin">
			<a href="/">
			<img title="HOME" alt="home" style=" float: left;width:26px;" src="/resources/main/home.png">
			</a>
			<div style="margin-top: 3px;"> 관리자 : ${login.nickname} </div> 
		</div>
		<ul class="Leftmenulist">
			<li>
				<a href="#" id="boarddrop1">분석</a>
				<ul id="boardsel1" style="display: none; background-color: white;">
					<li><a href="#">전체</a></li>
					<li><a href="#">관리자 수익</a></li>
					<li><a href="#">판매자 수익</a></li>
					<li><a href="#">회원 수</a></li>
					<li><a href="#">방문자 수 </a></li>
				</ul>	
			</li>
			<li>
				<a href="#" id="boarddrop2">게시글관리</a>
				<ul id="boardsel2" style="display: none; background-color: white;">
					<li><a href="#">자유게시판</a></li>
					<li><a href="#">이벤트 게시판</a></li>
					<li><a href="#">새게임 소식</a></li>
					<li><a href="#">1:1 문의</a></li>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">댓글관리</a></li>
					<li><a href="#">리뷰관리</a></li>
				</ul>			
			</li>
			<li>
				<a href="#" id="boarddrop3">회원관리</a>
				<ul id="boardsel3" style="display: none; background-color: white;">
					<li><a href="/admin/userManage/userlist">일반회원목록</a></li>
					<li><a href="/admin/userManage/sellerlist">판매회원목록</a></li>
					<li><a href="/admin/userManage/adminlist">관리자 목록</a></li>
				</ul>	
			</li>
			<li>
				<a href="#" id="boarddrop4">관리자메뉴</a>
				<ul id="boardsel4" style="display: none; background-color: white;">
					<li><a href="/admin/adminSetting/imgManage">배경 이미지 관리</a></li>
					<li><a href="/admin/adminSetting/slideManage">슬라이드 관리</a></li>
					<li><a href="/admin/adminSetting/chargeManage">수수료 관리</a></li>
				</ul>	
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	if('${login.author}'!='admin'){
		window.location.href = "/admin/adminSetting/adminError";
	}
	$("#boarddrop1").click(function(){
		$("#boardsel1").toggle("slow");
	})
	$("#boarddrop2").click(function(){
		$("#boardsel2").toggle("slow");
	})
	$("#boarddrop3").click(function(){
		$("#boardsel3").toggle("slow");
	})
	$("#boarddrop4").click(function(){
		$("#boardsel4").toggle("slow");
	})
</script>
