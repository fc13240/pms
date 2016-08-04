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
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
					      $('.word_count2').html(this.count('text'));  //字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字
					      //限制字数
					      var limitNum = 100;  //设定限制字数
					      var pattern = '还可以输入' + limitNum + '字'; 
					      $('.word_surplus').html(pattern); //输入显示
					      if(this.count('text') > limitNum) {
					       pattern = ('字数超过限制，请适当删除部分内容');
					       //超过字数限制自动截取
					       var strValue = editor.text();
					       strValue = strValue.substring(0,limitNum);
					       editor.text(strValue);      
					       } else {
					       //计算剩余字数
					       var result = limitNum - this.count('text'); 
					       pattern = '<font color="red">还可以输入' +  result + '字<font>'; 
					       }
					       $('.word_surplus').html(pattern); //输入显示
				   }
				});
				
				prettyPrint();
				/* editor.html("<strong>请填写发明名称！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor1;
			KindEditor.ready(function(K) {
				   editor1 = K.create('#editorContent1', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from1'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from1'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   }
				});
				prettyPrint();
				/* editor1.html("<strong>请填写专利所在的技术领域！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor2;
			KindEditor.ready(function(K) {
				   editor2 = K.create('#editorContent2', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from2'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from2'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   }
				});
				prettyPrint();
				/* editor2.html("<strong>请填写专利创建的背景技术！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor3;
			KindEditor.ready(function(K) {
				   editor3 = K.create('#editorContent3', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from3'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from3'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   },
				   afterFocus: function() {
					   loadingTemplate(4);
				   }
				});
				prettyPrint();
				/* editor3.html("<strong>请填写存在的技术问题！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor4;
			KindEditor.ready(function(K) {
				   editor4 = K.create('#editorContent4', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from4'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from4'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   },
				   afterFocus: function() {
					   loadingTemplate(5);
				   }
				   
				});
				prettyPrint();
				/* editor4.html("<strong>请填写权利要求部分！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor5;
			KindEditor.ready(function(K) {
				   editor5 = K.create('#editorContent5', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from5'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from5'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   },
				   afterFocus: function() {
					   loadingTemplate(6);
				   }
				});
				prettyPrint();
				 /* editor5.html("<strong>请填写技术特征！</strong>");  */
			});
		</script>
		<script type="text/javascript">
			var editor6;
			KindEditor.ready(function(K) {
				   editor6 = K.create('#editorContent6', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
							document.forms['from6'].submit();
						});
						K.ctrl(self.edit.doc, 13, function() {
							self.sync();
							document.forms['from6'].submit();
						});
					},
				   
				   afterChange : function() {
					   this.sync();
				   },
				   
				});
				prettyPrint();
				/* editor6.html("<strong>请填写具体的实施方式！</strong>"); */
			});
		</script>
		<script type="text/javascript">
			var editor7;
			KindEditor.ready(function(K) {
				   editor7 = K.create('#editorContent7', {
				   cssPath : '${base}/plugins/kindeditor/plugins/code/prettify.css',
 				   uploadJson : "${base}/kindeditor/file_upload.html", 
				   fileManagerJson : '${base}/kindeditor/file_manager_json.html',
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
				   resizeType : 0,  // 2时可以拖动改变宽度和高度，1时只能改变高度，0时不能拖动。
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
