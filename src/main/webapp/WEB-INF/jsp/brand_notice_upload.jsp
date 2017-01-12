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
<title>龙图腾专利管家——上传通知书</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>

<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_brand_management.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">

					<form action="<s:url value='/brandNotice/saveBrandNotice.html'/>" method="post" onsubmit="return checkRequired()">
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  	<input type="hidden" name="brand.id" id="brand" value="${brandId }"/>
						<h5>发文日:</h5>
					    <input class="selectPointOfInterest form-control" style="width:382px;"  type="text" onclick="WdatePicker({el:'dispatchDateId'})" id="dispatchDateId" name="dispatchDate" placeholder="发文日" value="" readonly="readonly">
					    <span id="dispatchDateError" style="color: red; display: none;font-weight:700;" >请选择发文日</span>
					    <br/>
				        <h5>通知类型:</h5>
				        <select style="width:382px;" class="selectPointOfInterest form-control" name="noticeType.noticeTypeId" id="noticeTypeId">
				          <option value="">全部</option>
				          <c:forEach items="${noticeTypes}" var="noticeType">
				            <option value="<c:out value='${noticeType.noticeTypeId}'/>">
				            <c:out value="${noticeType.noticeTypeDescription}"/>
				            </option>
				          </c:forEach>
				        </select>
				        <span id="noticeTypeError" style="color: red; display: none;font-weight:700;" >请选择通知类型</span>
				        <br>
				       	<h5>pdf上传:</h5>
						<input type="hidden" class="form-control" style="width:600px;" maxlength="100" id="brandNoticeFileHidden" name="zipfileName" value=""/>
						<input style="width:300px;display:inline;" type="text" id="brandNoticeFilename"  class="selectPointOfInterest form-control" placeholder="请选择pdf文件" readonly="readonly" onclick="$('input[id=brandNoticeFile]').click();"/>
						<button type="button" onclick="uploadNoticeClick()" class="t-btn3 button button-primary  button-rounded">上传</button>
						<br/><span id="pdfError" style="color: red; display: none;font-weight:700;" >请上传通知书pdf文件</span>
						<br/>
						
					    <div style="height:20px;"></div>
					    <button type="submit" class="t-btn3 button button-primary  button-rounded">提交</button>
					  </div>
					    
					</form>	
					<form action="<s:url value='/brandNotice/uploadBrandNoticeFile.html'/>" id="uploadBrandNoticeFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
						<input style="display:none" type="file" id="brandNoticeFile" name="file"/>
						<button type="button" id="uploadBrandNoticeBtn" style="display:none;" onclick="uploadBrandNoticeFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
					</form>				
				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>


<script type="text/javascript">
	$(function () {
		document.getElementById("dispatchDateError").style.display = "none";
		document.getElementById("noticeTypeError").style.display = "none";
		document.getElementById("pdfError").style.display = "none";
	});
	
	function uploadBrandNoticeFile() {
		var uploadForm = $("#uploadBrandNoticeFileForm");
		var option = {
			dataType : "json",
			data : {"file":$("#brandNoticeFile").val()},
			beforeSubmit : function () {
				var filename = $("#brandNoitceFilename").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf(".")+1);
				if(suffix == "pdf") {
					return true;
				} else {
					alert("请选择pdf格式的通知书，再进行上传！");
					return false;
				}
			},
			success : function (result) {
				$("#brandNoticeFileHidden").val(result);
				$("#brandNoticeFilename").val("");
				alert("上传成功");
				
			}
				
		}
		uploadForm.ajaxSubmit(option);
	}
	
	$('input[id=brandNoticeFile]').change(function(){
		$("#brandNoticeFilename").val($(this).val());
	})

	function uploadNoticeClick(){
		$("#uploadBrandNoticeBtn").trigger("click");
	}
	
	
	function checkRequired(){
		if($("#dispatchDateId").val() == '') {
			document.getElementById("dispatchDateError").style.display = "";
			return false;
		} else {
			document.getElementById("dispatchDateError").style.display = "none";
		}
		if($("#noticeTypeId").val() == '') {
			document.getElementById("noticeTypeError").style.display = "";
			return false;
		} else {
			document.getElementById("noticeTypeError").style.display = "none";
		}
		if($("#brandNoticeFileHidden").val() == '') {
			document.getElementById("pdfError").style.display = "";
			return false;
		} else {
			document.getElementById("pdfError").style.display = "none";
		} 
		return true;
	}
	
</script>
	
</body>
</html>


               