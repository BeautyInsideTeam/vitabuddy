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
 		 	<link rel="stylesheet" type="text/css" href="<c:url value='/css/wishList.css'/>">	   	      
	</head>
	<body>
	<c:import url="/WEB-INF/views/layout/top.jsp" /> 
		<section id="wrap">
        	<!--  top -->         		
			<div class="container">
		    <h1>찜목록</h1>
		   	    <div class="productList">
		   	    	<table class="wishList">
		   	    		<colgroup> 
			   	    		<col width="50">
			   	    		<col width="100">
			   	    		<col width="*">
			   	    		<col width="143">
		   	    		</colgroup>
		   	    		<thead>
		   	    			<tr class="listHead">
		   	    				<th scope="col">
		   	    					<input type="checkbox" checked="checked" class="check">
									<span class="selectText">
										 전체 선택 
									</span>
									<span class="selectDelete">
									 	선택 삭제
									</span>
		   	    				</th>
		   	    				<th scope="col"></th>
		   	    				<th scope="col"></th>
		   	    				<th scope="col"></th>
		   	    			</tr>
		   	    		</thead>
		   	    		<tbody class="listBody">
			   	    		<c:choose>
			   	    			<c:when test="${not empty wishList}">
			   	    			<c:forEach var="wishList" items="${wishLists}" varStatus="status">
				   	    			<tr class="wishItem">
				   	    				<td class="selectBox">
				   	    					<input type="checkbox" checked="checked" class="check">
				   	    				</td>
				   	    				<td class="itemImage">
				   	    					<a href="<c:url value='/product/detailView/${sup.supNo}'/>"><img class="prdImg" src="data:image/png;base64,${sup.base64SupImg}" width="100" height="100"> </a>
				   	    				</td>
				   	    				<td class="itemInfo">
				   	    					 <p>${sup.supName} 테스트 상품명</p>
				   	    					 <p>${sup.supBrand} 예시 브랜드 이름 </p>
				   	    					 <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sup.supPrice}"/> 얼추 가격</p>  <!-- 한국 통화 표시 -->
				   	    				</td>
				   	    				<td	class="status">
				   	    					<div class="addCart" href="<c:url value='/product/addCart'/>" id="addCart" data-prd-id="${prd.prdNo}">
				   	    						<a >장바구니 담기</a>
				   	    					</div>
				   	    					<div class="del" href="<c:url value='/product/deleteWish'/>" id="deleteWish" data-prd-id="${prd.prdNo}">
				   	    						<a >삭제</a>
				   	    					</div>
				   	    				</td>
				   	    			</tr>
				   	    		</c:forEach>
				   	    		</c:when>				   	    	
				   	    		<c:otherwise>
                                        <tr>
                                            <td colspan="4" align="center">찜 목록이 없습니다.</td>
                                        </tr>
                                </c:otherwise>	
                                <nav>
									<!-- 페이지네이션 -->
									<div class="pagination">
									<!-- 현재 페이지에 따라 이전/다음 버튼 비활성화 -->
									    <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" onclick="changePage(currentPage - 1)"><i class="fa-solid fa-caret-left"></i></a>
									    <c:forEach var="i" begin="1" end="${totalPages}">
									        <a href="#" class="page" onclick="changePage(${i})">${i}</a>
									    </c:forEach>
									    <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" onclick="changePage(currentPage + 1)"><i class="fa-solid fa-caret-right"></i></a>
									</div>
								</nav>	
			   	    		</c:choose>
		   	    		</tbody>
		   	    	</table>
		   	    	
		   	    	<!-- 이하 기존 코드들 -->
		   	    	
				    <%-- <div class="productItem">
				        <a href="<c:url value='/product/deleteWish'/>" id="deleteWish" data-prd-id="${sup.supNo}"><i class="fa-solid fa-trash"></i></a>
				        <a href="<c:url value='/product/detailView/${sup.supNo}'/>">
				            <img src="${sup.supImg}">
				            <h3>${sup.supName}</h3>
				        </a>
				        <p>${sup.supCompany}</p>
				        <p>${sup.supPrice}</p>
				        <a href="<c:url value='/product/addCart'/>" id="addCart" data-prd-id="${sup.supNo}">장바구니 추가</a>
				    </div>
				
				    <div class="productItem">
				        <a href="<c:url value='/product/deleteWish'/>" id="deleteWish" data-prd-id="${prd.prdNo}"><i class="fa-solid fa-trash"></i></a>
				        <a href="<c:url value='/product/detailView/${prd.prdNo}'/>">
				            <img src="${sup.supImg}">
				            <h3>${sup.supName}</h3>
				        </a>
				        <p>${sup.supPrice}</p>
				        <p>${sup.supCompany}</p>
				        <a href="<c:url value='/product/addCart'/>" id="addCart" data-prd-id="${prd.prdNo}">장바구니 추가</a>
				    </div>
				
				    <div class="productItem">
				        <a href="<c:url value='/product/deleteWish'/>" id="deleteWish" data-prd-id="${prd.prdNo}"><i class="fa-solid fa-trash"></i></a>
				        <a href="<c:url value='/product/detailView/${prd.prdNo}'/>">
				            <img src="sup.supImg">
				            <h3>sup.supName</h3>
				        </a>
				        <p>sup.supCompany</p>
				        <p>sup.supPrice</p>
				        <a href="<c:url value='/product/addCart'/>" id="addCart" data-prd-id="${prd.prdNo}">장바구니 추가</a>
				    </div>
   
			</div>
 --%>
		    	<%-- <c:forEach var="wish" items="${wishList}">
				
					<div class="productItem">
				        <a href="<c:url value='/product/deleteWish'/>" id="deleteWish" data-prd-id="${prd.prdNo}"><i class="fa-solid fa-trash"></i></a>
				        <a href="<c:url value='/product/detailView/${prd.prdNo}'/>">
				            <img src="${sup.supImg}">
				            <h3>${sup.supName}</h3>
				        </a>
				        <p>${sup.supPrice}</p>
				        <p>${sup.supCompany}</p>
				        <a href="<c:url value='/product/addCart'/>" id="addCart" data-prd-id="${prd.prdNo}">장바구니 추가</a>
			        </div>
				 </c:forEach> --%>
				 
				<%-- <nav>
					<!-- 페이지네이션 -->
					<div class="pagination">
					<!-- 현재 페이지에 따라 이전/다음 버튼 비활성화 -->
					    <a href="#" class="prev <c:if test='${currentPage == 1}'>disabled</c:if>" onclick="changePage(currentPage - 1)"><i class="fa-solid fa-caret-left"></i></a>
					    <c:forEach var="i" begin="1" end="${totalPages}">
					        <a href="#" class="page" onclick="changePage(${i})">${i}</a>
					    </c:forEach>
					    <a href="#" class="next <c:if test='${currentPage == totalPages}'>disabled</c:if>" onclick="changePage(currentPage + 1)"><i class="fa-solid fa-caret-right"></i></a>
					</div>
				</nav>	 --%>
			</div>
		</section>
		<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
	</body>
</html>