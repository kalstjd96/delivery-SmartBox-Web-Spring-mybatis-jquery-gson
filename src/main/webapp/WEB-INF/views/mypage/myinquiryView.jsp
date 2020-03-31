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
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/img4.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-8 col-md-10 mx-auto">
          <div class="page-heading">
            <h1>나의 문의내역</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Main Content -->
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12 mx-auto">
		
		<table id="inquiryTable" class="table table-bordered" style="margin-top: 20px; text-align: center;">
		<thead style="background: #0085a1; color: #fff;">
			<tr>
				<th>문의유형</th>
				<th>제목</th>
				<th>운송장번호</th>
				<th>문의날짜</th>
				<th>문의상태</th>
				<th style="visibility: hidden; display: none;">번호</th>
			</tr>
		</thead>
		<tbody>
		<c:choose>
		<c:when test="${!empty responseList}">
		<c:forEach items="${responseList}" var="response">
			<tr style="font-size: 15px;">
				<th>${response.inquiryType}</th>
				<th>${response.title}</th>
				<th>${response.waybillNumber}</th>
				<th><fmt:formatDate value="${response.regDate}" pattern="YYYY년 M월 d일"/></th>
				<th>${response.inquiryStatus}</th>
				<th style="visibility: hidden; display: none;">${response.inquiryNo}</th>
			</tr>
		</c:forEach>
		</c:when>
		<c:when test="${empty responseList}">
			<tr id="noTr">
				<td colspan="5" style="font-size: 35px; text-align: center;">문의정보가 없습니다.</td>
			<tr>
		</c:when>
		</c:choose>
		</tbody>
		</table>
      </div>
    </div>
  </div>

  <hr>
  
  <%@ include file="../../include/footer.jsp" %>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script>
	$('#inquiryTable tbody tr').on("click", function(){
	// 	alert('클릭');
	// 	var tr = $(this);
	// 	var tr_id =tr.attr('id');
	// 	var param = '?inquiryNo='+tr_id;
	// 	detailAjax(param, tr, tr_id);
		var tr = $(this);
	 	var sendData = JSON.stringify({"inquiryNo": tr.children('th').eq(5).text()});
		var clicks = $(this).data('clicks');
		if (clicks) {
			$('#detail_'+tr.children('th').eq(5).text()).remove();
		} else {
		 	detailAjax(tr, sendData);
		}
		$(this).data("clicks", !clicks);
	});
	
	function detailAjax(tr, sendData) {
		$.ajax({
			type : 'post',
			url : '/mypage/myinquiryDetail',
			dataType : 'json',
			data : sendData,
			contentType:'application/json;charset=UTF-8',
			success : function (data) {
				console.log(data);
				var result ='';
				result='<tr id=detail_'+data.response.inquiryNo+'><td colspan="5"><table class="table text-center sub-table" style="margin-bottom: 0px; font-size:15px;" width="100%"><thead style="background: #FFB843;"><tr><th>물품명</th><th>이름</th><th>주소</th></tr></thead>';
				result+='<tr><td>'+data.response.productName+'</td><td>'+data.response.name+'</td><td colspan="3">'+data.response.postCode+" "+data.response.addr1+" "+data.response.addr2+'</td></tr>';
				if(data.responseList.length>0){
					result+='<tr><td colspan="3"><a data-lightbox="uploadImages" href="${path}/upload/displayFile?fileName='+getImageLink(data.responseList[0].fileLocation)+'"><img src="${path}/upload/displayFile?fileName='+data.responseList[0].fileLocation+'" /></a></td><tr>'
					if(data.responseList.length>1)
						result+='<tr><td colspan="3"><a data-lightbox="uploadImages" href="${path}/upload/displayFile?fileName='+getImageLink(data.responseList[1].fileLocation)+'"><img src="${path}/upload/displayFile?fileName='+data.responseList[1].fileLocation+'" /></a></td><tr>'
				}
						
				result+='<tr><th colspan="3" style="background:#FFB843;">내용</th></tr><tr><td colspan="3">'+data.response.contents+'</td></tr></table></td></tr>'
				tr.after(result);
			},
			error : function (request,status,error) {
				alert('실패');
			}
		});
	}
	
	function getImageLink(fileName) {
		var front = fileName.substr(0, 12);
		var end = fileName.substr(14);
		return front + end;
	}
	</script>
 
</body>
</html>