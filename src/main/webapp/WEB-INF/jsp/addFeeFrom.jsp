<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——添加专利</title>
<%@ include file="_css.jsp" %>
	<script src="<s:url value='/temp/js/jquery.js'/>" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="<s:url value='/static/js/jquery.autocomplete.css'/>"/>
    <script type="text/javascript" src="<s:url value='/static/js/jquery.autocomplete.js'/>"></script>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_fee.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<form action="<s:url value='/fee/addFee.html'/>" method="post" id="addFeeForm">
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  
						<h5>申请号：</h5>
						<input style="width:400px;" class="selectPointOfInterest form-control" name="appNo" id="appNo"  type="text" onblur="loadPatent()" required>
					     
						<br>		
				       	<h5>专利名称:</h5>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="name" id="name" value="" readOnly="true"/>
						<br>
				 		<h5>第一申请人:</h5>
					    <input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="appPerson" id="appPerson" value="" readOnly="true"/>
					    <br>
					    <h5>案件状态:</h5>
					    <input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="patentStatus" id="patentStatus" value="" readOnly="true"/>
						<br>
						<h5>交费截止日:</h5>
						<input style="width:400px;pisplay:inline;"  class="selectPointOfInterest form-control" type="text" class="form-control" id="startAppDateId" 
							name="deadline" placeholder="交费截止日期选择" readonly="readonly" onclick="javascript:$('#start_date_img').click()" required> 
						<img style="display:none;" onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img">
				        <br>
				        <h5>交费种类:</h5>
				        <select style="width:400px;" class="selectPointOfInterest form-control" name="feeType" id="feeType"  required>
						  <option value=''>请选择</option>
						  <c:forEach items="${feeTypes}" var="feeType">
							<option value="${feeType}">${feeType}</option>
						  </c:forEach>
						</select>
						<br>	
				 		<h5>交费金额:</h5>
					    <input style="width:400px;"  type="text" name="amount" class="selectPointOfInterest form-control" required min="1" digits="true"/>
				 		<br>
				 		<h5>发票抬头:</h5>
					    <input style="width:400px;" type="text" class="form-control" name="invoiceTitle" id="invoiceTitle" value="" />
					    <br>
					    <div style="height:20px;"></div>
						<button class="button button-primary  button-rounded" type="submit" style="width:90px;">保存</button>		
					</form>				
				</div>

				
				
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>





	




</div>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script> 

<script type="text/javascript">
$(function() {
	var appNos = [];
	<c:forEach items="${patents}" var="patent">
		appNos.push("${patent.appNo}");
	</c:forEach>
	
     $().ready(function() {
     	$("#appNo").autocomplete(appNos);	
     });
	
	
	$("#addFeeForm").validate({
		submitHandler: function(form){ 
			form.submit();     
		}
	});	
});

function addDefaultOption(selectElem) {
	selectElem.append("<option value=''>请选择</option>");
}

function resetSelect() {
	for (var i = 0; i < arguments.length; i++) {
		var selectObj = arguments[i];
		selectObj.empty();
		addDefaultOption(selectObj);
	}
}

function addOptions(selectObj, options) {
	$.each(options, function(index, val){
		selectObj.append("<option value='" + val + "'>" + val + "</option>");
	});	
}
function loadPatent() {
	var appNo = $("#appNo").val();
	if (appNo != "") {
		$.ajax({
			url: "<s:url value='/fee/getPatentByPatentId.html'/>?appNo=" + appNo,
			type: 'get',
			dataType: 'json',
			success: function(result) {
				$("#name").val(result.patent.name);
				$('#appPerson').val(result.patent.appPerson);
				$('#patentStatus').val(result.patent.patentStatus.statusDescription);
				var feeType = $("#feeType");
				resetSelect(feeType);
				addOptions(feeType, result.feeTypes);
			}
		})
	} 
}
</script>

</body>
</html>