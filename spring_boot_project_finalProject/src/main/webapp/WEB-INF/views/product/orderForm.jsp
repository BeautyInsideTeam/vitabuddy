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
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>		
		<c:import url="/WEB-INF/views/layout/head.jsp" />
				
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
        	
        	<section>
        		<h3>결제</h3>
        		<form method="post" action="<c:url value='/product/orderComplete'/>">	        		
	        		
	        		<!-- 주문정보 -->
	        		<table border="1">
	        			<tr><th>이름</th>
	        						<td width="200"><input type="text" name="ordReceiver" value="${mem.memName}"></td></tr>
	        					<tr><th>이메일</th>
        						<td>
        							<input type="email" name="email" value="${mem.memEmail}"> 
        							</tr>
	        							
	        					<tr><th>연락처</th>
	        						<td>
	        							<input type="text" name="hp" value="${mem.memHp}">
	        						</tr>
	        			<tr><th>배송지 주소</th>
	        					<td colspan="3">
			        				<input type="text" id="ordRcvZipcode" name="ordRcvZipcode" size="5" 
			        								value="${mem.memZipcode}" readonly>
				            		<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
				            		<input type="text" id="ordRcvAddress1" name="ordRcvAddress1" placeholder="주소 입력" size="70" 
				            		             value="${mem.memAddress1}" readonly> <br>
				            		<input type="text" id="ordRcvAddress2" name="ordRcvAddress2" placeholder="상세 주소 입력" size="70"
				            		             value="${mem.memAddress2}" >
	        					</td></tr>
	        					
	        					<tr><th>결제 방법</th>
	        					<td colspan="2"><select name="ordPay">
	        		  		 		<option value="신용카드">신용카드</option>
	        		  		 		<option value="계좌이체">계좌이체</option>      		  		 		
	        		  		 		</select></td></tr>
	        							 
	        							 
	        		  <tr><th>배송 시 요청사항</th>
	        		  		 <td>
	        		  		 		<textarea name="ordMsg" id="ordMsg" rows="100" cols="5">배송메시지</textarea>     		  		 		
	        		  		 </td></tr>
	        		</table><br>
	        	
	        	
	        		<input type="submit" value="주문완료">
        		</form><br>
        	</section>
        	
        	 <!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>
		
	</body>
</html>