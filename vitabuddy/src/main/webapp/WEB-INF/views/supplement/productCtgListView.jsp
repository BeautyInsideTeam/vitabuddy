<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>상품 조회</title>	
		<!-- <c:import url = "/WEB-INF/views/layout/head.jsp"></c:import>--> 
	</head>
	<body>
		<div id="wrap">
			<!-- top.jsp import -->
			<!--<c:import url = "/WEB-INF/views/layout/top.jsp"></c:import>-->
			<br>
			<h3>상품 조회</h3>	<br>
			<table border="1" width="70%">
				<tr><th>상품이름</th>
				<th>상품 가격</th>
				
				
				<th>상품 브랜드</th>
		
				<!-- <th>제조사</th>
				<th>재고</th>
				<th>사진</th></tr>-->
				
			<!-- 검색 상품 반복 출력 : descript 필드(=상세보기출력)와 ctgId(동일한 ctg만 보여주므로)는 출력하지 않음 (6)-->
			<!-- 제품 번호를 클릭하면 상세보기 - a 태그 사용 --> 
				<c:forEach var="sup" items="${supplements}">
					<tr>
						<!-- <td><a href="<c:url value='/product/detailViewProduct/${prd.prdNo}'/>">${prd.prdNo}</a></td> prdNo는 PK이기 때문에, 있거나 없거나 둘중에 하나이고, 한 제품에 대해 하나의 행만 반환한다(중복X).  -->
						<td>${sup.supName}</td>
						<td><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sup.supPrice}" /></td>

						<td>${sup.supBrand}</td>
						
						<!-- <td>${prd.prdStock}</td>
						<td><img src="<c:url value='/prd_images/${prd.prdImg}'/>" width="30" height="20"></td>-->

					</tr>
				
				
				
				</c:forEach>

						
			</table><br><br>
			
			
		</div>
	</body>
</html>