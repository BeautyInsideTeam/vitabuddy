<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <title>비타버디 가입하기</title>
    <link rel="stylesheet" href="<c:url value='/css/register.css'/>" > <!--css 개발용 -->
    <c:import url="/WEB-INF/views/layout/head.jsp" /> 
    <!-- <link rel="stylesheet" type="text/css" href="<c:url value='/css/common.css'/>">-->
 <!--    <script src="/js/register.js"></script> JS 파일을 추가 --> <!--css 개발용 -->
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp" /> 
   <section id="wrap">
      <div class="container">
      	<div class="headers">
        	<h1>회원 가입</h1>
        </div>
        <form onsubmit="return false;">
	        <div class="horizontal_box">
					<div class="box_rowContents">
						<label>이름</label>
        					<input type="text" name="userName" id="userName" required/>
           			 </div>
					<p></p>
					<div class="box_rowContents">
             				<label>아이디</label>
	               		<input type="text" name="userId" id="userId" required/>
	               		<button type="button" onclick="fnDbCheckId()" name="dbCheckId" class="btn" style="position:absolute; right: 28%; width: 7%;">중복확인</button>
           		 	</div>
					<p></p>
					<div class="box_rowContents">
		               <label>비밀번호 </label>
		               <input type="password" name="userPwd" id="userPwd" oninput="pwCheck()" required/>
		            </div>
		            <p id="pwLeng"></p>
		              <div class="box_rowContents">
		              	<label>비밀번호 확인</label>
		              	<input type="password" name="confirmPwd" id="confirmPwd" oninput="pwCheck()" required/><br>
		             </div>
		             <p id="pwOk"></p>
               		<div class="phone-number">
	               			<div class="box_rowContents">
	                  <label>전화번호</label>
		                  <input type="tel" name="userPh1" id="userPh1" placeholder="010" maxlength="3" required/>
		                  -
		                  <input type="tel" name="userPh2" id="userPh2" placeholder="1111" maxlength="4" required/>
		                  -
		                  <input type="tel" name="userPh3" id="userPh3" placeholder="1234" maxlength="4" required/>
	              			 </div>
	              		</div>
	              		<p></p>
	              		<div class="box_rowContents">
			               <label>이메일</label>
			               <input type="email" name="userEmail" id="userEmail" onchange="emailCheck()" required/>
			             </div>
			               <p id="emOk"></p>
			               
	               	<div class="zipcode">
	               		<div class="box_rowContents">
			                  <label>우편번호</label>
			                  <input type="text" name="userZipcode" id="userZipcode" readonly/>
			                  <button type="button" name="searchBtn" class="btn" onclick="openZipSearch()" style="position:absolute; right: 28%; width: 7%;">우편번호 찾기</button>  
	                    </div>    
			            <p></p>
			            <div class="box_rowContents">
			                  <label>주소</label>
			                  <input type="text" name="userAddress1" id="userAddress1" readonly/>
			           	</div>    
			            <p></p>
			            <div class="box_rowContents">
			                  <label>상세 주소</label>
			                  <input type="text" name="userAddress2" id="userAddress2" required/>
	              		</div>
	               </div>
	            </div>
	         </form>
	         <button class="submit-btn" type="button" id="submitBtn" onclick="registerMember()">회원가입</button>
	      </div>
	   
   </section>
<c:import url="/WEB-INF/views/layout/footer.jsp" />  
</body>
</html>
