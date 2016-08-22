<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家——上传申请人文档</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>

<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="height:300px;padding:20px;">
					<form id="appPersonFileForm" action="<s:url value='/appPerson/uploadAttachmentFile.html'/>" method="post" enctype="multipart/form-data" class="form-horizontal">  
						<input style="display:none;"  id="appPersonFile" name="file" type="file" />
						<input class="selectPointOfInterest form-control"  style="width:300px;display:inline;" type="text" id="filename" name="filename" placeholder="请选择文件" readonly="readonly">
						<button type="button" onclick="$('input[id=appPersonFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
						<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded" onclick="uploadAppPersonFile()">上传</button>
						<input type="hidden" id="appPersonId" name="appPersonId" value="${appPersonId}">
					</form> 
					<div style="height:10px;">&nbsp;</div> 
					<span style="color:#666;">友情提示：建议上传后缀名为.doc或.docx格式的专利文档!
					</span>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>


<script type="text/javascript">
	$('input[id="appPersonFile"]').change(function() {
		$('#filename').val($(this).val());  
	});
	
	function uploadAppPersonFile(value){
		var hideForm = $('#appPersonFileForm'); 
		var options = {
			dataType : "json", 
			data: {'file': $("#appPersonFile").val()},
			beforeSubmit : function() {
				var name=$("#filename").val();
				var mime = name.toLowerCase().substr(name.lastIndexOf("."));
				if(mime ==".doc" || mime ==".docx"){
					return true;
				}else{
					alert("请上传后缀名为.doc或.docx格式的专利文档！");
					return false;
				}
			}, 
			success : function(result) {
				uploadSuccess(result); 
			}, 
			error : function() {
				alert("上传失败"); 
			} 
		}; 
		hideForm.ajaxSubmit(options); 
	}
	function uploadSuccess(value){
		var appPersonId=$("#appPersonId").val();
		$.ajax({
			type: "POST",
			url: "<s:url value='/appPerson/saveAppPersonFile.html'/>",
			data: {"appPersonId":appPersonId,"appPersonUrl":value},
			success: function(data){
				alert("保存成功");
			},
			error: function(){
				alert("保存失败");
			}
		});
	}

	
</script>
<script type="text/javascript" src="<s:url value='/temp/js/jquery_from.js'/>"></script>	
</body>
</html>


               