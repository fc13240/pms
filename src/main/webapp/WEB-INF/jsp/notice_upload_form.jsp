<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传通知书</title>
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
	
	<div class="t-box">
		<form action="<s:url value='/patent/upload.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal">  
		<input style="display:none;" id="id_notice_file" name="noticeFile" type="file" />
		<input style="width:300px;height:25px;" type="text" id="filename" placeholder="请选择文件" readonly="readonly">
		<button type="button" onclick="$('input[id=id_notice_file]').click();" class="t-btn3">浏览</button>
		<button type="submit" class="t-btn2">上传</button>
		</form>  
	</div>
	

</div>
<script type="text/javascript">
	$('input[id=id_notice_file]').change(function() {  
		$('#filename').val($(this).val());  
	});
</script>
</body>
</html>


               