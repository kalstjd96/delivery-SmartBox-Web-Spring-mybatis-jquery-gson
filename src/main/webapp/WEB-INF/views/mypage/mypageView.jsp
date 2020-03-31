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
	.btnSubmit{
		background: #FFB843;
	}
	.btnSubmit:hover{
		background: #E3A538;
	}
	</style>

</head>

<body>

  <!-- Navigation -->
  <%@ include file="../../include/nav.jsp" %>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/img4.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>마이페이지</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
    <div class="col-lg-6 col-md-6">
      <div class="card" style="margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			내 정보
        </div>
        <div>
            <p style="padding-left:20px; font-size: 15px;">사용자 정보를 수정할 수 있습니다.</p>
            <button class="btn btn-primary" style="margin: 20px;" id="myinfoBtn">수정하기</button>
		</div>
	  </div>
	</div>
	  
     <div class="col-lg-6 col-md-6">
      <div class="card" style="margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			나의 배송 내역
        </div>
        <div>
            <p style="padding-left:20px; font-size: 15px;">나의 배송내역을 조회할 수 있습니다.</p>
            <button class="btn btn-primary" style="margin: 20px;" id="mydeliveryBtn">조회하기</button>
		</div>
	  </div>
  	</div>
  	
  	<div class="col-lg-6 col-md-6">
      <div class="card" style="margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			나의 문의 내역
        </div>
        <div>
            <p style="padding-left:20px; font-size: 15px;">나의 문의내역을 확인할 수 있습니다.</p>
            <button class="btn btn-primary" style="margin: 20px;" id="myinquiryBtn">조회하기</button>
		</div>
	  </div>
  	</div>
	  
	</div>
    </div>
    
  <hr>
  <%@ include file="../../include/footer.jsp" %>
  <script>
  	$('#myinfoBtn').on('click', function(){
  		location.href = '${pageContext.request.contextPath}/mypage/myinfo';
  	});
  	$('#mydeliveryBtn').on('click', function(){
  		location.href = '${pageContext.request.contextPath}/mypage/mydelivery';
  	});
  	$('#myinquiryBtn').on('click', function(){
  		location.href = '${pageContext.request.contextPath}/mypage/myinquiry';
  	});
  	
  </script>
</body>
</html>