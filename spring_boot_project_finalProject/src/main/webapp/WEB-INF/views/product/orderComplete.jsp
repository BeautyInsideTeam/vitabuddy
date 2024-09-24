<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>주문 완료</title>
		<c:import url="/WEB-INF/views/layout/head.jsp" />		
	</head>
	<body>
		<div id="wrap">
        	<!--  top -->         
        	<c:import url="/WEB-INF/views/layout/top.jsp" />
			<section>		
				<h3>주문이 완료되었습니다</h3>
				주문내역은 마이페이지에서 확인할 수 있습니다.
				
				<!-- css로 버튼 형태 수정 예정 -->
				<a href="<c:url value='/myPage'/>" class="btn">
					마이페이지
				</a>
				
				<a href="<c:url value='/product/prdList'/>" class="btn">
					상점
				</a>
			</section> 
		
			<!--  bottom -->         
        	<c:import url="/WEB-INF/views/layout/bottom.jsp" />
      </div>
	</body>
</html>