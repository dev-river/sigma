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
			
			<h1>글 자세히 보기</h1>
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
					<textarea  class="form-control" id="content" readonly="readonly">${readvo.content}</textarea>
				</div>
				<div>
				    <input type="button" value="수정" class="btn update">
					<input type="button" value="목록" class="btn" onclick="location.href='/board/boardFR/list'">
					<input type="button" value="삭제" class="btn" onclick="location.href='/board/boardFR/delete?num=${readvo.num}'">
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
			
		<div class="row">
			<div data-backdrop="static" id="myModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-header">
						<button data-dismiss="modal" class="close">&times;</button>
						<p id="modal_rno"></p>
					</div>
					<div class="modal-body">
						<input id="modal_replytext" class="form-control">
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


<script type="text/javascript">

 

	$(document).ready(function(){
		var frnum = ${readvo.num}; /* 계속 사용될것이므로 전역변수로 지정 */
		
		$("#modal_delete").click(function(){
			var num = $("#modal_rno").text();
			
			$.ajax({
				type : 'delete',
				url : '/reply/'+num,
				dataType : 'text',
				success : function(result){
					alert(result);
					getAllList(frnum);
				}
			});
		});
		
		$("#modal_update").click(function() {
			var num = $("#modal_rno").text();
			var replytext = $("#modal_replytext").val();

			$.ajax({
				type : 'PUT',
				url : '/reply/'+num,					
				headers : {
					'Content-Type' : 'application/json',
					'X-HTTP-Method-Override' : 'PUT'
				},
				data : JSON.stringify({
					replytext : replytext
				}),
				dataType : 'text',
				success : function(result) {
					alter(result);
					getAllList(frnum);
				}
			});
		});
		
		$("#replyList").on("click", ".callModal", function(){
			var rno = $(this).prev("p").attr("data-rno");
			var replytext = $(this).prev("p").text();
			
			$("#modal_rno").text(rno);
			$("#modal_replytext").val(replytext);
			
			$("#myModal").modal("show");
		});
		
		$(".update").on("click",function(){
			location.href="/board/boardFR/update?num=${readvo.num}";
		})
		
		$("#btnReset").click(function(){
			$("#replycontent").val("");
			$("#replyer").val("");
		});
		
		getAllList(frnum);
		
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
		
		function getAllList(frnum) {
		
			$.getJSON("/reply/"+frnum, function(arr) {
				var str = '<hr>';
				
				for(var i=0; i<arr.length;i++){
					str += '<div class="panel panel-info">'+
					'<div class="panel-heading">'+
						'<span>frnum:'+arr[i].frnum+', 작성자: <span class="glyphicon glyphicon-user"></span>'+arr[i].replyer+'</span>'+
						'<span class="pull-right"><span class="glyphicon glyphicon-time"></span>'+arr[i].updatedate+'</span>'+
					'</div>'+
					'<div class="panel-body">'+
						'<p data-frnum="'+arr[i].frnum+'">'+arr[i].content+'</p>'+
						'<button class="btn callModal"><span class="glyphicon glyphicon-edit"></span>수정/삭제<span class="glyphicon glyphicon-trash"></span></button>'+
					'</div>'+
					'</div>';
				}
				
				$("#replyList").html(str);
				
			});
			
			
		}
	});
	
	
</script>
</body>
</html>