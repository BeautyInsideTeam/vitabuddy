<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />		   	      
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
		<section>		
		<div class="cart-container">
		    <h1>찜목록</h1>
		    
		    	<c:forEach var="wish" items="${wishList}">
				<div class="productItem">
			        <a href="<c:url value='/product/detailView/${prd.prdNo}'/>">
			            <img src="${wish.prdName}.png">
			            <h3>${wish.prdName}</h3>
			        </a>
			            <p>${wish.prdPrice}</p>
			            <p>${wish.prdCompany}</p>
			            <a href="/product/addCart/${wish.prdNo}" class="btn">장바구니에 추가</a>
			        </div>
				 </c:forEach>
				 
			<nav>
				<!-- 페이지네이션 -->
					<div class="pagination">
					    <a href="#" class="prev" onclick="changePage(currentPage - 1)">이전</a>
					    <c:forEach var="i" begin="1" end="${totalPages}">
					        <a href="#" class="page" onclick="changePage(${i})">${i}</a>
					    </c:forEach>
					    <a href="#" class="next" onclick="changePage(currentPage + 1)">다음</a>
					</div>
			</nav>	
				
				
		</div>
			</section> 
			
			<!--  bottom -->         
	        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	      </div>
	</body>
</html>