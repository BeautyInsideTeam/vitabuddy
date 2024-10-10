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
		<!-- css 링크 수정 --><link rel="stylesheet" type="text/css" href="<c:url value='/css/supplementDetail.css'/>">
		<c:import url="/WEB-INF/views/layout/head.jsp" />
	</head>
	<body>
		<div id="wrap">
		<c:import url="/WEB-INF/views/layout/top.jsp" />

				<!-- 리뷰작성 -->
				<div class="reviewWrite">
				<form method="post" id="reviewForm">
        			<input type="hidden" name="userId" value="${sessionScope.sid}">
        			<input type="hidden" name="supplementId" value="${sup.supplementId}">
		       		<!-- 리뷰 제목 -->
		       		<label>리뷰제목</label>
		       		<br>
		       		<input class="reviewTitle" type="text" name="title">
		       		<br>
		       		<!-- 별점 -->
		       		<div class="rating">
					    <label class="ratingLabel" for="star1">
					        <input type="radio" id="star1" class="ratingInput" name="rating" value="1">
					        <span class="starIcon" data-value="1"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star2">
					        <input type="radio" id="star2" class="ratingInput" name="rating" value="2">
					        <span class="starIcon" data-value="2"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star3">
					        <input type="radio" id="star3" class="ratingInput" name="rating" value="3">
					        <span class="starIcon" data-value="3"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star4">
					        <input type="radio" id="star4" class="ratingInput" name="rating" value="4">
					        <span class="starIcon" data-value="4"><i class="fa-regular fa-star"></i></span>
					    </label>
					    
					    <label class="ratingLabel" for="star5">
					        <input type="radio" id="star5" class="ratingInput" name="rating" value="5">
					        <span class="starIcon" data-value="5"><i class="fa-regular fa-star"></i></span>
					    </label>
					</div>    
					<br>
					
					<table class="option">
					<tr><td></td><td></td><td><label for="date">복용기간</label></td></tr>
						
					<!-- 해시태그 -->
						<tr><td><select id="hashtag" name="tagSelected">
						<option value="1" >1</option>
						<option value="2" >2</option>
						<option value="3" >3</option>
							<%-- <c:forEach var="tag" items="${taglist}">
							    <option value="${tag.tagNo}" ${tag.tag == tag.tagNo ? 'selected' : ''}>${tag.tagName}</option>
							</c:forEach> --%>
						</select></td>
						
						<td>
						<input type="date"
						        id="date1"
						        max="2100-12-31"
						        min="2000-01-01"> ~ </td>
						<td><input type="date"
						        id="date2"
						        max="2100-12-31"
						        min="2000-01-01"></td></tr>
					</table>
				
		       		<!-- 리뷰 내용 -->
		       		<br>
		       		<textarea class="reviewTxt" name="content" cols="150" rows="5"></textarea><br>
		       		<!-- 사진 첨부 -->
		       		<input class="Upload" type="file" id="uploadFile" name="imageUrl">
		       		
					    <br>

	        		<!-- submit -->
	        			<input type="submit" value="작성하기" class="btn btnFilled">
        		</form>
        		</div>
        		
        		<!-- 리뷰목록 -->
        		<div class="reviews">
        			<c:forEach var="review" items="${reviewList}">
				        <table class="reviewItem">
						    <tr><td><h3>${review.reviewTitle}</h3></td><td></td><td></td><td></td></tr>
						    <tr><td><p>${review.userName}</p></td><td><div class="hashTag">${review.reviewTag}</div></td><td></td><td><c:if test="${review.userName == sessionScope.sid}">
										                <a href="#" class="deleteReview" data-review-id="${review.userName}">리뷰삭제</a>
										            </c:if></td></tr>
						    <tr><td><p>리뷰 내용</p></td><td><div class="rate"><c:forEach var="i" begin="1" end="5">
							            <i class="${i <= review.rating ? 'fa-solid fa-star' : 'fa-regular fa-star'}"></i>
							        </c:forEach></div></td><td></td><td rowspan="2"><img class="reviewImg" src="/image/review.png" width="100" height="100"></td></tr>
							<tr><td colspan="3" class="content"><p>${review.content}</p></td></tr>
							<tr><td></td><td></td><td></td><td><a href="#" class="btn btnUnfilled">신고하기</a></td></tr>
						</table>
				    </c:forEach>
			    
				    	<nav>
							<!-- 페이지네이션 -->
								<div class="pagination">
								    <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" data-page="${currentPage - 1}""><i class="fa-solid fa-caret-left"></i></a>
								    <c:forEach var="i" begin="1" end="${totalPages}">
								        <a href="#" class="page" onclick="changePage(${i})">${i}</a>
								    </c:forEach>
								    <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" data-page="${currentPage + 1}"><i class="fa-solid fa-caret-right"></i></a>
								</div>
						</nav>
				
				</div>
				
				
			 <!--  footer -->         
	         <c:import url="/WEB-INF/views/layout/footer.jsp" /> 
    
		</div>
	</body>
</html>
