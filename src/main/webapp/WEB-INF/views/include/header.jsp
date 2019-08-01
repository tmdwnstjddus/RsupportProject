<%@ page language="java" 
		 contentType="text/html; charset=utf-8" 
		 pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="container">
		<div id="header">    	
            <div class="page-header">
                <h1 style='text-align:center'><a href="/rsupport/home">NOTICE WEB APPLICATION</a></h1>
            </div>
            <ul style='margin-left: 42%' class="nav nav-pills">
            	<li><a href="/rsupport/upload/notice">공지사항</a></li>
	            <c:choose>
	            <c:when test="${ empty loginuser }">
	            	<li><a href="/rsupport/account/login">로그인</a></li>
	                <li><a href="/rsupport/account/register">회원가입</a></li>
	            </c:when>
	            <c:otherwise>
	            	<li style=""><a href="/rsupport/home">${ loginuser.memberId }님 환영합니다.</a></li>
	            	<li><a href="/rsupport/account/logout">로그아웃</a></li>
	            </c:otherwise>
	            </c:choose>
            </ul>
        </div>
	</div>