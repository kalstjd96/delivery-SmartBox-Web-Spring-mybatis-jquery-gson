package com.cap.delivery.model;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class ChangePwdValidation implements Validator{
	
	private static final Logger logger = LoggerFactory.getLogger(ChangePwdValidation.class);

	@Override
	public boolean supports(Class<?> clazz) {
		return ChangePwdVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ChangePwdVO changePwdVO = (ChangePwdVO) target;

		if(changePwdVO.getCurrPwd() == null || changePwdVO.getCurrPwd().trim().isEmpty()) {
			logger.info("마이페이지 현재 비밀번호 입력 에러");
			errors.rejectValue("currPwd", "myinfo.currPwd.required", "현재 비밀번호를 입력해주세요.");
		}
		if(changePwdVO.getNewPwd() == null || changePwdVO.getNewPwd().trim().isEmpty()) {
			logger.info("마이페이지 새 비밀번호 입력 에러");
			errors.rejectValue("newPwd", "myinfo.newPwd.required", "새 비밀번호를 입력해주세요.");
		}
		if(changePwdVO.getNewPwdChk() == null || changePwdVO.getNewPwdChk().trim().isEmpty()) {
			logger.info("마이페이지 확인 비밀번호 입력 에러");
			errors.rejectValue("newPwdChk", "myinfo.newPwdChk.required", "새 비밀번호 확인을 입력해주세요.");
		}
		
		if(!changePwdVO.getNewPwd().equals(changePwdVO.getNewPwdChk()) || !changePwdVO.getNewPwdChk().equals(changePwdVO.getNewPwd())) {
			logger.info("마이페이지 비밀번호 일치 에러");
			errors.rejectValue("newPwdChk", "myinfo.newPwdChk.notEqual", "비밀번호가 일치하치 않습니다.");
		}else if(changePwdVO.getCurrPwd().equals(changePwdVO.getNewPwd())) {
			logger.info("마이페이지 현재 새 비밀번호 일치 에러");
			errors.rejectValue("newPwd", "myinfo.newPwd.equal", "기존 비밀번호와 다른 새 비밀번호를 입력해주세요.");
		}
	}
}
