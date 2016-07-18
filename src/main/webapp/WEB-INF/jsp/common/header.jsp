<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="base" value="<%=basePath%>" scope="application"></c:set>

<!-- 引入findeditor.js -->
<script src="<s:url value='/plugins/kindeditor/kindeditor-all-min.js'/>"></script>
<script src="<s:url value='/plugins/kindeditor/lang/zh_CN.js'/>"></script>
<script src="<s:url value='/temp/js/jquery.min.js'/>"></script>