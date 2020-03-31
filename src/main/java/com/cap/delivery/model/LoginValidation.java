package com.cap.delivery.model;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class LoginValidation implements Validator{

	private static final Logger logger = LoggerFactory.getLogger(LoginValidation.class);

	@Override
	public boolean supports(Class<?> clazz) {
		return LoginDto.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		LoginDto loginDto = (LoginDto) target;
		
		if(loginDto.getUserId() == null || loginDto.getUserId().trim().isEmpty()) {
			logger.info("로그인 아이디 미입력 에러");
			errors.rejectValue("userId", "login.userId.required", "아이디를 입력해주세요.");
		}
		else if(!Pattern.matches("^[a-zA-Z0-9]*$", loginDto.getUserId())) {
			logger.info("로그인 아이디 한글 입력 에러");
			errors.rejectValue("userId", "login.userId.pattern", "영문과 숫자만 입력할 수 있습니다.");
		}
		else if(loginDto.getUserId().length() > 20) {
			logger.info("로그인 아이디 20자 초과 에러");
			errors.rejectValue("userId", "login.userId.lengthsize", new Object[]{20}, "최대 20자까지 입력가능합니다.");
		}
		if(loginDto.getUserPwd() == null || loginDto.getUserPwd().trim().isEmpty()) {
			logger.info("비밀번호 미입력 에러");
			errors.rejectValue("userPwd", "login.userPwd.required", "비밀번호를 입력해주세요.");
		}
	}
}
