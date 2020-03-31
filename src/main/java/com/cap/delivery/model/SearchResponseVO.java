package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class SearchResponseVO {
	
	private String waybillNum;
	private String senderName;
	private String receiverName;
	private String productName;

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
	public String getReceiverName() {
		return receiverName;
	}
	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	
	@Override
	public String toString() {
		return "SearchResponseVO [waybillNum=" + waybillNum + ", senderName=" + senderName + ", receiverName="
				+ receiverName + ", productName=" + productName + "]";
	}
}
