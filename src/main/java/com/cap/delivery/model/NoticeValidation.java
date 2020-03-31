package com.cap.delivery.model;

import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


@Component
public class NoticeValidation implements Validator{
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeValidation.class);

	@Override
	public boolean supports(Class<?> clazz) {
		return NoticeVO.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		NoticeVO noticeVO = (NoticeVO) target;
		if(noticeVO.getTitle() == null || noticeVO.getTitle().trim().isEmpty()) {
			logger.info("게시글 제목 미입력 에러");
			errors.rejectValue("title", "notice.title.required", "제목을 입력해주세요.");
		}else if(noticeVO.getTitle().length() > 50) {
			logger.info("게시글 제목 글자수 에러");
			errors.rejectValue("title", "notice.title.lengthsize", new Object[]{50}, "최대 50자까지 가능합니다.");
		}
		if(noticeVO.getDivision() == null || noticeVO.getDivision().trim().isEmpty()) {
			logger.info("게시글 구분 미입력 에러");
			errors.rejectValue("division", "notice.division.required", "올바른 구분을 선택해주세요.");
		}else if(noticeVO.getDivision().equals("0")) {
			logger.info("게시글 구분 선택 에러");
			errors.rejectValue("division", "notice.division.noSelect", "구분을 선택해주세요.");
		}else if(!Pattern.matches("^[1-2]$", noticeVO.getDivision())) {
			logger.info("게시글 구분 패턴 에러");
			errors.rejectValue("division", "notice.division.pattern", "올바른 구분을 선택해주세요.");
		}
		if(noticeVO.getContents() == null || noticeVO.getContents().trim().isEmpty()) {
			logger.info("게시글 내용 미입력 에러");
			errors.rejectValue("contents", "notice.contents.required", "내용을 입력해주세요.");
		}
	}
}
