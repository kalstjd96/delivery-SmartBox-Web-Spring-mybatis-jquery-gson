package com.cap.delivery.model;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class NoticeVO {

	private Integer noticeNo;
	private String title;
	private String contents;
	private Date regDate;
	private String division;
	
	
	public Integer getNoticeNo() {
		return noticeNo;
	}
	public void setNoticeNo(Integer noticeNo) {
		this.noticeNo = noticeNo;
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
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", title=" + title + ", contents=" + contents + ", regDate=" + regDate
				+ ", division=" + division + "]";
	}
}
