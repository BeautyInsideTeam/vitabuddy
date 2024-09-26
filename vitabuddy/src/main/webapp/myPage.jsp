<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
<head>
<meta charset="UTF-8"> 
<title>마이페이지</title>
<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
</head>
<body>

<c:import url="/WEB-INF/views/layout/top.jsp" />
<div id="wrap">
<h2>MYPAGE</h2>
<div id="container" class style = "min-height:465px;">
	<div id="contArea">
		<div class="form-group">
			<label for="nockname"><strong>닉네임</strong></label><br>
			&nbsp;&nbsp;&nbsp; 
		</div>
		<div class="form-group">
			<label for="id"><strong>복용 중인 영양제</strong></label><br>
			&nbsp;&nbsp;&nbsp;
		</div>
		<div class="form-group">
			<label for="id"><strong>올바른 영양제 복용법</strong></label><br>
			&nbsp;&nbsp;&nbsp;	
		</div>
	</div>

<div id="changePage">
<a href="infoChage.jsp"><h3>회원 정보 수정</h3></a>
</div>
<div id="reviewList">
	<details>
	<summary>내가 쓴 리뷰</summary>
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
		<tr>
			<th>번호</th>
			<th style="width: 500px;">제목</th>
			<th>작성자</th>
			<th>추천 수</th>
			<th>작성일</th>
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
	</details>
</div>
<div id="orderList">
		<details>
	<summary>구매내역</summary>
	<select>
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
				<tr>
					<th>주문일자[주문번호]</th>
					<th>이미지</th>
					<th style="width: 500px;">상품정보</th>
					<th>수량</th>
					<th>상품 구매 금액</th>
					<th>주문 처리 상태</th>
					<th>취소/교환/반품</th>
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
		</details>
</div>
</div>
<footer>

</footer>
</body>
</html>