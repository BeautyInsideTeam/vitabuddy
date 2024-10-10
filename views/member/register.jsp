<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="register.css" >
		<link rel="stylesheet" href="header.css" >
		
		<meta charset="UTF-8">
		<title>비타버디에 오신 것을 환영합니다!</title>
	<body><!-- 이 또한 대대적으로 구조수정. 이젠 안 망가질 것으로 ,,,, 예상.-->
		<%@ include file="DYtop.jsp" %><!-- 탑 경로  및 명령어 수정 --><!--이름은 좀 더 고민하겠음--->
		<section id="wrap">
			<div class="container">
				<div class="headers">
					<h1>회원 가입</h1>
				</div>
				<div class="temp">
					<form method="post" id="information"onsubmit="return false;">
							<div class="horizontal_box">
								<label>이름</label>
								<input type="text" name="userName" required/>
								<label>아이디</label>
								<div class="box_rowContents">
									<input type="text" name="userId" required/>
									<button type ="button" name="searchBtn">중복 확인</button>
								</div>
								<label>비밀번호 </label>
			            		<input type="password"  name="userPwd" id="pw1" oninput="pwCheck()" required />
			            		<p id="pwLeng"></p>
			            		<label>비밀번호 확인</label>
								<input type="password"   name="confirmPwd" id="pw2" oninput="pwCheck()" required />
								<p id="pwOk"></p>
								<label>이메일 </label>
								<input type="email" name="userEmail" id="email" onchange="emailCheck()"required />
								<p id="emOk"></p>
								<label>전화 번호 </label>
								<%-- 통신사 주석처리
								<div class="phone-number"> 
								<select class="tellecom">
									<option value="kt" selected>KT</option>
									<option value="skt" selected>SKT</option>
									<option value="lg" selected>LG</option>

								</select> --%>
								<%-- oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" --%>
									<input type="text" name="userPh1" id="userPh1"placeholder="010"maxlength="3"  required/>
									 - 
									<input type="text" name="userPh2" id="userPh2"placeholder="1111"maxlength="4"  required/>
									 - 
									<input type="text" name="userPh3" id="userPh3"placeholder="1234"maxlength="4"   required/>
								</div>
							</div>
							<div class="zipcode">
								<label>우편번호</label>
								<div class="box_rowContents">
									<input type="text" name="userZipcode" id="userZipcode" required/>
									<button type ="button" name="searchBtn">우편번호 찾기</button>
								</div>
								<label>주소 </label>
								<input type="text" name="userAddress1" id="userAddress1" required/>
								<label>상세 주소 </label>
								<textarea rows="10%" cols="100%" name="userAddress2" id="userAddress2" required/></textarea>
							</div>	
					</form>
					
				</div>
				<button class="submit-btn" id="submitBtn" onclick="changeOn()" >회원 가입</button>
			</div>
		</section>
		<%@ include file="footer.jsp" %><!-- 푸터 삽입 -->
	</body>
</html>

<%-- 이하 스크립트는 참고용 --%>
<%-- <script type="text/javascript" src="register.js"></script> --%>
<!-- <script type="text/javascript">
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
		
		var form = document.getElementById('infomation');
		
		function changeOn(){
			if(email ==1 && pwd==1){
				alert('가입됐습니다.')	;
				form.action = ""/*데이터를 받을 곳 주소*/;
				form.method = "POST";
				form.submit();
				
			}else{
				
				alert('잘못된 데이터 입니다')	;
				return false;
			}
			
		}
		</script> -->