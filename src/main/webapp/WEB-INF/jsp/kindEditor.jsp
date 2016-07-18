<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
	<c:import url="common/header.jsp"></c:import>
	<title>测试页面</title>
	<!-- 编辑器控件 -->
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/default/default.css" />
	<%-- <link rel="stylesheet" type="text/css" href="<s:url value='/plugins/kindeditor/themes/default/default.css'/>"/> --%>
	<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					allowFileManager : true
				});
				editor.html("你可以测试一下插入文件和插入图片功能，提交后可以在下方看见预览！");
			});
	</script>
</head>

<body style="background-color: #FFF">
	${base }
	<p>
	<h1>${msg }</h1>  
	<div>
		<br/>
		&nbsp;&nbsp;KindEditor中的文件上传是针对php使用的，所以现在要在java中嵌入使用还得修整一下。把KindEditor包下所有的file_manager.php(文件管理地址)及其file_upload.php(文件上传地址)换成自己实现的地址。
		<br/>  
		<br/>
		<br/>
	</div>
	<!-- 主内容 start -->
	<div class="main">
	    <div class="wraper">
	        <form id="form" name="form" class="registerform" action="" onsubmit="return false;" method="post">
	            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
	            	<tr>
	                    <td style="width:520px;">
	                    	<textarea rows="3" cols="10" name="content" style="width:520px;height:400px;visibility:hidden;"></textarea>
	                    </td>
	            	</tr>
	                <tr>
	                    <td style="padding:10px 0 18px 0;">
	                        <input type="button" value="提 交" class="ajaxpost" id="submit" onclick="submitForm();"/> 
	                    </td>
	                </tr>
	            </table>
	        </form>
	    </div>
	</div>
	
	<div id="contentView">
		
	</div>
	
	<script type="text/javascript">
			function submitForm(){
				$.ajax({
					type: "POST",
					url: "<s:url value='/kindEditor/ajaxForm.html'/>",
					data: {"content":editor.html()},
					success: function(data){
						if(data){
							$("#contentView").html(data);
							$("textarea[name=content]").val("");
							editor.html("");
							
						}
					},
					error: function(){
						alert("操作失败");
					}
				});
			}
	</script>
</body>
</html>