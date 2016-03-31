<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>

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
			<span>专利类型</span><span style="margin-left: 62px;">专利状态</span>
			<span style="margin-left: 72px;">申请日期</span><span style="margin-left: 390px;">关键字</span>
		</p>
		<form action="<s:url value='/patent/search.html'/>" method="get" class="navbar-form navbar-left" role="search">
			<input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
			<div class="form-group">
				<select class="form-control" id="patentTypeId" name="patentType">
					<option value="">全部</option>
					<c:forEach items="${allPatentTypes}" var="patentType">
						<option value="<c:out value='${patentType.patentTypeId}'/>"><c:out value="${patentType.typeDescription}"/></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control" id="patentStatusId" name="patentStatus">
				  	<option value="">全部</option>
				  	<c:forEach items="${allPatentStatus}" var="patentStatus">
						<option value="<c:out value='${patentStatus.patentStatusId}'/>"><c:out value="${patentStatus.statusDescription}"/></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" id="startAppDateId" name="startAppDate" placeholder="申请日开始" 
				value="<fmt:formatDate value='${searchCondition.startAppDate}' pattern='yyyy-MM-dd'/>" readonly="readonly" onclick="javascript:$('#start_date_img').click()"> 
				<img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="start_date_img"> - 
			</div>	
			<div class="form-group">
				<input type="text" class="form-control" id="endAppDateId" name="endAppDate" placeholder="申请日结束" 
				value="<fmt:formatDate value='${searchCondition.endAppDate}' pattern='yyyy-MM-dd'/>" readonly="readonly" onclick="javascript:$('#end_date_img').click()">  
				<img onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img">
			</div>				
			<div class="form-group">
				<input type="text" class="form-control" id="keywordId" name="keyword" placeholder="申请号/名称/申请人/内部编码" value="${searchCondition.keyword}">
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
					<input type="checkbox" class="patent-check-item">
					<span class="batch-share"><a href="javascript:batchShare()">批量分享</a></span>
					<span class="batch-share"><a href="javascript:batchFee()">批量缴费</a></span>
				</th>
			</tr>
			<tr>
				<th>序号</th>
				<th>申请号/专利号</th>
				<th>专利名称</th>
				<th>第一申请人</th>
				<th>申请日</th>
				<th>专利类型</th>
				<th>案件状态</th>		
				<th>内部编码</th>
				<th>共享人</th>
				<th>操作</th>			
			</tr>
			<c:forEach items="${patents}" var="patent">
				<tr>
					<td>
						<span class="batch-share-item"><input type="checkbox" class="patent-check-item" patent="${patent.patentId}"></span>
						
					</td>
					<td><a href="javascript:window.open('<s:url value="/patent/detail/"/>${patent.patentId}.html')"><c:out value="${patent.appNo}"/></a></td>
					<td><c:out value="${patent.name}"/></td>
					<td><c:out value="${patent.appPerson}"/></td>
					<td><fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/></td>
					<td><c:out value="${patent.patentType.typeDescription}"/></td>
					<td><c:out value="${patent.patentStatus.statusDescription}"/></td>
					<td>
						<input type="text" value="${patent.internalCode}" size="30" onChange="changeInternalCode('${patent.patentId}', this.value)">
					</td>
					<td>
							<a href="">
								<c:out value="${patent.shareUsersAsString}"/>
							</a>;
					</td>
					<td width="150px">
						<a href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${patent.patentId}'/>">分享</a>
						<a href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${patent.patentId}'/>">缴费</a>
					</td>	 			
				</tr>
			</c:forEach>
		</table>
	</div>
</div>

<form:form action="" modelAttribute="searchCondition" method="get">
	<input type="text" id="search.page.nextPage" name="page.nextPage"/><a href="javascript:nextPage()">下一页</a>
</form:form>

<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>	
<script type="text/javascript">
$(function(){
	formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
})

function nextPage() {
	var patentType = $("#patentTypeId").val();
	var patentStatus = $("#patentStatusId").val();
	var startAppDate = $("#startAppDateId").val();
	var endAppDate = $("#endAppDateId").val();
	var keyword = $("#keywordId").val();
	var nextPage = document.getElementById("search.page.nextPage").value;
	var url = "<s:url value='/patent/list.html'/>?currentPage=" + nextPage;
	
	if (isSearch()) {
		url = "<s:url value='/patent/search.html'/>?patentType="+patentType + "&patentStatus=" + patentStatus + "&startAppDate=" + startAppDate + 
			"&endAppDate=" + endAppDate + "&keyword=" + keyword + "&page.currentPage=" + nextPage;;
	}
	
	location.href = url
}

function isSearch() {
	var patentType = $("#patentTypeId").val();
	var patentStatus = $("#patentStatusId").val();
	var startAppDate = $("#startAppDateId").val();
	var endAppDate = $("#endAppDateId").val();
	var keyword = $("#keywordId").val();
	
	if (!isEmpty(patentType) || !isEmpty(patentStatus) || !isEmpty(startAppDate) || !isEmpty(endAppDate) || !isEmpty(keyword)) {
		return true;
	}
	
	return false;
}

function isEmpty(value) {
	if (value == null || value == "undefined" || value == "") {
		return true;
	}
	
	return false;
}

function batchShare() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
	
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		return;
	}
	
	var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent').join(",");
	
	location.href = "<s:url value='/patent/showFriends.html'/>?patents=" + patents;
}
	
function batchFee() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
	
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		return;
	}
		
	var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
	
	 window.open("<s:url value='/fee/batchGrabFees.html'/>?patents=" + patents);
}	
	
function getFeeInfo(patentId) {
	window.open("/fee/list?patentId=" + patentId);
}
	
function deleteShare(patentId) {
	$.ajax({
		url: "" + patentId, 
		type: 'get', 
		dataType: "json",
		success: function(data) {
			if (data.result == 'not-owner') {
				formutil.alertMessage('你不是专利的拥有者，无法取消分享');				
			} else {
				formutil.alertMessage('分享已取消', true);	
			}
		}
	});			
}
	
function changeInternalCode(patentId, internalCode) {
	$.ajax({
		url: "<s:url value='/patent/changeInternalCode.html'/>?patentId=" + patentId + "&internalCode=" + internalCode, 
		type: 'get', 
		success: function(data) {
			//formutil.alertMessage('内部编码修改成功');	
		},
		error: function() {
			formutil.alertMessage('内部编码修改失败');
		}
	});
}

</script>
</body>
</html>