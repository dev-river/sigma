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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
        //남녀성비 구글차트 
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','sex');
            data.addColumn('number','비중');
 
            data.addRows([ 
                ['남',${manratio}],
                ['여',${womanratio}]
            ]);
            var opt = {
                    'title':'남녀 비율',
                    'width':300,
                    'height':300,
                    pieSliceText:'label',
                    backgroundColor: { fill:'transparent' },
                    titleTextStyle: {color: 'white', fontSize: 15 },
                    legend:'none'
            };
            var chart = new google.visualization.PieChart(document.getElementById('sexRatio'));
            chart.draw(data,opt);
        }
        
        google.charts.setOnLoadCallback(drawageChart);
        function drawageChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','age');
            data.addColumn('number','비중');
 
            data.addRows([ 
                ['10대 이하',${age1}],
                ['20대',${age2}],
                ['30대',${age3}],
                ['40대 이상',${age4}]
            ]);
            var opt = {
                    'title':'나이대 비율',
                    'width':300,
                    'height':300,
                    pieSliceText:'label',
                    backgroundColor: { fill:'transparent' },
                    titleTextStyle: {color: 'white', fontSize: 15 },
                    legend:'none'
            };
            var chart = new google.visualization.PieChart(document.getElementById('ageRatio'));
            chart.draw(data,opt);
        }
</script>

<link rel="stylesheet" type="text/css" href="/resources/css/main.css">
<style type="text/css">
   h5,.container{
   color: white;
   }
      #img1 {
         border-radius: 10px;
          box-shadow: 15px 15px 20px black;
          width: 240px;
          height: 190px;
         }
         #bigimg{
         width: 550px;
         height: 400px;
         border-radius: 10px;
          box-shadow: 15px 15px 20px black;
         }
</style>
</head>
<body style="background-color: black;">

<hr>
<div class="container" style="background-color: black;">
   <h3>게임이름: <a href="/myPage/subscribe/subComp?writer=${vo.writer}" style="text-decoration:none; color: #008299;">${vo.title}</a></h3>
   <h5>배급사: ${vo.writer}</h5>
   <h5>가격: <c:choose>
            <c:when test="${vo.dcrate eq 0}">
               ${vo.price}
            </c:when>
            <c:when test="${vo.dcrate ne 0}">
               ${vo.price * (1 - vo.dcrate / 100)} <span style="color:red">(${vo.dcrate}%off)</span>
            </c:when>
   </c:choose></h5>
   <h5>출시일: ${vo.regidate}</h5>
   <hr>
   <div class="row">
   <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" style="width: 550px; height: 400px; margin: 10px; ">
      <ol class="carousel-indicators">
         <li class="active" data-target="#carouselExampleIndicators" data-slide-to="0"></li>
         <c:forEach items="${filepath}" varStatus="i">
            <li data-target="#carouselExampleIndicators" data-slide-to="${i.index+1}"></li>
         </c:forEach>
      </ol>
      <div class="carousel-inner" style="width: 550px; height: 400px; margin: 0;">
         <div class="carousel-item active">
            <img class="d-block w-100" src="/resources/gameDetailFile/${firstfilepath}" alt=""  id="bigimg">
         </div>
         
         <c:forEach items="${filepath}" var="filename">
            <div class="carousel-item">
               <img class="d-block w-100" src="/resources/gameDetailFile/${filename}" alt=""  id="bigimg">
            </div>
         </c:forEach>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators"
         role="button" data-slide="prev"> <span
         class="carousel-control-prev-icon" aria-hidden="true"></span> <span
         class="sr-only">Previous</span>
      </a> <a class="carousel-control-next" href="#carouselExampleIndicators"
         role="button" data-slide="next"> <span
         class="carousel-control-next-icon" aria-hidden="true"></span> <span
         class="sr-only">Next</span>
      </a>
      </div>
      <div style="width: 550px; margin: 10px">
         <img class=""  id="img1" src="/resources/gameDetailFile/${firstfilepath}" alt="" height="190px" width="240px" style="margin: 5px;" data-target="#carouselExampleIndicators" data-slide-to="0">
         <c:forEach items="${filepath}" var="file" varStatus="i">
            <img class=""  id="img1" src="/resources/gameDetailFile/${file}" alt="" height="190px" width="240px" style="margin: 5px;" data-target="#carouselExampleIndicators" data-slide-to="${i.index+1}">
         </c:forEach>
      </div>
      </div>
      <br>
      <div style="float: left;">
      <h5>카테고리: ${vo.category}</h5>
      <h5>게임정보: ${vo.content}</h5>

      </div>
      <div class="row pull-right" style="width: 30%; float: right;" >
         <c:choose>
         	<c:when test="${vo.status eq 'x'}">
               <input type="button" value="비활성화된 게임입니다">
            </c:when>
            <c:when test="${vo.status eq 'o' && buycheck eq '0'}">
               <input class="pull-left shopBasket" style="width: 45%; margin: 5px; color: black;"
               type="button" value="장바구니에 추가"> <input
               class="pull-left zzim_list" style="width: 45%; margin: 5px;  color: black;"
               type="button" value="찜목록에 추가">
            </c:when>
            <c:when test="${vo.status eq 'o' && buycheck eq '1'}">
            	<input type="button" value="다운로드">
            </c:when>
         </c:choose>
      </div>
      <br><br>
      <hr>
      
      <c:choose>
      	<c:when test="${manratio eq '0' && womanratio eq '0'}">
      		<p>구매자가 0명입니다. 이 경우 남/녀 비율 및 나이 차트가 표시되지 않습니다.</p>
      	</c:when>
      	<c:otherwise>
      	<h4>구매자 통계</h3>
      		<div class="row">
	      		<div id="sexRatio"></div>
	      		<div id="ageRatio"></div>
      		</div>
      	</c:otherwise>
      </c:choose>
      <hr>
      <div>
         <jsp:useBean id="now" class="java.util.Date" />
         <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
         <c:choose>
            <c:when test="${empty dcvo}">
            </c:when>
            <c:when test="${dcvo.goal <= dcvo.joinclick && dcvo.dcenddate > today}">
               <p>할인 요청을 달성하여 ${dcvo.dcstartdate}부터 ${dcvo.dcenddate}까지 ${dcvo.dcrate}% 할인이 적용됩니다.</p>
            </c:when>
            <c:when test="${today <= dcvo.rqstartdate && dcvo.joinclick == 0}">
               ${dcvo.rqstartdate}에 ${dcvo.dcrate}%의 할인이 시작됩니다!
            </c:when>
            <c:when test="${dcvo.rqstartdate <= today && today <= dcvo.rqenddate && dcvo.goal > dcvo.joinclick}">
               <p>할인요청 종료: ${dcvo.rqenddate}</p>
               <p>할인요청 목표수: ${dcvo.joinclick} / ${dcvo.goal}</p>
               <p>달성 시 할인율: ${dcvo.dcrate}</p>
               <c:choose>
                  <c:when test="${dcjoincheck eq 0}">
                     <a class="btn btn-primary" href="/gameDetail/inform/dcCountAdd?num=${dcnum}&gdnum=${vo.num}" onclick="return confirm('할인 요청에 동참하시겠습니까 ?');">동참하기</a>
                  </c:when>
                  <c:otherwise>
                     <a class="btn btn-warning" href="#">동참완료</a>
                  </c:otherwise>
               </c:choose>
            </c:when>
            <c:otherwise>
            </c:otherwise>
         </c:choose>
      </div>
      
      <!-- 판매자만 보이게 할 버튼 -->
      <c:if test="${author eq 'seller' && id eq vo.writer}">
         <a class="btn btn-primary" href="/gameDetail/main/maincategoryupdate?num=${vo.num}">게임정보수정</a>
            <a class="btn btn-primary" href="/gameDetail/inform/DCRqSet?num=${vo.num}&title=${vo.title}" target="_blank">할인 요청 등록</a>
            <br><label for="status">게임등록상태: </label><input id="status" name="status" value="${vo.status}" readonly="readonly">
            <a class="btn btn-danger" href="/gameDetail/inform/gameStatus?num=${vo.num}&status=${vo.status}" onclick="return confirm('변경하시겠습니까?');">게임등록상태변경</a>
            <hr>
         </c:if>
         
            <!-- 리뷰 등록 -->
         <div>
            <label for="reviewContent">리뷰 등록: </label>
            <textarea rows="3" cols="150" id="reviewContent" style="color: black;"></textarea>
            <button class="reviewInsert btn btn-primary" style="float: right; margin: 0px 0px 0px 10px;">등록</button>
            <select id="likeselect" style="color: black; float: right;">
               <option value="추천" style="color: black;">추천</option>
               <option value="비추천" style="color: black;">비추천</option>
            </select>
         </div>
         <br>
         <hr>
         <!-- 긍정리뷰 최다글 및 부정리뷰 최다글 -->
         <div style="">
            <c:choose>
               <c:when test="${empty maxYesReview.assistyes}">
                  <p>아직 추천 공감 리스트가 없습니다!</p>
               </c:when>
               <c:when test="${maxYesReview.assistyes eq 0}">
                  <p>아직 추천 공감 리스트가 없습니다!</p>
               </c:when>
               <c:otherwise>
                  <h4><i class="far fa-thumbs-up fa-lg"></i>  추천 최다 리뷰</h4>
                  <br>
                  <p style="float: left;">작성자: ${maxYesReview.writer}</p>
                  <p style="float: right;">수정일: ${maxYesReview.updatedate}</p>
                  <textarea rows="3" cols="150" style="color: black; background: #B5C1DB; " readonly="readonly">${maxYesReview.content}</textarea>
                  <p style="float: right;">싫어요: ${maxYesReview.assistno} <button class="yesorno btn btn-danger" id="assistNo" value="${maxYesReview.num}">싫어요</button></p>
                  <p style="float: right;">좋아요: ${maxYesReview.assistyes} <button class="yesorno btn btn-success" id="assistYes" value="${maxYesReview.num}">좋아요</button></p>

                  <c:if test="${id eq maxYesReview.writer || author eq 'admin'}">
                     <a href="/gameDetail/main/maincategoryreviewupdate?num=${maxYesReview.num}" target="_blank" class="btn btn-warning"
                     onclick="window.open(this.href, 'reviewUpdate', 'width=1100, height=600'); return false;">수정</a>
                     <button class="reviewdelete btn btn-danger" value="${maxYesReview.num}">삭제</button>
                     <%-- <button class="reviewupdate btn btn-warning" value="${maxYesReview.num}">수정</button> <button class="reviewdelete btn btn-danger" value="${maxYesReview.num}">삭제</button> --%>
                  </c:if>
               </c:otherwise>
            </c:choose>
            </div>
            <br><br>
         <hr>
         <div style="">
         <c:choose>
            <c:when test="${empty maxNoReview.assistyes}">
               <p>아직 비추천 공감 리스트가 없습니다!</p>
            </c:when>
            <c:when test="${maxNoReview.assistyes eq 0}">
               <p>아직 비추천 공감 리스트가 없습니다!</p>
            </c:when>
            <c:otherwise>
               <h4><i class="far fa-thumbs-down fa-lg"></i> 비추천 최다 리뷰</h4>
               <br>
                  <p style="float: left;">작성자: ${maxNoReview.writer}</p>
                  <p style="float: right;">수정일: ${maxNoReview.updatedate}</p>
                  <textarea rows="3" cols="150" style="color: black; background: #B5C1DB;" readonly="readonly">${maxNoReview.content}</textarea>  
                  <p style="float: right;">싫어요: ${maxNoReview.assistno} <button class="yesorno btn btn-danger" id="assistNo" value="${maxNoReview.num}">싫어요</button></p>
                  <p style="float: right;">좋아요: ${maxNoReview.assistyes} <button class="yesorno btn btn-success" id="assistYes" value="${maxNoReview.num}">좋아요</button></p>
                  <c:if test="${id eq maxNoReview.writer || author eq 'admin'}">
                     <a href="/gameDetail/main/maincategoryreviewupdate?num=${maxNoReview.num}" target="_blank" class="btn btn-warning"
                     onclick="window.open(this.href, 'reviewUpdate', 'width=1100, height=600'); return false;">수정</a>
                     <button class="reviewdelete btn btn-danger" value="${maxNoReview.num}">삭제</button>
                     <%-- <button class="reviewupdate btn btn-warning" value="${maxNoReview.num}">수정</button> <button class="reviewdelete btn btn-danger" value="${maxNoReview.num}">삭제</button> --%>
                  </c:if>
            </c:otherwise>
         </c:choose>
         </div>
         <br>
         <!-- 리뷰글 최신순 리스트 -->
         <hr>
         <h3>최신 리뷰</h3>
   <br><br>
         <div>
            
            <c:forEach items="${reviewlist}" var="review">
               <div style=" min-height: 180px; max-height: auto;">
                  <p>-${review.recommend} 리뷰-</p>
                  <p style="float: left;">작성자: ${review.writer}</p>
                  <p style="float: right;">수정일: ${review.updatedate}</p>
                  <textarea rows="3" cols="150" style="color: black; background: #B5C1DB;" readonly="readonly">${review.content}</textarea>
                  <p style="float: right;">싫어요: ${review.assistno} <button class="yesorno btn btn-danger" id="assistNo" value="${review.num}">싫어요</button></p>
                  <p style="float: right;">좋아요: ${review.assistyes} <button class="yesorno btn btn-success" id="assistYes" value="${review.num}">좋아요</button></p>
                  <c:if test="${id eq review.writer || author eq 'admin'}">
                     <a href="/gameDetail/main/maincategoryreviewupdate?num=${review.num}" target="_blank" class="btn btn-warning"
                     onclick="window.open(this.href, 'reviewUpdate', 'width=1100, height=600'); return false;">수정</a>
                     <button class="reviewdelete btn btn-danger" value="${review.num}">삭제</button>
                     <%-- <button class="reviewupdate btn btn-warning" value="${review.num}">수정</button> <button class="reviewdelete btn btn-danger" value="${review.num}">삭제</button> --%>
                  </c:if>
               </div>
               <hr>
            </c:forEach>
            
            <!-- 리뷰 페이징 파트 -->
            <c:choose>
               <c:when test="${sto.amount eq 0}">
               </c:when>
               <c:otherwise>
               <div>
                  <div class="row text-center" style="position: relative; left: 45%">
                     <ul class="pagination">
                        <!-- ul에 pagination 클래스를 주면 예쁘다 -->

                        <c:if test="${sto.curPage>1}">
                           <li><a
                              href="/gameDetail/main/maincategoryread?num=${vo.num}&curPage=${sto.curPage-1}&perPage=${sto.perPage}">&laquo;</a></li>
                        </c:if>
                        <!-- 주소창에서 perPage값을 조절하면서 확인할것 -->

                        <c:forEach begin="${sto.bpn}" end="${sto.spn}" var="idx">
                           <li class="${sto.curPage == idx?'active':''}"><a
                              href="/gameDetail/main/maincategoryread?num=${vo.num}&curPage=${idx}&perPage=${sto.perPage}">${idx}</a></li>
                           <!-- li에 클래스를 active로 주면 현재 페이지에 색이 들어간다 -->
                        </c:forEach>

                        <c:if test="${sto.curPage<sto.totalPage}">
                           <li><a
                              href="/gameDetail/main/maincategoryread?num=${vo.num}&curPage=${sto.curPage+1}&perPage=${sto.perPage}">&raquo;</a></li>
                        </c:if>
                     </ul>
                  </div>
               </div>
            </c:otherwise>
            </c:choose>
         </div>
   </div>
   <br>
   <script type="text/javascript">
      $(document).ready(function(){
         $(".yesorno").on("click", function(){
            var reviewnum = $(this).val();
            var assist = $(this).attr("id");
            
            $.ajax({
               type: 'get',
               url: '/gameDetail/inform/reviewadd',
               data: {
                  'num': reviewnum,
                  'assist': assist
               },
               datatype: 'text',
               success: function(result){
                  alert('적용 되었습니다!');
                  window.location.reload();
               }
            });
         });
         
         $(".reviewInsert").on("click", function(){
         var reviewContent = $("#reviewContent").val();
         var obj = document.getElementById("likeselect");
         var likeselect = obj.options[obj.selectedIndex].value;
         
            $.ajax({
               type: 'post',
               url: '/gameDetail/inform/reviewinsert',
               data: {
                  'gdnum': "${vo.num}",
                  'reviewContent': reviewContent,
                  'likeselect': likeselect
               },
               datatype: 'text',
               success: function(){
                  alert('등록 되었습니다!');
                  window.location.reload();
               },
               error: function(){
                  alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
               }
            });
         });
         
         $(".reviewupdate").on("click", function(){
         var num = $(this).val();
         
            $.ajax({
               type: 'get',
               url: '/gameDetail/main/maincategoryreviewupdate',
               data: {
                  'num': num,
               },
               datatype: 'text',
               success: function(){
                  alert('등록 되었습니다!');
                  window.location.reload();
               },
               error: function(){
                  alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
               }
            });
         });
         
         $(".reviewdelete").on("click", function(){
         var num = $(this).val();
         
            $.ajax({
               type: 'get',
               url: '/gameDetail/inform/reviewdelete',
               data: {
                  'num': num,
               },
               datatype: 'text',
               success: function(){
                  alert('삭제 되었습니다!');
                  window.location.reload();
               },
               error: function(){
                  alert('로그인 또는 리뷰 내용 입력이 필요합니다.');
               }
            });
         });
         
         
         
      //장바구니에 추가
      $(".shopBasket").click(function() {
         var gdnum = ${vo.num};
         $.ajax({
            type : 'post',
            url : '/myPage/main/Basket',
            data : {
               gdnum : gdnum
            },
            dataType : 'text',
            success : function(event) {
               if(event=='failed'){
                  var con = confirm("해당 상품이 이미 장바구니에 들어있습니다. 장바구니로 이동하시겠습니까?")
                  if(con){
                     location.href = "/myPage/main/Basket";
                  }
               } else{
                  var con = confirm("해당 상품을 장바구니에 집어넣었습니다. 장바구니로 이동하시겠습니까?")
                  if(con){
                     location.href = "/myPage/main/Basket";
                  }
               }
            }
         });
      });
      
      //찜목록에 추가
      $(".zzim_list").click(function() {
         var gdnum = ${vo.num};
         $.ajax({
            type : 'post',
            url : '/myPage/main/zzim',
            data : {
               gdnum : gdnum
            },
            dataType : 'text',
            success : function(event) {
               if(event=='failed'){
                  var con = confirm("해당 상품이 이미 찜목록에 들어있습니다. 찜목록으로 이동하시겠습니까?")
                  if(con){
                     location.href = "/myPage/main/zzim";
                  }
               } else{
                  var con = confirm("해당 상품을 찜목록에 집어넣었습니다. 찜목록으로 이동하시겠습니까?")
                  if(con){
                     location.href = "/myPage/main/zzim";
                  }
               }
            }
         });
      });
      });
   </script>
</body>
</html>