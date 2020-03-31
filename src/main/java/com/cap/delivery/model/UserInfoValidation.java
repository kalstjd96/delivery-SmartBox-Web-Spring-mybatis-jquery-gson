package com.cap.delivery.model;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class UserInfoValidation implements Validator{
	
	private static final Logger logger = LoggerFactory.getLogger(UserInfoValidation.class);

	@Override
	public boolean supports(Class<?> clazz) {
		return UserInfoVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserInfoVO userInfoVO = (UserInfoVO) target;

		if(userInfoVO.getUserPwd() == null || userInfoVO.getUserPwd().trim().isEmpty()) {
			logger.info("마이페이지 비밀번호 입력 에러");
			errors.rejectValue("userPwd", "myinfo.userPwd.required", "비밀번호를 입력해주세요.");
		}
		if((userInfoVO.getUserEmail1() == null || userInfoVO.getUserEmail1().trim().isEmpty()) || (userInfoVO.getUserEmail2() == null || userInfoVO.getUserEmail2().trim().isEmpty())) {
			logger.info("마이페이지 이메일 미입력 에러");
			errors.rejectValue("userEmail2", "myinfo.userEmail.required", "이메일을 입력해주세요.");
		}else if((!Pattern.matches("^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*$", userInfoVO.getUserEmail1())) || (!Pattern.matches("^[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}$", userInfoVO.getUserEmail2()))) {
			logger.info("마이페이지 이메일 입력 에러");
			errors.rejectValue("userEmail2", "myinfo.userEmail.pattern", "올바른 형식의 이메일을 입력해주세요.");
		}
		if(userInfoVO.getUserPhone() == null || userInfoVO.getUserPhone().trim().isEmpty()) {
			logger.info("마이페이지 전화번호 미입력 에러");
			errors.rejectValue("userPhone", "myinfo.userPhone.required", "전화번호를 입력해주세요.");
		}else if(!Pattern.matches("^\\d{3}-\\d{3,4}-\\d{4}$", userInfoVO.getUserPhone())) {
			logger.info("마이페이지 전화번호 입력 에러");
			errors.rejectValue("userPhone", "myinfo.userPhone.pattern", "올바른 형식의 전화번호를 입력해주세요.");
		}
		if((userInfoVO.getPostCode() == null || userInfoVO.getPostCode().trim().isEmpty()) ||
				(userInfoVO.getAddr1() == null || userInfoVO.getAddr1().trim().isEmpty()) ||
				(userInfoVO.getAddr2() == null || userInfoVO.getAddr2().trim().isEmpty())) {
			logger.info("마이페이지 주소 미입력 에러");
			errors.rejectValue("addr2", "myinfo.addr.required", "주소를 입력해주세요.");
		}
	}
}
