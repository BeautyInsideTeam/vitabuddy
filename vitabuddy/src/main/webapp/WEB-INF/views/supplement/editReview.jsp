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
<!-- 리뷰작성 -->
		<div class="reviewWrite">
			<form method="post" id="reviewForm" enctype="multipart/form-data"
				action="/supplement/supplementDetail/${sup.supId}/review">
				<input type="hidden" name="reviewNo" value="${review.reviewNo}">
				<input type="hidden" name="userId" value="${sessionScope.sid}">
				<input type="hidden" name="supId" value="${sup.supId}">
				<!-- 리뷰 제목 -->
				<label>리뷰제목</label> <br> <input class="reviewTitle" type="text"
					name="reviewTitle" value="${review.reviewTitle}"> <br>

				<!-- 별점 -->
				<div class="rating">
					<label class="ratingLabel" for="star1"> <input type="radio"
						id="star1" class="ratingInput" name="rating" value="1"
						${review.rating == 1 ? 'checked' : ''}> <span
						class="starIcon" data-value="1"><i
							class="fa-regular fa-star"></i></span>
					</label> <label class="ratingLabel" for="star2"> <input
						type="radio" id="star2" class="ratingInput" name="rating"
						value="2" ${review.rating == 2 ? 'checked' : ''}> <span
						class="starIcon" data-value="2"><i
							class="fa-regular fa-star"></i></span>
					</label> <label class="ratingLabel" for="star3"> <input
						type="radio" id="star3" class="ratingInput" name="rating"
						value="3" ${review.rating == 3 ? 'checked' : ''}> <span
						class="starIcon" data-value="3"><i
							class="fa-regular fa-star"></i></span>
					</label> <label class="ratingLabel" for="star4"> <input
						type="radio" id="star4" class="ratingInput" name="rating"
						value="4" ${review.rating == 4 ? 'checked' : ''}> <span
						class="starIcon" data-value="4"><i
							class="fa-regular fa-star"></i></span>
					</label> <label class="ratingLabel" for="star5"> <input
						type="radio" id="star5" class="ratingInput" name="rating"
						value="5" ${review.rating == 5 ? 'checked' : ''}> <span
						class="starIcon" data-value="5"><i
							class="fa-regular fa-star"></i></span>
					</label>
				</div>

				<br>

				<table class="option">
					<tr>
						<td></td>
						<td></td>
						<td><label for="date">복용기간</label></td>
					</tr>

					<!-- 해시태그 -->
					<tr>
						<td><select id="hashtag" name="reviewHashtag">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<c:forEach var="tag" items="${taglist}">
									<option value="${tag.tagNo}">${tag.tagName}</option>
								</c:forEach>
						</select></td>

						<!-- 복용기간 설정 -->
						<td><input type="date" id="date1" name="startDate"
							value="${review.startDate}" max="2100-12-31" min="2000-01-01">
							~</td>
						<td><input type="date" id="date2" name="endDate"
							value="${review.endDate}" max="2100-12-31" min="2000-01-01">
						</td>
					</tr>
				</table>
				
				<!-- 리뷰 내용 -->
				<br>
				<textarea class="reviewTxt" name="content" cols="150" rows="5">${review.content}</textarea>
				<br>
				<!-- 사진 첨부 -->
				<input class="Upload" type="file" id="uploadFile" name="reviewImg" multiple>

				<br>

				<!-- submit -->
				<input type="submit" value="작성하기" class="btn btnFilled">
			</form>
		</div>
</body>
</html>