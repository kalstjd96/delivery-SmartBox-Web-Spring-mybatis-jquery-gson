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
	      	<table class="table table-hover " style="text-align: center;">
				<thead style="background: #FFB843;">
					<tr>
						<th width="15%">번호</th>
						<th width="20%">구분</th>
						<th width="auto">제목</th>
						<th width="20%">날짜</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${noticeList}" var="notice">
					<tr style="font-size: 18px;">
						<td>${notice.noticeNo}</td>
						<td>${notice.division}</td>
						<td style="font-weight: 600;"><a href="read${pageMaker.makeQuery(pageMaker.criteria.page)}&noticeNo=${notice.noticeNo}">${notice.title}</a></td>
						<td><fmt:formatDate value="${notice.regDate}" pattern="YYYY년 M월 d일"/></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			<div style="text-align: right;">
			<button type="button" class="btn btn-primary" id="wriBtn">글쓰기</button>
			</div>
      	</div>
        <div class="col-lg-12 col-md-12 mx-auto">
     		<ul class="pagination justify-content-center">
     		<c:if test="${pageMaker.prev}">
				<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
			</c:if>
			 <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li class="page-item" id="page_${idx}"><a class="page-link" href="list${pageMaker.makeQuery(idx)}">${idx}</a></li>
			</c:forEach>
			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li class="page-item"><a class="page-link" href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
			</c:if>
			</ul>
			
        </div>
      </div>
    </div>
  </article>

  <hr>
  <%@ include file="../../include/footer.jsp" %>
  <script>
  $(document).ready(function() {
	  	var page = ${page};
	  	$('#page_'+page).addClass("active");
	  	$('#page_'+page).children().css({ 'pointer-events': 'none' });
	  	
	  	var result = "${msg}";
	  	if(result == "regSuccess") {
			alert("게시글 등록이 완료되었습니다.")
		} else if (result == "modSuccess") {
			alert("게시글 수정이 완료되었습니다.")
		} else if (result == "delSuccess") {
			alert("게시글 삭제가 완료되었습니다.")
		}
  })
  $("#wriBtn").on("click", function () {
	  location.href='/notice/write';
  });
  </script>
</body>
</html>