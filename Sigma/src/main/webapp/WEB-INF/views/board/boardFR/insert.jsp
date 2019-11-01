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
	float: left;
	margin: 5px; padding:5px; width:80%;
	}

 #test_btn1 {
	border-radius: 5px;
	padding-right: 10px;
	margin-right: 10px;
	width: 100px;
	float: left;
	margin: 5px; padding:5px; width:80%;
	}


	#btn_group button {
		border: 1px solid white;
		background-color: rgba(0, 0, 0, 0);
		color: white;
		padding: 5px;
		position: relative;
		width:7%;
		float: right;
	}

	#btn_group button:hover {
		color: white;
		background-color: black;
	}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
</head>
<body>
	<br>
	<div class="bodymain">
	<div class="container" id="insert_form" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px; max-height: auto;">
		<div class="row" style="padding-left: 30px; padding-right: 30px;">
		<br>
			<form action="/board/main/list/boardinsert" method="post">
				<div class="form-group">
					<label for="title">제목</label>
					<input id="title" name="title" class="form-control" placeholder="제목">
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input id="writer" name="writer" class="form-control" value="${nickname}" readonly="readonly">
				</div>
				<br>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea style="width: 100%; border-radius: 10px;" rows="17" name="content" id="content" cols="80"></textarea>
				</div>
				
				<div id="btn_group">		
					<button id="submitBoardBtn">등록</button>
				</div>
				
			</form>
				<div id="btn_group">
					<button id="test_btn1" onclick="location.href='/board/main/list/boardlist'">취소</button>
				</div>
			</div>
	</div>
</div>


<!-- Smart Editor -->
<script type="text/javascript">
 
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
    oAppRef: oEditors,
    elPlaceHolder: "content",
    sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",
    fCreator: "createSEditor2"
});

$(document).ready(function(){
	$("#submitBoardBtn").on("click", function(){
		submitContents("#submitContents");
	});
});
 
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
    // 에디터의 내용이 textarea에 적용된다.
    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
 
    // 에디터의 내용에 대한 값 검증은 이곳에서
    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
  
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
 
</script>
</body>
</html>