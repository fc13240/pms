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
<script type="text/javascript">
			var editor;
			KindEditor.ready(function(K) {
				   editor = K.create('#editorContent', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 2,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
				   themeType : 'default',  //指定主题风格，可设置”default”、”simple”  指定simple时需要引入simple.css
				   height  : '700px',
				   width:'950px',
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
				/* editor.html("<strong>请填写发明名称！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor7;
			KindEditor.ready(function(K) {
				   editor7 = K.create('#editorContent7', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 2,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
				   themeType : 'default',  //指定主题风格，可设置”default”、”simple”  指定simple时需要引入simple.css
				   height  : '270px',
				   width:'850px',
				   readonlyMode : false, //只读模式 默认为false
				   allowFileManager : false,  //显示浏览远程服务器按钮
				   allowImageUpload : true,
				   afterBlur: function(){this.sync();},
				   syncType:"auto",
				   afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {
							self.sync();
							document.forms['from7'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from7'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   },
				   
				});
				prettyPrint();
				/* editor7.html("<strong>请填写群里要求部分！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor8;
			KindEditor.ready(function(K) {
				   editor8 = K.create('#editorContent8', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 2,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
				   themeType : 'default',  //指定主题风格，可设置”default”、”simple”  指定simple时需要引入simple.css
				   height  : '270px',
				   width:'850px',
				   readonlyMode : false, //只读模式 默认为false
				   allowFileManager : false,  //显示浏览远程服务器按钮
				   allowImageUpload : true,
				   afterBlur: function(){this.sync();},
				   syncType:"auto",
				   afterCreate : function() {
						var self = this;
						K.ctrl(document, 13, function() {
							self.sync();
							document.forms['from8'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from8'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   },
				   
				});
				prettyPrint();
				/* editor8.html("<strong>请填写专利的摘要！</strong>"); */
			});
		</script>
