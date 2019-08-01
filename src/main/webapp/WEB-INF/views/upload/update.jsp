<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8">
	<title>공지사항</title>
	
	<!-- 처음 css 개발
	<link rel="Stylesheet" href="/rsupport/resources/styles/default.css" />
	<link rel="Stylesheet" href="/rsupport/resources/styles/input.css" /> 
	 -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
		
	
</head>
<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <form action="/rsupport/upload/update"
		        	  method="post">
		        <input type="hidden" name="uploadNo" value="${ notice.uploadNo }">
		        <table class="table table-hover" style="margin:auto; width: 50%">
	            	<tr>
                      <th>작성자</th>
                      <td>
                      	  <input type="hidden" name="uploader" value="${ loginuser.memberId }">
                      	  ${ loginuser.memberId }	
                      </td>
                   </tr>
                   <tr>
                      <th>최종수정일</th>
                      <td>
                      	  <input type="hidden" name="moddate" value="${ notice.moddate }">
                      	  ${ notice.moddate }
                      </td>
                   </tr>          
                   <tr>
                      <th colspan="1">제목</th>
                      <td colspan="3">
                          <input type="text" name="title" style="width:580px" value="${ notice.title }"/>
                      </td>
                   </tr>
                   <tr>
                      <th colspan="1">내용</th>
                      <td colspan="3">
                          <textarea name="content" style="width:580px" rows="15" >${ notice.content }</textarea>
                      </td>
                   </tr>
              </table>
		        <div class="buttons">
		        	<input class="btn btn-default" type="submit" value="자료등록" />
		        	<input class="btn btn-default" id="cancel_button" type="button" value="취소" />
		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	</div>

	
<script type="text/javascript">

		window.addEventListener("load", function(event) { //js의 main 함수
			var btnCancel = document.querySelector("#cancel_button");
			btnCancel.addEventListener("click", function(event){ 
				history.back(); //브라우저의 이전 버튼을 클릭으로 페이지네이션 이동
				//location.href = "/rsupport/upload/notice"; //주소창에 notice를 입력하고 엔터
				});
			});
       		
</script>

</body>
</html>