<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>

<%-- <c:import url="/WEB-INF/views/layout/order.jsp"/> --%>
<meta charset="UTF-8">
<title>비타버디 - 주문/결제 </title>
<c:import url="/WEB-INF/views/layout/head.jsp" />
<link rel="stylesheet" type="text/css" href="<c:url value='/css/orderForm.css'/>">
</head>
<body>
<c:import url="/WEB-INF/views/layout/top.jsp" /> 
 <section id="wrap"> <!-- 본문 시작 -->
 	<div class="container">
 		<div class="headers"> <!-- 제목 -->
                    <h1>주문/결제</h1>
        </div>
       
       	<form> <!-- 보내면 받을 곳 db가 있어야 할 것 같아요 -->
       		<div class="horizontal_box"> <!-- 이용자 배송 관련 정보 -->
       			<div><!-- 타이틀 -->
       				<h2>배송지</h2>
       			</div>
       			<div class="box_rowContents"> <!-- 콘텐츠 좌우정리 -->
       				<label>받으시는 분</label><span>*</span><!-- span은 필수요소 입력 -->
       				<input type="text" name="userName" value="${myInfo.userName}" required/>
       			</div>
				<p></p>
				<div class="zipcode">
					<label>받으실 주소</label><span>*</span>
					<div class="box_rowContents">
						<input type="text" name="userZipcode" id="userZipcode" value="${myInfo.userZipcode}" required/>  <!-- value값 추가 : form 페이지에 보일 수 있게 -->
						<button type ="button" name="searchBtn" onclick=searchZip()>우편번호 찾기</button>
					</div>
					<input type="text" name="userAddress1" id="userAddress1" value="${myInfo.userAddress1}" required/>
					<input type="text" id="userAddress2" name="userAddress2"  value="${myInfo.userAddress2}" required/>
				</div>
				<p></p>
				<div class="phone-number">
	               			<div class="box_rowContents">
	                  <label>전화번호</label><span>*</span>
		                  <input type="tel" name="userPh1" id="userPh1" value="${fn:split(myInfo.userPh,'-')[0]}"  maxlength="3" required/>
		                  -
		                  <input type="tel" name="userPh2" id="userPh2" value="${fn:split(myInfo.userPh,'-')[1]}" maxlength="4" required/>
		                  -
		                  <input type="tel" name="userPh3" id="userPh3" value="${fn:split(myInfo.userPh,'-')[2]}" maxlength="4" required/>
	              			 </div>
	              		</div>
				<div class="box_rowContents"> <!-- 콘텐츠 좌우정리 -->
       				<label>이메일</label><span>*</span>
					<input type="email" name="userEmail" id="userEmail" onchange="emailCheck()"  value="${myInfo.userEmail}" required />
       			</div>
				<p></p>
				<div class="box_rowContents"> <!-- 배송시 유의사항 -->
       				<select id="orderOption">
       					<option value="">--메세지 선택(선택사항)--</option>
       					<option value="배송 전에 미리 연락 부탁드립니다.">배송 전에 미리 연락 부탁드립니다.</option>
       					<option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
       					<option value="부재 시 문 앞에 놓아주세요">부재 시 문 앞에 놓아주세요</option>
       					<option value="안전 배송 부탁드립니다.">안전 배송 부탁드립니다.</option>
       				</select>
       			</div>
       		</div>
       		
       		<div class="horizontal_box"> <!-- 상품 관련 정보 -->
       			<div><!-- 타이틀 -->
       				<h2>주문상품</h2>
       			</div>
       			<table class="productList">
       				<colgroup>  <!-- 테이블 각 칸 길이 조절 -->
		   	    		<col width="100">
		   	    		<col width="*">
		   	    		<col width="143">
	   	    		</colgroup>
	   	    		<tbody class="listBody">
		   	    		
			   	    			<td scope="col" class="itemImage">
		   	    					<a href="<c:url value='/supplyment/detailView/${sup.supNo}'/>"><img class="prdImg" src="data:image/png;base64,${sup.base64SupImg}" width="100" height="100"> </a>
		   	    				</td>
		   	    				<td scope="col" class="itemInfo">
		   	    					 <p>${sup.supName} 테스트 상품명</p>
		   	    					 <p>${sup.supBrand} 예시 브랜드 이름 </p>
		   	    					 <p> 주문 갯수 </p>
		   	    					 <p><fmt:setLocale value="ko_KR"/><fmt:formatNumber type="currency" value="${sup.supPrice}"/> 얼추 가격</p> 
		   	    				</td>
		   	    				<td scope="col" class="itemDelete">
		   	    					<div class="del" href="<c:url value='/member/deleteOrderItem'/>" id="deleteOrderItem" data-prd-id="${prd.prdNo}">
		   	    						<p>삭제</p>
		   	    					</div>
		   	    				</td>
	   	    		</tbody>
	   	    		
       			</table>
       			<div class="title"> <!-- 배송비 영역 -->
	   						<h2>배송비</h2>
	   						<span class="deliveryFee">
	   							<span id="feeFree">0 (무료)</span>
	   						</span>
	   					</div>
	       			<div class="payment"> <!-- 결제수단 영역 -->
	       				<div><!-- 타이틀 -->
	       					<h2>결제수단</h2>
	       				</div>
	       				<select id="payOption">
	       					<option value="">--결제수단 선택(필수)--</option>
	       					<option value="계좌이체">계좌이체</option>
	       					<option value="카카오페이">카카오페이</option>
	       					<option value="TOSS">토스</option>
	       					<option value="기타">기타</option>
	       				</select>
	       			</div>
	       			<div> <!-- 최종 결제 금액 부분 -->
	       				<div> <!-- 타이틀 -->
	       					<h2>결제정보</h2>
	       				</div>
	       				<div> <!-- 내역 부분 -->
	       					<table>
		       					<colgroup>
		       						<col width="155">
		       						<col width="auto">
		       					</colgroup>
		       					<tbody>
		       						<tr>
		       							<th scope="row">주문상품</th>
		       							<td class="right">
		       								<span class="price"> 가격 </span>
		       							</td>
		       						</tr>
		       						<tr class="displayNone">
		       							<th scope="row"> 부가세 </th>
		       							<td class="right">
		       								<span class="price"> 
		       									<span id="부가세 관련 내용">
		       										+얼마
		       									</span> 
		       								</span>
		       							</td>
		       						</tr>
		       						<tr>
		       							<th scope="row">
		       								"배송비"
		       								<span class="displayNoneInfo">(착불 상품 포함)</span>
		       							</th>
		       							<td class="right">
		       								<span class="price"> 
		       									"+"
		       									<span id="총 배송비 관련 내용">
		       										얼마
		       									</span>
		       								</span>
		       							</td>
		       						</tr>
		       						<tr>
		       							<th scope="row">지역별 배송비</th>
		       							<td class="right">
		       								<span class="price">
		       									"+"
		       									<span id="지역 추가 배송비 내용"> 얼마? </span>
		       								</span>
		       							</td>
		       						</tr>
		       						<tr class="discountView">
		       							<th scope="row">
		       								할인/부가결제
		       							</th>
		       							<td class="right">
		       								<span class="price">
		       									<span class="txtRed">
		       									"-"
		       										<span id="할인내역"> 얼마 </span>
		       									</span>
		       								</span>
		       							</td>
		       						</tr>
		       					</tbody>
	       					</table>
	       				</div>
	       			</div>
	       			<div class="totalPaymentPrice">
	       				<h2> 최종 결제 금액 </h2>
	       				<strong class="txtStrong">
	   						<span id="paymentTotalView"> 가격 들어가는 곳</span> 				
	       				</strong>		
	       			</div>
	       			<div class="orderFixItem"> <!-- 결제버튼 -->
	       				<button type="button" class="btnSubmit">
	       					<span> 최종 가격 </span>
	       					<span>원 결제하기</span>
	       				</button>	
	       			</div>
       			</div>
       		</div>
       	</form>
        
 </section>
<c:import url="/WEB-INF/views/layout/footer.jsp" />  <!-- 푸터 삽입 -->
</body>
</html>