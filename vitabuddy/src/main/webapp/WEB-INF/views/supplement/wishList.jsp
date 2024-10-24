<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>찜 목록</title>
 		<c:import url="/WEB-INF/views/layout/head.jsp" />	
 		 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/wishList.css'/>">
	</head>
	<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" /> 
		<section id="wrap">        		
			<div class="container">
		    <h1>찜 목록</h1>
		   	    <div class="supplementList">
		   	    	<table class="wishList">
		   	    		<colgroup> 
			   	    		
			   	    		<col width="50">
			   	    		<col width="170">
			   	    		<col width="*">
			   	    		<col width="143">
		   	    		</colgroup>	
		   	    			<tbody class="listBody">
			   	    		<c:choose>
			   	    			<%-- 장바구니가 있는 경우  --%> 
			   	    			 <c:when test="${not empty wishList}">
			   	    			<c:forEach var="wishList" items="${wishList}" varStatus="status">
				   	    			tr class="wishItem">
				   	    				<td>
				   	    					
				   	    				</td>
				   	    				<td class="itemImage">
				   	    					<a href="<c:url value='/api/supplement/supplementDetail/${cartList.supId}'/>">
				   	    						<img class="supImg" src="data:image/png;base64,${supImgBase64}" width="150" height="150">
				   	    					</a>
				   	    				</td>
				   	    				<td class="supDetail">
				   	    					 <p>${sup.supName} 테스트 상품명</p>
				   	    					 <p>${sup.supBrand} 예시 브랜드 이름 </p>
				   	    					 <p><fmt:formatNumber value="${sup.supPrice}" pattern="#,###" /> 얼추 가격</p>
				   	    				</td>
				   	    				<td	class="status">
				   	    					<div class="plusCartBtn" type="button" data-sup-id="${wishList.supId}" data-wish-id="${wishList.wishId}" data-user-id="${sessionScope.sid}" >
												    <i class="fa-solid fa-cart-plus" value="장바구니에 담기"></i>
											</div>
											<p></p>
				   	    					<div class="deleteCartBtn" type="button" data-sup-id="${wishList.supId}" data-wish-id="${wishList.wishId}" data-user-id="${sessionScope.sid}" >
												    <i class="fa-solid fa-trash" value="찜 목록에서 삭제하기"></i>
											</div>
				   	    				</td>
				   	    			</tr>
				   	    		</c:forEach>
				   	    		</c:when>				   	
				   	    		<%-- 장바구니가 빈 경우  --%>  	
				   	    		<c:otherwise>
                                        <tr>
                                            <td colspan="4" align="center">찜 목록이 없습니다.</td>
                                        </tr>
                                </c:otherwise>	 
                               <%--  <nav> 페이지네이션 부분
                     
								
									<div class="pagination">
									
									    <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" onclick="changePage(currentPage - 1)"><i class="fa-solid fa-caret-left"></i></a>
									    <c:forEach var="i" begin="1" end="${totalPages}">
									        <a href="#" class="page" onclick="changePage(${i})">${i}</a>
									    </c:forEach>
									    <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" onclick="changePage(currentPage + 1)"><i class="fa-solid fa-caret-right"></i></a>
									</div>
								</nav>	 --%>
			   	    		</c:choose>
		   	    		</tbody>
		   	    	</table>
		   	    	
			</div>
		</section>
		<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
	</body>
</html>