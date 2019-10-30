<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

     <div class="row text-center" style="text-align : center">
         <ul class="pagination">
         
            <c:if test="${to.curPage>1}">
            <a href="/board/boardNG/list?curPage=${to.curPage-1}">&laquo;</a>
            </c:if>
            
            <c:forEach begin="${to.bpn}" end="${to.spn}" var="i">
               <a href="/board/boardNG/list?curPage=${i}">
               	<c:if test="${i==to.curPage}"><font color="red" size="3em">${i}</font></c:if>
               	<c:if test="${i != to.curPage}">${i}</c:if>
               </a>&nbsp;
            </c:forEach>
            
            <c:if test="${to.curPage<to.totalPage}">
            <a href="/boardNG/list?curPage=${to.curPage+1}">&raquo;</a>
            </c:if>
         </ul>
      </div>