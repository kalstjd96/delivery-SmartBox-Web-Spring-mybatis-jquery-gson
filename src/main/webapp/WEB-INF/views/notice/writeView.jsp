<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/post-bg.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-12 mx-auto">
          <div class="post-heading">
            <h1>공지사항</h1>
          </div>
        </div>
      </div>
    </div>
  </header>

  <!-- Post Content -->
  <article>
    <div class="container">
      <div class="row">
      	<div class="col-lg-12 col-md-12 mx-auto">
      	<form:form modelAttribute="notice" id="noticeWriteForm" method="post" action="${pageContext.request.contextPath}/notice/write">
	      	<table class="table" style="text-align: center;">
				<tbody>
					<tr style="background: #FFB843;">
						<th width="auto" style="vertical-align: middle; font-size: 26px;">
							<form:input cssClass="form-control" path="title" id="title" maxlength="50" placeholder="제목을 입력해주세요."/>
						</th>
					</tr>
						<tr>
							<td colspan="2" style="padding: 0px 12px 0px 12px;"><small><form:errors path="title" cssClass="errormsg" /></small></td>
						</tr>
					<tr style="font-size: 18px;">
						<th colspan="2" style="text-align: left">
							<form:select cssClass="form-control" path="division" id="division" style="width: auto;">
								<option value="0" <c:if test="${empty reload}">selected="selected"</c:if>>선택</option>
								<option value="1" <c:if test="${reload eq 1}">selected="selected"</c:if>>공지사항</option>
								<option value="2" <c:if test="${reload eq 2}">selected="selected"</c:if>>이벤트</option>
							</form:select>
							<small><form:errors path="division" cssClass="errormsg" /></small>
						</th>
					</tr>
					<tr>
						<td colspan="2" style="padding: 60px 30px 60px 30px;">
							<form:textarea rows="10" cssClass="form-control" path="contents" id="contents" value="${notice.contents}" maxlength="500" placeholder="내용을 입력해주세요."></form:textarea>
							<p style="margin: 0px;" id="counter"></p>
							<small><form:errors path="contents" cssClass="errormsg" /></small>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="hidden" name="page" value="${criteria.page}">
			<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
		
			<div style="text-align: right;">
				<button type="button" class="btn btn-primary" id="listBtn">목록</button>
				<button type="reset" class="btn btn-primary" id="resBtn">초기화</button>
				<button type="button" class="btn btn-primary" id="subBtn">저장</button>
			</div>
			</form:form>
      	</div>
      </div>
    </div>
  </article>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
  
  <script>
  $(document).ready(function() {
	  $('#counter').html($('#contents').val().length + '/500');
	  $('#contents').keyup(function (e){
          var content = $(this).val();
          $('#counter').html(content.length + '/500');
      });
  });
      

  $('#listBtn').on('click', function() {
	  self.location = '/notice/list';
  });
  $('#resBtn').on('click', function () {
	  if(confirm("초기화 하시겠습니까?") == false)
	  		return false;
  });
  $('#subBtn').on('click', function () {
	  $('#noticeWriteForm').submit();
  });
  </script>
</body>
</html>