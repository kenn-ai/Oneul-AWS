<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>공지사항</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/nav.jsp"></jsp:include>
<div class="page">

	<!-- Page Heading -->
	<div class="row">
	   <div class="col-lg-12">
	      <h4 class="page-header"> 공지사항</h4>
	   </div>
	</div><!-- /.row -->
	
	<div id="main-contents">
		
	<!-- ####################	 시작		#################### -->
	
	<form id="writeForm" class="form-horizontal" action="/notice/actWrite" method="post">
		<input type="hidden" name="userid" value="${ login.userid }">
		<div class="form-group">
			<label for="title" class="col-sm-1 control-label">제목</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="title" name="title" placeholder="제목">
			</div>
		</div>
		<div class="form-group">
			<label for="contents" class="col-sm-1 control-label">내용</label>
			<div class="col-sm-10">
				<textarea class="form-control" id="contents" name="contents" rows="20" placeholder="내용" style="width: 100%"></textarea>
				<!-- smarteditor -->
				<script type="text/javascript">
				var oEditors = [];
				nhn.husky.EZCreator.createInIFrame({
				    oAppRef: oEditors,
				    elPlaceHolder: "contents",
				    sSkinURI: "/resources/smarteditor/SmartEditor2Skin.html",
				    fCreator: "createSEditor2"
				});
				</script>
				<!-- end of smarteditor -->
			</div>
		</div>
		<button class="btn btn-default" id="btn_list" type="button">
		<script type="text/javascript">
                  $("#btn_list").on("click", function(e) {
                     e.preventDefault();
                     location.href="/notice/list";
                  });
        </script>
		<span>목록</span>
		</button>
		<button type="submit" class="btn btn-default" id="btn_submit">
		<span>등록</span>
			<script type="text/javascript">
				$("#btn_submit").on("click", function(e) {
					e.preventDefault();
					oEditors.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
					$("#writeForm").submit();
				});
			</script>
		</button>
	</form>
  	
	<!-- ####################	   끝     	#################### -->	
		
	</div><!-- /#main-contents -->
</div>
</body>
</html>
