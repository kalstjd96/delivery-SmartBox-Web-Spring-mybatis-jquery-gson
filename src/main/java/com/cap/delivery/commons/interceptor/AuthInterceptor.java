package com.cap.delivery.commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	// 페이지 요청 정보 저장
	private void saveDestination(HttpServletRequest request) {
		/* request.getRequestURI() : 프로젝트와 파일경로까지 얻어온다.
			예) http://localhost:8081/board/list.jsp
     		결과) return: /board/list.jsp
     	*/
		String uri = request.getRequestURI();
		/* 쿼리스트링이란? 데이터를 전달 하기 위한 URL의 일부분, GET방식의 파라미터 전달 문자열이다. URL뒤에 붙는 변수? */
		String query = request.getQueryString();
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("destination : " + (uri+query));
			request.getSession().setAttribute("destination", uri + query);
		}
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute("login") == null) {
			logger.info("current user is not logged");
			saveDestination(request);
			response.sendRedirect("/user/login");
			return false;
		}
		
		return true;
	}
}
