<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>通知书列表</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
</head>
<body>
<div class="row">
	<div class="col-lg-12">
		<p>
			<span>专利类型</span><span style="margin-left: 62px;">通知状态</span>
			<span style="margin-left: 40px;">通知类型</span><span style="margin-left: 60px;">纸质申请</span><span style="margin-left: 68px;">申请日期</span>
			<span style="margin-left: 222px;">发文日期</span><span style="margin-left: 200px;">关键字</span>
		</p>
		
		<form action="<s:url value='/notice/search.html'/>" method="get" class="navbar-form navbar-left" role="search">
			<div class="form-group">
				<select class="form-control" id="patentTypeId" name="patentType">
					<option value="">全部</option>
					<c:forEach items="${patentTypes}" var="patentType">
						<option value="<c:out value='${patentType.patentTypeId}'/>"><c:out value="${patentType.typeDescription}"/></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control" id="noticeProcessStatusId" name="noticeProcessStatus">
					<option value="">全部</option>
					<c:forEach items="${noticeProcessStatus}" var="processStatus">
						<option value="<c:out value='${processStatus.processStatusId}'/>"><c:out value="${processStatus.processStatusDescription}"/></option>
					</c:forEach>
				</select>
			</div>			
			<div class="form-group">
				<select class="form-control" id="noticeTypeId" name="noticeType">
					<option value="">全部</option>
					<c:forEach items="${noticeTypes}" var="noticeType">
						<option value="<c:out value='${noticeType.noticeTypeId}'/>"><c:out value="${noticeType.noticeTypeDescription}"/></option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control" id="paperApplyTypeId" name="paperApplyType">
					<option value="">全部</option>
					<c:forEach items="${paperApplyTypes}" var="paperApplyType">
						<option value="<c:out value='${paperApplyType.paperTypeId}'/>"><c:out value="${paperApplyType.paperTypeDescription}"/></option>
					</c:forEach>
				</select>
			</div>			
			<div class="form-group">
				<input type="text" class="form-control" id="startAppDate" name="startAppDate" placeholder="申请日开始" 
				value="" readonly="readonly" onclick="javascript:$('#start_date_img').click()"> 
				<img onclick="WdatePicker({el:'startAppDate'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="start_date_img"> - 
			</div>	
			<div class="form-group">
				<input type="text" class="form-control" id="endAppDate" name="endAppDate" placeholder="申请日结束" 
				value="" readonly="readonly" onclick="javascript:$('#end_date_img').click()">  
				<img onclick="WdatePicker({el:'endAppDate'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img">
			</div>		
			<div class="form-group" style="margin-left: 20px;">
				<input type="text" class="form-control" id="startDispatchDate" name="startDispatchDate" placeholder="发文日开始" 
				value="" readonly="readonly" onclick="javascript:$('#fawen_start_date_img').click()"> 
				<img onclick="WdatePicker({el:'startDispatchDate'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="fawen_start_date_img"> - 
			</div>	
			<div class="form-group">
				<input type="text" class="form-control" id="endDispatchDate" name="endDispatchDate" placeholder="发文日结束" 
				value="" readonly="readonly" onclick="javascript:$('#fawen_end_date_img').click()">  
				<img onclick="WdatePicker({el:'endDispatchDate'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="fawen_end_date_img">
			</div>				
			<div class="form-group">
				<select class="form-control" id="keywordType" name="keywordType">
				  <option value="all">全部</option>
				  <option value="appNo">申请号</option>
				  <option value="appName">专利名称</option>
				  <option value="appPerson">申请人</option>
				  <option value="noticeName">通知书名称</option>
				  <option value="patentStatus">案件状态</option>
				</select>
			</div>			
			<div class="form-group">
				<input type="text" class="form-control" id="keyword" name="keyword" placeholder="申请号/专利名称/申请人/通知书名称/案件状态"
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
				<th colspan="13">
					<input type="checkbox" class="check-item">
					<span class="batch-share"><a href="javascript:batchShare()">批量分享</a></span>
					<span class="batch-share"><a href="javascript:batchFee()">批量缴费</a></span>
				</th>
			</tr>
			<tr>
				<th>序号</th>
				<th>申请号/专利号</th>
				<th>专利名称</th>
				<th>第一申请人</th>
				<th>案件状态</th>
				<th>共享人</th>
				<th>发文日</th>
				<th>通知书名称</th>		
				<th>纸件申请</th>
				<th>期限</th>
				<th>通知状态</th>			
				<th>处理人</th>		
				<th>操作</th>		
			</tr>
			<c:forEach items="${notices}" var="notice">
				<tr>
					<td>
						<span class="batch-share-item"><input type="checkbox" class="check-item" patent="<c:out value='${notice.noticeId}'/>"></span>
						
					</td>
					<td><a href="javascript:window.open('<s:url value="/patent/detail/"/><c:out value="${notice.patent.patentId}"/>.html')"><c:out value="${notice.patent.appNo}"/></a></td>
					<td><c:out value="${notice.patent.name}"/></td>
					<td><c:out value="${notice.patent.firstAppPerson}"/></td>
					<td><c:out value="${notice.patent.patentStatus.statusDescription}"/></td>
					<td><c:out value="${notice.patent.shareUsersAsString}"/></td>
					<td><fmt:formatDate value="${notice.dispatchDate}" pattern="yyyy-MM-dd"/></td>
					<td><a id="preview" href='javascript:void(0);' onclick="javascript:window.open('<s:url value='/notice/preview.html'/>?notice=${notice.noticeId}',  '_blank')"><c:out value="${notice.name}"/></a></td>
					<td>
						<select class="form-control" onchange="javascript:changePaperApplyType('${notice.noticeId}', this)">
							<c:forEach items="${paperApplyTypes}" var="paperApplyType">
								<option value="<c:out value='${paperApplyType.paperTypeId}'/>" <c:if test="${paperApplyType.paperTypeId==notice.paperApplyType.paperTypeId}">selected="selected"</c:if>>
									<c:out value="${paperApplyType.paperTypeDescription}"/>
								</option>
							</c:forEach>
						</select>
					</td>
					<td>
						<c:choose>
							<c:when test="${notice.remainDays == -1}">
								已超期
							</c:when>
							<c:otherwise>
								<c:out value="${notice.remainDays}"/>
							</c:otherwise>
						</c:choose>
					</td>
					<td>
						<select class="form-control" onchange="javascript:processNotice('${notice.noticeId}', this)">
							<c:forEach items="${noticeProcessStatus}" var="processStatus">
								<option value="<c:out value='${processStatus.processStatusId}'/>" <c:if test="${processStatus.processStatusId==notice.processStatus.processStatusId}">selected="selected"</c:if>>
									<c:out value="${processStatus.processStatusDescription}"/>
								</option>
							</c:forEach>
						</select>
					</td>
					<td><c:out value="${notice.processUser.username}"/></td>
					<td width="150px">
						<a href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${notice.patent.patentId}'/>">分享</a>
						<a id="download" href="<s:url value='/notice/download.html'/>?notice=${notice.noticeId}">下载</a>
					</td>	 			
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
function changePaperApplyType(notice, selectElement) {
	paperApplyType = 1;
	for (var i = 0; i < selectElement.length; i++) {
		if (selectElement.options[i].selected == true) {
			paperApplyType = selectElement.options[i].value;
		}
	}		

	$.ajax({
		url: "<s:url value='/notice/changePaperType.html'/>?notice=" + notice + "&paperApplyType=" + paperApplyType,
		type: 'get', 
		success: function(data) {
			if (data == "no-permission") {
				$("<div>共享人只能把[纸质申请]修改为[申请纸件]</div>").dialog({
					modal: true,
					buttons: {
						Ok: function() {
							$(this).dialog("close");
						}
					}	
				});		

				return;
			}
			
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});
			
		}
	});			
}

function processNotice(notice, selectElement) {
	processStatus = 1;
	for (var i = 0; i < selectElement.length; i++) {
		if (selectElement.options[i].selected == true) {
			processStatus = selectElement.options[i].value;
		}
	}		

	$.ajax({
		url: "<s:url value='/notice/processNotice.html'/>?notice=" + notice + "&processStatus=" + processStatus,
		type: 'get', 
		success: function(data) {
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});
		}
	});			
}
</script>
</body>
</html>