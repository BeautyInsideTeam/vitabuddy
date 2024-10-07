<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
<title>비타버디 가입하기</title>
<c:import url="/WEB-INF/views/layout/head.jsp" />
<link rel="stylesheet" href="common.css" >
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp" /> 
	<div id="wrap" >
				
			<div class="container">
			<h1>회원 가입</h1>
			<form>
			<div class="left">
				<label>이름</label>
						<input type="text" name="userName"/>
				<br>아이디
					<button type ="button" onclick="fnDbCheckId()" name="dbCheckId" class="btn">
						중복확인
					</button>
					<input type="text" name="userId" id="userId" onkeydown="inputIdChk()"/>
				
				<label>비밀번호 설정</label>
				<input type="password" name="userPwd" id="userPwd" oninput="pwCheck()" />
				<label>비밀번호 확인</label>
				<input type="password" name="confirmPwd" id="confirmPwd" oninput="pwCheck()" placeholder="설정하신 비밀번호를 입력하세요"/><br>
				<span id="pwOk"></span>
				<div class="phone-number">
				<label>전화 번호 입력</label>
				<input type="tel" name="userPh1" id="userPh1"placeholder="010"maxlength="3"/>
				-
				<input type="tel" name="userPh2" id="userPh2"placeholder="1111"maxlength="4"/>
				-
				<input type="tel" name="userPh3" id="userPh3"placeholder="1234"maxlength="4"/>
				</div>
				<label>이메일</label>
					<input type="email" name="UserEmail" id="userEmail"placeholder="example@domai.com"/>
			</div>
			
			<div class = "right">
			<div class="zipcode">
				우편번호 입력<button type ="button" name="searchBtn" class="btn" >우편번호 찾기</button><BR>
					<input type="text" name="userZipcode" id="userZipcode"/>
					
			</div>
				
				<label>주소 입력</label>
				<input type="text" name="userAddress1" id="userAddress1"/>
				<label>상세 주소 입력</label>
				<input type="text" name="userAddress2" id="userAddress2"/>
				</form>
			</div>
			
			
	</form>
	<button class="submit-btn">회원가입</button>
</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
</body>
<script type="text/javascript">
function pwCheck(){
	if(document.getElementById('userPwd').value != '' && document.getElementById('confirmPwd').value!=''){
		if(document.getElementById('userPwd').value ==document.getElementById('confirmPwd').value){
		document.getElementById('pwOk').innerHTML="비밀번호가 일치합니다.";
		document.getElementById('pwOk').style.color='green';
    }else{
    	document.getElementById('pwOk').innerHTML="비밀번호가 일치하지 않습니다.";
    	document.getElementById('pwOk').style.color='red';    
    	}
    }
}</script>
</html>