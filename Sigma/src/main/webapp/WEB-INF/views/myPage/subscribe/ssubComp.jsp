<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container" style="background-color: rgb(25, 25, 25, 0.8); border-radius: 10px; min-height: 700px;">
		<div class="row">
			<table class="table" style="position:relative; left: 200px; width: 60%;">
				<thead>
					<tr>
						<th  style="height: 150px; ">
							<h2 style="color: white;">내 단골 스토어 리스트</h2>
							<div style="position: relative; left:83%; width: 15%;">
							</div>
						</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${favCompList}" var="r" begin="0" end="0">
						<tr>
							<td>
								<a href="/myPage/subscribe/subComp?writer=${r.id}">
								<c:choose>
									<c:when test="${r.filepath eq null}">
										<img alt="" src="/resources/gameDetailFile/noimage.png" style="width:25%; padding-right: 5px;" class="pull-left">
									</c:when>
									<c:otherwise>
										<img alt="" src="/resources/gameDetailFile/${r.filepath}" style="width:25%; padding-right: 5px;" class="pull-left">
									</c:otherwise>
								</c:choose>
								<h3 style="position:relative; top:45px;" class="pull-left gn">${r.id}</h3></a>
									<c:forEach items="${favCompList}" var="g" varStatus="status">
										<c:if test="${status.index<3}">
											<a href="/gameDetail/main/maincategoryread?num=${g.num}">
											<div style="width:18%; margin:2px; height:150px; text-align: center;" class="pull-right">
											<c:choose>
												<c:when test="${g.gamefilepath eq null}">
													<img alt="" src="/resources/gameDetailFile/noimage.png" style="width:90%; height: 80%; padding-right: 3px;" class="pull-left">
												</c:when>
												<c:otherwise>
													<img alt="" src="/resources/gameDetailFile/${g.gamefilepath}" style="width:90%; height: 80%; padding-right: 3px;" class="pull-left">
												</c:otherwise>
											</c:choose>
											<br>
											<p>${g.title}</p>
											</div>
											</a>
										</c:if>
									</c:forEach>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>