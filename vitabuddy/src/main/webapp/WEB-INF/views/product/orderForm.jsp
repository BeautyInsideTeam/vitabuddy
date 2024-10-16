<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문서 작성</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />	
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>	
				<link rel="stylesheet" type="text/css" href="<c:url value='/css/orderForm.css'/>">
		
				
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
        	
        	<section>
        		<h3>결제</h3>
        		<form method="post" action="<c:url value='/product/orderComplete'/>">	        		
	        		
	        		<!-- 주문정보 -->
	        		<table class="orderForm">
	        			<tr><th>이름</th></tr>
	        						<tr><td><input type="text" name="ordReceiver" value="${mem.userName}"></td></tr>
	        					<tr><th>이메일</th></tr>
        						<tr><td><input type="email" name="email" value="${mem.userEmail}"></tr>
	        							
	        					<tr><th>연락처</th></tr>
	        						<tr><td>
	        							<input type="text" name="hp" value="${mem.userPh}">
	        						</tr>
	        			<tr><th>배송지 주소</th></tr>
	        					<tr><td>
			        				<div class="zipcodeContainer">
									    <input type="text" id="ordRcvZipcode" name="ordRcvZipcode" size="5" value="${mem.userZipcode}" readonly>
									    <input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기" class="btn btnFilled">
									</div>

				            		<input type="text" id="ordRcvAddress1" name="ordRcvAddress1" placeholder="주소 입력" size="70" 
				            		             value="${mem.userAddress1}" readonly> <br>
				            		<input type="text" id="ordRcvAddress2" name="ordRcvAddress2" placeholder="상세 주소 입력" size="70"
				            		             value="${mem.userAddress2}" >
	        					</td></tr>
	        					
	        					<tr><th>결제 방법</th></tr>
	        					<tr><td><select name="ordPay">
	        		  		 		<option value="신용카드">신용카드</option>
	        		  		 		<option value="계좌이체">계좌이체</option>      		  		 		
	        		  		 		</select></td></tr>
	        							 
	        							 
	        		  <tr><th>배송 시 요청사항</th></tr>
	        		  		 <tr><td>
	        		  		 		<textarea name="ordMsg" id="ordMsg" rows="5" cols="50">배송메시지</textarea>     		  		 		
	        		  		 </td></tr>
	        		</table><br>
	        	
	        	
	        		<input type="submit" value="주문완료" class="btn btnUnfilled">
        		</form><br>
        	</section>
        	
        	 <!--  footer -->         
	        	<c:import url="/WEB-INF/views/layout/footer.jsp" />
      </div>
		
	</body>
</html>