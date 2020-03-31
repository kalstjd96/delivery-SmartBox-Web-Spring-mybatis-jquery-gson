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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/lightbox/css/lightbox.css"/>
  
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
	.fileDrop {
		padding-top: 80px;
		text-align: center;
	}
		
	.uploadedList li {
		list-style-type: none;
		float:left;
		margin-left:-1px;
	}
	.uploadedList:after {
		content: "";
	    display: block;
	    clear: both;
	}
	.fileDrop {
		width: 100%;
		height: 200px;
		border: 2px dotted #00657b;
	}
	#counter {
		color: #00657b;
	}
	</style>

</head>

<body class="content-wrapper">

  <!-- Navigation -->
  <%@ include file="../../include/nav.jsp" %>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/contact-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>고객 문의</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
    <div class="col-lg-10 col-md-12 mx-auto">
    <form:form modelAttribute="inquiry" id="inquiryForm" method="post" action="${pageContext.request.contextPath}/support/inquiry">
      <div class="col-lg-12 col-md-12 mx-auto">
      <p style="font-size: 15px; margin-top: 0px;"><span style="color: red;">＊</span> 표시는 필수 입력 항목입니다.</p>
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			<span style="color: red;">＊ </span>신청자 정보
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>운송장번호</label>
              	<form:input type="text" cssClass="form-control" placeholder="운송장번호" id="waybillNum" path="waybillNum" maxlength="12"/>
              	<small><form:errors path="waybillNum" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>이름</label>
				<form:input type="text" cssClass="form-control" placeholder="이름" id="name" path="name" />
            	<small><form:errors path="name" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
				<label>전화번호</label>
				<form:input type="text" cssClass="form-control" placeholder="전화번호" id="phone" path="phone" maxlength="13"/>
            	<small><form:errors path="phone" cssClass="errormsg" /></small>
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
	  </div>
	  <div class="col-lg-12 col-md-12 mx-auto" style="margin-bottom: 70px;">
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800;">
        <div class="card-header">
			<span style="color: red;">＊ </span>문의정보
        </div>
        <div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>유형</label>
              	<form:select cssClass="form-control" path="inquiryType" id="inquiryType">
					<option value="0" selected="selected">선택</option>
					<option value="1">배송확인</option>
					<option value="2">배송지연</option>
					<option value="3">반품확인</option>
					<option value="4">반품지연</option>
					<option value="5">칭찬</option>
					<option value="6">불친절</option>
					<option value="7">사고처리</option>
					<option value="8">제안</option>
					<option value="9">기타</option>
				</form:select>
              	<small><form:errors path="inquiryType" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			<label>물품명</label>
			<form:input type="text" cssClass="form-control" placeholder="물품명" id="productName" path="productName"/>
            <small><form:errors path="productName" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			<label>제목</label>
			<form:input type="text" cssClass="form-control" placeholder="제목" id="title" path="title"/>
            <small><form:errors path="title" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
			<label>내용</label>
			<form:textarea rows="5" cssClass="form-control" path="contents" id="contents" maxlength="500" placeholder="내용을 입력해주세요."></form:textarea>
			<p style="margin: 0px;" id="counter"></p>
			<small><form:errors path="contents" cssClass="errormsg" /></small>
			</div>
		</div>
	  </div>
	  </div>
	  <form:hidden path="loginId" value="${loginId}"/>
	  <div class="col-lg-12 col-md-12 mx-auto">
      <div class="card" style="border: none; margin-bottom: 40px; font-weight: 800; margin-top: 20px;">
        <div class="card-header" style="margin-bottom: 20px;">
			첨부파일
        </div>
        <div class="fileDrop">
			<p style="margin: 0px;"><i id="dragMsg" style="color: #C2C5CC">이미지를 드래그 해주세요.</i></p>
			<ul class="uploadedList" style="display:inline-block; padding: 0px;"></ul>
		</div>
		<small><span class="errormsg">${error}</span></small>
	  </div>
	  </div>
	  <button class="btn w-100 btnSubmit" style="font-size: 20px;" type="button" id="btnInqSubmit">문의신청</button>
	</form:form>
	</div>
    </div>
  </div>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
  <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="${pageContext.request.contextPath}/resources/lightbox/js/lightbox.js" ></script>
  <script>
  $(document).ready(function() {
	  $('#counter').html($('#contents').val().length + '/500');
	  $('#contents').keyup(function (e){
          var content = $(this).val();
          $('#counter').html(content.length + '/500');
      });
	  
	  $('#phone').keydown(function (event) {
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
	  
	  $(".content-wrapper").on("dragenter dragover drop", function (event){
		event.preventDefault();
	  });
		
	  $(".fileDrop").on("dragenter dragover", function(event) {
			//drop영역에 들어가고, 드롭영역에 드래그 되고있을때의 기본 효과를 막음
		event.preventDefault();
	  });
	  
	  
	  $(".fileDrop").on("drop", function(event) {
			//drop이 될 때 기본 효과를 막음
			//기본 효과를 막지 않으면 드래그시에 브라우저에서 이미지파일이 열려버림
			event.preventDefault();
			//첨부파일 배열
			var files = event.originalEvent.dataTransfer.files;
			console.log(files);
			
			if (files.length > 2) {
				alert('파일은 한번에 두개만 올릴 수 있습니다.');
				return false;
			}
			if ($(".uploadedList div").length == 1
					&& files.length > 1) {
				alert('파일을 하나만 더 올릴 수 있습니다.');
				return false;
			
			} else if ($(".uploadedList div").length == 2) {
				alert('파일이 이미 두개입니다.');
				return false;
			}
			
			//AJAX로 (이미지를 넘길때)폼 전송을 가능케해주는 FormData 객체
			var formData = new FormData();
			var fileSize = new Array();
			for (var i = 0; i < files.length; i++) {
					formData.append("file", files[i]); //폼에 file 변수 추가
					fileSize[i] = files[i].size;
				
			}
			//서버에 파일 업로드(백그라운드에서 실행됨)
			// contentType: false => multipart/form-data로 처리됨
			$.ajax({	
					//AjaxUploadController에 post방식으로 넘어감
					type : "post",
					url : "/upload/uploadAjax",
					data : formData,
					dataType : "json",
					processData : false,
					contentType : false,
					success : function(data, status, req) {
						console.log("data:" + data); //업로드된 파일 이름
						console.log("status:" + status); //성공,실패 여부
						console.log("req:" + req.status);//요청코드값
						var obj = eval(data);
						var index = 0;
						$('#dragMsg').hide();
						$('.fileDrop').css('padding', '0');
						for(var item in obj){
							console.log(obj[item]);
							var str = "<span>";
							str = "<li style='margin-top:7px;'><input type='hidden' name='fileLocationArr' value='"+ obj[item] + "'>"
							str += "<input type='hidden' name='fileSizeArr' value='"+ fileSize[index] + "'>"
							str += "<input type='hidden' name='fileNameArr' value='"+ getOriginalName(obj[item]) + "'>"
							str += "<span><img src='${path}/upload/displayFile?fileName="+ obj[item] + "'></span>";
							str += "<div class='file-info'><a data-lightbox='uploadImages' href='${path}/upload/displayFile?fileName="+ getImageLink(obj[item])+ "'>";
							str += getOriginalName(obj[item])+"</a>"
							str += "<a name='fileLocation' href='"+obj[item]+"' class='delBtn'>[X]</a></div></li>";
							$(".uploadedList").append(str);
							index++;
						}
					}
				});
		}); //fileDrop 함수
		//첨부파일 삭제 함수
		$(document).on("click", ".delBtn", function(event) {
			event.preventDefault();
			//현재 클릭한 태그
			if(confirm("삭제하시겠습니까? 삭제된 파일은 복구할 수 없습니다.")){
			var that = $(this);
			$.ajax({
				url : "/upload/deleteFile",
				type : "post",
				data : {
					fileName : $(this).attr("href")
				},
				dataType : "text",
				success : function(result) {
					if (result == "deleted") {
						that.parents("li").remove();
						if($(".uploadedList div").length == 0){
							  $('.fileDrop').css('padding', '80');
							  $('#dragMsg').show();
						}
					}
				}
			});
			}
		});
		function getOriginalName(fileName) {
			var subFileName = fileName.substr(14);
			var idx = subFileName.indexOf("_") + 1
			return subFileName.substr(idx);
		}
		function getImageLink(fileName) {
			if (!checkImageType(fileName)) {//이미지 파일이 아니면 skip
				return;
			}
			var front = fileName.substr(0, 12);//연월일 경로
			var end = fileName.substr(14);// s_ 제거
			return front + end;
		}
		function checkImageType(fileName) {
			// '/i': ignore case
			var pattern = /jpg|png|jpeg/i; //정규표현식(대소문자 무시)
			return fileName.match(pattern); //규칙에 맞으면 true
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
		  $('#btnInqSubmit').on("click", function(){
			  $('#inquiryForm').submit();
		  });
  </script>
</body>
</html>