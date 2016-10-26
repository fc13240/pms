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


<!--  -->

<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap.min.css'/>">
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap-theme.min.css'/>">
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="<s:url value='/temp/js/jquery.min.js'/>"></script>
<script src="<s:url value='/temp/js/jquery-ui.min.js'/>" type="text/javascript"></script>
<script src="<s:url value='/temp/js/formutil.js'/>" type="text/javascript"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<s:url value='/temp/css/common.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" href="<s:url value='/temp/css/buttons.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
<link rel="stylesheet" media="screen" href="<s:url value='/temp/css/jquery-ui.min.css'/>" />
<!-- 引入findeditor.js -->
<script type="text/javascript" src="${base }/plugins/kindeditor/kindeditor-all.js"></script>
<script type="text/javascript" src="${base }/plugins/kindeditor/lang/zh_CN.js"></script>
<script type="text/javascript" src="${base }/plugins/kindeditor/plugins/code/prettify.js"></script>
<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/simple/simple.css" />
<link rel="stylesheet" href="${base }/plugins/kindeditor/plugins/code/prettify.css" />

 <script src="${base }/plugins/kindeditor/js-selfwrite.js" type="text/javascript"></script>
<script src="${base }/plugins/kindeditor/selfwritefigure.js" type="text/javascript"></script>   <!--uploadImg-->
<script src="${base }/plugins/kindeditor/selfwritefigure2.js" type="text/javascript"></script>   <!--uploadImg-->
<script type="text/javascript">
			var editor;
			KindEditor.ready(function(K) {
				   editor = K.create('#newsContent', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
				   cssData: 'body {font-family: "宋体"; font-size: 14px}',
 				   uploadJson : "${base}/kindeditor/newsFileUpload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 2,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
				   themeType : 'simple',  //指定主题风格，可设置”default”、”simple”  指定simple时需要引入simple.css
				   height  : '510px',
				   width:'900px',
				   readonlyMode : false, //只读模式 默认为false
				   allowFileManager : false,  //显示浏览远程服务器按钮
				   allowImageUpload : true,
				   afterBlur: function(){this.sync();},
				   syncType:"auto",
				   afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {
							self.sync();
							document.forms['from'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   }
				});
				
				prettyPrint();
			});
		</script>