<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8"> 
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="common.css" >
<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
</head>
<body>

<c:import url="/WEB-INF/views/layout/top.jsp" />
<div id="wrap">
<h1>마이페이지</h1>
<div class="container" >
	<form>
	<div class = "right">
		 <label>이름</label>
         <input type="text">
		 <label>복용 중인 영양제</label>
         <input type="text">
		 <label>올바른 영양제 복용법</label>
		 <textarea></textarea>	
	</div>
	<div class = "left">
 	<div class="review-section">
 	내가 작성한 리뷰 목록
			<select>
				<option>정렬 기준</option>
				<option>최신순</option>
				<option>오래된 순</option>
				<option>조회수 순</option>
				<option>추천 순</option>
				<option>댓글 순</option>
			</select>
		<table id="reviewList">
		<thead>
		<tr width="100%">
			<th width = "10%">번호</th>
			<th width = "50%">제목</th>
			<th width = "15%">작성자</th>
			<th width = "15%">추천 수</th>
			<th width = "10%">작성일</th>
		</tr>
		</thead>
		<tbody>
			<tr>
			</tr>
		</tbody>
	</table>
		<div align ="center">
			작성하신 리뷰가 없습니다.
			</div>
</div>
<div class="purchase-section">
	구매 내역<select>
		<option>현재 주문 처리 상태</option>
		<option>입금 전</option>
		<option>배송 준비 중</option>
		<option>배송 중</option>
		<option>배송 완료</option>
		<option>취소</option>
		<option>반품</option>
		<option>환불</option>
		</select>
		
		<table id="productInfo">
			<thead>
				<tr width="100%">
					<th width="20%">주문일자</th>
					<th>이미지</th>
					<th width="50%">상품정보</th>
					<th>수량</th>
					<th>금액</th>
					<th>주문 처리</th>
				</tr>
			</thead>
			<tbody>
				<tr>
				</tr>
			</tbody>
		</table>
		<div align ="center">
			주문 내역이 없습니다.
			</div>
		</div>
	</form>
</div>

 <button class="submit-btn" href='infoChange.jsp'">회원 정보 수정</button>
<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
</body>
</html>