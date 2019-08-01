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
		
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>		
	
</head>
<body>

	<div id="pageContainer">
	
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<div style="padding-top:25px;text-align:center">
		<div id="inputcontent">
		    <div id="inputmain">
		        <form action="write"
		        	  method="post">
		        	<table class="table table-hover" style="margin:auto; width: 50%">
             	  		<tr>
                      		<th>작성자</th>
                      		<td>
                      	  		<input type="hidden" name="uploader" value="${ loginuser.memberId }">
                      	  		${ loginuser.memberId }	
                      		</td>
                  		</tr>          
	                  	<tr>
	                      	<th>제목</th>
	                      	<td>
                          		<input type="text" id="title" name="title" style="width:580px" />
	                      	</td>
	                  	</tr>
	                  	<tr>
	                      	<th>내용</th>
	                      	<td>
	                          	<textarea id="content" name="content" style="width:580px" rows="15" ></textarea>
                      		</td>
	                  	</tr>
                  	</table>
		       		
		       		<div class="buttons">
		        		<input class="btn btn-default" id="submit" type="submit" disabled="disabled" value="공지등록" />
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
		//location.href = "notice"; 
		});
	});

		 
	
	//제목 입력시 공지등록 활성화
	$("#title").keyup(function(){
		 $("#submit").removeAttr("disabled");
		 
		});
	
		
    </script>
</body>
</html>