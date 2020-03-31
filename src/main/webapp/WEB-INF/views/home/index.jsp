<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/courier-services.jpg');">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="site-heading">
            <h1>운송장 조회</h1>
<!--             <span class="subheading">A Blog Theme by Start Bootstrap</span> -->
			<form:form modelAttribute="searchDto" id="searchForm" method="post" action="${pageContext.request.contextPath}/board/search">
			<div class="control-group">
				<div class="form-group controls">
              		<form:input type="text" cssClass="form-control" placeholder="Search" path="waybillNum" id="waybillNum" maxlength="12" />
<!--               		<p class="help-block text-danger"></p> -->
					<small><form:errors path="waybillNum" cssClass="errormsg" /></small>
					<form:hidden path="clickPage" value="index"/>
					<form:hidden path="type" value="waybillNum"/>
            	</div>
          	</div>
          	<button class="btn btn-primary" type="submit" style="width:100%">검색</button>
          	</form:form>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-8 col-md-10 mx-auto">
        <c:forEach items="${noticeList}" var="notice">
        <div class="post-preview">
          <a href="/notice/read?noticeNo=${notice.noticeNo}">
            <p class="post-subtitle">
              	<h4>${notice.division}</h4>
            </p>
            <span class="post-title">
              	${notice.title}
            </span>
          </a>
          <p class="post-meta"><fmt:formatDate value="${notice.regDate}" pattern="YYYY년 M월 d일"/></p>
        </div>
        <hr>
        </c:forEach>
        <!-- Pager -->
        <div class="clearfix">
          <a class="btn btn-primary float-right" href="/notice/list">더보기 &rarr;</a>
        </div>
      </div>
    </div>
  </div>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
</body>
</html>