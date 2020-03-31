package com.cap.delivery.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class MyinquiryVO {

	private String inquiryType;
	private String title;
	private String waybillNumber;
	private Date regDate;
	private String inquiryStatus;
	private int inquiryNo;

	
	public String getInquiryType() {
		return inquiryType;
	}
	public void setInquiryType(String inquiryType) {
		this.inquiryType = inquiryType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWaybillNumber() {
		return waybillNumber;
	}
	public void setWaybillNumber(String waybillNumber) {
		this.waybillNumber = waybillNumber;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getInquiryStatus() {
		return inquiryStatus;
	}
	public void setInquiryStatus(String inquiryStatus) {
		this.inquiryStatus = inquiryStatus;
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	
	public void deliveryTypeChange(String deliveryType) {
		switch (Integer.parseInt(deliveryType)) {
		case 1:
			this.inquiryType = "배송확인";
			break;
		case 2:
			this.inquiryType = "배송지연";
			break;
		case 3:
			this.inquiryType = "반품확인";
			break;
		case 4:
			this.inquiryType = "반품지연";
			break;
		case 5:
			this.inquiryType = "칭찬";
			break;
		case 6:
			this.inquiryType = "불친절";
			break;
		case 7:
			this.inquiryType = "사고처리";
			break;
		case 8:
			this.inquiryType = "제안";
			break;
		case 9:
			this.inquiryType = "기타";
			break;
		default:
			this.inquiryType = "오류";
			break;
		}
	}
}
