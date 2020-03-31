package com.cap.delivery.service;

import com.cap.delivery.model.LoginDto;
import com.cap.delivery.model.SignupDto;
import com.cap.delivery.model.UserVO;

public interface UserService {
	int ajaxChkId(String inputId);
	String login(String userId);
	UserVO sessionRegister(LoginDto loginDto);
	void insertSignup(SignupDto signupDto);
}
