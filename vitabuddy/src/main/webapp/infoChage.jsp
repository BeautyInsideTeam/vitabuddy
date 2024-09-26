<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://kit.fontawesome.com/567f0760c2.js" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<script src="/jsmember.js"></script>
<link rel="stylesheet" href="css/form.css">
<link rel="stylesheet" href="css/button.css">
<c:import url="/WEB-INF/views/layout/head.jsp" />
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp" />
<div id="wrap">
<h2>회원 정보 수정</h2>
<div class="wrapper">
	<form action="memberUpdate.do" method="post" name="frm">
		<tr>
			<td>이름</td>
			</tr>
			<tr>
			 <th><input type="text" name="User_ Name" size="40" value="${GETMEMBER.getUser_Name() }" /></th>
		</tr>
		<tr>
			<td width="35%">아이디</td>
			</tr><tr>
			<td width="65%">${GETMEMBER.getUser_id() }</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			</tr><tr>
			<td><input type="password" name="User_pwd" size="40" required /></td>
		</tr>
		<tr>
			<td>비밀번호 확인</td>
			</tr><tr>
			<td><input type="password" name="User_repwd" size="40" required /></td>
		</tr>
		
		<!--로그인 정보 -->
	
		<tr>
			<td>이메일</td>
			</tr><tr>
			<td><input type="email" name="User_email" size="40"value="${GETMEMBER.getUser_email() }"  /></td>
		</tr>
	
			<tr>
			<td>전화 번호</td>
			</tr><tr>
			<td><input type="tel" name="User_tel" size="40" value="${GETMEMBER.getUser_tel() }" /></td>
		</tr>
		<tr>
			<td>배송지 변경</td>
			</tr><tr>
			<td><input type="text" name="User_add" size="40" value="${GETMEMBER.getUser_add() }" /></td>
		</tr>
		<div>
	<tr>
		<td colspan="2" align="center">
			<input class="button" type="submit" value="회원 정보 수정" />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="button" type="reset" value="다시 쓰기" />
		</td>
	</tr>
</div>
	</form>
	<form class="search-box" action="" method="get">
		<input class="search_text" type="text" name="" placeholder="영양제 검색">
		<button class="btn" type="submit">
		<i class="fa-solid fa-magnifying-glass"></i>
		</button>	
	</form>
</table>
<table class="table2">
	<form action="memberTabletList.do" method="post" name="frm2">
		<tr>
		<td>복용 중인 영양제 변경</td>
		</tr>
		<tr>
		<td><input type="text" name="User_TabletList" size="40" value="${GETMEMBER.getUser_TabletList() }" /></td>
		</tr>
	</select>
	
	
	</form>
</table>
</div>
<footer>


</footer>
</body>
</html>