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
</style>
</head>

<body>
<%-- 				<form action="">
					<input type="hidden" name="perPage" value="${vo.nickname}">
				</form> --%>
	<br>
	<div class="bodymain">
	<div class="container" id="insert_form" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
		<div class="insert" style="padding-left: 30px;padding-right: 30px;">
		<div class="row">
		<br>
			<form action="/board/main/One/OneInsert" method="post">
			
				<div class="form-group">
					<label for="title">제목</label>
					<input id="title" name="title" class="form-control" placeholder="제목">
				</div>
				<div class="form-group">
					<label for="writer">작성자</label>
					<input id="writer" name="writer" class="form-control" value="${login.nickname}" readonly="readonly">
				</div>
				<br><br>
				
				<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" id="content" name="content" rows="13" placeholder="내용을 입력하세요"></textarea>
			</div>
				<div class="form-group">
					<button id="submitBoardBtn" class="btn btn-info">등록</button>
					<input type="button" class="btn btn-danger" id="cancle" value="취소" onclick="location.href='/board/main/One/One'">
				</div>
			</form>
			
		</div>
	</div>
</div>
</div>

<!-- <script type="text/javascript">
      var oEditors = [];
      nhn.husky.EZCreator.createInIFrame({
         oAppRef : oEditors,
         elPlaceHolder : "content",
         sSkinURI : "/resources/se2/SmartEditor2Skin.html",
         htParams : {
            bUseToolbar : true,
            bUseVerticalResizer : true,
            bUseModeChanger : true,
            fOnBeforeUnload : function() {
            }
         },

         fOnAppLoad : function() {
            oEditors.getById["content"].exec("PASTE_HTML", [ "" ]);
         },
         fCreator : "createSEditor2"
      });

      $("#submitBoardBtn").click(function() {
         oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
         $("#insert_form").submit();
      });

      function pasteHTML(filepath){
          var sHTML = '<img src="/resources/upload/'+filepath+'">';
          oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
      }
      
      
   </script> -->
</body>
 
</html>