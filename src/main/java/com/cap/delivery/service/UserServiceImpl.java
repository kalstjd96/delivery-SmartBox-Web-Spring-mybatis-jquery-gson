package com.cap.delivery.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cap.delivery.dao.UserDao;
import com.cap.delivery.model.LoginDto;
import com.cap.delivery.model.SignupDto;
import com.cap.delivery.model.UserVO;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	@Override
	public int ajaxChkId(String inputId) {
		return userDao.ajaxChkId(inputId);
	}

	@Override
	public void insertSignup(SignupDto signupDto) {
		userDao.insertSignup(signupDto);
	}

	@Override
	public UserVO sessionRegister(LoginDto loginDto) {
		return userDao.sessionRegister(loginDto);
	}

	@Override
	public String login(String userId) {
		return userDao.login(userId);
	}

}
