<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<c:import url="/WEB-INF/views/layout/head.jsp"/>  <!-- head.jsp 삽입 --> 
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/memberChangecheck.js'/>"></script>  <!-- infoChange.js 스크립트 삽입 -->
		<script src="<c:url value='/js/searchZip.js'/>"></script> <!-- searchZip.js 스크립트 삽입 -->
		<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/infoChange.css'/>" >   <!-- 로컬 sts 환경에 맞춰 경로 지정 -->
		<meta charset="UTF-8"> 
		<title>회원 정보 수정</title>
	</head>
	
	<body>
		
		<c:import url="/WEB-INF/views/layout/top.jsp"/> 
		<section id="wrap">
			<div class="container">
				<div class="headers"> 
					<h1>회원 정보 수정</h1>
				</div> 
				
				<div class="temp">
					<div class="left">
						<form method="post" id="information" action="<c:url value='/member/myInfoUpdate'/>" >  
							<div class="horizontal_box">
								<label>이름</label>
								<input type="text" name="userName" value="${myInfo.userName}" required/>
								<label>비밀번호 변경</label>
			            		<input type="password"  name="userPwd" id="userPwd" oninput="pwCheck()"  required />
			            		<p id="pwLeng"></p>
			            		<label>비밀번호 확인</label>
								<input type="password"   name="confirmPwd" id="confirmPwd" oninput="pwCheck()" required />
								<p id="pwOk"></p>
								<label>이메일 변경</label>
								<input type="email" name="userEmail" id="userEmail" onchange="emailCheck()"  value="${myInfo.userEmail}" required />
								<p id="emOk"></p>
								<label>전화 번호 변경</label>
								
								<div class="phone-number">
								
									<input type="text" name="userPh1" id="userPh1" placeholder="010" maxlength="3" value="${fn:split(myInfo.userPh,'-')[0]}" required/>
									 - 
									<input type="text" name="userPh2" id="userPh2" placeholder="1111" maxlength="4" value="${fn:split(myInfo.userPh,'-')[1]}" required/>
									 - 
									<input type="text" name="userPh3" id="userPh3" placeholder="1234" maxlength="4" value="${fn:split(myInfo.userPh,'-')[2]}" required/>
								</div>
								
								<div class="zipcode">
									<label>우편번호 입력</label>
									<div class="box_rowContents">
										<input type="text" name="userZipcode" id="userZipcode" required/>
										<button type ="button" name="searchBtn" onclick=searchZip()>우편번호 찾기</button>
									</div>
									<label>주소 변경</label>
									<input type="text" name="userAddress1" id="userAddress1" value="${myInfo.userAddress1}" required/>
									<label>상세 주소 변경</label>
									<input type="text" id="userAddress2" name="userAddress2"  value="${myInfo.userAddress2}" required/>
								</div>
							</div>
						<button class="submit-btn" id="submitBtn" type="submit" >정보변경</button>  <!--정보변경 버튼, 즉 submit을 눌렀을 때, 위 form 태그 시작쪽의 onsubmit이 적용되고 requestmapping url로 이동할 수 있도록 type="submit" 추가-->

						</form>
					</div>
				
					<!-- 여기서부터 영양제 정보 수정 변경 - 팀장님 파트 -->
					<div class="right">
						<form class="searchBox" action="" method="get">
							<div class="search-box">
						        <i class="fas fa-search"></i>
						        <input type="text" placeholder="Search">
						    </div>
						   	<div>
								<label>복용 중인 영양제 변경</label>
								<textarea rows="10%" cols="100%" value="${getMember.getUserTabletList()}" /></textarea>							
							</div>
							<button class="submit-btn" id="submitBtn" type="submit" >변경하기</button>
						</form>
						
						
					</div>
					
					
				</div>
			</div>
		</section>
		<c:import url="/WEB-INF/views/layout/footer.jsp"/>
	</body>

	<!-- 변경사항 
		1. 통신사 파트 sk, lg, kt 삭제 완료 
		2. jsp 파일 내에 script 전부 삭제 후, 별도 js 로 옮김 - infoChange.js로 분리, changeOn()제거
		3. infomation -> info"r"mation 오타 수정완료
		5. button 태그가 <form> 태그 "외부"에 위치 -> <form>태그 "내부"로 재위치 시킴 : 버튼 눌렀는데도 전송이 안되는 이유
		6. 전화번호 파트 정규식 삭제 완료
		7. infoChange.js파일 내 eamil > email로 오타 수정
		8. input태그 내 id, name 수정 완료 -> 그에 따른 js 파일의 모든 id 수정까지 완료
		9. [영양제 정보 수정] 파트 -> form 태그가 두개 분리되어있음 -> 하나의 폼 태그로 합치고, div태그로 두개 섹션 생성
		10. 상세주소 <textarea> 에서 <text>로 수정 완료
		11. placeholder 추가 : 이름, 비밀번호, 이메일, 전화번호, 주소에 placeholder 삽입
		12. ${myInfo.userName}으로 되어있는 부분 : 백엔드 모델 객체 변수를 myInfo로 지정함-->
		


	
</html>