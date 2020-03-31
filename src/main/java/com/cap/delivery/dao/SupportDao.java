package com.cap.delivery.dao;

import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;

public interface SupportDao {

	void insertInquiry(InquiryVO inquiryVO, FileVO fileVO);
}
