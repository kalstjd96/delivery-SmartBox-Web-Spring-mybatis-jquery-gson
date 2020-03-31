package com.cap.delivery.model;


import org.springframework.stereotype.Component;

@Component
public class MyDeliveryDto {

	private String startDate;
	private String endDate;
	private String loginName;
	private String phone;
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public void setSessionInfo(String userName, String userPhone) {
		this.loginName = userName;
		this.phone = userPhone;
	}
	@Override
	public String toString() {
		return "MyDeliveryDto [startDate=" + startDate + ", endDate=" + endDate + ", loginName=" + loginName
				+ ", phone=" + phone + "]";
	}
}
