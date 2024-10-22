<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/home.css'/>">
	<c:import url="/WEB-INF/views/layout/head.jsp" />	 
</head>
<body>
<div id="wrap">
<c:import url="/WEB-INF/views/layout/top.jsp" />
	
	
	<h1>VITA BUDDY</h1>
	
	<!-- 검색창 -->
	<div class="search">
		<form class="searchBox" id="searchForm" method="get">
			<input type="text" name="keyword" id="keyword" class="searchTxt" placeholder="Search">
			<button type="submit" class="searchBtn">  <!--돋보기 아이콘  -->
			<i class="fa-solid fa-magnifying-glass"></i>
			</button>
		</form>
	
	</div>
					<br>
<section class="home">
	<!-- 메인메뉴 -->
	<div class="mainMenu">
	
	<!-- 로그인 하지 않은 경우 -->
		<c:if test="${empty sessionScope.sid }">
		<!-- 상점 -->
		<a href="<c:url value='/supplement/supplementList'/>"><img src="<c:url value='/image/prdList.png'/>" class="menuImg"><br>상점</a>
		
		</c:if>
	
	<!-- 로그인 한 경우 -->
					<c:if test="${not empty sessionScope.sid }">
		<!-- 상점 -->
		<a href="<c:url value='/supplement/supplementList'/>"><img src="<c:url value='/image/prdList.png'/>" class="menuImg"><br>상점</a>
		
		<!-- 마이페이지 -->
		<a href="<c:url value='/member/myPage'/>"><img src="<c:url value='/image/myPage.png'/>" class="menuImg"><br>마이페이지</a>
	</c:if>
	</div>
</section>	
<br><br>
<section class="home">
	<h2>인기상품</h2>
	<h3>브랜드별 인기상품</h3>
	
	<div class="bestItems">
	    
	    	<!-- 전체 상품  출력 -->  
	    	<c:forEach var="sup" items="${brandBestItem}">
	           <div class="bestItem">
	           <a href="<c:url value='/api/supplement/supplementDetail/${sup.supId}'/>">
	           <img class="prdImg" src="data:image/png;base64,${sup.base64SupImg}" width="200" height="200"> </a>
		        <p>${sup.supName}</p>
		        <p>${sup.supBrand}</p>
		        <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sup.supPrice}"/></p>  <!-- 한국 통화 표시 -->
	           </div>
	        </c:forEach>

</section>

<c:import url="/WEB-INF/views/layout/footer.jsp" />

</div>
</body>
</html>