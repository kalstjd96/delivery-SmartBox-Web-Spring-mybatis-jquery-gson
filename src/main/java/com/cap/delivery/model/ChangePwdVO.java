package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class ChangePwdVO {

	private String userId;
	private String currPwd;
	private String newPwd;
	private String newPwdChk;

	
	public String getCurrPwd() {
		return currPwd;
	}
	public void setCurrPwd(String currPwd) {
		this.currPwd = currPwd;
	}
	public String getNewPwd() {
		return newPwd;
	}
	public void setNewPwd(String newPwd) {
		this.newPwd = newPwd;
	}
	public String getNewPwdChk() {
		return newPwdChk;
	}
	public void setNewPwdChk(String newPwdChk) {
		this.newPwdChk = newPwdChk;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}
