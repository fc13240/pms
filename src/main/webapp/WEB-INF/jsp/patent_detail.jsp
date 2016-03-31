<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>专利详细信息</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
</head>
<body>
	<div class="patent-detail-caption">[ <c:out value="${patent.patentType.typeDescription} ] ${patent.name} ( ${patent.appNo}"/> )</div>
	<table class="table table-striped">
		<tr>
			<td width="33%"><span class="patent-item-title">专利号：</span> <c:out value="${patent.appNo}"/></td>	
			<td width="33%"><span class="patent-item-title">专利类型：</span> <c:out value="${patent.patentType.typeDescription}"/></td>	
			<td width="34%"><span class="patent-item-title">专利名称：</span><c:out value="${patent.name}"/></td>	
		</tr>
		<tr>
			<td><span class="patent-item-title">申请日：</span><fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/></td>	
			<td><span class="patent-item-title">第一申请人：</span><c:out value="${patent.firstAppPerson}"/></td>	
			<td><span class="patent-item-title">案件状态：</span><c:out value="${patent.patentStatus.statusDescription}"/></td>	
		</tr>
		<tr>
			
			<td><span class="patent-item-title">共享人：</span><c:out value="${patent.shareUsersAsString}"/></td>	
			<td></td>	
			<td></td>	
		</tr>		
	</table>
	
<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>	
</body>
</html>