package com.cap.delivery.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cap.delivery.dao.MypageDao;
import com.cap.delivery.model.ChangePwdVO;
import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;
import com.cap.delivery.model.MyDeliveryDto;
import com.cap.delivery.model.MyinquiryVO;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;
import com.cap.delivery.model.UserInfoVO;
import com.cap.delivery.model.myDeliveryResponseList;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	private MypageDao mypageDao;

	@Override
	public List<myDeliveryResponseList> myDeliveryList(MyDeliveryDto myDeliveryDto) {
		return mypageDao.myDeliveryList(myDeliveryDto);
	}

	@Override
	public SearchResponseVO responseDelivery(String waybillNum) {
		return mypageDao.responseDelivery(waybillNum);
	}

	@Override
	public List<SearchResponseListVO> responseDeliveryList(String waybillNum) {
		return mypageDao.responseDeliveryList(waybillNum);
	}

	@Override
	public UserInfoVO getUserInfo(String userId) {
		return mypageDao.getUserInfo(userId);
	}

	@Override
	public String getUserPwd(String userId) {
		return mypageDao.getUserPwd(userId);
	}
	
	@Override
	public void modifyUserInfo(UserInfoVO userInfoVO) {
		mypageDao.modifyUserInfo(userInfoVO);
	}

	@Override
	public void changePwd(ChangePwdVO changePwdVO) {
		mypageDao.changePwd(changePwdVO);
	}

	@Override
	public List<MyinquiryVO> getMyinquiry(String userId) {
		return mypageDao.getMyinquiry(userId);
	}

	@Override
	public InquiryVO getMyinquiryDetail(String inquiryNo) {
		return mypageDao.getMyinquiryDetail(inquiryNo);
	}

	@Override
	public List<FileVO> getMyinquiryFile(String inquiryNo) {
		return mypageDao.getMyinquiryFile(inquiryNo);
	}
	
}
