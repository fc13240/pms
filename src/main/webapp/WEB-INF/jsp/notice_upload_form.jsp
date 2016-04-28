<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>

<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_notice.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">上传通知书</span>
	</div>
	<form action="<s:url value='/notice/upload.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal">
	<!-- #section:elements.form -->
	<se:csrfInput/>
	<div class="form-group">
		<div class="col-xs-12">
			<input multiple="" type="file" name="noticeFile" style="display:none;" id="id-input-file-3" required />
	<!-- /section:custom/file-input -->
		</div>
	</div>
	<button class="btn btn-info" type="submit" style="height:45px;width：100px">上传</button>
	</form> 	


</div>

</body>
</html>


               