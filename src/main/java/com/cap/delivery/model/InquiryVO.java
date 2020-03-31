package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class InquiryVO {

	private String inquiryNo;
	private String waybillNum;
	private String name;
	private String phone;
	private String postCode;
	private String addr1;
	private String addr2;
	private String inquiryType;
	private String productName;
	private String title;
	private String contents;
	private String loginId;
	
	public String getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(String inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String getWaybillNum() {
		return waybillNum;
	}
	public void setWaybillNum(String waybillNum) {
		this.waybillNum = waybillNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}
	
	@Override
	public String toString() {
		return "InquiryVO [inquiryNo=" + inquiryNo + ", waybillNum=" + waybillNum + ", name=" + name + ", phone="
				+ phone + ", postCode=" + postCode + ", addr1=" + addr1 + ", addr2=" + addr2 + ", inquiryType="
				+ inquiryType + ", productName=" + productName + ", title=" + title + ", contents=" + contents
				+ ", loginId=" + loginId + "]";
	}
	
}
