<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!--  -->
<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>

<!-- top 메뉴 -->    
        	<header>
        		<div id="headerBox">
	            	<div id="logoBox">
	            	<%-- <a href="<c:url value='/home'/>"><img src="<c:url value=''/>" id="logoImg"></a> --%>
	            	<a href="<c:url value='/home'/>">VITA BUDDY</a>
	            	</div>
					<div id="topMenu"> 
					
					<!-- 로그인 하지 않은 경우 -->
					
					<a href="<c:url value='/'/>">로그인</a>					
					<a href="<c:url value='/joinForm'/>">회원가입</a>
					
					
					<!-- 로그인 한 경우 -->
					
					<a href="<c:url value='/member/logout'/>">로그아웃</a>
					<a href="<c:url value='/wishList'/>"><i class="fa-solid fa-heart">찜 목록</i></a>					
					<a href="<c:url value='/product/cartList'/>"><i class="fa-solid fa-cart-shopping">장바구니</i></a>
					
					</div>
            	</div>
            	<hr>
            </header>
            