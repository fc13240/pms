<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>上传专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">上传专利</span>
	</div>
	<div class="t-box">
		<form id="patent" action="<s:url value='/patent/upload.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal">  
		<input style="display:none;" id="patentFile" name="patentFile" type="file" />
		<input style="width:300px;height:25px;" type="text" id="filename" name="filename" placeholder="请选择文件" readonly="readonly">
		<button type="button" onclick="$('input[id=patentFile]').click();" class="t-btn3">浏览</button>
		<button type="submit" class="t-btn2">上传</button>
		</form>  
	</div>

</div>
<script type="text/javascript">
	jQuery(function($) {
		$("#patent").validate({
			rules: {
				filename: 'required'
			},
			messages: {
				filename: '请选择要上传的专利表格'
			},
			submitHandler: function(form){ 
				form.submit();     
			}
		});
	});
	$('input[id=patentFile]').change(function() {  
		$('#filename').val($(this).val());  
	});
</script>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>	
</body>
</html>