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
			
			<form action="">
				<input type="hidden" name="num" value="${vo.num}">
				<input type="hidden" name="curPage" value="${to.curPage}">
				<input type="hidden" name="perPage" value="${to.perPage}">
				<input type="hidden" name="searchType" value="${to.searchType}">
				<input type="hidden" name="keyword" value="${to.keyword}">
			</form>
			
				<div class="form-group">
					<label for="num">글번호</label>
					<input class="form-control" id="num" value="${vo.num}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="viewcnt">조회수</label>
					<input class="form-control" id="viewcnt" value="${vo.viewcnt}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="title">제목</label>
					<input class="form-control" id="title" value="${vo.title}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="writer">작성자</label>
					<input class="form-control" id="writer" value="${vo.writer}" readonly="readonly">
				</div>
				
				<div class="form-group">
					<label for="content">내용</label>
					<textarea  class="form-control" id="content" readonly="readonly">${vo.content}</textarea>
				</div>
				<div>
				    <input type="button" value="수정" class="btn btn-primary update">
					<input type="button" value="목록" class="btn btn-info" onclick="location.href='/board/main/slist/searchboardNGList?searchType=${to.searchType}&keyword=${to.keyword}&curPage=${to.curPage}&perPage=${to.perPage}'">
					<input type="button" value="삭제" class="btn btn-warning del" >
					<%-- onclick="location.href='/board/boardFR/delete?num=${readvo.num}&curPage=${to.curPage}&perPage=${to.perPage}' --%>
				</div>
		</div>
		<hr>

<script type="text/javascript">

 

	$(document).ready(function(){
		var frnum = ${vo.num};  /* 계속 사용될것이므로 전역변수로 지정 */
		
		/* boardUpdate 부분 */
		$(".update").on("click",function(){
			location.href="/board/main/slist/searchboardNGUpdate?num=${vo.num}&searchType=${to.searchType}&keyword=${to.keyword}&curPage=${to.curPage}&perPage=${to.perPage}";
		});
		
			$(".del").click(function(){
				
				var num = $("input[name='num']").val();
				
				$.ajax({
					type : 'post',
					url : '/searchMainboardDel',
					data : {
						num : num
					},
					success : function(){
				   	 location.href="/board/main/slist/searchboardNGList?searchType=${to.searchType}&keyword=${to.keyword}&curPage=${to.curPage}&perPage=${to.perPage}";
					}
				});
			});
	
</script>
</body>
</html>