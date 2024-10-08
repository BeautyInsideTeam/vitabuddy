<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="DYcommon.css" >
<link rel="stylesheet" href="DYheader.css" >
<meta charset="UTF-8">
<title>마이페이지</title>
</head>
<body>
	<%@ include file="DYtop.jsp" %><!-- 탑 경로  및 명령어 수정 -->
	<section id="wrap">
		<div class="container">
			<div class="headers">
					<h1>마이페이지</h1>
			</div>
			<div class="horizontal_box">
				<form>
					<label>이름</label>
			        <input type="text" value=" ${getMember.getUserName() }" class="name" readonly />
					<label>복용 중인 영양제</label>
			        <textarea textarea rows="10%" cols="100%" value="${getMember.getUserTabletList()}"  readonly></textarea>
					<label>올바른 영양제 복용법</label>
					<textarea textarea rows="10%" cols="100%"readonly></textarea>	
				</form>
			</div>
			<button class="submit-btn" onclick="location.href='infoChange.jsp'">정보 수정하기 </button>
			<div>
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
					<tr>
						<th>번호</th>
						<th class="important" >제목</th>
						<th >작성자</th>
						<th >추천 수</th>
						<th>작성일</th>
					</tr>
					</thead>
						<tbody>
							<tr>
							</tr>
						</tbody>
					</table>
						<div align ="center" class="board">
							작성하신 리뷰가 없습니다.
						</div>
				</div>
				<div class="purchase-section" >
					구매 내역
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
						<table width="100%" id="productInfo">
							<thead>
								<tr >
									<th >주문일자</th>
									<th>이미지</th>
									<th width: 45%;>상품정보</th>
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
						<div align ="center" class="board">
							주문 내역이 없습니다.
						</div>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="footer.jsp" %><!-- 푸터 삽입 -->
</body>
</html>