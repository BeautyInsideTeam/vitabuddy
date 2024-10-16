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
<%-- <script src="<c:url value='/js/search.js'/>"></script> <!-- 검색 js 추가 -->--%>
<script src="<c:url value='/js/search.js'/>"></script> <!-- 검색 js 수정 -->

<script src="<c:url value='/js/pageSupplementList.js'/>"></script> <!-- 페이지 js 추가 -->
<link rel="stylesheet" type="text/css" href="<c:url value='/css/supplementList.css'/>"> <!-- css 링크 수정 -->

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
	        <li data-category="functions"><a href="#">기능별</a></li>  <!-- 수정사항1. function 을 functions로 바꿈 s 추가 (이하동일) -->
	        <li data-category="ingredients"><a href="#">성분별</a></li>
	        <li data-category="brands"><a href="#">브랜드별</a></li>
	    </ul>
	</div>
	
	
	<!-- 하위 카테고리 -->
	<div id="subCtg">
	    <div class="subCtgMenu" data-category="functions">
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
	            <li><a href="#">기능8</a></li> 출력 형태-->
	            
	        </ul>
	    </div>
	    <div class="subCtgMenu" data-category="ingredients">
	        <ul>
	            <c:forEach var="func" items="${ctg}">
	                    <li><a href="#">${ingredient.ingredient}</a></li>
	            </c:forEach> 
	        </ul>
	    </div>
	    <div class="subCtgMenu" data-category="brands">
	        <ul>
	           <c:forEach var="func" items="${ctg}">
	                    <li><a href="#">${brand.supBrand}</a></li>
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
	    <!-- 상품 데이터 반복 출력 -->  <!-- 수정사항2. 전체 상품 데이터, brand, function, ingredient 태그 선택 시 출력되는 상품 데이터 -->
	    <div class="products">
	    
	    	<!-- 전체 상품  출력 -->  
	    	<c:forEach var="sup" items="${pagingsupList}">
	           <div class="productItem">
	           <a href="<c:url value='/api/supplement/supplementDetail/${sup.supId}'/>">
	           <img class="prdImg" src="data:image/png;base64,${sup.base64SupImg}" width="300" height="300"> </a>
		        <p>${sup.supName}</p>
		        <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sup.supPrice}"/></p>  <!-- 한국 통화 표시 -->
		        <p>${sup.supBrand}</p>
	           </div>
	        </c:forEach>
	        
	        
	        
	        <!-- brand 태그 선택시 상품 출력 -->  <!-- 막상 해시태그값을 선택했을 때 상품이 나오는 js파일은 없다. 그냥 jsp로 -->
	        <c:forEach var="brandsup" items="${pagingbrandsupList}">
	           <div class="productItem">
	           <a href="<c:url value='/api/supplement/supplementDetail/${brandsup.supId}'/>">   <!-- 상품 상세 연결 링크 수정 -->
	           <img class="prdImg" src="data:image/png;base64,${brandsup.base64SupImg}" width="300" height="300"> </a>  <!-- 상품 이미지 출력 코드 : 클릭했을 때, 해당 상품의 supId로 넘어간다 (제품 상세페이지로 이동) -->
		        <p>${brandsup.supName}</p>
		        <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${brandsup.supPrice}"/></p>
		        <p>${brandsup.supBrand}</p>
	           </div>
	        </c:forEach> 
	        
	        <!-- function 태그 선택시 상품 출력 -->
	        <c:forEach var="funcsup" items="${pagingfunctionsupList}">
	           <div class="productItem">
	  		   <a href="<c:url value='/api/supplement/supplementDetail/${funcsup.supId}'/>">   <!-- 상품 상세 연결 링크 수정 -->
	           <img class="prdImg" src="data:image/png;base64,${funcsup.base64SupImg}" width="300" height="300"> </a>  <!-- 상품 이미지 출력 코드 : 클릭했을 때, 해당 상품의 supId로 넘어간다 (제품 상세페이지로 이동) -->
		        <p>${funcsup.supName}</p>
		        <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${funcsup.supPrice}"/></p>
		        <p>${funcsup.supBrand}</p>
	           </div>
	        </c:forEach>
	        
	        
	        <!-- ingredients 태그 선택시 상품 출력 -->
	        <c:forEach var="ingresup" items="${pagingingredientsupList}">
	           <div class="productItem">
	           <a href="<c:url value='/api/supplement/supplementDetail/${ingresup.supId}'/>">   <!-- 상품 상세 연결 링크 수정 -->
	           <img class="prdImg" src="data:image/png;base64,${ingresup.base64SupImg}" width="300" height="300"> </a>  <!-- 상품 이미지 출력 코드 : 클릭했을 때, 해당 상품의 supId로 넘어간다 (제품 상세페이지로 이동) -->
		        <p>${ingresup.supName}</p>
		        <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${ingresup.supPrice}"/></p>
		        <p>${ingresup.supBrand}</p>
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
	   
	   <div class="pagination">
	        <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" data-page="${currentPage - 1}"><i class="fa-solid fa-caret-left"></i></a>
	        <c:forEach var="i" begin="1" end="${totalPages}">
	            <a href="#" class="page" onclick="changePage(${i})">${i}</a>
	        </c:forEach>
	        <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" data-page="${currentPage + 1}"><i class="fa-solid fa-caret-right"></i></a>
	    </div>
	    
	</nav> 


<!--  footer -->         
<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
</div>    
</body>
</html>
