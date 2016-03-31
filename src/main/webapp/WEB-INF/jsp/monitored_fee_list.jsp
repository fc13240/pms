<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>专利列表</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>
	<div class="row">
		<div class="col-lg-12">
			<p>
				<span>专利类型</span><span style="margin-left: 62px;">缴费状态</span>
				<span style="margin-left: 30px;">费用类型</span><span style="margin-left: 60px;">缴费截止日</span>
			</p>
			<form action="<s:url value='/fee/search.html'/>" method="get" class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<select class="form-control" id="patentType" name="patentType">
					  <option value="">全部</option>
					  <option value="1">发明</option>
					  <option value="2">实用新型</option>
					  <option value="3">外观设计</option>
					</select>
				</div>
				<div class="form-group">
					<select class="form-control" id="paymentStatus" name="paymentStatus">
					  <option value="">全部</option>
					  <option value="1">应缴</option>
					  <option value="2">已缴</option>
					</select>
				</div>			
				<div class="form-group">
					<select class="form-control" id="patentStatus" name="patentStatus">
					  <option value="">全部</option>
					  <option value="1">申请费</option>
					  <option value="3">年登印费</option>
					  <option value="6">维持年费</option>
					</select>
				</div>		
				<div class="form-group">
					<input type="text" class="form-control" id="startDeadline" name="startDeadline" placeholder="缴费截止日开始" 
					value="" readonly="readonly" onclick="javascript:$('#start_fee_end_date_img').click()"> 
					<img onclick="WdatePicker({el:'startDeadline'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="start_fee_end_date_img"> - 
				</div>	
				<div class="form-group">
					<input type="text" class="form-control" id="endDeadline" name="endDeadline" placeholder="缴费截止日结束" 
					value="" readonly="readonly" onclick="javascript:$('#end_fee_end_date_img').click()"> 
					<img onclick="WdatePicker({el:'endDeadline'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_fee_end_date_img">
				</div>					
				<div class="form-group">
					<input type="text" class="form-control" id="id_keyword" name="keyword" placeholder="申请号/专利名称/申请人/费用类型"
					value="">
				</div>
				<button type="submit" class="btn btn-primary patent-query">查询</button>
			</form>	
		</div>
	</div>

	<div class="row">
		<div class="col-lg-12">
			<table class="table table-bordered patent-table table-striped">	
				<tr>
					<th colspan="10">
						<input type="checkbox" class="fee-check-item">
						<span class="batch-share"><a href="javascript:batchUpdateInvoiceTitles()">批量修改发票抬头</a></span>
						<span class="batch-share"><a href="javascript:deleteFees()">批量删除</a></span>
						<span class="batch-share"><a href="javascript:exportFees()">批量导出</a></span>
					</th>		
				</tr>
				<tr>
					<th>序号</th>
					<th>申请号/专利号</th>
					<th>专利名称</th>
					<th>第一申请人</th>
					<th>案件状态</th>
					<th>缴费截止日</th>
					<th>缴费种类</th>
					<th>缴费金额</th>
					<th>发票抬头</th>
					<th>费用状态</th>
				</tr>
				<c:forEach items="${fees}" var="fee">
					<tr>
						<td>
							<span class="batch-share-item"><input type="checkbox" class="fee-check-item" fee="${fee.feeId}"></span>
						</td>
						<td>${fee.patent.appNo}</td>
						<td>${fee.patent.name}</td>
						<td>${fee.patent.firstAppPerson}</td>
						<td>${fee.patent.patentStatus.statusDescription}</td>
						<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
						<td>${fee.feeType}</td>
						<td>${fee.amount} </td>
						<td><input type="text" value="${fee.invoiceTitle}" 
								onChange="changeInvoiceTitle('${fee.feeId}', this.value)" size="30"></td>
						<td>${fee.paymentStatus.payementStatusDescription}</td>
					</tr>
				</c:forEach>	
			</table>
		</div>
	</div>
	
<iframe id="feeExcelFileFrame" style="display:none"></iframe>	
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>
<script type="text/javascript">
$(function(){
	formutil.clickAllCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
	formutil.clickItemCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
});	

function exportFees() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择要导出的记录');
		return;
	}	
	
	var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');

	var iframe = document.getElementById('feeExcelFileFrame');
	iframe.src = "<s:url value='/fee/exportFees.html'/>?fees=" + fees;		
}

function batchUpdateInvoiceTitles() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择费用记录');
		return;
	}		
	
	var invoiceTitle = prompt("请输入发票抬头", "");
	if (invoiceTitle != null && invoiceTitle != "") {
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
		
		$.ajax({
			url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fees + "&invoiceTitle=" + invoiceTitle, 
			type: 'get', 
			success: function(data) {
				location.reload();
			}
		});
	} 
}

function changeInvoiceTitle(fee, invoiceTitle) {
	$.ajax({
		url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fee + "&invoiceTitle=" + invoiceTitle, 
		type: 'get', 
		success: function(data) {
			// location.reload();
		}
	});			
}
</script>	
</body>
</html>