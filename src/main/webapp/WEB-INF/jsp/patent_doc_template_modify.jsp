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
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<title>专利模板列表！</title>
	<!-- 编辑器控件 -->
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/simple/simple.css" />
	<link rel="stylesheet" href="${base }/plugins/kindeditor/plugins/code/prettify.css" />
	<link href="${base }/static/css/edit_instruct.css?v=2.3.20150415" type="text/css" rel="stylesheet" />
	<c:import url="common/kindEditor.jsp"></c:import>
	<link href="<s:url value="/static/css/bootstrap.css"/>" rel="stylesheet"/>
	<%@ include file="_css.jsp" %>
	
</head>

<body>
<div>
<%@ include file="_top.jsp" %>
</div>
<div style="height:150px;"></div>
<div>
  <div class="content" id="content0">
	<div class="cl">
		<div id="editor0" thistempid="1">
			<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
			<input type="hidden" value="" id="divtitletips">
			<div class="textarea" name="tooltip">
				    <div class="wraper">
				    	<div>
				    		<span style="color:red;font-weight: bold;">专利类型:${patentDocumentTemplate.patentType.typeDescription }</span><br/>
				    		<span style="font-weight: bold;">所属专利部分:</span>${patentDocumentTemplate.patentDocSectionType.patentDocSectionDesc }
				    	</div>
				        <form id="form" name="form" class="registerform" action="<s:url value='/editor/updateTemplateDoc.html'/>" method="post">
				        	<div class="title" style="margin-left: 0px;">
								<span>模板简述</span> <br/>
								<span >
									<input type="hidden" name="templateId" value="${patentDocumentTemplate.templateId }"/>
									<input type="hidden" name="patentDocSectionType.patentDocSectionId" value="${patentDocSectionId }"/>
									<input type="text" id="templateIntroduce" style="width: 848px" class="form-control" name="templateTitle" placeholder="发明带名称" value="${patentDocumentTemplate.templateTitle }"/>
								</span>
							</div>
							<div style="height:20px;"></div>
				            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
				            	<tr>
				                    <td style="width:520px;">
				                    	<textarea rows="3" cols="10" id="editorContent" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >
				                    		${patentDocumentTemplate.content }
				                    	</textarea>
				                    </td>
				            	</tr>
				                <tr>
				                    <td style="padding:10px 0 18px 0;">
				                        <!-- <input type="submit" class="btn btn-danger" value="确认修改"/> -->
				                        <button type="submit" class="btn btn-danger">确认修改</button>
				                    </td>
				                </tr>
				            </table>
				        </form>
				   </div>
			</div>
		</div>
	</div>
</div>
</div>
<script type="text/javascript">
/* 	$(function (){
		editor.html('${patentDocumentTemplate.content }');
	}) */

</script>
</body>
</html>