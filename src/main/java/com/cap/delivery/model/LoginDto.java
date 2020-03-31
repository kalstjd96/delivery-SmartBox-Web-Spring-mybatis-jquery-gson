package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class LoginDto {

	private String userId;
	private String userPwd;
	private boolean useCookie;
	
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
	public boolean isUseCookie() {
		return useCookie;
	}
	public void setUseCookie(boolean useCookie) {
		this.useCookie = useCookie;
	}
	
	@Override
	public String toString() {
		return "LoginDto [userId=" + userId + ", userPwd=" + userPwd + ", useCookie=" + useCookie + "]";
	}
}
