<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:import url="/WEB-INF/views/layout/head.jsp" />	
<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
<script src="<c:url value='/js/search.js'/>"></script>
<script src="<c:url value='/js/order.js'/>"></script>
<%-- <script src="<c:url value='/js/page.js'/>"></script> --%>
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/prdList.css'/>">

</head>
<body>
<div id="wrap">
<c:import url="/WEB-INF/views/layout/top.jsp" />

	<section>
	<h1>FIND YOUR NUTRITION</h1>
	<br>
	<hr>
	
<!-- 검색창 -->
	<div class="search">
		<form class="searchBox" id="searchForm" method="get">
			<input type="text" name="keyword" id="keyword" class="searchTxt" placeholder="Search">
			<button type="submit" class="searchBtn"><!-- 돋보기 아이콘 -->
			<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	
	</div>	
</section>

<nav>
	<!-- 카테고리 -->
	<form class="category">
		<!-- 메뉴 -->
		<div class="ctgSelect">
			<input type="radio" name="ctg" value="function" onClick=""/>기능별
		    <input type="radio" name="ctg" value="ingredient" onClick=""/>성분별
		    <input type="radio" name="ctg" value="brand" onClick=""/>브랜드별
		</div>
		
			<!-- 세부 카테고리 -->
	<div class="ctgList">
	    <div id="function" class="ctgMenu" style="display:none;">
	        <c:forEach var="func" items="${ctg}">
		        <div class="ctgItem">
		        <a href="#">
		            <h3>${func.function}</h3> 
		        </a>
		        </div>
		    </c:forEach>
	    </div>
	
	    <div id="ingredient" class="ctgMenu" style="display:none;">
	        <c:forEach var="ingredient" items="${ctg}">
		        <div class="ctgItem">
		        <a href="#">
		            <h3>${ingredient.ingredient}</h3> 
		        </a>
		        </div>
		    </c:forEach>
	    </div>
	    
	    <div id="brand" class="ctgMenu" style="display:none;">
	        <c:forEach var="brand" items="${ctg}">
		        <div class="ctgItem">
		        <a href="#">
		            <h3>${brand.prdBrand}</h3> 
		        </a>
		        </div>
		    </c:forEach>
	    </div>
    </div>
	</form>	
	

	<!-- 정렬 -->
	<div class="ordNav">
		<select id="order">
			<option value="review">리뷰순</option>
			<option value="sales">구매순</option>
		</select>
	</div>
</nav>			
	
<section>
	<!-- 상품 데이터 반복 출력 -->
	<div id="prdList" class="prdList">
	    <c:forEach var="prd" items="${prdList}">
	        <div class="productItem">
	        <a href="<c:url value='/product/detailView/${prd.prdNo}'/>">
	            <img src="${prd.prdImg}">
	            <h3>${prd.prdName}</h3>
	            
	        </a>
	            <p><fmt:formatNumber value="${prd.prdPrice}" pattern="#,###"/> 원</p>
	            <button type="button" class="btn">장바구니에 추가</button>
	        </div>
	    </c:forEach>
	</div>
</section>		
	
<nav>
	<!-- 페이지네이션 -->
		<div class="pagination">
		    <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" onclick="changePage(currentPage - 1)"><i class="fa-solid fa-caret-left"></i></a>
		    <c:forEach var="i" begin="1" end="${totalPages}">
		        <a href="#" class="page" onclick="changePage(${i})">${i}</a>
		    </c:forEach>
		    <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" onclick="changePage(currentPage + 1)"><i class="fa-solid fa-caret-right"></i></a>
		</div>
</nav>

<!--  footer -->         
	        	<c:import url="/WEB-INF/views/layout/footer.jsp" />
</div>	
</body>
</html>