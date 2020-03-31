package com.cap.delivery.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cap.delivery.model.ChangePwdVO;
import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;
import com.cap.delivery.model.MyDeliveryDto;
import com.cap.delivery.model.MyinquiryVO;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;
import com.cap.delivery.model.UserInfoVO;
import com.cap.delivery.model.myDeliveryResponseList;

@Repository
public class MypageDaoImpl implements MypageDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<myDeliveryResponseList> myDeliveryList(MyDeliveryDto myDeliveryDto) {
		return sqlSession.selectList("mypageMapper.myDeliveryList", myDeliveryDto);
	}

	@Override
	public SearchResponseVO responseDelivery(String waybillNum) {
		return sqlSession.selectOne("mypageMapper.responseDelivery", waybillNum);
	}

	@Override
	public List<SearchResponseListVO> responseDeliveryList(String waybillNum) {
		return sqlSession.selectList("mypageMapper.responseDeliveryList", waybillNum);
	}

	@Override
	public UserInfoVO getUserInfo(String userId) {
		return sqlSession.selectOne("mypageMapper.getUserInfo", userId);
	}

	@Override
	public String getUserPwd(String userId) {
		return sqlSession.selectOne("mypageMapper.getUserPwd", userId);
	}
	
	@Override
	public void modifyUserInfo(UserInfoVO userInfoVO) {
		sqlSession.update("mypageMapper.modifyUserInfo", userInfoVO);
	}

	@Override
	public void changePwd(ChangePwdVO changePwdVO) {
		sqlSession.update("mypageMapper.changePwd", changePwdVO);
	}

	@Override
	public List<MyinquiryVO> getMyinquiry(String userId) {
		return sqlSession.selectList("mypageMapper.getMyinquiry", userId);
	}

	@Override
	public InquiryVO getMyinquiryDetail(String inquiryNo) {
		return sqlSession.selectOne("mypageMapper.getMyinquiryDetail", inquiryNo);
	}

	@Override
	public List<FileVO> getMyinquiryFile(String inquiryNo) {
		return sqlSession.selectList("mypageMapper.getMyinquiryFile", inquiryNo);
	}

	
}
