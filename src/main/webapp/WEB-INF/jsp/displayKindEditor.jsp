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
	<link rel="stylesheet" href="<c:url value='plugins/kindeditor/themes/default/default.css'/>" />
	<script>
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="editorContent"]', {
					allowFileManager : true
				});
				editor.html($("#editorContent").val());
			});
			
			
			
			function submitForm(){
				$.ajax({
					type: "POST",
					url: "<s:url value='/editor/addEditorText.html'/>",
					data: {"editorContent":editor.html()},
					success: function(data){
						if(data){
							//$("#contentView").html(data);
							$("textarea[name=editorContent]").val(editor.html());
							editor.html(editor.html());
							
						}
					},
					error: function(){
						alert("操作失败");
					}
				});
			};
	</script>
</head>

<body style="background-color: #FFF">
	${base }
	<p>
	<h1>${msg }</h1>  
	<div>
		<br/>
		&nbsp;&nbsp;从官网下直接下载KindEditor来使用，还不太行,因为对于KindEditor中的文件上传是针对php使用的，所以现在要在java中嵌入使用还得修整一下。把KindEditor包下所有的file_manager.php(文件管理地址)及其file_upload.php(文件上传地址)换成自己实现的地址。具体实现方法代码在附件中。
		<br/>  
		【注意】<font color=red>对应的文件上传和文件管理地址要全部替换掉成自己实现的哦</font>这样才能保证正常使用哦
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
	                    	<textarea rows="3" cols="10" name="editorContent" id="editorContent" style="width:520px;height:400px;visibility:hidden;">
	                    		${editorTest.editorContent }
	                    	</textarea>
	                    	<p>
								您当前输入了 <span class="word_count1">0</span> 个文字。（字数统计包含HTML代码。）<br />
								您当前输入了 <span class="word_count2">0</span> 个文字。（字数统计包含纯文本、IMG、EMBED，不包含换行符，IMG和EMBED算一个文字。）
							</p>
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
		查看文档：
		<select id="editorid" onchange="findText(this.value)">
			<c:forEach items="${editorIds }" var="editorId">
				<option value="${editorId }">文档：${editorId }</option>
			</c:forEach>		
		</select>
<script type="text/javascript">
	function findText(editorId){
		var url = "<c:url value='/editor/findTextById.html'/>?editorId="+editorId;
		location.href=url;
	}
</script>
</body>
</html>