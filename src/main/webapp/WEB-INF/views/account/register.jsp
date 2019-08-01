<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8" %>

<!DOCTYPE html>

<html>
<head>

	<!-- 처음 css 개발
	<link rel="Stylesheet" href="/rsupport/resources/styles/default.css" />
	<link rel="Stylesheet" href="/rsupport/resources/styles/input.css" />  -->
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>	

	
	
	<meta charset="utf-8" />
	<title>회원가입</title>
	
</head>
<body>

	<div id="pageContainer">
	
		<!-- 지정된 헤더 불러오기 -->
		<jsp:include page="/WEB-INF/views/include/header.jsp" />
		
		<div id="inputcontent">
			<br /><br />
		    <div id="inputmain" style="margin:auto; width: 25%">
		        <div class="inputsubtitle">
		      		<h3> 회원가입정보 </h3>
		        </div>

		        <form action="register" method="post">
		        <table class="table table-hover">
		            <tr>
		                <th>아이디(ID)</th>
		                <td>
		                <p>
		                    <input type="text" id="memberId" name="memberId"/>
		                    
		                    <button class="btn btn-default" id="idCheck" type="button">중복확인</button> 
		                </p>    
		                <p id="result">
		                   	<span id="msg"></span>
		                </p>
		                </td>
		            
		            </tr>
		            
		            <tr>
		                <th>비밀번호</th>
		                <td>
		                	<input type="password" id="passwd" name="passwd" />
		                </td>
		            </tr>
		            <tr>
		                <th>비밀번호 확인</th>
		                <td>
		                    <input type="password" id="confirm" name="confirm"/>
		                </td>
		            </tr>
		            <tr>
		                <th>이메일</th>
		                <td>
		                	<input type="text" id="email" name="email"/>
		                </td>
		            </tr>
		                       		            
		        </table>
		        <div class="buttons">
		        	<input class="btn btn-default" id="submit" type="submit" value="회원가입" disabled="disabled"  />
		        	<input class="btn btn-default" id="cancel_button" type="button" value="취소" />

		        </div>
		        </form>
		    </div>
		</div>   	
	
	</div>
	
	
	<script type="text/javascript">
	
	window.addEventListener("load", function(event) { //js의 main 함수
		var btnCancel = document.querySelector("#cancel_button");
		btnCancel.addEventListener("click", function(event){ 
			location.href = "/rsupport/home"; 
			});
		});
	
	
	
	//중복검사
	$("#idCheck").click(function(){	 
		 var query = {memberId : $("#memberId").val()};
		 
		 $.ajax({
			 url : "/rsupport/account/idCheck",
			 type : "post",
			 data : query,
			 success : function(data) {		  
				 if(data == 1) {
					 $("#result #msg").text("이미 사용중인 아이디 입니다.");
					 $("#result #msg").attr("style", "color:#f00"); 
					 $("#submit").attr("disabled", "disabled"); 
					 } else {
						 $("#result #msg").text("사용 가능한 아이디 입니다.");
						 $("#result #msg").attr("style", "color:#00f");
						 $("#submit").removeAttr("disabled");
					 }
				 }
		 	});
		 });
	
	//중복확인후 아이디 변경 재검사
	$("#memberId").keyup(function(){
		 $("#result #msg").text("중복확인을 해주세요.");
		 $("#result #msg").attr("style", "color:#000"); 
		 $("#submit").attr("disabled", "disabled");
		 
		});
	
	</script>
</body>
</html>