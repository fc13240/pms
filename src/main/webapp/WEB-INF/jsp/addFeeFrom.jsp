<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_fee.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">添加费用信息</span>
	</div>
	
	<form action="<s:url value='/fee/addFee.html'/>" method="post" id="addFeeForm">
	  <div class="t-third">
	    <ul>
	      <li>
	        <p>申请号:</p>
	        <select name="appNo" id="appNo" onchange="loadPatent()" required>
			  <option value=''>请选择专利号</option>
			  <c:forEach items="${patents}" var="patent">
				<option value="${patent.appNo}">${patent.appNo}</option>
			  </c:forEach>
			</select>
	      </li>
	      <li>
	        <p>专利名称:</p>
	        <input style="height:16px;" type="text" name="name" id="name" value="" readOnly="true"/>
	      </li>
	      <li>
	        <p>第一申请人:</p>
	        <input style="height:16px;" type="text" name="appPerson" id="appPerson" value="" readOnly="true"/>
	      </li>
	      <li>
	        <p>案件状态:</p>
	        <input style="height:16px;" type="text" name="patentStatus" id="patentStatus" value="" readOnly="true"/>
	      </li>
	      <li>
	        <p>缴费截止日:</p>
	        <div style="margin-top:10px;" >
					<div class="input-group">
					  <div style="float:left;margin-left: 16px;" class="form-group" style="margin-left:15px;" >
					  <div style="float:left;">
						<input  type="text" class="form-control" id="startAppDateId" 
						name="deadline" placeholder="缴费截止日期选择" 
						readonly="readonly" onclick="javascript:$('#start_date_img').click()" style="width: 150px;height: 16px" required> </div>
					  <div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="25" height="30" align="absmiddle" id="start_date_img"></div>
					</div>
				  </div>
				  </div>
	      </li>
	      <li>
	        <p>缴费种类:</p>
	        <select name="feeType" id="feeType"  required>
			  <option value=''>请选择</option>
			  <c:forEach items="${feeTypes}" var="feeType">
				<option value="${feeType}">${feeType}</option>
			  </c:forEach>
			</select>
	      </li>
	      <li>
	        <p>缴费金额:</p>
	        <input style="height:16px;" type="text" name="amount" id="amount"  required min="1" digits="true"/>
	      </li>
	      <li>
	        <p>发票抬头:</p>
	        <input style="height:16px;" type="text" name="invoiceTitle" id="invoiceTitle" value=" " />
	      </li>
	      <li>
	        <p>&nbsp;</p>
	        <button type="submit">保存</button>
	      </li>
	    </ul>
	  </div>
	</form>


</div>
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script> 

<script type="text/javascript">
$(function() {
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