<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>

	<meta charset="utf-8" />
	<title>로그인</title>
	<!-- 처음 css 개발
	<link rel="Stylesheet" href="/rsupport/resources/styles/default.css" />
	<link rel="Stylesheet" href="/rsupport/resources/styles/input.css" />  -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

</head>
<body>
	
	<div id="pageContainer">
		
		<!-- 지정된 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain" style="margin:auto; width: 25%">
		        <div class="inputsubtitle">
		        	<h3>로그인 정보</h3>
		        
		        
		        <form action="login" method="post">	       
		        <table class="table table-hover">
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                    <input type="text" name="memberId"/>
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" name="passwd"/>
		                </td>
		            </tr>
		        </table>
		        
		        <div class="buttons">
		        	<input class="btn btn-default" type="submit" value="로그인"  />
		        	<input class="btn btn-default" id="cancel_button" type="button" value="취소" />
		        </div>
		        </form>
		        </div>
		        
		    </div>
		</div>   	
	
	</div>

</body>

	<script type="text/javascript">
	
		window.addEventListener("load", function(event) { //js의 main 함수
			var btnCancel = document.querySelector("#cancel_button");
			btnCancel.addEventListener("click", function(event){ 
				location.href = "/rsupport/home"; 
				});
			});
	
	</script>
</html>