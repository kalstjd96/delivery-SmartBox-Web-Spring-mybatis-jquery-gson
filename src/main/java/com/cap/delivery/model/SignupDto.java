package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class SignupDto {

	private Integer memberNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userBirthYear;
	private String userBirthMonth;
	private String userBirthDay;
	private String userEmail1;
	private String userEmail2;
	private String userPhone;
	private String postCode;
	private String addr1;
	private String addr2;
	
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getAddr2() {
		return addr2;
	}
	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}
	public String getUserEmail1() {
		return userEmail1;
	}
	public void setUserEmail1(String userEmail1) {
		this.userEmail1 = userEmail1;
	}
	public String getUserEmail2() {
		return userEmail2;
	}
	public void setUserEmail2(String userEmail2) {
		this.userEmail2 = userEmail2;
	}
	public String getUserBirthYear() {
		return userBirthYear;
	}
	public void setUserBirthYear(String userBirthYear) {
		this.userBirthYear = userBirthYear;
	}
	public String getUserBirthMonth() {
		return userBirthMonth;
	}
	public void setUserBirthMonth(String userBirthMonth) {
		this.userBirthMonth = userBirthMonth;
	}
	public String getUserBirthDay() {
		return userBirthDay;
	}
	public void setUserBirthDay(String userBirthDay) {
		this.userBirthDay = userBirthDay;
	}
	public Integer getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(Integer memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "SignupDto [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", userBirthYear="
				+ userBirthYear + ", userBirthMonth=" + userBirthMonth + ", userBirthDay=" + userBirthDay
				+ ", userEmail1=" + userEmail1 + ", userEmail2=" + userEmail2 + ", userPhone=" + userPhone
				+ ", postCode=" + postCode + ", addr1=" + addr1 + ", addr2=" + addr2 + "]";
	}
}