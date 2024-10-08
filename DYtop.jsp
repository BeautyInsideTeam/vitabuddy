<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
  <%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  --%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8"> 
		<title>topper</title>
		<link rel="stylesheet" href="DYcommon.css" >
		<link rel="stylesheet" href="header.css" >
	</head>   
	<body>  
		<section id="wrap">
        	<div role="banner">
        		<div id="headerBox">
	            	<div id="logoBox">
	            	<%-- <a href="<c:url value='/home'/>"><img src="<c:url value=''/>" id="logoImg"></a> --%>
	            	<a href="<c:url value='/home'/>">VITA BUDDY</a>
	            	</div>
					<div id="topMenu"> 
					
					<!-- 로그인 하지 않은 경우 -->
					<c:if test="${empty sessionScope.sid}">
					<a href="<c:url value='/'/>">로그인</a>					
					<a href="<c:url value='/joinForm'/>">회원가입</a>
					</c:if>
					
					<!-- 로그인 한 경우 -->
					<c:if test="${not empty sessionScope.sid}">
					<a href="<c:url value='/member/logout'/>">로그아웃</a>
					<a href="<c:url value='/wishList'/>"><i class="fa-solid fa-heart"></i></a>					
					<a href="<c:url value='/product/cartList'/>"><i class="fa-solid fa-cart-shopping"></i></a>
					</c:if>
					</div>
            	</div>
            	<hr>
            </div>
           </section>
        </body>
 </html>
            