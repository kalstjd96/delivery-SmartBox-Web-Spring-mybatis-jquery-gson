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
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>택배예약</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
    <div class="col-lg-10 col-md-12 mx-auto">
    <form:form modelAttribute="reservationDto" id="reservationForm" method="post" action="${pageContext.request.contextPath}/board/reservation">
      <div class="col-lg-12 col-md-12 mx-auto">
      <p style="font-size: 15px; margin-top: 0px;"><span style="color: red;">＊</span> 표시는 필수 입력 항목입니다.</p>
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			<span style="color: red;">＊ </span>보내는 분
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>이름</label>
              	<form:input type="text" cssClass="form-control" placeholder="이름" id="senderName" path="senderName"/>
              	<small><form:errors path="senderName" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>전화번호</label>
				<form:input type="text" cssClass="form-control" placeholder="전화번호" id="senderPhone" path="senderPhone"/>
            	<small><form:errors path="senderPhone" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>주소</label>
					<div class="input-group" style="margin-bottom: 5px; width: 60%;">
					<form:input type="text" cssClass="form-control" placeholder="우편번호" id="senderPostCode" path="senderPostCode" readonly="true"/>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" style="padding: 11px 25px;" onclick="execDaumPostcode('sender');">우편번호 찾기</button>
		      		</span>
				</div>
			<form:input type="text" cssClass="form-control" placeholder="주소" id="senderAddr1" path="senderAddr1" style="margin-bottom: 5px;" readonly="true"/>
			<form:input type="text" cssClass="form-control" placeholder="상세주소" id="senderAddr2" path="senderAddr2"/>
			<small><form:errors path="senderAddr2" cssClass="errormsg" /></small>
            </div>
		</div>
	  </div>
	  </div>
	  
	  <div class="col-lg-12 col-md-12 mx-auto">
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			<span style="color: red;">＊ </span>받는 분
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>이름</label>
              	<form:input type="text" cssClass="form-control" placeholder="이름" id="receiverName" path="receiverName"/>
              	<small><form:errors path="receiverName" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			<label>전화번호</label>
			<form:input type="text" cssClass="form-control" placeholder="전화번호" id="receiverPhone" path="receiverPhone"/>
            <small><form:errors path="receiverPhone" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>주소</label>
				<div class="input-group" style="margin-bottom: 5px; width: 60%;">
					<form:input type="text" cssClass="form-control" placeholder="우편번호" id="receiverPostCode" path="receiverPostCode" readonly="true"/>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" style="padding: 11px 25px;" onclick="execDaumPostcode('receiver');">우편번호 찾기</button>
		      		</span>
				</div>
			<form:input type="text" cssClass="form-control" placeholder="주소" id="receiverAddr1" path="receiverAddr1" style="margin-bottom: 5px;" readonly="true"/>
			<form:input type="text" cssClass="form-control" placeholder="상세주소" id="receiverAddr2" path="receiverAddr2"/>
			<small><form:errors path="receiverAddr2" cssClass="errormsg" /></small>
            </div>
		</div>
	  </div>
	  </div>
	  
	  <div class="col-lg-12 col-md-12 mx-auto">
      <div class="card" style="border: none; font-weight: 800; margin-bottom: 40px;">
        <div class="card-header">
			 상품정보
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
			    <label for="courierCode">택배회사</label>
			    <form:select class="form-control" path="courierCode" id="courierCode" style="width: 50%;">
					<option selected="selected" value="0">＊택배회사 선택</option>
					<option value="1">CJ대한통운</option>
					<option value="2">로젠택배</option>
					<option value="3">우체국</option>
			    </form:select>
			    <small><form:errors path="courierCode" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			    <label for="dateOfVisit">방문날짜</label>
			    <form:select class="form-control" path="dateOfVisit" id="dateOfVisit" style="width: 50%;">
					<option selected="selected" value="0">＊방문날짜 선택</option>
			    </form:select>
			    <small><form:errors path="dateOfVisit" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>특이사항</label>
              	<form:input type="text" cssClass="form-control" placeholder="특이사항 기재" id="senderReq" path="senderReq"/>
              	<small><form:errors path="senderReq" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<div class="dropdown-backdrop">
			    <label for="fareCategoryCode">운임방식</label>
			    <form:select class="form-control" path="fareCategoryCode" id="fareCategoryCode" style="width: 50%;">
					<option selected="selected" value="0">＊운임 선택</option>
					<option value="1">선불</option>
					<option value="2">후불</option>
			    </form:select>
			    <small><form:errors path="fareCategoryCode" cssClass="errormsg" /></small>
			    </div>
            </div>
		</div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>상품명</label>
				<form:input type="text" cssClass="form-control" placeholder="＊상품명" id="productName" path="productName"/>
				<small><form:errors path="productName" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			<label>상품가격</label>
			<form:input type="text" cssClass="form-control" placeholder="＊상품가격" id="productPrice" path="productPrice"/>
            <small><form:errors path="productPrice" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			    <label for="productWeight">상품부피</label>
			    <form:select class="form-control" path="productWeight" id="productWeight" style="width: 50%;">
					<option selected="selected" value="0">＊ 상품부피 선택</option>
					<option value="4000">극소 (2kg 이하)</option>
					<option value="6000">소 (5kg 이하)</option>
					<option value="7000">중 (15kg 이하)</option>
					<option value="8000">대 (25kg 이하)</option>
			    </form:select>
			    <small><form:errors path="productWeight" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>예상운임</label>
				<div class="input-group" style="margin-bottom: 5px; width: 60%;">
					<form:input type="text" cssClass="form-control" placeholder="＊예상운임" id="freightCost" path="freightCost" readonly="true"/>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" style="padding: 11px 25px;" id="btnFreightCostCalc">예상운임 계산</button>
		      		</span>
				</div>
				<small><form:errors path="freightCost" cssClass="errormsg" /></small>
            </div>
		</div>
	  </div>
	  <button class="btn w-100 btnSubmit" style="font-size: 20px;" type="button" id="btnResSubmit">택배예약</button>
	  </div>
	  
	</form:form>
	</div>
    </div>
  </div>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  $(document).ready(function addOption(){
	    var now = new Date();
		var valArr = new Array();
		var valArr2 = new Array();
		
		if(now.getDay() == 5 || now.getDay() == 6) {
		 var num;
		 if(now.getDay() == 5){
		     num = 2;
		 }else {
		     num = 1  
		 }
		 now.setDate(now.getDate()+num);       
		}
		
		var nowDayOfWeek = now.getDay();
		var nowDay = now.getDate();
		var nowMonth = now.getMonth();
		var nowYear = now.getYear();
		nowYear += (nowYear < 2000) ? 1900 : 0;
		
		
		var today = new Date(nowYear, nowMonth, nowDay);
		var reserveDate = new Date(nowYear, nowMonth, nowDay)
		var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
		var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
		 
		for(var i=today.getDay(), j=1; i<5; i++,j++){
		    reserveDate.setDate(reserveDate.getDate()+1);
		 valArr[j-1] = (reserveDate.getMonth()+1)+'월'+(reserveDate.getDate())+'일';
		 valArr2[j-1] = today.getFullYear()+"-"+(reserveDate.getMonth()+1)+"-"+(reserveDate.getDate());
		}
		  
		var objSel = document.getElementById("dateOfVisit");
		
		for(var i=0; i<=valArr.length-1; i++){
			var objOption = document.createElement("option");       
			objOption.text = valArr[i];
			objOption.value = valArr2[i];
			objSel.options.add(objOption);
		}
  });

  $(document).ready(function(){
	  if('${reloadForm.courierCode}' != ''){
		  $('#courierCode').val('${reloadForm.courierCode}').prop('selected', true);
	  }
	  if('${reloadForm.dateOfVisit}' != ''){
		  $('#dateOfVisit').val('${reloadForm.dateOfVisit}').prop('selected', true);
	  }
	  if('${reloadForm.fareCategoryCode}' != ''){
		  $('#fareCategoryCode').val('${reloadForm.fareCategoryCode}').prop('selected', true);
	  }
	  if('${reloadForm.productWeight}' != ''){
		  $('#productWeight').val('${reloadForm.productWeight}').prop('selected', true);
	  }
  });
  
  var clicks=false;
  $('#btnFreightCostCalc').on("click", function(){
		var weight = $('#productWeight option:selected').val();
		if (!clicks) {
			if(weight == 0){
				  alert('상품부피를 선택해주세요.');
				  return false;
			}
			$('#freightCost').val(weight);
			clicks = true;
		}
	});

  $('#productWeight').on('change', function() {
	  clicks = false;
  });
  
  $('#btnResSubmit').on("click", function(){
	  if(clicks == false){
			alert("예상운임을 다시 계산해주세요.");
			return false;
	  }
	  $('#reservationForm').submit();
  });
  
  var themeObj = {
	//bgColor: "", //바탕 배경색
	searchBgColor: "#212529", //검색창 배경색
	//contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
	//pageBgColor: "", //페이지 배경색
	//textColor: "", //기본 글자색
	queryTextColor: "#FFFFFF" //검색창 글자색
	//postcodeTextColor: "", //우편번호 글자색
	//emphTextColor: "", //강조 글자색
	//outlineColor: "", //테두리
  };
  function execDaumPostcode(btnId) {
     new daum.Postcode({
  	   theme: themeObj,
          oncomplete: function(data) {
              // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

              // 각 주소의 노출 규칙에 따라 주소를 조합한다.
              // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
              var addr = ''; // 주소 변수
              var extraAddr = ''; // 참고항목 변수

              //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
              if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                  addr = data.roadAddress;
              } else { // 사용자가 지번 주소를 선택했을 경우(J)
                  addr = data.jibunAddress;
              }

              // 우편번호와 주소 정보를 해당 필드에 넣는다.
              
              document.getElementById(btnId+'PostCode').value = data.zonecode;
              document.getElementById(btnId+'Addr1').value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById(btnId+'Addr2').focus();
          }
      }).open();
    }
</script>
</body>
</html>