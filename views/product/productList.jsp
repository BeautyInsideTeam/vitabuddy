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
<script src="<c:url value='/js/category.js'/>"></script>
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
	            <button type="submit" class="searchBtn">
	                <i class="fa-solid fa-magnifying-glass"></i>
	            </button>
	        </form>
	    </div>  
	</section>
	
	<nav>
	<!-- 상위 카테고리 -->
	<div id="category">
	    <ul>
	        <li data-category="function"><a href="#">기능별</a></li>
	        <li data-category="ingredient"><a href="#">성분별</a></li>
	        <li data-category="brand"><a href="#">브랜드별</a></li>
	    </ul>
	</div>
	
	
	<!-- 하위 카테고리 -->
	<div id="subCtg">
	    <div class="subCtgMenu" data-category="function">
	        <ul>
	        	<c:forEach var="func" items="${ctg}">
	                    <li><a href="#">${func.function}</a></li>
	            </c:forEach>
	            
	            <!-- <li><a href="#">기능1</a></li>
	            <li><a href="#">기능2</a></li>
	            <li><a href="#">기능3</a></li>
	            <li><a href="#">기능4</a></li>
	            <li><a href="#">기능5</a></li>
	            <li><a href="#">기능6</a></li>
	            <li><a href="#">기능7</a></li>
	            <li><a href="#">기능8</a></li> -->
	        </ul>
	    </div>
	    <div class="subCtgMenu" data-category="ingredient">
	        <ul>
	            <c:forEach var="func" items="${ctg}">
	                    <li><a href="#">${ingredient.ingredient}</a></li>
	            </c:forEach>
	        </ul>
	    </div>
	    <div class="subCtgMenu" data-category="brand">
	        <ul>
	            <c:forEach var="func" items="${ctg}">
	                    <li><a href="#">${brand.prdBrand}</a></li>
	            </c:forEach>
	        </ul>
	    </div>
	</div>
		
	
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
	    <div class="products">
	    <c:forEach var="sup" items="${supList}">
	           <div class="productItem">
	            <a href="<c:url value='/product/detailView/${sup.supNo}'/>">
	            <img src="${sup.supImg}" alt="${sup.supName}">
		        </a>
		        <p>${sup.supName}</p>
		        <p>${sup.supPrice}</p>
		        <p>${sup.supBrand}</p>
	           </div>
	        </c:forEach>
	        <%-- <div class="productItem">
	            <a href="<c:url value='/product/detailView/${sup.supNo}'/>">
	            <img src="sup.supImg" alt="${sup.supName}">
		        </a>
		        <p>sup.supName</p>
		        <p>sup.supPrice</p>
		        <p>sup.supBrand</p>
	           </div> --%>
		</div>
	   
	</section>        
	
	<nav>
	    <!-- 페이지네이션 -->
	    <div class="pagination">
	        <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" data-page="${currentPage - 1}"><i class="fa-solid fa-caret-left"></i></a>
	        <c:forEach var="i" begin="1" end="${totalPages}">
	            <a href="#" class="page" onclick="changePage(${i})">${i}</a>
	        </c:forEach>
	        <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" data-page="${currentPage - 1}"><i class="fa-solid fa-caret-right"></i></a>
	    </div>
	</nav>

<!--  footer -->         
<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
</div>    
</body>
</html>
