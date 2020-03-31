package com.cap.delivery.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class UserInfoVO {

	private String userId;
	private String userName;
	private String userPhone;
	private String userPwd;
	private Date userBirth;
	private String userBirthDay;
	private String userEmail;
	private String userEmail1;
	private String userEmail2;
	private String postCode;
	private String addr1;
	private String addr2;
	private Date joinDate;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
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
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserBirthDay() {
		return userBirthDay;
	}
	public void setUserBirthDay(String userBirthDay) {
		this.userBirthDay = userBirthDay;
	}
	
	public void emailDivide(String userEmail) {
		String tempEmail[] = userEmail.split("@");
		this.userEmail1 = tempEmail[0];
		this.userEmail2 = tempEmail[1];
	}
	
	public void birthChange(Date userBirth) {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd");
		this.userBirthDay = fmt.format(userBirth);
	}
	
	@Override
	public String toString() {
		return "UserInfoVO [userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone + ", userPwd="
				+ userPwd + ", userBirth=" + userBirth + ", userBirthDay=" + userBirthDay + ", userEmail=" + userEmail
				+ ", userEmail1=" + userEmail1 + ", userEmail2=" + userEmail2 + ", postCode=" + postCode + ", addr1="
				+ addr1 + ", addr2=" + addr2 + ", joinDate=" + joinDate + "]";
	}
}
