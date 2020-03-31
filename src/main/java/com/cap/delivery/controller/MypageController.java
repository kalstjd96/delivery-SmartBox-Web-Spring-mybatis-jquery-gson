package com.cap.delivery.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cap.delivery.model.ChangePwdVO;
import com.cap.delivery.model.ChangePwdValidation;
import com.cap.delivery.model.FileVO;
import com.cap.delivery.model.InquiryVO;
import com.cap.delivery.model.MyDeliveryDto;
import com.cap.delivery.model.MyDeliveryValidation;
import com.cap.delivery.model.MyinquiryVO;
import com.cap.delivery.model.SearchResponseListVO;
import com.cap.delivery.model.SearchResponseVO;
import com.cap.delivery.model.UserInfoVO;
import com.cap.delivery.model.UserInfoValidation;
import com.cap.delivery.model.UserVO;
import com.cap.delivery.model.myDeliveryResponseList;
import com.cap.delivery.service.MypageService;



@RequestMapping("/mypage")
@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	private MypageService mypageService;
	
	@Autowired
	private MyDeliveryValidation myDeliveryValidation;
	
	@Autowired
	private UserInfoValidation userInfoValidation;
	
	@Autowired
	private ChangePwdValidation changePwdValidation; 
	
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String mypageViewGET() {
		return "mypage/mypageView";
	}
	
	@RequestMapping(value = "/mydelivery", method = RequestMethod.GET)
	public String mydeliveryGET(Model model, HttpSession session, MyDeliveryDto myDeliveryDto) {
		logger.info("mypage 내 운송장 GET");
		UserVO userVO = (UserVO)session.getAttribute("login");
		myDeliveryDto.setSessionInfo(userVO.getUserName(),userVO.getUserPhone()); 
		List<myDeliveryResponseList> response = mypageService.myDeliveryList(myDeliveryDto);
		
		model.addAttribute("myDelivery", myDeliveryDto);
		model.addAttribute("responseList", response);
		return "/mypage/myDeliveryView";
	}
	
	@RequestMapping(value = "/mydelivery", method = RequestMethod.POST)
	public String mydeliveryPOST(@Valid @ModelAttribute("myDelivery") MyDeliveryDto myDeliveryDto, BindingResult result, Model model, @RequestParam(value="dateBtn") String clickBtn) {
		logger.info("mypage 내 운송장 POST");
		myDeliveryValidation.validate(myDeliveryDto, result);
		if(result.hasErrors()) {
			logger.info("에러 검출");
			return "/mypage/myDeliveryView";
		}
		List<myDeliveryResponseList> response = mypageService.myDeliveryList(myDeliveryDto);
		model.addAttribute("responseList", response);
		model.addAttribute("activeBtn",clickBtn);
		return "/mypage/myDeliveryView";
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfoViewGET(Model model, HttpSession session) {
		logger.info("mypage 정보수정 GET");
		UserVO userVO = (UserVO)session.getAttribute("login");
		UserInfoVO userinfo = mypageService.getUserInfo(userVO.getUserId());
		userinfo.emailDivide(userinfo.getUserEmail());
		userinfo.birthChange(userinfo.getUserBirth());
		
		model.addAttribute("userinfo", userinfo);
		model.addAttribute("changePwd", new ChangePwdVO());
		return "mypage/myinfoView";
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.POST)
	public String myinfoViewPOST(@ModelAttribute("userinfo") UserInfoVO userInfoVO, BindingResult result, Model model, HttpSession session, RedirectAttributes redirect) {
		logger.info("mypage 정보수정 POST");
		UserVO userVO = (UserVO)session.getAttribute("login");
		userInfoValidation.validate(userInfoVO, result);
		if(result.hasErrors()) {
			logger.info("에러 검출");
			model.addAttribute("changePwd", new ChangePwdVO());
			return "mypage/myinfoView";
		}
		if(!BCrypt.checkpw(userInfoVO.getUserPwd(), mypageService.getUserPwd(userVO.getUserId()))){
			model.addAttribute("msg","비밀번호를 확인해주세요.");
			model.addAttribute("changePwd", new ChangePwdVO());
			return "mypage/myinfoView";
		}
		System.out.println(userInfoVO.toString());
		userInfoVO.setUserId(userVO.getUserId());
		userVO.setUserPhone(userInfoVO.getUserPhone());
		session.setAttribute("login", userVO);
		mypageService.modifyUserInfo(userInfoVO);
		redirect.addFlashAttribute("msg", "정보 수정이 완료되었습니다.");
		return "redirect:/mypage/myinfo";
	}
	
	@RequestMapping(value = "/changePwd", method = RequestMethod.POST)
	public String changePwdPOST(@Valid @ModelAttribute("changePwd") ChangePwdVO changePwdVO, BindingResult result, Model model, HttpSession session, RedirectAttributes redirect) {
		logger.info("mypage 비밀번호 수정 POST");
		UserVO userVO = (UserVO)session.getAttribute("login");
		changePwdValidation.validate(changePwdVO, result);
		if(result.hasErrors()) {
			UserInfoVO userinfo = mypageService.getUserInfo(userVO.getUserId());
			userinfo.emailDivide(userinfo.getUserEmail());
			userinfo.birthChange(userinfo.getUserBirth());
			
			model.addAttribute("userinfo", userinfo);
			return "mypage/myinfoView";
		}
		if(!BCrypt.checkpw(changePwdVO.getCurrPwd(), mypageService.getUserPwd(userVO.getUserId()))){
			UserInfoVO userinfo = mypageService.getUserInfo(userVO.getUserId());
			userinfo.emailDivide(userinfo.getUserEmail());
			userinfo.birthChange(userinfo.getUserBirth());
			
			model.addAttribute("userinfo", userinfo);
			model.addAttribute("msg","비밀번호를 확인해주세요.");
			return "mypage/myinfoView";
		}
		changePwdVO.setUserId(userVO.getUserId());
		changePwdVO.setNewPwd(BCrypt.hashpw(changePwdVO.getNewPwd(), BCrypt.gensalt()));
		mypageService.changePwd(changePwdVO);
		redirect.addFlashAttribute("msg", "비밀번호 수정이 완료되었습니다.");
		return "redirect:/mypage/myinfo";
	}
	
	@RequestMapping(value = "/myinquiry", method = RequestMethod.GET)
	public String myinquiryViewGET(Model model, HttpSession session) {
		UserVO userVO = (UserVO)session.getAttribute("login");
		List<MyinquiryVO> myinquiryVO = mypageService.getMyinquiry(userVO.getUserId());
		for(MyinquiryVO my : myinquiryVO) {
			my.deliveryTypeChange(my.getInquiryType());
		}
		model.addAttribute("responseList", myinquiryVO);
		return "mypage/myinquiryView";
	}
	
	//	ajax 부분
	@ResponseBody
	@RequestMapping(value = "/mydeliveryDetail", method = RequestMethod.POST)
	public HashMap<String, Object> ajaxMydeliveryDeliveryPOST(@RequestBody String reciveData) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject)jsonParser.parse(reciveData);
		String waybillNum = (String) jsonObj.get("waybillNum");
		SearchResponseVO response = mypageService.responseDelivery(waybillNum);
		List<SearchResponseListVO> responseList = mypageService.responseDeliveryList(waybillNum);
		
		map.put("response", response);
		map.put("responseList", responseList);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value = "/myinquiryDetail", method = RequestMethod.POST)
	public HashMap<String, Object> ajaxMyinquiryDeliveryPOST(@RequestBody String reciveData) throws Exception {
		HashMap<String, Object> map = new HashMap<String, Object>();
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonObj = (JSONObject)jsonParser.parse(reciveData);
		String inquiryNo = (String) jsonObj.get("inquiryNo");
		InquiryVO inquiryVO = mypageService.getMyinquiryDetail(inquiryNo);
		List<FileVO> fileList = mypageService.getMyinquiryFile(inquiryNo);
		
		map.put("response", inquiryVO);
		map.put("responseList", fileList);
		return map;
	}
	
	
}
