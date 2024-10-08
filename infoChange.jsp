<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="DYcommon.css" >
		<link rel="stylesheet" href="DYheader.css" >
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>
	</head>
	<!--섹션 기반으로 한 번 갈아엎음. 구조적 문제였음. id나 class 등은 그대로 유지함. 이제 css로 안 망그러질 것-->
	<body>
		<%@ include file="DYtop.jsp" %>
		<section id="wrap"> <!--섹션 사용을 통해 탑, 본문, 푸터 구분-->
			<div class="container">
				<div class="headers">
					<h1>회원 정보 수정</h1>
				</div>
				
				<div class="temp">
					<div class="left">
						<form method="post" id="infomation"onsubmit="return false;">
							<div class="horizontal_box">
								<label>ID</label>
								<input type="text" name="userId" value="${getMember.getUserID() }" required readonly />
								<label>이름</label>
								<input type="text" name="userName" value="${getMember.getUserName() }" required/>
								<label>비밀번호 변경</label>
			            		<input type="password"  name="userPwd" id="pw1" oninput="pwCheck()" required />
			            		<p id="pwLeng"></p>
			            		<label>비밀번호 확인</label>
								<input type="password"   name="confirmPwd" id="pw2" oninput="pwCheck()" required />
								<p id="pwOk"></p>
								<label>이메일 변경</label>
								<input type="email" name="userEmail" id="email" onchange="emailCheck()"  value="${getMember.getUserEmail() }" required />
								<p id="emOk"></p>
								<label>전화 번호 변경</label>
								<div class="phone-number">
								<%-- <select class="tellecom">
									<option value="kt" selected>KT</option>
									<option value="skt" selected>SKT</option>
									<option value="lg" selected>LG</option>
								</select> --%>
								<%-- 통신사는 주석으로 해 둠 하단은 정규식 뺌 --%>
								<%--oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"--%>
									<input type="text" name="userPh1" id="userPh1"placeholder="010"maxlength="3" value="${getMember.getUserPh1() }" required/>
									 - 
									<input type="text" name="userPh2" id="userPh2"placeholder="1111"maxlength="4" value="${getMember.getUserPh2() }" required/>
									 - 
									<input type="text" name="userPh3" id="userPh3"placeholder="1234"maxlength="4" value="${getMember.getUserPh3() }"  required/>
								</div>
								<div class="zipcode">
									<label>우편번호 입력</label>
									<div class="box_rowContents">
										<input type="text" name="userZipcode" id="userZipcode" value="${getMember.getUserZipcode() }" required/>
										<button type ="button" name="searchBtn">우편번호 찾기</button>
									</div>
									<label>주소 변경</label>
									<input type="text" name="userAddress1" id="userAddress1" value="${getMember.getUserAddress1() }"required/>
									<label>상세 주소 변경</label>
									<textarea rows="10%" cols="100%" name="userAddress2" id="userAddress2" value="${getMember.getUserAddress2() }"required/></textarea>
								</div>
							</div>
						</form>
						<button class="submit-btn" id="submitBtn" onclick="changeOn()" >정보 변경</button>
					</div>
				
					<div class="right">
						<form>
							<div>
								<form class="searchBox" action="" method="get">
									<div class="search-box">
								        <i class="fas fa-search"></i>
								        <input type="text" placeholder="Search">
								    </div>
								</form>
								<label>복용 중인 영양제 변경</label> <!-- 복용중인 영양제 데이터는 어디있는지 모르겠어요-->
								<textarea rows="10%" cols="100%" value="${getMember.getUserTabletList() }" /></textarea>							
							</div>
						</form>
						<button class="submit-btn" type="submit" id="submitBtn">변경하기</button>
					</div>
				</div>
			</div>
		</section>
		<%@ include file="footer.jsp" %> 
	</body>
	<script type="text/javascript" src="register.js"></script>

	<!-- 하단은 기존에 작성한 펑션들-->
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
				alert('변경됐습니다.')	;
				form.action = ""/*데이터를 받을 곳 주소*/;
				form.method = "POST";
				form.submit();
				
			}else{
				
				alert('잘못된 데이터 입니다')	;
				return false;
			}
			
		}
		</script> -->
</html>