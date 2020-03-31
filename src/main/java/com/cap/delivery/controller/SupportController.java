package com.cap.delivery.controller;

import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.ObjectUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;
import com.cap.delivery.model.InquiryValidation;
import com.cap.delivery.model.UserVO;
import com.cap.delivery.service.SupportService;

@Controller
@RequestMapping("/support")
public class SupportController {

	private static final Logger logger = LoggerFactory.getLogger(SupportController.class);
	
	@Autowired
	private InquiryValidation inquiryValidation;
	
	@Resource(name = "uploadPath")
	 private String uploadPath;
	
	@Autowired
	private SupportService supportService;
	
	@RequestMapping(value = "/inquiry", method = RequestMethod.GET)
	public String inquiryViewGET(Model model, HttpSession session) {
		logger.info("고객문의 GET");
		supportService.deleteFile(session, uploadPath);
		model.addAttribute("inquiry", new InquiryVO());
		if(session.getAttribute("login") != null) {
			UserVO userVO = (UserVO) session.getAttribute("login");
			model.addAttribute("loginId", userVO.getUserId());
		}
		return "support/inquiryView";
	}
	
	@RequestMapping(value = "/inquiry", method = RequestMethod.POST)
	public String inquiryViewPOST(@Valid @ModelAttribute("inquiry") InquiryVO inquiryVO, BindingResult result ,Model model, HttpSession session, FileVO fileVO) {
		logger.info("고객문의 POST");
		inquiryValidation.validate(inquiryVO, result);
		if(result.hasErrors()) {
			logger.info("에러검출");
			supportService.deleteFile(session, uploadPath);
			return "support/inquiryView";
		}
		
		if(fileVO.getFileNameArr() != null) {
			for(String temp : fileVO.getFileNameArr()) {
				if(!Pattern.matches("^\\S+.(?i)(jpg|jpeg|png|gif)$",temp)) {
					logger.info("확장자 에러");
					model.addAttribute("error", "이미지 파일만 올릴 수 있습니다.");
					supportService.deleteFile(session, uploadPath);
					return "support/inquiryView";
				}else if (fileVO.getFileNameArr().length > 2){
					logger.info("업로드 개수 에러");
					model.addAttribute("error", "파일은 최대 2개까지 업로드 가능합니다.");
					supportService.deleteFile(session, uploadPath);
					return "support/inquiryView";
				}
			}
		}
		supportService.insertInquiry(inquiryVO, fileVO);
		return "redirect:/";
	}
}
