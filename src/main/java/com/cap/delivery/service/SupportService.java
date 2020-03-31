package com.cap.delivery.service;

import javax.servlet.http.HttpSession;

import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;

public interface SupportService {
void deleteFile (HttpSession session, String uploadPath);
void insertInquiry(InquiryVO inquiryVO, FileVO fileVO);
}
