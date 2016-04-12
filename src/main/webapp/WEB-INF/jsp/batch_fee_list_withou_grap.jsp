<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<title>费用列表</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>

<div class="row">
	<div class="col-lg-12">
		
		<table class="table table-bordered patent-table table-striped">	
			<tr>
				<th colspan="9">应缴费信息</th>
			</tr>			
			<tr>
				<th colspan="9">
					<input type="checkbox" class="fee-check-item">
					<span class="batch-share"><a href="javascript:updateMonitorStatus(2)">加入监控</a></span>
					<span class="batch-share"><a href="javascript:updateMonitorStatus(1)">放弃监控</a></span>
				</th>		
			</tr>
			<tr>
				<th>序号</th>
				<th>申请号/专利号</th>
				<th>专利名称</th>
				<th>第一申请人</th>
				<th>案件状态</th>
				<th>缴费种类</th>
				<th>缴费截止日</th>
				<th>缴费金额</th>
				<th>监控状态</th>
			</tr>
			<c:forEach items="${fees}" var="fee" varStatus="status">
				<tr>
					<td>
						<span class="batch-share-item"><input type="checkbox" class="fee-check-item" feeId="${fee.feeId}"></span>
						${status.index+1}
					</td>
					<td>${fee.patent.appNo}</td>
					<td>${fee.patent.name}</td>
					<td>${fee.patent.firstAppPerson}</td>
					<td>${fee.patent.patentStatus.statusDescription}</td>
					<td>${fee.feeType}</td>
					<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
					<td>${fee.amount} </td>
					<td>${fee.monitorStatus.monitorStatusDescription}</td>
				</tr>
			</c:forEach>	
		</table>	
	
	
	</div>
</div>

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
	
	function updateMonitorStatus(status) {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		
		if (!feeSelected) {
			formutil.alertMessage('请选择应缴费记录');
			return;
		}
		
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'feeId');
		
		location.href = "<s:url value='/fee/batchChangeMonitorStatus.html'/>?fees=" + fees + "&monitorStatus=" + status;
	}
	
</script>
</body>
</html>