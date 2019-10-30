<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<br>
<style>

</style>
<div id="Left" style="width: 280px; float: left;">
	<div id="LeftMenu" style="width: 280px;">
		<div id="LeftMenuLogin">
			<a href="/">
			<img title="HOME" alt="home" style=" float: left;width:26px;" src="/resources/main/home.png">
			</a>
			<div style="margin-top: 3px; color: white;"> 관리자 : ${login.nickname} </div> 
		</div>
		<ul class="Leftmenulist"  style="width: 280px;">
			<li style="width: 170px;">
				<a href="#" id="boarddrop1">게시글관리</a>
				<ul id="boardsel1" style="display: none; background-color: white; color: black; border-radius: 10px;">
					<li><a href="/admin/main/board/boardManage">전체게시판 관리</a></li>
					<li><a href="/admin/main/board/onebyoneManage">1:1문의 관리</a></li>
					<li><a href="/admin/main/board/QnaManage">QnA 관리</a></li>
					<li><a href="/admin/main/board/ReviewManage">리뷰 관리</a></li>
				</ul>			
			</li>
			<li style="width: 170px;">
				<a href="#" id="boarddrop2">회원관리</a>
				<ul id="boardsel2" style="display: none; background-color: white; border-radius: 10px;">
					<li><a href="/admin/main/user/adminlist">일반회원목록</a></li>
					<li><a href="/admin/main/user/adminsellerlist">판매회원목록</a></li>
					<li><a href="/admin/main/user/adminadminlist">관리자 목록</a></li>
				</ul>	
			</li>
			<li style="width: 200px;">
				<a href="#" id="boarddrop3">관리자메뉴</a>
				<ul id="boardsel3" style="display: none; background-color: white; border-radius: 10px;">
					<li><a href="/admin/main/setting/imgmanage">배경 이미지 관리</a></li>
					<li><a href="/admin/main/setting/slidemanage">슬라이드 관리</a></li>
					<li><a href="/admin/main/setting/chargeManage">수수료 관리</a></li>
				</ul>	
			</li>
		</ul>
	</div>
</div>
<script type="text/javascript">
	if('${login.author}'!='admin'){
		window.location.href = "/admin/main/adminError";
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
</script>
