<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
<title>비타버디 가입하기</title>
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp" /> 
	<div id="wrap" class="wrapper">
		<form method="post" name="joinForm" id="joinForm">
		<!--  회원가입 타이틀 -->
		<header>
			<div align="center">
				<h1 class="title">
					회원 가입
				</h1>
			</div>
		</header>
			<div class="formGroup">
				<label for="userName">
				 이름<span class="identify"></span>
				</label>
				<div>	
					<tr>
						<th><input type="text" name="userName"  /></th>
					</tr>
				</div>
			</div>
			<div class="formGroup">
				<label for="userId">
					아이디<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="userId" id="userId" onkeydown="inputIdChk()"/>
					<button type ="button" onclick="fnDbCheckId()" name="dbCheckId" class="btn">
						중복확인
					</button>
				</div>
			</div>
			<div class="formGroup">
				<label for="userPwd">
					비밀번호 설정 <span class="identify"></span>
				</label>
				<div>
				<input type="password" name="userPwd" id="userPwd" placeholder="영문, 숫자, 특수기호 포함 10자 이상"/>
				</div>
			</div>
			
			<div class="formGroup">
				<label for="userPwd">
					비밀번호 확인<span class="identify"></span>
				</label>
				<div>
				<input type="password" name="confirmPwd" id="confirmPwd"placeholder="설정하신 비밀번호를 입력하세요"/>
				</div>
			
			<div class="formGroup">
				<label for="userPh">
					핸드폰 번호<span class="identify"></span>
				</label>
				<div>
				<input type="tel" name="userPh1" id="userPh1"placeholder="010"maxlength="3"/>
				-
				<input type="tel" name="userPh2" id="userPh2"placeholder="1111"maxlength="4"/>
				-
				<input type="tel" name="userPh3" id="userPh3"placeholder="1234"maxlength="4"/>
				</div>
				
			</div>
			<div class="formGroup">
				<label for="UserEmail">
					이메일<span class="identify"></span>
				</label>
				<div>
					<input type="email" name="UserEmail" id="userEmail"placeholder="example@domai.com"/>
				</div>
			</div>
			<div class="formGroup">
				<label for="userAddress">
					우편번호 입력<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="userZipCode" id="userZipCode"/>
					<button type ="button" name="searchBtn" class="btn">
						우편번호 찾기
					</button>
				</div>
			</div>
			<div class="formGroup">
				<label for="userAddress">
					주소 입력<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="userAddress1" id="userAddress1"/>
				</div>
			</div>
			<div class="formGroup">
				<label for="userAddress">
					상세 주소 입력<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="userAddress2" id="userAddress2"/>
				</div>
			</div>
			<tr>
		<td colspan="2" align="center">
			<input class="button" type="submit" value="회원가입" />
		</td>
	</tr>
		</div>
		
	</form>
</div>
</body>
</html>