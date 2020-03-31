package com.cap.delivery.model;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

@Component
public class InquiryValidation implements Validator{

	private static final Logger logger = LoggerFactory.getLogger(InquiryValidation.class);
	
	@Override
	public boolean supports(Class<?> clazz) {
		return InquiryVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		InquiryVO inquiryVO = (InquiryVO) target;
		
		if(inquiryVO.getWaybillNum() == null || inquiryVO.getWaybillNum().trim().isEmpty()) {
			logger.info("고객문의 운송장 미입력 에러");
			errors.rejectValue("waybillNum", "support.waybillNum.required", "운송장 번호를 입력해주세요.");
		}else if(!Pattern.matches("^[0-9]*$", inquiryVO.getWaybillNum())) {
			logger.info("고객문의 운송장 입력 에러");
			errors.rejectValue("waybillNum", "support.waybillNum.pattern", "숫자만 입력가능합니다.");
		}else if(inquiryVO.getWaybillNum().length() != 12) {
			errors.rejectValue("waybillNum", "support.waybillNum.lengthsize", new Object[]{12}, "운송장 12자를 입력해주세요.");
		}
		if(inquiryVO.getName() == null || inquiryVO.getName().trim().isEmpty()) {
			logger.info("고객문의 이름 미입력 에러");
			errors.rejectValue("name", "support.name.required", "이름을 입력해주세요.");
		}else if(!Pattern.matches("^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$", inquiryVO.getName())) {
			logger.info("고객문의 이름 입력 에러");
			errors.rejectValue("name", "support.name.pattern", "한글만 입력해주세요.");
		}
		if(inquiryVO.getPhone() == null || inquiryVO.getPhone().trim().isEmpty()) {
			logger.info("회원가입 전화번호 미입력 에러");
			errors.rejectValue("phone", "support.phone.required", "전화번호를 입력해주세요.");
		}else if(!Pattern.matches("^\\d{3}-\\d{3,4}-\\d{4}$", inquiryVO.getPhone())) {
			logger.info("회원가입 전화번호 입력 에러");
			errors.rejectValue("phone", "support.phone.pattern", "올바른 형식의 전화번호를 입력해주세요.");
		}
		if((inquiryVO.getPostCode() == null || inquiryVO.getPostCode().trim().isEmpty()) ||
				(inquiryVO.getAddr1() == null || inquiryVO.getAddr1().trim().isEmpty()) ||
				(inquiryVO.getAddr2() == null || inquiryVO.getAddr2().trim().isEmpty())) {
			logger.info("고객문의 주소 미입력 에러");
			errors.rejectValue("addr2", "support.addr.required", "주소를 입력해주세요.");
		}
		if(inquiryVO.getInquiryType() == null || inquiryVO.getInquiryType().trim().isEmpty()) {
			logger.info("고객문의 유형 미입력 에러");
			errors.rejectValue("inquiryType", "support.inquiryType.required", "올바른 유형을 선택해주세요.");
		}else if(inquiryVO.getInquiryType().equals("0")) {
			logger.info("고객문의 미선택 에러");
			errors.rejectValue("inquiryType", "support.inquiryType.noSelect", "구분을 선택해주세요.");
		}else if(!Pattern.matches("^[1-9]$", inquiryVO.getInquiryType())) {
			logger.info("고객문의 유형 선택 에러");
			errors.rejectValue("inquiryType", "support.inquiryType.pattern", "올바른 유형을 선택해주세요.");
		}
		if(inquiryVO.getProductName() == null || inquiryVO.getProductName().trim().isEmpty()) {
			logger.info("고객문의 제품명 미입력 에러");
			errors.rejectValue("productName", "support.productName.required", "물품명을 입력해주세요.");
		}else if(!Pattern.matches("^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$", inquiryVO.getProductName())) {
			logger.info("고객문의 제품명 입력 에러");
			errors.rejectValue("productName", "support.productName.pattern", "한글만 입력해주세요.");
		}
		if(inquiryVO.getTitle() == null || inquiryVO.getTitle().trim().isEmpty()) {
			logger.info("고객문의 제목 미입력 에러");
			errors.rejectValue("title", "support.title.required", "제목을 입력해주세요.");
		}
		if(inquiryVO.getContents() == null || inquiryVO.getContents().trim().isEmpty()) {
			logger.info("고객문의 내용 미입력 에러");
			errors.rejectValue("contents", "support.contents.required", "내용을 입력해주세요.");
		}
	}
}
