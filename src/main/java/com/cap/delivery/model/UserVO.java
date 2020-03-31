package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class UserVO {

	private String userId;
	private String userName;
	private String userPhone;
	
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
	
	@Override
	public String toString() {
		return "UserVO [userId=" + userId + ", userName=" + userName + ", userPhone=" + userPhone + "]";
	}
}
