<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
    <div class="container">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/">TeamAvery</a>
      <c:if test="${empty login}">
	  <!--  아이콘 참조     https://fontawesome.com/icons/sign-in-alt?style=solid -->
      <p style="margin: 0px 0px 0px 0px;"><a class="navbar-brand" href="${pageContext.request.contextPath}/user/login" style="font-size: 15px; text-decoration: underline;"><i class="fas fa-sign-in-alt"></i> 로그인</a></p>
      <p style="margin: 0px 0px 0px 0px;"><a class="navbar-brand" href="${pageContext.request.contextPath}/user/signup" style="font-size: 15px; text-decoration: underline;"><i class="fas fa-user-alt"></i> 회원가입</a></p>
      </c:if>
      <c:if test="${not empty login}">
      <div class="d-none d-xs-none d-sm-none d-md-none d-lg-none d-xl-block">
      <p style="margin: 0px 0px 0px 0px; font-size: 15px;" class="navbar-brand" >${login.userId}님 반갑습니다.</p>
      </div>
      <p style="margin: 0px 0px 0px 0px;"><a class="navbar-brand" href="${pageContext.request.contextPath}/mypage/mypage" style="font-size: 15px; text-decoration: underline; margin-right: 0px;"><i class="fas fa-user-cog"></i> 마이페이지</a></p>
      <p style="margin: 0px 0px 0px 0px;"><a class="navbar-brand" href="${pageContext.request.contextPath}/user/logout" style="font-size: 15px; text-decoration: underline; margin-right: 0px;"><i class="fas fa-sign-out-alt"></i> 로그아웃</a></p>
      </c:if>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        Menu
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
<!--           <li class="nav-item"> -->
<%--             <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a> --%>
<!--           </li> -->
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/board/search" style="font-size: 15px;">택배조회</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/board/reservation" style="font-size: 15px;">택배예약</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/support/inquiry" style="font-size: 15px;">고객문의</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath}/notice/list" style="font-size: 15px;">공지사항</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>