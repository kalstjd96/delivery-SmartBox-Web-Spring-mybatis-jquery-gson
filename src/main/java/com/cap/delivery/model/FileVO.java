package com.cap.delivery.model;

import java.util.Arrays;

import org.springframework.stereotype.Component;

@Component
public class FileVO {

	private int fileNo;
	private String[] fileLocationArr;
	private String fileLocation;
	private int inquiryNo;
	private String[] fileNameArr;
	private String fileName;
	private long[] fileSizeArr;
	private long fileSize;
	
	public int getFileNo() {
		return fileNo;
	}
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	public String[] getFileLocationArr() {
		return fileLocationArr;
	}
	public void setFileLocationArr(String[] fileLocationArr) {
		this.fileLocationArr = fileLocationArr;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	public int getInquiryNo() {
		return inquiryNo;
	}
	public void setInquiryNo(int inquiryNo) {
		this.inquiryNo = inquiryNo;
	}
	public String[] getFileNameArr() {
		return fileNameArr;
	}
	public void setFileNameArr(String[] fileNameArr) {
		this.fileNameArr = fileNameArr;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public long[] getFileSizeArr() {
		return fileSizeArr;
	}
	public void setFileSizeArr(long[] fileSizeArr) {
		this.fileSizeArr = fileSizeArr;
	}
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	
	@Override
	public String toString() {
		return "FileVO [fileNo=" + fileNo + ", fileLocationArr=" + Arrays.toString(fileLocationArr) + ", fileLocation="
				+ fileLocation + ", inquiryNo=" + inquiryNo + ", fileNameArr=" + Arrays.toString(fileNameArr)
				+ ", fileName=" + fileName + ", fileSizeArr=" + Arrays.toString(fileSizeArr) + ", fileSize=" + fileSize
				+ "]";
	}
}
