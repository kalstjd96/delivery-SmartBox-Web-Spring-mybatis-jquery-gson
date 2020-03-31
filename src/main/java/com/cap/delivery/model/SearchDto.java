package com.cap.delivery.model;

import org.springframework.stereotype.Component;

@Component
public class SearchDto {

	private String waybillNum;
	private String reservationNum;
	private String clickPage;
	private String type;

	public String getWaybillNum() {
		return waybillNum;
	}

	public void setWaybillNum(String waybillNum) {
		this.waybillNum = waybillNum;
	}

	public String getClickPage() {
		return clickPage;
	}

	public void setClickPage(String clickPage) {
		this.clickPage = clickPage;
	}

	public String getReservationNum() {
		return reservationNum;
	}

	public void setReservationNum(String reservationNum) {
		this.reservationNum = reservationNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "SearchDto [waybillNum=" + waybillNum + ", reservationNum=" + reservationNum + ", clickPage=" + clickPage
				+ ", type=" + type + "]";
	}
}
