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
    <link rel="stylesheet" type="text/css" href="<c:url value='/css/cartList.css'/>">
    <script src="<c:url value='/js/ordPrice.js' />"></script>
    <script src="<c:url value='/js/deleteCart.js' />"></script>    
</head>
<body>
    <div id="wrap">
        <!-- top -->
        <c:import url="/WEB-INF/views/layout/top.jsp" />
        <section>        
            <div class="cartContainer">
                <h1>장바구니</h1>
                <!-- 결제하기 누르면 바로 주문정보 창 -->
                <form method="post" action="<c:url value='/supplement/orderForm'/>">
                    <table class="cartItems">
                        <thead>
                            <tr>
                                <th class="cartNo">번호</th>
                                <th colspan="2">상품 정보</th>
                                <th class="supPrice">가격</th>
                                <th class="ordPrice" colspan="2">주문금액</th>
                            </tr>
                        </thead>
                        
                    	<c:choose>
                    	<!-- 장바구니가 빈 경우 -->
                            <c:when test="${empty cart}">
                                <tbody>
                                    <tr><td colspan="6">장바구니가 비어있습니다.</td></tr>
                                </tbody>
                            </c:when>
                            <c:otherwise>
                            <!-- 장바구니에 상품이 있을 경우 -->
                                <c:forEach var="cartList" items="${cart}" varStatus="status">
                                    <tbody>
                                        <tr>
                                            <td rowspan="3">${status.index + 1}</td>
                                            <td rowspan="3" class="tableImg">
                                                <a href="<c:url value='/api/supplement/supplementDetail/${sup.supId}'/>">
                                                    <img class="supImg" src="data:image/png;base64,${supImgBase64}">
                                                </a>
                                            </td>              
                                            <td class="supDetail">${sup.supName}</td>
                                            <td>
                                                <span class="price" data-price="${cart.supPrice}">
                                                    <fmt:formatNumber value="${cart.supPrice}" pattern="#,###" />
                                                </span> 원
                                            </td>
                                            <td>수량 : 
                                                <input type="button" class="minusBtn" value="-"> 
												<input type="text" class="cartQty" name="cartQty" value="1"  size="1" readonly> 
												<input type="button" class="plusBtn" value="+">
                                            </td>
                                            <td rowspan="3" class="deleteBtn">
                                                <input type="hidden" name="supId" value="${cart.supId}">
                                                <button class="deleteCartBtn" type="button" data-sup-id="${cart.supId}" value="삭제">
                                                    <i class="fa-solid fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="supDetail">${cart.supBrand}</td><td></td><td></td>
                                        </tr>
                                        <tr>
                                            <td></td><td></td>
                                            <td><span class="amount"><fmt:formatNumber value="${cart.supPrice}" pattern="#,###" /></span> 원</td>
                                        </tr>
                                    </tbody>
                                  </c:forEach>
                            </c:otherwise>
                        </c:choose>
                    </table>
                    
                    <!-- 총액 표시 및 결제 버튼 -->
                    <div class="totalResult">
                        주문 내역
                        <br>
                        상품 총액: <span id="total">
                            <!-- 총 구매 예정 금액 표시 -->
                            <fmt:formatNumber value="${sum}" pattern="#,###"/></span> 원
                        <br>
                        <!-- 결제하기 버튼 -->
                        <input type="submit" value="결제하기" class="btn btnFilled">
                    </div>
                </form> 
            </div>
        </section>
        
        <!-- footer -->
        <c:import url="/WEB-INF/views/layout/footer.jsp" />
    </div>
</body>
</html>
