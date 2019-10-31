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

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.12/css/all.css" integrity="sha384-G0fIWCsCzJIMAVNQPfjH08cyYaUtMwjJwqiRKxxE/rx96Uroj1BtIQ6MLJuheaO9"
    crossorigin="anonymous">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/side.css">
<style type="text/css">

</style>
</head>
<body>
    <nav class="floating-menu">
        <ul class="main-menu">
            <li><!-- 홈 -->
                <a href="/"  title="메인">
                    <i class="fas fa-home fa-lg"></i>
                </a>
            </li>
            
            <li><!-- 로그인 -->
           			 <c:if test="${empty login}">
                		  <a href="/member/login/login" title="로그인"><i class="fas fa-user-alt fa-lg"></i></a>
              		 </c:if>
              		
              		 <c:if test="${!empty login}">
              		 	 <!-- 로그아웃 -->
             		     <c:if test="${login.author eq 'user'}">
                  			 <a href="/member/login/logout" title="로그아웃"><i class="fas fa-user-alt-slash fa-lg"></i></a>
                		 </c:if>
                		
                	
               		 	 <c:if test="${login.author eq 'seller'}">
                   			 <a href="/member/login/logout" title="로그아웃"><i class="fas fa-user-alt-slash fa-lg"></i></a>
                		 </c:if>
                	
                		
               		 	 <c:if test="${login.author eq 'admin'}">
                   			 <a href="/member/login/logout" title="로그아웃"><i class="fas fa-user-alt-slash fa-lg"></i></a>
                		 </c:if>
                		
              		 </c:if>
            </li>
            
            <li><!-- 내정보 -->
              	<c:if test="${!empty login}">
              		
             		     <c:if test="${login.author eq 'user'}">
                  			 <a href="/myPage/main/mypage?id=${login.id}" title="마이페이지">
                  			 	<i class="far fa-address-card fa-lg"></i>
                  			 </a>
                		 </c:if>
                	 
               		 	 <c:if test="${login.author eq 'seller'}">
                    		 <a href="/compManage/main/manageread?id=${login.id}" title="판매자페이지"> <i class="fas fa-address-card fa-lg"  class="ripple"></i></a>
                		 </c:if>
                	 
                	 
               		 	 <c:if test="${login.author eq 'admin'}">
                    		 <a href="/admin/main/user/adminlist?id=${login.id}" title="관리자페이지"> <i class="far fa-address-card fa-lg"  class="ripple"></i></a>
                		 </c:if>
                	
              	 </c:if>
            </li>
          	<!-- 이전페이지 -->
            <li>
                <a href="#" onclick='history.back(-1); return false;' title="이전">
                    <i class="fas fa-arrow-left fa-lg"></i>
                </a>
               
            </li>
            <li>
            <c:if test="${!empty login}"><!-- 충전 -->
            	 <c:if test="${login.author eq 'user'}">
                  	<a href="/myPage/main/cash?id=${login.id}" title="충전">
                  		<i class="fas fa-dollar-sign fa-lg"></i>
                  	</a>
                </c:if>
                 <c:if test="${login.author eq 'seller'}">
                    <a href="/compManage/main/gamelist?writer=${login.id}" title="게임관리"> 
                    	<i class="fas fa-cogs fa-lg"  class="ripple"></i>
                    </a>
                </c:if>
                <c:if test="${login.author eq 'admin'}">
                    <a href="/admin/main/user/adminlist?id=${login.id}" title="그래프"> 
                    	<i class="fas fa-chart-bar fa-lg"  class="ripple"></i>
                    </a>
                </c:if>
               </c:if>
                
            </li>
              <li>
            <c:if test="${!empty login}"><!-- 충전 -->
            
                 <c:if test="${login.author eq 'seller'}">
                   <a href="/myPage/main/cash?id=${login.id}" title="충전">
                  		<i class="fas fa-dollar-sign fa-lg"></i>
                  	</a>
                </c:if>
           
               </c:if>
                
            </li>
        </ul>
        <div class="menu-bg"></div>
    </nav>
    
    <script type="text/javascript">
    	function Back() {
			window.history.back(-1);
		}
    </script>
</body>
</html>