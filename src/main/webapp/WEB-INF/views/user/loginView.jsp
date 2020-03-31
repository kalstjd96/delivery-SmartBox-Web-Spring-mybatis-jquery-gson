<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="ko">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Clean Blog - Start Bootstrap Theme</title>
  
  <!-- Bootstrap core CSS -->
  <%@ include file="../../include/header.jsp" %>

	<style type="text/css">
	.errormsg {
		color: red;
	}
	</style>
</head>

<body>
  <!-- Navigation -->
  <%@ include file="../../include/nav.jsp" %>
  
  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/courier-services.jpg'); height: 100vh; margin-bottom: 0px;">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading" style="margin-top: 250px; padding: 100px 40px 100px 40px; background: rgba(255, 255, 255, 0.4);">
            <h1 style="margin-bottom: 100px;">TeamAvery</h1>
<!--             <span class="subheading">A Blog Theme by Start Bootstrap</span> -->
			<form:form modelAttribute="loginDto" id="loginForm" action="${pageContext.request.contextPath}/user/login" method="post">
			<div class="control-group">
				<div class="form-group controls">
              		<form:input type="text" cssClass="form-control" placeholder="아이디" path="userId" id="userId" maxlength="20" style="font-size: 1.5rem;"/>
					<small><form:errors path="userId" cssClass="errormsg" /></small>
				</div>
				<div class="form-group controls">
					<form:input type="password" cssClass="form-control" placeholder="비밀번호" path="userPwd" id="userPwd" maxlength="20" style="font-size: 1.5rem;"/>
					<small><form:errors path="userPwd" cssClass="errormsg" /></small>
            	</div>
          	</div>
          	<button class="btn btn-primary" type="submit" style="width:100%; font-size: 25px;"><i class="fas fa-sign-in-alt"></i> 로그인</button>
          	</form:form>
          </div>
        </div>
      </div>
    </div>
  </header>
<!-- Bootstrap core JavaScript -->
<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Custom scripts for this template -->
<script src="${pageContext.request.contextPath}/resources/js/clean-blog.min.js"></script>
  </body>
  </html>