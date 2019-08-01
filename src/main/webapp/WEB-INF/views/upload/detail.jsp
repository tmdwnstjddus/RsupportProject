<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %><%-- JSTL의 함수를 제공하는 taglib --%>
    
<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>공지사항</title>
	
	<!-- 처음 css 개발
	<link rel="Stylesheet" href="/rsupport/resources/styles/default.css" />
	<link rel="Stylesheet" href="/rsupport/resources/styles/input.css" />  -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
		
	
</head>

<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp" />	
		
		<div style="padding-top:25px; height: 100%">

		        		<table class="table table-hover" style="margin:auto; width: 50%;">
		        			<tr>
				                <th style="width: 25%">게시물 번호</th>
				                <td style="width: 25%">${ notice.uploadNo }</td>
				                <th style="width: 25%">작성일</th>
				                <td style="width: 25%">${ notice.regdate }</td>             
				            </tr>
				            <tr >
				            	<th>조회수</th>
				                <td>${ notice.readCount }</td>
				                <th>최종수정일</th>
				                <td>${ notice.moddate }</td>
				                
				            </tr>
				            <tr>
				                <th colspan="1">작성자</th>
				                <td colspan="3">${ notice.uploader }</td>
				            </tr>
				            <tr>
				                <th colspan="1">제목</th>
				                <td colspan="3">${ notice.title }</td>
				            </tr>
				            <tr>
				                <th colspan="1">내용</th>
				                <%-- 줄바꿈 문자열을 저장하고 있는 변수 만들기 --%>	
<c:set var="enter" value="
" />
				                <%-- notice.content 문자열에서 \r\n을 <br>로 변경 --%>
				                <td colspan="3">${ fn:replace(notice.content, enter, '<br>') }</td>
				            </tr>
		        		</table>
        
				        <div style="text-align: center; margin-left: 130px" class="buttons">
				        	<!-- 로그인한 사용자와 글의 작성자가 같으면 삭제, 수정 버튼 활성화  -->
				       			<c:if test="${loginuser.memberId eq notice.uploader }">
				        			<input class="btn btn-default" type="button" id="update_button" value="편집" />
				        			<input class="btn btn-default" type="button" id="delete_button" value="삭제" />
				        		</c:if> 	
				        		
				        		<input class="btn btn-default" type="button" id="cancel_button" value="목록보기"/>	        	
						</div>
			 </div>
		 </div>   	
</body>

	<script type="text/javascript">
	
    	//브라우저가 html을 모두 읽고 처리할 준비가 되었을 때
       	window.addEventListener("load", function(event) { //js의 main 함수
       		var btnCancel = document.querySelector("#cancel_button");
       		btnCancel.addEventListener("click", function(event){ 
       			//history.back(); //이전 버튼을 클릭으로 페이지네이션으로 이동
       			location.href = "/rsupport/upload/notice";
                });
       		
       		var btnDelete = document.querySelector('#delete_button');
       		btnDelete.addEventListener('click', function(event) {
       			var ok = confirm("${notice.uploadNo}번 자료를 삭제할까요?");
       			if(ok){
       				//<a 를 통한 요청이므로 주소 뒤에 ?key=value 형식을 써서 데이터 전송
       				location.href = "/rsupport/upload/delete/${ notice.uploadNo }";
       			}
       		});
       		
       		var btnUpdate = document.querySelector('#update_button');
       		btnUpdate.addEventListener('click', function(event) {
       			//<a 를 통한 요청이므로 주소 뒤에 ?key=value 형식을 써서 데이터 전송
       			location.href = "/rsupport/upload/update/${ notice.uploadNo }";
       		});
       	});
    	
     </script>
</html>