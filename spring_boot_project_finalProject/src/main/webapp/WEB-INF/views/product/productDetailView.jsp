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
		<script src="<c:url value='/js/productDetail.js'/>"></script>
		<%-- <script src="<c:url value='/js/page.js'/>"></script> --%>
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
			<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
			
			<h3>상품 상세 조회</h3>
			<br><br>
			
			${prd.prdName}
			${prd.prdRate} 
			
			<a href="<c:url value='/product/addWish/${prd.prdNo}'/>">찜목록 추가</a>
			<a href="<c:url value='/product/addCart/${prd.prdNo}'/>">장바구니 추가</a>
			
			<form method="post" action="<c:url value='/product/insertCart'/>"> 
			<input type="hidden" name="prdNo" value="${prd.prdNo}">${prd.prdNo}
			
			
			
				<table border="1" width="900">
					<tr><td>가격  </td>
						<!-- js에서 아래 span 태그를 활용해서 직접 prdPrice 값(첝단위 구분자가 없는)을 추출할 수 있음 -->
							<td><span id="price" data-price="${prd.prdPrice}">
									<fmt:formatNumber value="${prd.prdPrice}" pattern="#,###" /></span> 원</td></tr>
						<tr><td>브랜드 </td><td> ${prd.prdCompany}</td></tr>
				</table>
				
				<img src=" " width=" " height=" ">
			</form>	
				
				<br>
				
				<!-- 상품 상세 정보 -->
				<div>
						<h3>상품설명</h3>
						<p>${prd.prdDetail}</p>
				</div>
				<div>
						<h3>복용법</h3>
						<p>${prd.prdDosage}</p>
				</div>
				<div>
						<h3>주의사항</h3>
						<p>${prd.prdPrecaution}</p>
				</div>
				<div>
						<h3>영양정보</h3>
						<p>${prd.prdNutriInfo}</p>
				</div>
				
				
				<!-- 리뷰작성 -->
				<form action="/product/reviewWrite" method="post">
        		
		       		<!-- 리뷰 제목 -->
		       		<p>리뷰제목</p>
		       		<input type="text">
		       		<!-- 리뷰 내용 -->
		       		<textarea name="opinion" cols="50" rows="5"></textarea><br>
		       		<!-- 사진 첨부 -->
		       		<input type="file" id="uploadFile" name="uploadFile">
		       		<!-- 별점 -->
					    <label class="ratingLabel" for="star1">
					        <input type="radio" id="star1" class="ratingInput" name="rating" value="1">
					        <span class="star-icon"></span>
					    </label>
					    
					    <label class="ratingLabel" for="star2">
					        <input type="radio" id="star2" class="ratingInput" name="rating" value="2">
					        <span class="star-icon"></span>
					    </label>
					    
					    <label class="ratingLabel" for="star3">
					        <input type="radio" id="star3" class="ratingInput" name="rating" value="3">
					        <span class="star-icon"></span>
					    </label>
					    
					    <label class="ratingLabel" for="star4">
					        <input type="radio" id="star4" class="ratingInput" name="rating" value="4">
					        <span class="star-icon"></span>
					    </label>
					    
					    <label class="ratingLabel" for="star5">
					        <input type="radio" id="star5" class="ratingInput" name="rating" value="5">
					        <span class="star-icon"></span>
					    </label>

	        		<!-- submit -->
	        			<input type="submit" value="작성완료">
        		</form>
        		
        		<!-- 리뷰목록 -->
        		<div class="review">
				    <c:forEach var="review" items="${reviewList}">
				        <div class="productItem">
				        <h3>${review.userName}</h3>
				        <p>리뷰 내용</p>
				        <p>${review.opinion}</p>
				            <p>${review.rating}</p>
				            <a href="#" class="btn">신고하기</a>
				        </div>
				    </c:forEach>
				</div>
				
				<!-- 페이지네이션 -->
				<div>
					<nav aria-label="PageNavigation">
					  <ul class="pagination">
					    <li class="page-item"><a class="page-link" href="?page=1">1</a></li>
					    <li class="page-item"><a class="page-link" href="?page=2">2</a></li>
					    <li class="page-item"><a class="page-link" href="?page=3">3</a></li>
			
					  </ul>
					</nav>
				</div>	
				
				
			 <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
    
		</div>
	</body>
</html>
