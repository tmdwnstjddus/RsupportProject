<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>공지사항</title>

	<!-- 
	<link rel="Stylesheet" href="/rsupport/resources/styles/default.css" /> 
	-->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
		
</head>
<body>

	<div id="container">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<div style="padding-top: 25px; text-align:center;">
		
		[ <a style="text-align: center; "href="write">공지사항 등록</a> ]
		<br><br>
			<table class="table table-hover" style="margin:auto; width: 70%">
			<thead>
				<tr style="background-color:#339fb7; height: 45px;">
					<th style="text-align: center; width: 20%;" >게시물 번호</th>
					<th style="text-align: center; width: 20%;">제목</th>
					<th style="text-align: center; width: 20%;">작성자</th>
					<th style="text-align: center; width: 20%">작성일</th>
					<th style="text-align: center; width: 20%">조회수</th>
				</tr>
			</thead>
				<c:forEach var="notice" items="${ notice }">
				<tr>
					<td>${ notice.uploadNo }</td>
					<td>
						<a href="detail/${ notice.uploadNo }" style="text-decoration: none">
								${ notice.title }
						</a>
					</td>
					<td>${ notice.uploader }</td>
					<td>${ notice.regdate }</td>
					<td>${ notice.readCount }</td>
				</tr>
				</c:forEach>	
			</table>
		</div>
	
		<!-- 게시판 하단의 페이징 버튼 -->
		<nav aria-label="Page navigation example" style="text-align: center; margin-top: 1%">
           	<ul class="pagination" style="margin:auto;">
               <li>
               		<c:if test="${PageMaker.prev}">
                		<a class="" href="notice${PageMaker.makeQuery(PageMaker.startPage - 1)}">이전</a>
                	</c:if> 
               </li>
               
               <c:forEach begin="${PageMaker.startPage}" end="${PageMaker.endPage}" var="idx">
               <li <c:out value="${PageMaker.cri.page == idx ? 'class=active' : '' }"/>>
                	<a class="" href="notice${PageMaker.makeQuery(idx)}">${idx}</a>
              	</li>
               </c:forEach>

               <li>
               	<c:if test="${PageMaker.next && PageMaker.endPage > 0}">
                		<a class="" href="notice${PageMaker.makeQuery(PageMaker.endPage + 1)}">다음</a>
                	</c:if> 
               </li>
          	</ul>
         </nav>

      </div>

</body>
</html>