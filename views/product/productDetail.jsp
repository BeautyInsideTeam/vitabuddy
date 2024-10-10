<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 상세 조회</title>
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="<c:url value='/js/rating.js'/>"></script>
		<!-- css 링크 수정 --><link rel="stylesheet" type="text/css" href="<c:url value='/css/productDetailView.css'/>">
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
			<!--  top -->         
		
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
			
			<div class="prdProfile">

			<br><br>
			<table>
			<tr><td><h2>
			${sup.supName}</h2></td><td></td><td rowspan="5"><img class="prdImg" src="/image/prd01.png" width="300" height="300"></td></tr>
			<!-- 별점 -->
			<tr><td>
			<%-- <div class="rating">
			<c:forEach var="i" begin="1" end="5">
	            <i class="${i <= sup.rating ? 'fa-solid fa-star' : 'fa-regular fa-star'}"></i>
	        </c:forEach>
	        </div> --%></td><td></td><td></td></tr>
	        
	        <tr><td>
			<%-- <div class="hashTag">
			${sup.supTag} --%>
        	</div></td><td></td><td></td></tr>
			<tr><td>
			<a href="#" id="addWish" data-prd-id="${sup.supplementNo}">찜목록 추가</a></td>
			<td><a href="#" id="addCart" data-prd-id="${sup.supplementNo}">장바구니 추가</a></td><td></td></tr>
					<tr><td>가격  </td>
							<td><span id="price" data-price="${sup.supplementPrice}">
									<fmt:formatNumber value="${sup.supplementPrice}" pattern="#,###" /></span> 원</td><td></td></tr>
						<tr><td>브랜드</td><td>${sup.supplementCompany}</td><td></td></tr>
				</table>

			</div>
				
				<br>
				
				<!-- 상품 상세 정보 -->
				<div class="prdInfo">
				<h2>상품 상세 정보</h2>
					<div>
							<h3>상품설명</h3>
							<p>${sup.supplementDetail}</p>
					</div>
					<div>
							<h3>복용법</h3>
							<p>${sup.supplementDosage}</p>
					</div>
					<div>
							<h3>주의사항</h3>
							<p>${sup.supplementPrecaution}</p>
					</div>
					<div>
							<h3>영양정보</h3>
							<p>${sup.supplementNutriInfo}</p>
					</div>
				</div>
				
			
			 <!--  footer -->         
	         <c:import url="/WEB-INF/views/layout/footer.jsp" /> 
    
		</div>
	</body>
</html>
