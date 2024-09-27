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
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/review.css'/>">
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
			<!--  top -->         
			
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
			
			<div class="prdProfile">
			<h3>상품 상세 조회</h3>
			<br><br>
			
			${prd.prdName}
			<!-- 별점 -->
			<div class="rating">
			<c:forEach var="i" begin="1" end="5">
	            <i class="${i <= product.rating ? fa-solid fa-star : fa-regular fa-star}"></i>
	        </c:forEach>
	        </div>
	        
	        <div class="hashTag">
        		${prd.reviewTag}
        	</div>
			
			<a href="<c:url value='/product/addWish'/>" id="addWish" data-prd-id="${prd.prdNo}">찜목록 추가</a>
			<a href="<c:url value='/product/addCart'/>" id="addCart" data-prd-id="${prd.prdNo}">장바구니 추가</a>
			
			<form method="post" action="<c:url value='/product/insertCart'/>"> 
			<input type="hidden" name="prdNo" value="${prd.prdNo}">${prd.prdNo}
			
			
			
				<table width="900">
					<tr><td>가격  </td>
							<td><span id="price" data-price="${prd.prdPrice}">
									<fmt:formatNumber value="${prd.prdPrice}" pattern="#,###" /></span> 원</td></tr>
						<tr><td>브랜드 </td><td> ${prd.prdCompany}</td></tr>
				</table>
				
				<img class="prdImg" src=" " width=" " height=" ">
			</form>	
			</div>
				
				<br>
				
				<!-- 상품 상세 정보 -->
				<div class="prdInfo">
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
				</div>
				
				
				<!-- 리뷰작성 -->
				<div class="reviewWrite">
				<form action="/product/reviewWrite" method="post" class="reviewForm">
        		
		       		<!-- 리뷰 제목 -->
		       		<label>리뷰제목</label>
		       		<br>
		       		<input class="reviewTitle" type="text">
		       		<br>
		       		<!-- 별점 -->
		       		<div class="ratings">
					    <label class="ratingLabel" for="star1">
					        <input type="radio" id="star1" class="ratingInput" name="rating" value="1">
					        <span class="star-icon"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star2">
					        <input type="radio" id="star2" class="ratingInput" name="rating" value="2">
					        <span class="star-icon"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star3">
					        <input type="radio" id="star3" class="ratingInput" name="rating" value="3">
					        <span class="star-icon"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star4">
					        <input type="radio" id="star4" class="ratingInput" name="rating" value="4">
					        <span class="star-icon"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star5">
					        <input type="radio" id="star5" class="ratingInput" name="rating" value="5">
					        <span class="star-icon"><i class="fa-regular fa-star"></i></span>
					    </label>
					</div>    
					<br>
					
					<!-- 해시태그 -->
						<select id="hashtag" name="quantity">
						<c:forEach var="tags" items="${taglist}">
						    <option value="${tag.tagNo}" ${tag.tag == tag.tagNo ? 'selected' : ''}>a</option>
						</c:forEach>
						</select>
				
		       		<!-- 리뷰 내용 -->
		       		<br>
		       		<textarea class="reviewTxt" name="opinion" cols="150" rows="5"></textarea><br>
		       		<!-- 사진 첨부 -->
		       		<input class="Upload" type="file" id="uploadFile" name="uploadFile">
		       		
					    <br>

	        		<!-- submit -->
	        			<input type="submit" value="작성완료">
        		</form>
        		</div>
        		
        		<!-- 리뷰목록 -->
        		<div class="reviews">
				    <c:forEach var="review" items="${reviewList}">
				        <div class="reviewItem">
				        <h3>${review.userName}</h3>
				        <p>${review.reviewDate}</p>
				        	<div class="hashTag">
				        		${review.reviewTag}
				        	</div>
				        <p>리뷰 내용</p>
				        <p>${review.content}</p>
				            <p>${review.rating}</p>
				            <a href="#" class="btn">신고하기</a>
				        </div>
				    </c:forEach>
				    
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
				
				</div>
				
				
			 <!--  footer -->         
	        <c:import url="/WEB-INF/views/layout/footer.jsp" />
    
		</div>
	</body>
</html>
