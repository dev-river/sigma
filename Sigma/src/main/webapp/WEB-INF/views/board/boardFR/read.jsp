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
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
.read{
	position: relative;
	width: 1070px;
	height: auto;
	margin: 0;
	right: 0%;
	
	
}
.callModal{
	float: right;
}
</style>
</head>
<body>
	<br>
	<div class="bodymain">
<div class="container">	
		<div class="read">
			<div class="row">
				<form action="">
					<input type="hidden" name="num" value="${readvo.num}">
					<input type="hidden" name="curPage" value="${to.curPage}">
					<input type="hidden" name="perPage" value="${to.perPage}">
					<input type="hidden" name="perPage" value="${vo.nickname}">
				</form>
			
				<div class="form-group">
					<label for="num">글번호</label>
					<input class="form-control" id="num" value="${readvo.num}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="viewcnt">조회수</label>
					<input class="form-control" id="viewcnt" value="${readvo.viewcnt}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" id="title" value="${readvo.title}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="writer">작성자</label>
					<input class="form-control" id="writer" value="${readvo.writer}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="content">내용</label>
					<div id="content">${readvo.content}</div>
				</div>
				<div>
				    <input type="button" value="수정" class="btn update btn-primary">
					<input type="button" value="목록" class="btn btn-info" onclick="location.href='/mainboard?curPage=${to.curPage}&perPage=${to.perPage}'">
					<input type="button" value="삭제" class="btn btn-warning" onclick="location.href='/board/boardFR/delete?num=${readvo.num}&curPage=${to.curPage}&perPage=${to.perPage}'">
				</div>
			</div>
		<hr>
			<!-- Reply Form {s} -->
		
			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<form name="form" id="form">

				<!-- <hidden path="num" id="num"/> -->

				<div class="row">

					<div class="col-sm-10">

						<textarea id="replycontent" class="form-control" rows="3" placeholder="댓글을 입력해 주세요"></textarea>

					</div>

					<div class="col-sm-2">

						<input class="form-control" id="replyer" placeholder="댓글 작성자"></input>

						<button type="button" class="btn btn-sm btn-primary" id="btnReplyInsert" style="width: 100%; margin-top: 10px"> 저 장 </button>
						<button type="button" class="btn btn-sm btn-warning" id="btnReset" style="width: 100%; margin-top: 10px"> 취 소 </button>
			
					</div>
				</div>
				</form>
			</div>
		

			<!-- Reply Form {e} -->
			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">

				<h6 class="border-bottom pb-2 mb-0">Reply list</h6>

				<div id="replyList" class="row">
				
					<hr>
				
				</div>

			</div> 
			
<!-- 			<div class="row"> 댓글 페이징 들어갈 곳
				<ul class="pagination">
				
				</ul>
			</div> -->
			
		<div class="row">
			<div data-backdrop="static" id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-header">
						<button data-dismiss="modal" class="close">&times;</button>
						<p id="modal_num"></p>
					</div>
					<div class="modal-body">
						<input id="modal_content" class="form-control">
					</div>
					<div class="modal-footer">
						<button id="modal_update" data-dismiss="modal" class="btn">수정</button>
						<button id="modal_delete" data-dismiss="modal" class="btn">삭제</button>
						<button id="modal_close" data-dismiss="modal" class="btn">닫기</button>
					</div>
				</div>
			</div>
		</div>
</div>
</div>
</div>
<br>
<script type="text/javascript">

 

	$(document).ready(function(){
		var frnum = ${readvo.num}; /* 계속 사용될것이므로 전역변수로 지정 */
		/* var replyPage = 1; */
		
		$(".pagination").on("click","li a", function(event) {
			event.preventDefault();
			replyPage =$(this).attr("href");
			getAllList(frnum);
		});
		
		/* replyDelete 부분 */
		$("#modal_delete").click(function(){
			var num = $("#modal_num").text();
			
			$.ajax({
				type : 'DELETE',
				url : '/reply/'+num,
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'DELETE'
				},
				dataType : 'text',
				success : function(result){
					alert(result);
					getAllList(frnum);
				}
			});
		});
		
		/* replyUpdate 부분 */
		$("#modal_update").click(function() {
			
			var num = $("#modal_num").text();
			var replytext = $("#modal_content").val();
			
			
			$.ajax({
				type : 'POST',
				url : '/reply/'+num,
				ContentType : 'application/json',
				data : {
					'content' : replytext
				},
				dataType : 'text',
				success : function(result) {
					alert(result);
					getAllList(frnum);
				}
			});
		});
		
		/* replyModal 창 */
		$("#replyList").on("click", ".callModal", function(){
			var num = $(this).prev("p").attr("data-num");
			var replytext = $(this).prev("p").text();
			
			$("#modal_num").text(num);
			$("#modal_replytext").val(replytext);
			
			$("#myModal").modal("show");
		});
		
		/* boardUpdate 부분 */
		$(".update").on("click",function(){
			location.href="/mainboardupdate?num=${readvo.num}&curPage=${to.curPage}&perPage=${to.perPage}";
		})
		
		/* replyReset 부분 */
		$("#btnReset").click(function(){
			$("#replycontent").val("");
			$("#replyer").val("");
		});
		
		getAllList(frnum);
		
		/* replyInsert 부분 */
		$("#btnReplyInsert").click(function() {
			
			var replyer = $("#replyer").val();
			var replycontent = $("#replycontent").val();
		
			$.ajax({
				type : 'post',
				url : '/reply',
				data : {
					'frnum' : frnum,
					'replyer' : replyer,
					'content' : replycontent
					
				},
				dataType : 'text',
				
				success : function(result) {
					alert(result);
					if (result == 'INSERT_SUCCESS') {
						$("#replyer").val("");
						$("#replycontent").val("");
						getAllList(frnum);
					}
				}
			});
		});
		
		/* replyList 부분 */
		function getAllList(frnum) {
		
			$.getJSON("/reply/"+frnum, function(arr) {
				var str = '<hr>';
				
				for(var i=0; i<arr.length;i++){
					str += '<div class="panel panel-info">'+
					'<div class="panel-heading">'+
						'<span>No.'+arr[i].num+' 작성자: <span class="glyphicon glyphicon-user"></span>'+arr[i].replyer+'</span>'+
						'<span class="pull-right"><span class="glyphicon glyphicon-time"></span>'+arr[i].updatedate+'</span>'+
					'</div>'+
					'<div class="panel-body">'+
						'<p data-num="'+arr[i].num+'">'+arr[i].content+'</p>'+
						'<button class="btn callModal"><span class="glyphicon glyphicon-edit"></span>수정/삭제<span class="glyphicon glyphicon-trash"></span></button>'+
					'</div>'+
					'</div>';
				}
				
				$("#replyList").html(str);
				
				printPaging(result);
			});
		}
	});
	
/* 	function printPaging(to) {
		var str = '';
		if(to.curPage > 1){
			str+="<li><a href='"+(to.curPage)+"'>&laquo;</a></li>"
		}
		
		for(var i=to.bpn;i<to.spn+1;i++){
			var strClass = to.curPage == i ? 'active':'';
			str+="<li class='"+strClass+"'><a href='"+i+"'>"+i+"</a></li>";
		}
		
		if(to.curPage < to.totalPage){
			str+="<li><a href='"+(to.curPage+1)+"'>&raquo;</a></li>"
		}
		
		$(".pagination").html(str);
	} */
	
	
</script>
</body>
</html>