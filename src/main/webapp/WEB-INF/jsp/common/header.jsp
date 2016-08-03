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
<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/simple/simple.css" />
<link rel="stylesheet" href="${base }/plugins/kindeditor/plugins/code/prettify.css" />
<link href="${base }/static/css/edit_instruct.css?v=2.3.20150415" type="text/css" rel="stylesheet" />
<script src="${base }/static/js/tab_change.js" type="text/javascript"></script>   <!--tabChange-->
 <script src="${base }/plugins/kindeditor/js-selfwrite.js" type="text/javascript"></script>
<script src="${base }/plugins/kindeditor/selfwritefigure.js" type="text/javascript"></script>   <!--uploadImg-->
<script src="${base }/plugins/kindeditor/selfwritefigure2.js" type="text/javascript"></script>   <!--uploadImg-->
<link rel="stylesheet" href="${base }/temp/zyupload/skins/zyupload-1.0.0.css " type="text/css">
<script type="text/javascript" src="${base }/temp/zyupload/zyupload.basic-1.0.0.js"></script>
<script type="text/javascript" src="${base }/temp/zyupload/jquery.easing.min.js"></script>
<link type="text/css" rel="stylesheet" media="screen" href="${base }/temp/zyupload/style.css" />
<script src="${base }/plugins/kindeditor/layer.min.js" type="text/javascript"></script>
