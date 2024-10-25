<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문서 작성</title>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script src="<c:url value='/js/searchZip.js'/>"></script>
		<c:import url="/WEB-INF/views/layout/head.jsp" />	
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/orderForm.css'/>">
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
        <section class="container">
        		<div class="headers">
		            <h1>주문/결제</h1>
		        </div>
        	
        	<div class="prdList">
        		<h3>주문 상품 목록</h3>
        		<table class="productList">
        			<tr>
        				<th>번호</th>
        				<th colspan="2">상품</th>
        				<th>수량</th>
        				<th>가격</th>
        			</tr>
        			<c:set var="index" value="1"/> <!--  수정사항 1 : 반복 시작 전에 인덱스 값을 초기화 -->
        			<c:forEach var="cartList" items="${cartLists}">
	        			<tr>
	        				<%-- <td>${status.index + 1}</td> 반복문 안에서 사용하게 되면, 반복문 돌때마다 초기화시켜서 1, 1, 1, 1로 출력됨 --%>
	        				<td>${index}</td>  <!--  수정사항 2 : 반복 시작 전에 인덱스 값을 초기화 -->
	        				<td class="supImg"><img class="supImg" src="data:image/png;base64,${cartList.base64SupImg}"></td>
	        				<td class="supName">${cartList.supName}
	        					<input type="hidden" name="supId" value="${cartList.supId}"></td> <!-- el표현식 작성함, supId가 서버로 전송되어야 하므로 input에 hidden 처리   -->
	        				<td>${cartList.cartQty}
	        					<input type="hidden" name="ordQty" value="${cartList.cartQty}"></td> <!-- cartQty가 서버로 전송되어야 하므로 input에 hidden 처리 -->
	        				<td><span class="price">
	        						<c:set var="amount" value="${cartList.supPrice * cartList.cartQty}"/> <!-- 추가 수정 : foreach 반복문이고, cartList에는 수량과 단가가 모두 들어가있으므로 단순 곱셈 대체 + 이 상품별 금액을 amount에 저장 -->
			               			<c:set var="sum" value="${sum + amount}"/>  <!-- sum 변수 선언하고, 반복돌면서 amount누적으로 더해진다 -> sum은 반복문 밖에서 출력할 예정 -->
			               			<fmt:formatNumber value="${amount}" pattern="#,###" />  <!-- 수정사항 : amount 그대로 출력 -->
                                  <!--<fmt:formatNumber value="${cartList.supPrice * cartList.cartQty}" pattern="#,###" /> --> 
                                </span> 원</td>
	        			</tr>
	        			<c:set var="index" value="${index + 1}"/> <!-- 수정사항 3 : 반복할 때마다 인덱스를 1 증가 -->
        			</c:forEach>
        			<tr>
        				<td colspan="4" align="right">총 금액 :</td>
        				<td><span class="price">
                              <fmt:formatNumber value="${sum}" pattern="#,###" />  <!-- 추가 수정: totalPrice에서 반복문 안쪽에서 선언한 sum으로 변경 -->
                            </span> 원</td>
        			</tr>
        		</table>
        	</div>
        	
        	<br>
        	
        	<div class="order">
        	<h3>배송 정보</h3>
        		<form method="post" action="<c:url value='/supplement/orderComplete'/>"> <!-- *****요청드릴 사항 : form태그가 장바구니 리스트까지 전부 포함하도록 - 주문목록 정보는 order_product테이블에, 배송정보(주문정보)는 orderInfo 테이블로 분리해 컨트롤러에서 처리할 예정 -->
             <div class="horizontal_box">
                <div class="box_rowContents">
                    <label>이름</label>
                    <input type="hidden" name="userId" value="${myInfo.userId}">  <!-- 수정사항 :orderInfo 로 데이터가 넘어갈 때, 주문자의 userID가 필요하므로 hidden으로 데이터 넣음 -->
                    <input type="text" name="userName" id="userName" value="${myInfo.userName}"/>
                </div>
                <p></p>
                
                <div class="box_rowContents">
                    
                        <label>전화번호</label>
                       <div class="phone-number">
                        <input type="text" name="userPh1" id="userPh1" class="userPh" placeholder="010" maxlength="3" value="${fn:split(myInfo.userPh,'-')[0]}" required/>
						<span>-</span>
						<input type="text" name="userPh2" id="userPh2" class="userPh" placeholder="1111" maxlength="4" value="${fn:split(myInfo.userPh,'-')[1]}" required/>
						<span>-</span>
						<input type="text" name="userPh3" id="userPh3" class="userPh" placeholder="1234" maxlength="4" value="${fn:split(myInfo.userPh,'-')[2]}" required/>
					</div>
                </div>
                <p></p>
                <div class="box_rowContents">
                    <label>이메일</label>
                    <input type="email" name="userEmail" id="userEmail" value="${myInfo.userEmail}"/>
                </div>
                <p></p>

                <div class="zipcode">
                    <div class="box_rowContents">
                        <label>우편번호</label>
                        <input type="text" name="userZipcode" id="userZipcode" value="${myInfo.userZipcode}" readonly/>
                        <button type="button" name="searchBtn" class="btn" onclick=searchZip()>우편번호 찾기</button><br>             
                    </div>
                    <p></p>
                    <div class="box_rowContents">
                        <label>주소</label>
                        <input type="text" name="userAddress1" id="userAddress1" value="${myInfo.userAddress1}" readonly/>
                    </div>
                    <p></p>
                    <div class="box_rowContents">
                        <label>상세 주소</label>
                        <input type="text" name="userAddress2" id="userAddress2" value="${myInfo.userAddress2}"/>
                    </div>
                </div>
                <p></p>
                <div class="box_rowContents">
                	<label>결제 방법</label>
		        	<select name="ordPay">
		        		<option value=""disabled selected>결제 방법을 선택해주세요</option>
		  		 		<option value="신용카드">신용카드</option>
		  		 		<option value="계좌이체">계좌이체</option>      		  		 		
		  		 	</select>
		  		 </div>
		  		 <p></p>
		  		 <div class="box_rowContents">
			  		 <label>배송 시 <br> 요청사항</label>
		        	 <textarea name="ordMsg" id="ordMsg" rows="5" cols="50" placeholder="배송메시지를 입력해주세요"></textarea> 
		  		 </div>
            </div>
            <button class="submit-btn" type="button" id="submitBtn">결제 완료</button>
        </form><br>
        	</div>
        	
        </section>
        	
        	 <!--  footer -->         
	        	<c:import url="/WEB-INF/views/layout/footer.jsp" />
      </div>
		
	</body>
</html>