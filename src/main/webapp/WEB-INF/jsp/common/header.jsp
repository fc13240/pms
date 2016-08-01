<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="base" value="<%=basePath%>" scope="application"></c:set>

<!-- 引入findeditor.js -->
<script type="text/javascript" src="${base }/plugins/kindeditor/kindeditor-all-min.js"></script>
<script type="text/javascript" src="${base }/plugins/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${base }/temp/js/jquery.js"></script>
<script type="text/javascript" src="${base }/plugins/kindeditor/plugins/code/prettify.js"></script>
