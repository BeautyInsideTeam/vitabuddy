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
						<input type="text" name="userName"required/>
				<br>아이디
					<button type ="button" onclick="fnDbCheckId()" name="dbCheckId" class="btn">
						중복확인
					</button>
					<input type="text" name="userId" id="userId" required/>
				
				<label>비밀번호 설정</label>
				<input type="password" name="userPwd" id="userPwd" oninput="pwCheck()" required/>
				 <br><span id="pwLeng"></span>
				<label>비밀번호 확인</label>
				<input type="password" name="confirmPwd" id="confirmPwd" oninput="pwCheck()" required/><br>
				<span id="pwOk"></span>
				<div class="phone-number">
				<label>전화 번호 입력</label>
				<input type="tel" name="userPh1" id="userPh1"placeholder="010"maxlength="3"required/>
				-
				<input type="tel" name="userPh2" id="userPh2"placeholder="1111"maxlength="4"required/>
				-
				<input type="tel" name="userPh3" id="userPh3"placeholder="1234"maxlength="4"required/>
				</div>
				<label>이메일</label>
					<input type="email" name="userEmail" " id="email" onchange="emailCheck()" required/>
					<br><span id="emOk"></span>
			</div>
			
			<div class = "right">
				<div class="zipcode">
					우편번호 입력<button type ="button" name="searchBtn" class="btn" >우편번호 찾기</button><BR>
					<input type="text" name="userZipcode" id="userZipcode"/>		
					<label>주소 입력</label>
					<input type="text" name="userAddress1" id="userAddress1"required/>
					<label>상세 주소 입력</label>
					<input type="text" name="userAddress2" id="userAddress2"required/>
				</div>
			</div>
			
			
		</form>
	
		<button class="submit-btn" type="submit" onclick="changeOn()" id="submitBtn" >회원가입</button>
	</div>
<c:import url="footer.jsp" /> 
</body>
<script type="text/javascript">

var pwd = 0;
var eamil = 0;

	function pwCheck(){
		var pw3 = document.getElementById('userPwd').value ;
		if(pw3.length<8){
			document.getElementById('pwLeng').innerHTML="비밀번호는 8자리 이상이어야 합니다.";
	    	document.getElementById('pwLeng').style.color='red';
		}else{
			document.getElementById('pwLeng').innerHTML="";
		}
		if(document.getElementById('userPwd').value != '' && document.getElementById('confirmPwd').value!=''){
			if(document.getElementById('userPwd').value ==document.getElementById('confirmPwd').value){
			document.getElementById('pwOk').innerHTML="비밀번호가 일치합니다.";
			document.getElementById('pwOk').style.color='green';
			pwd = 1;
			 }else{
	    	document.getElementById('pwOk').innerHTML="비밀번호가 일치하지 않습니다.";
	    	document.getElementById('pwOk').style.color='red';  
	    	pwd = 0;
	    	}
	    }
	} 

	function emailCheck(){
		if(document.getElementById('email').value.indexOf("@")>0){
			document.getElementById('emOk').innerHTML="";
			email = 1;
		}else{
			document.getElementById('emOk').innerHTML="올바른 이메일 형식이 아닙니다.";
	    	document.getElementById('emOk').style.color='red'; 
			email = 0;
		}
	}
	function changeOn(){
		if(email ==1 && pwd==1){
			alert('가입됐습니다.')	;
			return true;
		}else{
			
			alert('잘못된 데이터 입니다')	;
			return false;
		}
		
	}
</script>					
</html>