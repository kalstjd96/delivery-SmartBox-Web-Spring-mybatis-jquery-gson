package com.cap.delivery.model;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class ReservationValidation implements Validator{
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationValidation.class);

	@Override
	public boolean supports(Class<?> clazz) {
		return ReservationDto.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ReservationDto reservationDto = (ReservationDto) target;
		
		if(reservationDto.getSenderName() == null || reservationDto.getSenderName().trim().isEmpty()) {
			logger.info("보내는 사람 이름 에러");
			errors.rejectValue("senderName", "reservation.senderName.required", "보내는 분의 이름을 입력해주세요.");
		}
		if(!Pattern.matches("^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$", reservationDto.getSenderName())) {
			logger.info("보내는 사람 이름 한글 미입력");
			errors.rejectValue("senderName", "reservation.senderName.pattern", "이름에 한글만 입력해주세요.");
		}
		if(reservationDto.getSenderPhone() == null || reservationDto.getSenderPhone().trim().isEmpty()) {
			logger.info("보내는 사람 핸드폰 에러");
			errors.rejectValue("senderPhone", "reservation.senderPhone.required", "보내는 분의 핸드폰 번호를 입력해주세요.");
		}
		if(!Pattern.matches("^[0-9]*$", reservationDto.getSenderPhone())) {
			logger.info("보내는 사람 핸드폰 숫자 미입력");
			errors.rejectValue("senderPhone", "reservation.senderPhone.pattern", "핸드폰 번호에 숫자만 입력해주세요.");
		}
		if((reservationDto.getSenderPostCode() == null || reservationDto.getSenderPostCode().trim().isEmpty()) ||
				(reservationDto.getSenderAddr1() == null || reservationDto.getSenderAddr1().trim().isEmpty()) ||
				(reservationDto.getSenderAddr2() == null || reservationDto.getSenderAddr2().trim().isEmpty())) {
			logger.info("보내는 사람 주소 에러");
			errors.rejectValue("senderAddr2", "reservation.senderAddr.required", "주소를 입력해주세요.");
		}
		
		
		if(reservationDto.getReceiverName() == null || reservationDto.getReceiverName().trim().isEmpty()) {
			logger.info("보내는 사람 이름 에러");
			errors.rejectValue("receiverName", "reservation.receiverName.required", "보내는 분의 이름을 입력해주세요.");
		}
		if(!Pattern.matches("^[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]*$", reservationDto.getReceiverName())) {
			logger.info("보내는 사람 이름 한글 미입력");
			errors.rejectValue("receiverName", "reservation.receiverName.pattern", "이름에 한글만 입력해주세요.");
		}
		if(reservationDto.getReceiverPhone() == null || reservationDto.getReceiverPhone().trim().isEmpty()) {
			logger.info("받는 사람 핸드폰 에러");
			errors.rejectValue("receiverPhone", "reservation.receiverPhone.required", "보내는 분의 핸드폰 번호를 입력해주세요.");
		}
		if(!Pattern.matches("^[0-9]*$", reservationDto.getReceiverPhone())) {
			logger.info("받는 사람 핸드폰 숫자 미입력");
			errors.rejectValue("receiverPhone", "reservation.receiverPhone.pattern", "숫자만 입력해주세요.");
		}
		if((reservationDto.getReceiverPostCode() == null || reservationDto.getReceiverPostCode().trim().isEmpty()) ||
				(reservationDto.getReceiverAddr1() == null || reservationDto.getReceiverAddr1().trim().isEmpty()) ||
				(reservationDto.getReceiverAddr2() == null || reservationDto.getReceiverAddr2().trim().isEmpty())) {
			logger.info("받는 사람 주소 에러");
			errors.rejectValue("receiverAddr2", "reservation.receiverAddr.required", "받는 분의 주소를 입력해주세요.");
		}
		
		if(reservationDto.getCourierCode() == 0) {
			logger.info("택배회사 선택 에러");
			errors.rejectValue("courierCode", "reservation.courierCode.noSelect", "택배회사를 선택해주세요.");
		}
		if(reservationDto.getDateOfVisit().equals("0")) {
			logger.info("방문날짜 선택 에러");
			errors.rejectValue("dateOfVisit", "reservation.dateOfVisit.noSelect", "방문날짜를 선택해주세요.");
		}
		if(reservationDto.getSenderReq().length() > 25) {
			logger.info("특이사항 크기 에러");
			errors.rejectValue("senderReq", "reservation.senderReq.lengthsize", new Object[]{25},"최대 25자 까지 입력가능합니다.");
		}
		if(reservationDto.getFareCategoryCode() == 0) {
			logger.info("운임 선택 에러");
			errors.rejectValue("fareCategoryCode", "reservation.fareCategoryCode.noSelect", "운임방식을 선택해주세요.");
		}else if(!Pattern.matches("^[1-2]*$", Integer.toString(reservationDto.getFareCategoryCode()))) {
			logger.info("운임 데이터 변조 에러");
			errors.rejectValue("fareCategoryCode", "reservation.fareCategoryCode.modulate", "올바른 데이터를 넣어주세요.");
		}
		if(reservationDto.getProductName() == null || reservationDto.getProductName().trim().isEmpty()) {
			logger.info("상품명 미입력 에러");
			errors.rejectValue("productName", "reservation.productName.required", "상품명을 입력해주세요.");
		}
		if(reservationDto.getProductPrice() == null || reservationDto.getProductPrice().toString().trim().isEmpty()) {
			logger.info("상품가격 미입력 에러");
			errors.rejectValue("productPrice", "reservation.productPrice.required", "상품가격을 입력해주세요.");
		}else if(!Pattern.matches("^[0-9]*$", reservationDto.getProductPrice())) {
			logger.info("상품가격 글자입력 에러");
			errors.rejectValue("productPrice", "reservation.productPrice.pattern", "숫자만 입력해주세요");
		}
		if(reservationDto.getProductWeight() == 0) {
			logger.info("상품 부피 선택 에러");
			errors.rejectValue("productWeight", "reservation.productWeight.noSelect", "상품부피를 선택해주세요.");
		}
		if(reservationDto.getFreightCost() == null || reservationDto.getFreightCost().toString().trim().isEmpty()) {
			logger.info("예상운임 미입력 에러");
			errors.rejectValue("freightCost", "reservation.freightCost.noSelect", "예상운임을 계산해주세요.");
		}else if(!Pattern.matches("^[0-9]*$", reservationDto.getFreightCost().toString())) {
			logger.info("예상운임 글자입력 에러");
			errors.rejectValue("freightCost", "reservation.freightCost.pattern", "숫자만 입력해주세요");
		}else if(!reservationDto.getFreightCost().equals("4000") && !reservationDto.getFreightCost().equals("6000") && !reservationDto.getFreightCost().equals("7000") && !reservationDto.getFreightCost().equals("8000")) {
			logger.info("예상운임 데이터 변조 에러");
			errors.rejectValue("freightCost", "reservation.freightCost.modulate", "올바른 데이터를 넣어주세요.");
		}
	}
}
