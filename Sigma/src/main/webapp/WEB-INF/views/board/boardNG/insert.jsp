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
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
.insert{
	position: relative;
	width: 1070px;
	height: auto;
	margin: 0;
	right: 45px;
}
label{
	color: white;
}
</style>
</head>

<body>
	<br><br><br>
	<div class="bodymain">
	<div class="container" id="insert_form">
		<div class="insert">
		<div class="row">
			<form action="/board/main/newgame/NewGameInsert" method="post">
				<div class="form-group">
					<label for="title">제목</label>
					<input id="title" name="title" class="form-control" placeholder="제목">
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input id="writer" name="writer" class="form-control" placeholder="작성자">
				</div>
				<br><br>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea id="content" name="content" class="form-control" rows="3" placeholder="내용" ></textarea>
				</div>
				<div class="form-group" style="float: right; padding-bottom: 20px;">
					<button id="submitBoardBtn" class="btn btn-info">등록</button>
					<input type="button" class="btn btn-danger" id="cancle" value="취소" onclick="location.href='/board/main/newgame/NewGame'">
				</div>
			</form>
			
		</div>
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