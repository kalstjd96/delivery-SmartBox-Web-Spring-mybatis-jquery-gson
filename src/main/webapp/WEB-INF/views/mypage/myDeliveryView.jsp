<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  
  <style>
  	/*datepicer 버튼 롤오버 시 손가락 모양 표시*/
	.ui-datepicker-trigger{cursor: pointer;}
	/*datepicer input 롤오버 시 손가락 모양 표시*/
	.hasDatepicker{cursor: pointer;}
	.modal-lg{max-width: 1200px;}
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
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/img3.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>나의 배송내역</h1>
            <span class="subheading">This is what I do.</span>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 mx-auto">
      	<form:form modelAttribute="myDelivery" id="myDeliveryForm" method="post" action="${pageContext.request.contextPath}/mypage/mydelivery">
		<div class="control-group">
			<div class="form-group floating-label-form-group controls">
              	<label>이메일</label>
              	<div class="input-group">
              	<span class="input-group-btn" style="margin: auto;">
					<i class="far fa-calendar-alt" style="margin-left: 10px; font-size: 25px;"></i>
	      		</span>
				<form:input type="text" cssClass="form-control" placeholder="시작날짜" id="startDate" path="startDate" style="margin-left: 15px;"/>
				<span class="input-group-btn" style="margin: auto;">
				부터
				</span>
				<span class="input-group-btn" style="margin: auto;">
					<i class="far fa-calendar-alt" style="margin-left: 10px; font-size: 25px;"></i>
	      		</span>
	      		<form:input type="text" cssClass="form-control" placeholder="종료날짜" id="endDate" path="endDate" style="margin-left: 15px;"/>
	      		<span class="input-group-btn" style="margin: auto;">
				까지
				</span>
			</div>
            <small><form:errors path="startDate" cssClass="errormsg" /></small>
            <small><form:errors path="endDate" cssClass="errormsg" /></small>
            </div>
		</div>
		<div class="btn-group btn-group-toggle" data-toggle="buttons" style="margin-top: 10px;">
		<label class="btn btn-light" for="mr-1">
			<input type="radio" class="radio-value" name="dateBtn" id="mr-1" value="1week"> 1주일
		</label>
		<label class="btn btn-light" for="mr-2">
			<input type="radio" class="radio-value" name="dateBtn" id="mr-2" value="1month"> 1개월
		</label>
		<label class="btn btn-light" for="mr-3">
			<input type="radio" class="radio-value" name="dateBtn" id="mr-3" value="3month"> 3개월
		</label>
		<label class="btn btn-light" for="mr-4">
			<input type="radio" class="radio-value" name="dateBtn" id="mr-4"value="all"> 전체시기
		</label>
		</div>
		
		<table class="table table-hover table-bordered" style="margin-top: 20px;">
		<thead class="thead-light">
			<tr style="text-align: center;">
				<th>상품이름</th>
				<th>운송장번호</th>
				<th>보내는 분</th>
				<th>배송일자</th>
				<th>배송상태</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${!empty responseList}">
		<c:forEach items="${responseList}" var="response">
			<tr style="font-size: 15px;">
				<td>${response.productName}</td>
				<td>${response.waybillNum}</td>
				<td>${response.senderName}</td>
				<td><fmt:formatDate value="${response.processTime}" pattern="YYYY년 M월 d일"/></td>
				<td>${response.deliveryStep}</td>
			</tr>
		</c:forEach>
		</c:when>
		<c:when test="${empty responseList}">
			<tr id="noTr">
				<td colspan="5" style="font-size: 35px; text-align: center;">배송정보가 없습니다.</td>
			<tr>
		</c:when>
		</c:choose>
		</tbody>
		</table>
		<form:hidden path="loginName" value="${myDelivery.loginName}"/>
		<form:hidden path="phone" value="${myDelivery.phone}"/>
		<button type="button" class="btn btn-info w-100" id="lookupBtn" style="margin-top: 10px;">조회</button>
		</form:form>
      </div>
    </div>
  </div>

  <hr>
  
  <!-- The Modal -->
  <div class="modal" id="myModal">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">상세정보</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <!-- Modal body -->
        <div class="modal-body">
        <table class="table table-bordered" style="text-align: center;">
        	<tr>
        		<th>운송장번호</th>
        		<th>보내는 분</th>
        		<th>받는 분</th>
        		<th>상품명</th>
        	</tr>
        	<tr id="info" style="font-size: 14px;">
        		<td></td>
        		<td></td>
        		<td></td>
        		<td></td>
        	</tr>
        </table>
        <table class="table table-bordered" style="text-align: center;">
        	<thead>
	        	<tr id="step">
		       		<th>단계</th>
		       		<th>처리</th>
		       		<th>상품상태</th>
		       		<th>담당점소</th>
	        	</tr>
        	</thead>
        	<tbody id="stepBody" style="font-size: 14px;">
        	</tbody>
        </table>
        </div>
        <!-- Modal footer -->
        <div class="modal-footer">
        <button id="btnCancel" type="button" class="btn btn-warning cancel">취소</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>
  
  <%@ include file="../../include/footer.jsp" %>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
  	
  
	function modalShow(e) {
		var sendData = JSON.stringify({waybill_Num:e.getAttribute('id')});
		console.log(sendData);
		$('.infoSub').remove();
		$('.stepSub').remove();
		ajaxConnectionDetail(sendData);
	}
	
	$(function() {
		if('${activeBtn}' != ''){
	  		$('input[value="${activeBtn}"]').parents("label").addClass('active');
	  		$('input[value="${activeBtn}"]').prop("checked", true)
		}else{
	  		$('#mr-4').parents("label").addClass('active');
	  		$('#mr-4').prop("checked", true)
		}
	  	
       	$('label.btn.btn-light').on('change',function(){
			if($('input[name="dateBtn"]:checked').val() == '1week'){
				alert("1주일");
	             $('#startDate').datepicker('setDate', '-7D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	             $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}else if($('input[name="dateBtn"]:checked').val() == '1month'){
				alert("1개월");
				$('#startDate').datepicker('setDate', '-1M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	            $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}else if($('input[name="dateBtn"]:checked').val() == '3month'){
				alert("3개월");
				$('#startDate').datepicker('setDate', '-3M'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	            $('#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}else if($('input[name="dateBtn"]:checked').val() == 'all'){
				alert("전체");
				$('#startDate').datepicker('setDate', null); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
	            $('#endDate').datepicker('setDate', null); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
			}
		});
           //input을 datepicker로 선언
           $("#startDate").datepicker({
               dateFormat: 'yy-mm-dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
//          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "-1D" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });                 
           
           $("#endDate").datepicker({
               dateFormat: 'yy-mm-dd' //Input Display Format 변경
               ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
               ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
               ,changeYear: true //콤보박스에서 년 선택 가능
               ,changeMonth: true //콤보박스에서 월 선택 가능                
//          ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
//          ,buttonImage: "http://jqueryui.com/resources/demos/datepicker2/images/calendar.gif" //버튼 이미지 경로
               ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
               ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
               ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
               ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
               ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
               ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
               ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
               ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
               ,maxDate: "today" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                
           });
	});
           //초기값을 오늘 날짜로 설정
//      $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
//      $('#datepicker2').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
           $('#lookupBtn').click(function() {
        	   $('#myDeliveryForm').submit();
 			});
 			
 		   $('#myDeliveryForm tbody tr').click(function() {
 			  var tr = $(this);
 			  if(tr.attr("id") == 'noTr')
 				  return false;
 			  var td = tr.children('td');
 			  var sendData = JSON.stringify({"waybillNum": td.eq(1).text()});
 			  $('.stepDetail').remove();
 			 $.ajax({
 				type : 'post',
 				url : '/mypage/mydeliveryDetail',
 				data : sendData,
 				dataType : 'json',
 				contentType:'application/json;charset=UTF-8',
 				success : function (data) {
 					console.log(data);
					var i = 0;
					$.each(data.response, function(key,value){
							$('#info').children().eq(i++).text(value);
					});
					var type;
					$.each(data.responseList, function(index){
						var dataTr ='<tr class="stepDetail">';
						$.each(data.responseList[index], function(key,value){
							dataTr+='<td>'+value+'</td>';
							if(key == 'deliveryType')
								type = value; 
						});
						dataTr +='</tr>'
						$('#stepBody').append(dataTr);
					});
					if(type > 0)
						$('#btnCancel').hide();
					else
						$('#btnCancel').show();
					$('#myModal').modal('show');
 				},
 				error : function (request,status,error) {
 					alert('실패');
 				}
 			});
 		  });
 		   
 		  $('.cancel').click(function() {
 			  if(confirm("취소하시겠습니까?") == true){
// 				여기 구현해야함
 			  }
 		  });
</script>
</body>
</html>