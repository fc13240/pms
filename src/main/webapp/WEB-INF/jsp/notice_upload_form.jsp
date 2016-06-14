<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——上传通知书</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>

<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_notice.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="height:400px;padding:20px;">
					<form id="notice" action="<s:url value='/notice/upload.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal">  
					<input style="display:none;" id="id_notice_file" name="noticeFile" type="file" />
					<input style="width:300px;height:33px;display:inline;" type="text" class="lt-input form-control" id="filename" name="filename" placeholder="请选择文件" readonly="readonly" required>
					<button type="button" onclick="$('input[id=id_notice_file]').click();" class="button button-primary  button-rounded">浏览</button>
					<button type="submit" class="button button-caution button-rounded">上传</button>
					</form> 
					<div style="height:10px;">&nbsp;</div> 
					<span style="color:#666;">(文件格式：从CPC客户端批量导出且未经任何处理的通知书压缩包。)
					</span>					 				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>


<script type="text/javascript">
	jQuery(function($) {
		$("#notice").validate({
			rules: {
				filename: 'required'
			},
			messages: {
				filename: '请选择要上传的通知书压缩文件'
			},
			submitHandler: function(form){ 
				form.submit();     
			}
		});
	});

	$('input[id=id_notice_file]').change(function() {  
		$('#filename').val($(this).val());  
	});
</script>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>	
</body>
</html>


               