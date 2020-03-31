<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.btnSubmit{
		background: #FFB843;
	}
	.btnSubmit:hover{
		background: #E3A538;
	}
	
	.sub {
    font-size: .85em;
    line-height: 1.764705882em;
    position: relative;
    z-index: 0;
    display: block;
    margin: 0;
    transition: top .3s ease,opacity .3s ease;
    vertical-align: middle;
    vertical-align: baseline;
    opacity: 1;
    top: 0;
    color: #0085A1;
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
            <h1>내 정보 수정</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
    <div class="col-lg-10 col-md-12 mx-auto">
    <form:form modelAttribute="userinfo" id="userinfoForm" method="post" action="${pageContext.request.contextPath}/mypage/myinfo">
      <div class="col-lg-12 col-md-12 mx-auto" style="margin-bottom: 70px;">
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			내 정보
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">아이디</span>
              	<input class="form-control" name="userId" readonly="readonly" value="${userinfo.userId}"/>
            </div>
		</div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">이름</span>
              	<input class="form-control" name="userName" readonly="readonly" value="${userinfo.userName}"/>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">생년월일</span>
              	<input class="form-control" name="userBirthDay" value="${userinfo.userBirthDay}" readonly="readonly">
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">이메일</span>
              	<div class="input-group">
				<form:input type="text" cssClass="form-control" placeholder="이메일을 입력해주세요." id="userEmail1" path="userEmail1" style="margin-right: 10px;" maxlength="20"/>
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
				<span class="sub">전화번호</span>
				<form:input type="text" cssClass="form-control" placeholder="전화번호를 입력해주세요." id="userPhone" path="userPhone" maxlength="13"/>
            	<small><form:errors path="userPhone" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<span class="sub">비밀번호</span>
				<form:password cssClass="form-control" placeholder="비밀번호를 입력해주세요." id="userPwd" path="userPwd" maxlength="20"/>
            	<small><form:errors path="userPwd" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<span class="sub">주소</span>
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
	  <button class="btn w-100 btnSubmit" style="font-size: 20px;" type="button" id="btnInfoModify">정보수정</button>
	  </div>
	</form:form>
	
	<form:form modelAttribute="changePwd" id="changePwdForm" method="post" action="${pageContext.request.contextPath}/mypage/changePwd">
	<div class="col-lg-12 col-md-12 mx-auto">
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			비밀번호 변경
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">현재 비밀번호</span>
              	<form:password cssClass="form-control" placeholder="현재 비밀번호를 입력해주세요." id="currPwd" path="currPwd" style="margin-right: 10px;" maxlength="20"/>
              	<small><form:errors path="currPwd" cssClass="errormsg" /></small>
            </div>
		</div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">새 비밀번호</span>
              	<form:password cssClass="form-control" placeholder="새 비밀번호를 입력해주세요." id="newPwd" path="newPwd" style="margin-right: 10px;" maxlength="20"/>
              	<small><form:errors path="newPwd" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<span class="sub">새 비밀번호 확인</span>
              	<form:password cssClass="form-control" placeholder="새 비밀번호 확인을 입력해주세요." id="newPwdChk" path="newPwdChk" style="margin-right: 10px;" maxlength="20"/>
              	<small><form:errors path="newPwdChk" cssClass="errormsg" /></small>
            </div>
		</div>
	  </div>
	  <button class="btn w-100 btnSubmit" style="font-size: 20px;" type="button" id="btnChaangePwdBtn">비밀번호 변경</button>
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
		
		if('${msg}' != ''){
			alert('${msg}');
		}
          
        backupFormValue();
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
  var backupSerialize = null;

  function backupFormValue() {
	   backupSerialize = $('#userinfoForm').serialize();
  }
  
  $('#btnInfoModify').on("click", function(){
	  var currentSerialize = $('#userinfoForm').serialize();
	  if(backupSerialize == currentSerialize){
		  alert('정보를 변경하고 다시 시도해주세요.')
		  return false;
	  }
	  $('#userinfoForm').submit();
  });
  
  $('#btnChaangePwdBtn').on("click", function(){
	  if($('#currPwd').val() == '' || $('#newPwd').val() == '' || $('#newPwdChk').val() == ''){
		  alert('비밀번호를 입력해주세요.')
		  return false;
	  }
	  $('#changePwdForm').submit();
  });
</script>
</body>
</html>