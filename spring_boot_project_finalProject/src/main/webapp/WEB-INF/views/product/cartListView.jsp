<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />		   	      
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
		<section>		
		<div class="cart-container">
		    <h1>장바구니</h1>
		    
		    <form method="post" action="<c:url value='/product/orderForm'/>">
		    	<c:forEach var="prd" items="${cartList}">
				<table>
					<tr><td></td><td></td><td></td>
					<td><form method="post" action="<c:url value='/product/deleteCartItem'/>">
					    <input type="hidden" name="prdNo" value="${prd.prdNo}">
					    <button type="submit" value="삭제"><i class="fa-solid fa-trash"></i></button>
					</form></td></tr>
			            <tr>
			               <td colspan="2"><img src="<c:url value=' ' />" width="30" height="20"></td>			              
			               <td>${prd.prdName}</td><td>
			               		<span class="price" data-price=${prd.prdPrice }>
			               			<fmt:formatNumber value="${prd.prdPrice }" pattern="#,###" />
			               		</span> 원</td>
			               <td>수량</td></tr>
			               <tr><td>${prd.prdCompany}</td>
			               <td>
			               	<select id="quantity" name="quantity">
							    <option value="1" ${cart.cartQuantity == 1 ? 'selected' : ''}>1</option>
							    <option value="2" ${cart.cartQuantity == 2 ? 'selected' : ''}>2</option>
							    <option value="3" ${cart.cartQuantity == 3 ? 'selected' : ''}>3</option>
							    <option value="4" ${cart.cartQuantity == 4 ? 'selected' : ''}>4</option>
							    <option value="5" ${cart.cartQuantity == 5 ? 'selected' : ''}>5</option>
							</select>
			               </td></tr>
				</table>
				 </c:forEach>
				
				<hr>
				
				주문 내역
				상품 총액:<span id="total">
			         				<!--총 구매예정금액 표시-->
			         				<fmt:formatNumber value="${sum}" pattern="#,###"/></span> 원</td>
		    
		
		    <!-- 결제하기 버튼 -->
		    <input type="submit" value="결제하기">
			</form>
		</div>
			</section> 
			
			<!--  bottom -->         
	        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
	      </div>
	</body>
</html>