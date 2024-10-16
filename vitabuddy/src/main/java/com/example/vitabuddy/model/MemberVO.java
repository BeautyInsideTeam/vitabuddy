package com.example.vitabuddy.model;

public class MemberVO {
<<<<<<< HEAD
	private String userId;
	private String userName;
	private String userPwd;
	private String userEmail;
	private String userPh;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		userPwd = userPwd;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		userEmail = userEmail;
	}
	public String getUserPh() {
		return userPh;
	}
	public void setUserPh(String userPh) {
		userPh = userPh;
	}
	public String getUserZipcode() {
		return userZipcode;
	}
	public void setUserZipcode(String userZipcode) {
		userZipcode = userZipcode;
	}
	public String getUserAddress1() {
		return userAddress1;
	}
	public void setUserAddress1(String userAddress1) {
		userAddress1 = userAddress1;
	}
	public String getUserAddress2() {
		return userAddress2;
	}
	public void setUserAddress2(String userAddress2) {
		userAddress2 = userAddress2;
	}
	
	
=======

	// 1. 멤버필드
	private String userName;
	private String userId;
	private String userPwd;
	private String userEmail;
	private String userPH;
	private String userZipcode;
	private String userAddress1;
	private String userAddress2;

	// 2. VO클래스 초기화
	public MemberVO() {

	}

	// 3. getter & setter
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPH() {
		return userPH;
	}

	public void setUserPH(String userPH) {
		this.userPH = userPH;
	}

	public String getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}

	public String getUserAddress1() {
		return userAddress1;
	}

	public void setUserAddress1(String userAddress1) {
		this.userAddress1 = userAddress1;
	}

	public String getUserAddress2() {
		return userAddress2;
	}

	public void setUserAddress2(String userAddress2) {
		this.userAddress2 = userAddress2;
	}

>>>>>>> merge_features/Login
}
