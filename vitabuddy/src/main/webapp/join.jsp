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
		<form method="post" name="join_form" id="join_form">
		<!--  회원가입 타이틀 -->
		<header>
			<div align="center">
				<h1 class="title">
					회원 가입
				</h1>
			</div>
		</header>
			<div class="form_group">
				<label for="user_name">
				 이름<span class="identify"></span>
				</label>
				<div>	
					<tr>
						<th><input type="text" name="User_Name"  /></th>
					</tr>
				</div>
			</div>
			<div class="form_group">
				<label for="user_id">
					아이디<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="user_id" id="user_id" onkeydown="inputIdChk()"/>
					<button type ="button" onclick="fn_dbCheckId()" name="dbCheckId" class="btn">
						중복확인
					</button>
				</div>
			</div>
			<div class="form_group">
				<label for="user_pw">
					비밀번호 설정 <span class="identify"></span>
				</label>
				<div>
				<input type="password" name="user_pw" id="user_pw" placeholder="영문, 숫자, 특수기호 포함 10자 이상"/>
				</div>
			</div>
			
			<div class="form_group">
				<label for="user_pw">
					비밀번호 확인<span class="identify"></span>
				</label>
				<div>
				<input type="password" name="user_pw_re" id="user_pw"placeholder="설정하신 비밀번호를 입력하세요"/>
				</div>
			
			<div class="form_group">
				<label for="user_tel">
					핸드폰 번호<span class="identify"></span>
				</label>
				<div>
				<input type="tel" name="User_tel" id="User_tel"placeholder="010-1111-1234"/>
				</div>
			</div>
			<div class="form_group">
				<label for="user_email">
					이메일<span class="identify"></span>
				</label>
				<div>
					<input type="email" name="User_email" id="User_email"placeholder="example@domai.com"/>
				</div>
				<tr>
					<td><input type="radio" name="User_newsOption">이메일로 최신 소식을 받아보는 것에 동의하십니까?</td>
				</tr>
			</div>
			<div class="form_group">
				<label for="user_add">
					주소 입력<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="User_add" id="User_add"/>
				</div>
			</div>
			<div class="form_group">
				<label for="user_addDetail">
					상세 주소 입력<span class="identify"></span>
				</label>
				<div>
					<input type="text" name="User_addDetail" id="User_addDetail"/>
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