<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>专利列表</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
	<style>
		a {
			font-size: 20px;
		}
		p {
			padding-left: 100px;
		}
	</style>
</head>
<body>
<table style="padding-left:200px;" class="table table-bordered table-striped">
<tr><td><a href="<s:url value='/patent/list.html'/>?currentPage=1">我的专利</a></td></tr>
<tr><td><a href="<s:url value='/friend/list.html'/>">我的好友</a></td></tr>
<tr><td><a href="<s:url value='/friend/searchForm.html'/>">添加好友</a></td></tr>
<tr><td><a href="<s:url value='/friend/request/list.html'/>">好友请求处理</a></td></tr>
<tr><td><a href="<s:url value='/sharePatent/list.html'/>">我分享的专利</a></td></tr>
<tr><td><a href="<s:url value='/sharePatent/friendShareList.html'/>">好友分享给我的专利</a></td></tr>
<tr><td><a href="<s:url value='/notice/list.html'/>">我的通知书</a></td></tr>
<tr><td><a href="<s:url value='/patent/showUploadForm.html'/>">上传专利</a></td></tr>
<tr><td><a href="<s:url value='/notice/showUploadForm.html'/>">上传通知书</a></td></tr>
<tr><td><a href="<s:url value='/fee/monitoredFeeList.html'/>">费用监控</a></td></tr>
</table>
</body>
</html>