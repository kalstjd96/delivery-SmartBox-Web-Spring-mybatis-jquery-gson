package com.cap.delivery.model;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class MyDeliveryValidation implements Validator{
	
	private static final Logger logger = LoggerFactory.getLogger(MyDeliveryValidation.class);

	@Override
	public boolean supports(Class<?> clazz) {
		return MyDeliveryDto.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MyDeliveryDto myDeliveryDto = (MyDeliveryDto) target;
		if(!(myDeliveryDto.getStartDate().trim().isEmpty() || myDeliveryDto.getStartDate() == null)
				|| !(myDeliveryDto.getEndDate().trim().isEmpty() || myDeliveryDto.getEndDate() == null)) {
			if(!Pattern.matches("^[0-9][0-9][0-9][0-9]\\-[0-9][0-9]\\-[0-9][0-9]$", myDeliveryDto.getStartDate())) {
				logger.info("시작날짜 형식 에러");
				errors.rejectValue("startDate", "mypage.startDate.pattern", "올바른 날짜 형식을 입력해주세요.");
			}
			else if(!Pattern.matches("^[0-9][0-9][0-9][0-9]\\-[0-9][0-9]\\-[0-9][0-9]$", myDeliveryDto.getEndDate())) {
				logger.info("시작날짜 형식 에러");
				errors.rejectValue("endDate", "mypage.endDate.pattern", "올바른 날짜 형식을 입력해주세요.");
			}
		}
	}
}
