<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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

</head>

<body>

  <!-- Navigation -->
  <%@ include file="../../include/nav.jsp" %>

  <!-- Page Header -->
  <header class="masthead" style="background-image: url('${pageContext.request.contextPath}/resources/img/img5.jpg')">
    <div class="overlay"></div>
    <div class="container">
      <div class="row">
        <div class="col-lg-12 col-md-12 mx-auto">
          <div class="page-heading">
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
	      	<table class="table" style="text-align: center;">
				<tbody>
					<tr style="background: #FFB843;">
						<th width="auto"><span style="font-size: 26px; color: #fff; width: 10%;">${notice.noticeNo}</span></th>
						<th width="auto" style="vertical-align: middle; font-size: 26px; text-align: left;">${notice.title}</th>
					</tr>
					<tr style="font-size: 18px;">
						<th style="text-align: center;">${notice.division}</th>
						<th style="text-align: right"><fmt:formatDate value="${notice.regDate}" pattern="YYYY년 M월 d일"/></th>
					</tr>
					<tr>
						<td colspan="2" style="padding: 60px 30px 60px 30px;">${notice.contents}</td>
					</tr>
				</tbody>
			</table>
			<form role="form" method="post">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo}">
				<input type="hidden" name="page" value="${criteria.page}">
				<input type="hidden" name="perPageNum" value="${criteria.perPageNum}">
			</form>
			<div style="text-align: right;">
				<button type="button" class="btn btn-primary" id="listBtn">목록</button>
				<button type="button" class="btn btn-primary" id="modBtn">수정</button>
				<button type="button" class="btn btn-primary" id="delBtn">삭제</button>
			</div>
      	</div>
      </div>
    </div>
  </article>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
  
  <script>
  var formObj = $("form[role='form']");

  $('#listBtn').on('click', function() {
	  formObj.attr("method", "get");
	  formObj.attr("action", "/notice/list");
	  formObj.submit();
  });
  $("#modBtn").on("click", function () {
		formObj.attr("action", "/notice/modify");
		formObj.attr("method", "get");
		formObj.submit();
  });
  $("#delBtn").on("click", function () {
	  	if(confirm("게시글을 삭제하시겠습니까?") == false)
	  		return false;	
		formObj.attr("action", "/notice/remove");
		formObj.submit();
  });
  </script>
</body>
</html>