package com.cap.delivery.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.cap.delivery.model.LoginDto;
import com.cap.delivery.model.LoginValidation;
import com.cap.delivery.model.SignupDto;
import com.cap.delivery.model.SignupValidation;
import com.cap.delivery.model.UserVO;
import com.cap.delivery.service.UserService;


@RequestMapping("/user")
@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired 
	private LoginValidation loginValidation;
	
	@Autowired
	private SignupValidation signupValidation;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginViewGet(Model model) {
		logger.info("로그인 GET");
		model.addAttribute("loginDto", new LoginDto());
		return "/user/loginView";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginViewPost(@Valid @ModelAttribute("loginDto") LoginDto loginDto, BindingResult result ,Model model, RedirectAttributes redirect) {
		logger.info("로그인 POST");
		loginValidation.validate(loginDto, result);
		if (result.hasErrors()) {
			logger.info("로그인 에러 검출");
			return "/user/loginView"; 
		}

		model.addAttribute("loginDto", loginDto);
		return "forward:loginSuccess";
	}
	
	@RequestMapping(value = "/loginSuccess")
	public void loginSuccess(@ModelAttribute("loginDto") LoginDto loginDto, BindingResult result, Model model) {
		logger.info(loginDto.toString());
		
		String dbPwd = userService.login(loginDto.getUserId());
		if(dbPwd == null || !BCrypt.checkpw(loginDto.getUserPwd(), dbPwd)) {
			logger.info("로그인 실패");
			return ;
		}else {
		logger.info("로그인 성공");
		UserVO userVO = userService.sessionRegister(loginDto);
		model.addAttribute("userVO", userVO);
		}
		//return "/user/loginView";
//		[추후에 시간남으면 해야할듯] Java: Client -> Server 데이터 전송시 RSA 암호화 (Spring MVC, JSP) <https://vip00112.tistory.com/40>
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession httpSession) {
		logger.info("로그아웃");
		Object object = httpSession.getAttribute("login");	//해당 세션 속성명 값을 Object 타입으로 리턴, 없을 경우 null
		if( object != null) {
			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("login");	//login 세션  제거
			httpSession.invalidate();	// 현재 생성된 세션 무효화
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
			if(loginCookie != null) {	// 로그인 유지를 선택했을 경우 loginCookie 값을 초기화
				loginCookie.setPath("/");	//쿠키의 유효한 디렉토리 설정
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
//				userService.keepLogin(userVO.getUser_id(), null, null);	// DB에 저장한 세션아이디와 자동로그인 유지기간 초기화
			}
		}
		return "/user/logoutView";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signupViewGet(Model model) {
		logger.info("회원가입 GET");
		model.addAttribute("signupDto", new SignupDto());
		return "/user/signupView";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signupViewPost(@Valid @ModelAttribute("signupDto") SignupDto signupDto, BindingResult result ,Model model) {
		logger.info("회원가입 POST");
		logger.info("값 들어온거: "+signupDto.toString());
		signupValidation.validate(signupDto, result);
		if (result.hasErrors()) {
			logger.info("회원가입 에러 검출");
			model.addAttribute("reloadForm",signupDto);
			return "/user/signupView"; 
		}
		logger.info("toString:"+signupDto.toString());
		
		String hashPw = BCrypt.hashpw(signupDto.getUserPwd(), BCrypt.gensalt());
		signupDto.setUserPwd(hashPw);
		
		userService.insertSignup(signupDto);
		return "redirect: /index";
	}
	
	
	//	ajax부분
	@ResponseBody
	@RequestMapping(value = "/ajaxChkId", method = RequestMethod.POST)
	public String signupChkId(@RequestParam("inputId") String inputId) {
		if(userService.ajaxChkId(inputId) == 0)
			return "YES";
		else {
			return "NO";
		}
	}
}
