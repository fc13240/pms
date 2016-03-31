<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
<style type="text/css">

		#patent-upload-form {
			background-color: #F8F8FF;
			width: 500px;
			border: 1px dash #666;
			margin-left: 100px;
			margin-top: 0px;
			padding-left: 40px;
			padding-right: 40px;
			padding-top: 20px;
   			-moz-border-radius: 15px;     
   			-webkit-border-radius: 15px;  
   			border-radius:15px;         	
		}
		
		
		#filename {
			height: 30px; 
			width: 300px;
			margin-bottom: 30px;
		}
		
		.btn-browser {
			width: 100px;
		}
		
		.btn-upload {
			width: 300px;
			margin-left: 15px;
		}
</style>
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<form action="<s:url value='/patent/upload.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal" id="patent-upload-form">
			<se:csrfInput />
			<fieldset>
				<legend>添加专利清单</legend>
				<div class="form-group" style="display:none">
					<input type="file" name="patentFile" id="patentFile"/>
				</div>
				<input type="text" id="filename" placeholder="请选择文件" readonly="readonly">
				<button type="button" id="browser" class="btn btn-primary btn-browser" onclick="$('input[id=patentFile]').click();">浏览</button>	
				<div class="form-group">
					<input type="submit" class="btn btn-primary btn-upload" value="上传">	
				</div>
			</fieldset>
		</form>	
	</div>
</div>
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script type="text/javascript">
	$('input[id=patentFile]').change(function() {  
		$('#filename').val($(this).val());  
	});
</script>
</body>
</html>