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
            <h1>회원가입</h1>
            <span class="subheading">Have questions? I have answers.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
    <div class="col-lg-10 col-md-12 mx-auto">
    <form:form modelAttribute="signupDto" id="signupForm" method="post" action="${pageContext.request.contextPath}/user/signup">
      <div class="col-lg-12 col-md-12 mx-auto">
      <p style="font-size: 15px; margin-top: 0px;"><span style="color: red;">＊</span> 표시는 필수 입력 항목입니다.</p>
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			<span style="color: red;">＊ </span>사용자 정보
        </div>
        <div class="form-group floating-label-form-group controls">
			<label>아이디</label>
			<div class="input-group">
				<form:input type="text" cssClass="form-control" placeholder="아이디" id="userId" path="userId" maxlength="20"/>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button" style="padding: 11px 45px; font-size: 18px;" id="btnIdChk">중복확인</button>
	      		</span>
			</div>
			<small><form:errors path="userId" cssClass="errormsg" /></small>
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>비밀번호</label>
              	<form:password cssClass="form-control" placeholder="비밀번호" id="userPwd" path="userPwd" maxlength="20"/>
              	<small><form:errors path="userPwd" cssClass="errormsg" /></small>
            </div>
		</div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>이름</label>
              	<form:input type="text" cssClass="form-control" placeholder="이름" id="userName" path="userName" maxlength="7"/>
              	<small><form:errors path="userName" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>생년월일</label>
              	<div class="input-group">
              	<form:input type="text" cssClass="form-control" placeholder="년(4자)" id="userBirthYear" path="userBirthYear" maxlength="4" style="margin-right: 10px;"/>
              	<form:select cssClass="form-control" placeholder="월" id="userBirthMonth" path="userBirthMonth" style="margin: auto;">
					<option value="0" label="월" selected="selected"/>
              	</form:select>
              	<form:input type="text" cssClass="form-control" placeholder="일" id="userBirthDay" path="userBirthDay" style="margin-left: 15px;" maxlength="2"/>
              	</div>
              	<small><form:errors path="userBirthDay" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>이메일</label>
              	<div class="input-group">
				<form:input type="text" cssClass="form-control" placeholder="이메일" id="userEmail1" path="userEmail1" style="margin-right: 10px;" maxlength="20"/>
				<span class="input-group-btn" style="margin: auto;">
					<i class="fas fa-at" style="font-size: 25px;"></i>
	      		</span>
	      		<form:input type="text" cssClass="form-control" id="userEmail2" path="userEmail2" style="margin-left: 10px;" maxlength="20"/>
			</div>
            <small><form:errors path="userEmail2" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>전화번호</label>
				<form:input type="text" cssClass="form-control" placeholder="전화번호" id="userPhone" path="userPhone" maxlength="13"/>
            	<small><form:errors path="userPhone" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>주소</label>
					<div class="input-group" style="margin-bottom: 5px; width: 60%;">
					<form:input type="text" cssClass="form-control" placeholder="우편번호" id="postCode" path="postCode" readonly="true"/>
					<span class="input-group-btn">
						<button class="btn btn-primary" type="button" style="padding: 11px 25px;" onclick="execDaumPostcode('sender');">우편번호 찾기</button>
		      		</span>
				</div>
			<form:input type="text" cssClass="form-control" placeholder="주소" id="addr1" path="addr1" style="margin-bottom: 5px;" readonly="true"/>
			<form:input type="text" cssClass="form-control" placeholder="상세주소" id="addr2" path="addr2"/>
			<small><form:errors path="addr2" cssClass="errormsg" /></small>
            </div>
		</div>
	  </div>
	  <button class="btn w-100 btnSubmit" style="font-size: 20px;" type="button" id="btnSignupSubmit">회원가입</button>
	  </div>
	</form:form>
	</div>
    </div>
  </div>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script>
  $(document).ready(function () {
          $('#userPhone').keydown(function (event) {
           var key = event.charCode || event.keyCode || 0;
           $text = $(this); 
           if (key !== 8 && key !== 9) {
               if ($text.val().length === 3) {
                   $text.val($text.val() + '-');
               }
               if ($text.val().length === 8) {
                   $text.val($text.val() + '-');
               }
           }

           return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
	 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
	 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
		})
	   $('#userId').keydown(function(event){ 
		   if (!(event.keyCode >=37 && event.keyCode<=40)) {
		   	  var inputVal = $(this).val();
		   	  $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
		   }
	   })
	   for(var i=1; i<13; i++){
		   $('#userBirthMonth').append('<option value="'+i+'" label="'+i+'"/>');   
	   }
       if('${reloadForm.userBirthMonth}' != ''){
			  $('#userBirthMonth').val('${reloadForm.userBirthMonth}').prop('selected', true);
	   }
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
  function execDaumPostcode() {
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
              
              document.getElementById('postCode').value = data.zonecode;
              document.getElementById('addr1').value = addr;
              // 커서를 상세주소 필드로 이동한다.
              document.getElementById('addr2').focus();
          }
      }).open();
  }
  var clicks = false;
  
  $('#btnIdChk').click(function() {
	  if($('#userId').val().trim() == ''){
		  alert('아이디를 입력해주세요.');
		  return false;
	  }
	  $.ajax({
		  type:'POST',
		  url:'ajaxChkId',
		  data:{'inputId': $('#userId').val()
		  },
	 	  success:function(data){
		  console.log(data);
		  console.log(clicks);
		  if(data == 'YES'){
			  alert('사용 가능한 아이디입니다.');
			  clicks = true;
		  }
		  else if(data == 'NO')
			  alert('이미 존재하는 아이디입니다.');
		  	  return false;
	  	  }
	  })
	  clicks = true;
  });
  
  $('#btnSignupSubmit').on("click", function(){
	 if(clicks == false){
		 alert("아이디 중복확인을 해주세요.")
		 return false;
	 }
	  $('#signupForm').submit();
  });
</script>
</body>
</html>