<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8"> 
<title>footer</title>
<link rel="stylesheet" href="<c:url value='/css/footer.css'/>" >  <!-- 강사님은 제외 -->

</head>
<body>  
	<section id="wrap">
		<footer>
			<div class="inner" style="    display: flex;">
				<div class="moveTopBtn" type="button" align="center" onclick="window.scrollTo(0,0);">최상단으로</div>
				
				<div class="moveTopBtn" type="button" align="center" href="csCenter.jsp" >고객센터</a>
				</div>
			</div>
		</footer>
	</section>
</body>
</html>	