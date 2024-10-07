<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="/jsmember.js"></script>
<link rel="stylesheet" href="common.css" >
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp" />
	<div id="wrap">
		<div class="container">
		<h1>회원 정보 수정</h1>
			<form>
				<div class="child1">
					<label>이름</label>
					 <input type="text" name="userName" value="${getMember.getUserName() }" required/>
				
					<label>아이디</label>
					<input type="text" name="userId" id="idid" value="${getMember.getuserId() }"readonly />
					
					<label>비밀번호 변경</label>
		            <input type="password"  name="userPwd" id="pw1" oninput="pwCheck()" required />
		            <br><span id="pwLeng"></span>
					<label>비밀번호 확인<label>
					<input type="password"   name="confirmPwd" id="pw2" oninput="pwCheck()" required />
					<br><span id="pwOk"></span>
					
					<label>이메일 변경<label>
					<input type="email" name="userEmail" " id="email" onchange="emailCheck()"  value="${getMember.getUserEmail() }" required />
					<br><span id="emOk"></span>
					<label>전화 번호 변경</label>
					<div class="phone-number">
						<input type="number" name="userPh1" id="userPh1"placeholder="010"maxlength="3" value="${getMember.getUserPh1() }" required/>
						-
						<input type="number" name="userPh2" id="userPh2"placeholder="1111"maxlength="4" value="${getMember.getUserPh2() }" required/>
						-
						<input type="number" name="userPh3" id="userPh3"placeholder="1234"maxlength="4" value="${getMember.getUserPh3() }"  required/>
					</div>
			</div>
				<div class="child2">
					<div class="zipcode">
						우편번호 입력     <button type ="button" name="searchBtn" class="btn" >우편번호 찾기</button><BR>
							<input type="text" name="userZipcode" id="userZipcode"required/>
							
					
						
						<label>주소 변경</label>
						<input type="text" name="userAddress1" id="userAddress1" value="${getMember.getUserAddress() }"required/>
						<label>상세 주소 변경</label>
						<input type="text" name="userAddress2" id="userAddress2" value="${getMember.getUserAddress2() }"required/>
						
					</div>
				</div>
		<div class="child3">
			<input class="searchText" type="text" name="" placeholder="search">
			<button class="btn" type="button">
			<i class="fa-solid fa-magnifying-glass"></i>
			</button>	
			<label>복용 중인 영양제 변경</label>
			<input type="text" name="userTabletList" value="${getMember.getUserTabletList() }" />
		</div>
	</form>
	<button class="submit-btn" type="submit" onclick="changeOn()" id="submitBtn">변경하기</button>

		</div>
</div>
</div>


<c:import url="/WEB-INF/views/layout/footer.jsp" /> 
</body>
<script type="text/javascript">
var pwd = 0;
function pwCheck(){
	var pw3 = document.getElementById('pw1').value ;
	if(pw3.length<8){
		document.getElementById('pwLeng').innerHTML="비밀번호는 8자리 이상이어야 합니다.";
    	document.getElementById('pwLeng').style.color='red';
	}else{
		document.getElementById('pwLeng').innerHTML="";
	}
	if(document.getElementById('pw1').value != '' && document.getElementById('pw2').value!=''){
		if(document.getElementById('pw1').value ==document.getElementById('pw2').value){
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

 
var eamil = 0;

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
		alert('변경됐습니다.')	;
		return true;
	}else{
		
		alert('잘못된 데이터 입니다')	;
		return false;
	}
	
}


</script>					
</html>