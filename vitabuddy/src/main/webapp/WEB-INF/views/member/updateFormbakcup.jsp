<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 정보 수정</title>	
		<c:import url="/WEB-INF/views/layout/head.jsp"/>
		<link rel="stylesheet" type="text/css" href="<c:url value='/css/join.css'/>">
		<script src="<c:url value='/js/jquery-3.7.1.min.js'/>"></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
		<script src="<c:url value='/js/searchZip.js'/>"></script>
		<script src="<c:url value='/js/passwordChg.js'/>"></script>
		
		<script>
			//submit 발생 시, 아래 form에서 submit 발생하면 호출되는 함수
			function doAction(form){
				var formData = new FormData(document.getElementById("joinForm"));
				
				for(var key of formData.keys()){
					console.log(key, ":", formData.get(key))
					if(formData.get(key)==""){
						alert(document.getElementById(key).placeholder+"를 입력하세요");
						return false;   //submit이 일어나지 않도록
					}
				}
				return true;   //submit이 진행되도록 
			}
		
		
		
		</script>

	</head>
	<body>
	<div id="wrap">
		<!-- top.jsp 임포트 -->
			<c:import url="/WEB-INF/views/layout/top.jsp"/>
		<section>
	        <h1 id="title">회원 정보 수정</h1>
	        <form id="joinForm" name="joinForm" method="post"  
	        	  action="<c:url value='/member/myInfoUpdate'/>" onsubmit="return doAction(this.form)"> <!-- submit이면 함수를 호출 && 매개변수로 현재 form의 참조값이 넘어간다 -->
	        	<table>
		            <tr>
		            	<th> 성명</th>
		           		<td><input type="text" id="userName" name="userName"  value="${myInfo.userName}" ></td> <!-- value가 있으면 placeholder -->
	           		</tr>
		            <tr>
		            	<th> ID</th>
		            	<td><input type="text" id="userId" name="userId" value="${myInfo.userId}" > </td>
		            		
	            	</tr>
	            	
	            	<tr><td colspan=2>비밀번호 변경은 현재 비밀번호 입력 후 변경 버튼을 클릭하세요</td></tr>
		            <tr>
		            
		            	
		            	<!-- 로그인한 상태여도 현재 비밀번호 한번 더 확인해서 비밀번호가 맞으면 비밀번호 변경 폼으로 전환 : js에서 ajax로 구성 -->
		            	<!-- 현재 비밀번호가 틀리면 비밀 번호 안맞는다는 메시지를 출력하고 현재 화면에 머무르도록 함 -->
		            	<th>비밀번호 변경</th> <!-- 따로 구성 -->
		            	<td><input type="password"  name="userPwd" id="userPwd" oninput="pwCheck()" required />
			            <br><span id="pwLeng"></span></td> <!-- name 속성 없으면 Form 데이터 안날아감 -->
			         </tr>
			         <tr>
		            	
		            	<th>비밀번호 확인</th> <!-- 따로 구성 -->
		            	<td><input type="password"   name="cfmuserPwd" id="cfmuserPwd" oninput="pwCheck()" required />
						<br><span id="pwOk"></span></td>
	            	</tr>
	            	<tr>
		            	<th>이메일</th>
		            	<td><input type="text" name="userEmail" id="userEmail" onchange="emailCheck()"  value="${getMember.getUserEmail() }" required /> <!-- id=userEmail 로 변경 -->
						<br><span id="emOk"></span></td>
	            	</tr>
	            	
		            <tr>
		            	<th>휴대폰 번호 변경</th> <!-- 휴대폰 번호 분리작업, jstl의 split함수 사용 --> 
		            	<td><input type="text" id="userPh1" name="userPh1" size="3" value="${fn:split(myInfo.userPh,'-')[0]}" placeholder="hp1"> 
		                    - <input type="text" id="userPh2" name="userPh2" size="4" value="${fn:split(myInfo.userPh,'-')[1]}" placeholder="hp2">
		                    - <input type="text" id="userPh3" name="userPh3" size="4" value="${fn:split(myInfo.userPh,'-')[2]}" placeholder="hp3"></td>
                    </tr>
                    
                    <tr>
		            	<th>주소</th>
		            	<td colspan="3">
		            		<input type="text" id="userZipcode" name="userZipcode" size="5"   value="${myInfo.userZipcode}" readonly>
		            		<input type="button" id="searchZipBtn" name="searchZipBtn" value="우편번호 찾기"><br>
		            		<input type="text" id="userAddress1" name="userAddress1"  value="${myInfo.userAddress1}" placeholder="주소"  size="40" readonly>
		            		<input type="text" id="userAddress2" name="userAddress2"  value="${myInfo.userAddress2}" placeholder="상세 주소" >
	            		</td>
	            	</tr>
		            	             
		             <tr>
		                <td colspan="2" align="center" id="button">
		                    <br><input type="submit" value="완료">
		                    <input type="reset" value="취소">
		                </td>
		            </tr>             
	            </table>
	      </form>	
      </section>
    <!-- bottom.jsp 임포트 -->
	<c:import url="/WEB-INF/views/layout/footer.jsp"/>
     </div>
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

</html>


