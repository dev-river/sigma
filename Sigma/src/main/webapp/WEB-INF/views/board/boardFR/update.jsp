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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">

label{
	color: white;
}
	#submitBoardBtn {
	border-radius: 5px;
	padding-right: 10px;
	margin-right: 10px;
	width: 100px;
	float: right;
	margin: 5px; padding:5px; width:80%;
	}


	#btn_group button {
		border: 1px solid white;
		background-color: rgba(0, 0, 0, 0);
		color: white;
		padding: 5px;
		position: relative;
		left:0%;
		width:7%;
	}

	#btn_group button:hover {
		color: white;
		background-color: black;
	}

</style>
</head>
<body>
	<div class="bodymain">
	<br>
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
		<div class="update" style="padding-left: 30px; padding-right: 30px;">
		<br>
		<h3 style="color: white;">게시글 수정</h3><br/>
		
		<form action="/board/main/list/boardupdate" method="post">
			<input type="hidden" name="curPage" value="${to.curPage}">
			<input type="hidden" name="perPage" value="${to.perPage}">
			
			<div class="form-group">
				<label for="title">글번호</label>
				<input class="form-control" id="num" name="num" value="${updatevo.num}" readonly="readonly">
			</div>
			
			<div class="form-group">
				<label for="writer">작성자</label>
				<input class="form-control" id="writer" name="writer" value="${updatevo.writer}">
			</div>
			
			<div class="form-group">
				<label for="title">제목</label>
				<input class="form-control" id="title" name="title" value="${updatevo.title}">
			</div>
			
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="3">${updatevo.content}</textarea>
			</div>
			<div id="btn_group">
					<button class="update" id="submitBoardBtn">수정</button>
			</div>
		
		</form>
	</div>
	</div>
	</div>
	
	<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "content",
	    sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
		
		//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
		function submitContents(elClickedObj) {
		    // 에디터의 내용이 textarea에 적용된다.
		    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
		    try {
		        elClickedObj.form.submit();
		    } catch(e) {
		     
		    }
		}
		
		// textArea에 이미지 첨부
		function pasteHTML(filepath){
		    var sHTML = '<img src="<%=request.getContextPath()%>/resources/boardFR/'+filepath+'">';
		    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		}
		
		$(document).ready(function(){
			$("#submitBoardBtn").on("click", function(){
				submitContents("#submitBoardBtn");
			})
		});
	</script>
	
</body>
</html>