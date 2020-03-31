package com.cap.delivery.service;

import java.util.List;

import com.cap.delivery.model.ChangePwdVO;
import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;
import com.cap.delivery.model.MyDeliveryDto;
import com.cap.delivery.model.MyinquiryVO;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;
import com.cap.delivery.model.UserInfoVO;
import com.cap.delivery.model.myDeliveryResponseList;

public interface MypageService {
	List<myDeliveryResponseList> myDeliveryList(MyDeliveryDto myDeliveryDto);
	SearchResponseVO responseDelivery(String waybillNum);
	List<SearchResponseListVO> responseDeliveryList(String waybillNum);
	UserInfoVO getUserInfo(String userId);
	String getUserPwd(String userId);
	void modifyUserInfo(UserInfoVO userInfoVO);
	void changePwd(ChangePwdVO changePwdVO);
	List<MyinquiryVO> getMyinquiry(String userId);
	InquiryVO getMyinquiryDetail(String inquiryNo);
	List<FileVO> getMyinquiryFile(String inquiryNo);
}
