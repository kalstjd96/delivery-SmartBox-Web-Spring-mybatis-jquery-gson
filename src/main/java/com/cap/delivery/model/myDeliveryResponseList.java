package com.cap.delivery.model;

import java.util.Date;

public class myDeliveryResponseList {

	private String productName;
	private String waybillNum;
	private String senderName;
	private Date processTime;
	private String deliveryStep;
	
	public String getDeliveryStep() {
		return deliveryStep;
	}
	public void setDeliveryStep(String deliveryStep) {
		this.deliveryStep = deliveryStep;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getWaybillNum() {
		return waybillNum;
	}
	public void setWaybillNum(String waybillNum) {
		this.waybillNum = waybillNum;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public Date getProcessTime() {
		return processTime;
	}
	public void setProcessTime(Date processTime) {
		this.processTime = processTime;
	}
	@Override
	public String toString() {
		return "myDeliveryResponseList [productName=" + productName + ", waybillNum=" + waybillNum + ", senderName="
				+ senderName + ", processTime=" + processTime + ", deliveryStep=" + deliveryStep + "]";
	}
}
