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
<%-- <script src="<c:url value='/js/page.js'/>"></script> --%>
 <link rel="stylesheet" type="text/css" href="<c:url value='/css/prdList.css'/>">

</head>
<body>
<div id="wrap">
<c:import url="/WEB-INF/views/layout/top.jsp" />

	<section>
	<h1>FIND YOUR NUTRITION</h1>
	
<!-- 검색창 -->
	<div class="search">
		<form id="searchForm" action="/search">
			<input type="text" name="keyword" id="keyword" placeholder="Search">
			<button type="submit" class="searchBtn"><!-- 돋보기 아이콘 -->
			<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	
	</div>	
</section>

<nav>
	<!-- 카테고리 -->
		<!-- 메뉴 -->
		<a href="<c:url value='/product/prdListCtgView/${ctg.ctgNo}'/>">기능별</a>
		<a href="<c:url value='/product/prdListCtgView/${ctg.ctgNo}'/>">성분별</a>
		<a href="<c:url value='/product/prdListCtgView/${ctg.ctgNo}'/>">브랜드별</a>
	
	<div class="ctg">
	    <c:forEach var="ctg" items="${ctgList}">
	        <div class="ctgItem">
	        <a href="<c:url value='/product/prdList/${ctg.ctgNo}'/>">
	            <h3>${ctg.ctgName}</h3> 
	        </a>
	        </div>
	    </c:forEach>
	</div>
	
	<!-- 정렬 -->
		<select id="order" onchange="sortProducts()">
			<option value="review">리뷰순</option>
			<option value="sales">구매순</option>
		</select>
</nav>			
	
<section>
	<!-- 상품 데이터 반복 출력 -->
	<div id="prdList" class="prd">
	    <c:forEach var="prd" items="${prdList}">
	        <div class="productItem">
	        <a href="<c:url value='/product/detailView/${prd.prdNo}'/>">
	            <img src="${prd.prdName}.png">
	            <h3>${prd.prdName}</h3>
	            
	        </a>
	            <p><fmt:formatNumber value="${prd.prdPrice}" pattern="#,###"/> 원</p>
	            <button type="button">장바구니에 추가</button>
	        </div>
	    </c:forEach>
	</div>
</section>		
	
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
</body>
</html>