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
<title>龙图腾专利管家——添加专利</title>
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
					<form action="<s:url value='/fee/addFee.html'/>" method="post" id="addFeeForm" >
					  <div class="lt-third" style="background:#fff;margin-top:10px;">
					  
						<h5>申请号：</h5>
						<input style="width:400px;display:inline;" class="selectPointOfInterest form-control" name="appNo" id="appNo"  type="text" onblur="loadPatent()" required maxLength="30"/>
						<span id="appNoTip">(注：不要输入字母和小数点)</span>
						<span
							style="color: black; display: none;font-weight:700;" id=appNoError>请输入正确的专利号</span>
						<br>
						
						<h5>专利类型:</h5>
				        <select style="width:400px;" class="selectPointOfInterest form-control" name="patentType" id="patentType" onblur="loadFeeTypes()" required >
				           <option value="">请选择</option>
				          <c:forEach items="${allPatentTypes}" var="patentType">
				            <option value="<c:out value='${patentType.patentTypeId}'/>">
				            <c:out value="${patentType.typeDescription}"/>
				            </option>
				          </c:forEach>
				        </select>
				        <br>	
				        	
				       	<h5>专利名称:</h5>
				       	<input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="name" id="name" value="" maxLength="100"/>
						<br>
				 		<h5>第一申请人:</h5>
					    <input style="width:400px;" class="selectPointOfInterest form-control" type="text" name="appPerson" id="appPerson" value="" onblur="loadInvoiceTitle()" required maxLength="100"/>
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
				 		<h5>缴费金额:</h5>
					    <input style="width:400px;"  type="text" name="amount" class="selectPointOfInterest form-control" required min="1" maxLength="10" digits="true"/>
				 		<br>
				 		<input type="hidden" name="invoiceTitle" id="invoiceTitle" />
					    <div style="height:20px;"></div>
						<button class="button button-primary  button-rounded" type="submit" style="width:130px;">加入交费购物车</button>		
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
			if (loadPatent()) {
				form.submit();
			} 			     
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
	$.each(options, function(index, val,val2){
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
				$("#patentType").val(result.patent.patentType.patentTypeId);				
				var feeType = $("#feeType");
				resetSelect(feeType);
				addOptions(feeType, result.feeTypes);
			}
		});
		var checkAppNo = /^[0-9]+$/;
		var reg = new RegExp(checkAppNo);	
		document.getElementById("appNoTip").style.display = "";
		document.getElementById("appNoError").style.display = "none";
		if (!reg.test(appNo)) {
			document.getElementById("appNoTip").style.display = "none";
			document.getElementById("appNoError").style.display = "";
			return false;
		} else {
			return true;
		}
	}
	return false;
		
}

function loadFeeTypes() {
	var patentTypeId = $("#patentType").val();
	if (patentType != "") {
		$.ajax({
			url: "<s:url value='/fee/getFeeTypesByPatentType.html'/>?patentTypeId=" + patentTypeId,
			type: 'get',
			dataType: 'json',
			success: function(result) {				
				var feeType = $("#feeType");
				resetSelect(feeType);
				addOptions(feeType, result.feeTypes);
			}
		});
	} 
}

function loadInvoiceTitle() {
	var invoiceTitle = $("#appPerson").val();
	$("#invoiceTitle").val(invoiceTitle); 
}

</script>

</body>
</html>