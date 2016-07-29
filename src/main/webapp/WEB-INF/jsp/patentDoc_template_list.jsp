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

	
	<select id="" onchange="chooseSection(this.value)">
		<c:forEach items="${patentDocSectionTypes }" var="patentDocSectionType">
			<option value="${patentDocSectionType.patentDocSectionId }"
				<c:if test="${patentDocSectionType.patentDocSectionId ==sectionValue}">selected="selected"</c:if>>
				${patentDocSectionType.patentDocSectionDesc }
			</option>
		</c:forEach>
	</select>
	
	   <div class="tab-pane fade in active" id="home">
	      专利模板首页
	   </div>
	   <div>
	   	   <table id="simple-table" class="table table-striped table-bordered table-hover">
	   	   		<thead>
	   	   			<tr>
						<th>序号</th>
						<th>模块说明</th>
						<th>专利类型</th>
						<th>模板内容</th>
						<th>创建时间</th>
						<th>修改时间</th>
						<th>操作</th>
	   	   			</tr>
	   	   		</thead>
	   	   		<tbody>
		   			<c:forEach items="${templateDocList}" var="templateDoc" varStatus="status">
		   				<tr>
		   					<td style="text-align:center">${status.count }</td>
		   					<td style="text-align:center">${templateDoc.templateTitle }</td>
		   					<td style="text-align:center">${templateDoc.patentType.typeDescription }</td>
		   					<td style="text-align:center"><a href="javascript:preViem()">点我预览</a></td>
		   					<td style="text-align:center"> <fmt:formatDate value="${templateDoc.createTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
		   					<td style="text-align:center"> <fmt:formatDate value="${templateDoc.lastUpdateTime }" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
		   					<td style="text-align:center">
		   						<div>
		   						<button type="button" class="btn btn-default" onclick="findTemplateDocData(${templateDoc.templateId })">修改</button>
		   						<button type="button" class="btn btn-danger" onclick="deletTemplateDoc(${templateDoc.templateId})">删除</button>
		   						</div>
		   					</td>
		   					<td style="display: none;">
		   						<div class="content" id="content0">
									<div class="cl">
									
										<div id="editor0" thistempid="1">
											<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
											<input type="hidden" value="" id="divtitletips">
											<div class="textarea" name="tooltip">
												    <div class="wraper">
								                    	<textarea rows="3" cols="10" id="editorContent" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;">
								                    		${templateDoc.content }
								                    	</textarea>
												   </div>
											</div>
										</div>
									</div>
								</div>
							</td>
		   				</tr>
		   			
		   			</c:forEach>
	   			</tbody>
	   	   </table>
	   	
	   </div>
</div>
<!-- modal -->
<%-- <div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true">
   
   <div class = "modal-dialog" style="width:935px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
               	修改模板
            </h4>
         </div>
         
          <form role="form"  action="<s:url value='/patent/advertisement/addAdvertisement.html'/>" id="advertisement" method="post">
	         <div class = "modal-body">
	           	<div class="content" id="content0">
					<div class="cl">
						<div id="editor0" thistempid="1">
							<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
							<input type="hidden" value="" id="divtitletips">
							<div class="textarea" name="tooltip">
								    <div class="wraper">
								        <form id="form" name="form" class="registerform" action="" onsubmit="return false;" method="post">
								        	<div class="title" style="margin-left: 0px;">
												<span>模板简述</span> <br/>
												<span >
													<input type="text" id="templateIntroduce" style="width: 848px" class="form-control" name="templateIntroduce" placeholder="发明带名称"/>
												</span>
											</div>
											<div style="height:20px;"></div>
								            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
								            	<tr>
								                    <td style="width:520px;">
								                    	<textarea rows="3" cols="10" id="editorContent" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
								                    </td>
								            	</tr>
								                <tr>
								                    <td style="padding:10px 0 18px 0;">
								                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(inventIntroduce,1,editor,editorContent,inventIntroduce);">提 交</button>
								                    </td>
								                </tr>
								            </table>
								        </form>
								   </div>
							</div>
						</div>
					</div>
					<div id="error_content0" style="margin-left: -50px; float: left; color: Red; text-align: right;" class="textarea">
						您当前输入了 <span class="word_count2">0</span>个文字。<br> 
						<span class="word_surplus"></span>
					</div>
				</div>
	         </div>
	         
	         <div class = "modal-footer">
	            <button type = "button" class = "btn btn-default" data-dismiss = "modal" id="closeButton">
	              	关闭
	            </button>
	            
	            <button type = "submit" class = "btn btn-primary">
	               	确认
	            </button>
	         </div>
         </form>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
   
</div> --%>
<!-- modal -->

<button id="hiddenButton" type="button" style="font-size: 12px;display: none;" class = "btn btn-primary btn-lg" data-toggle = "modal" data-target = "#myModal">
复层
</button>
<div class = "modal fade" id = "myModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true">
   
   <div class = "modal-dialog" style="width:935px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
               	预览模板
            </h4>
         </div>

         <div class = "modal-body" id="modalDiv">
           	
         </div>
      </div><!-- /.modal-content -->
   </div><!-- /.modal-dialog -->
   
</div>
<script>
   function chooseSection(patentDocSectionId){
	   location.href="<s:url value='/editor1/templateList.html'/>?patentDocSectionId="+patentDocSectionId;
   }
   function findTemplateDocData(templateId){
	   location.href="<s:url value='/editor1/findTemplateDocByTemplateId.html'/>?templateId="+templateId+"&patentDocSectionId=${sectionValue}";
	   /* $.ajax({
		   type :"POST",
		   url : "<s:url value='/editor1/findTemplateDocByTemplateId.html'/>",
		   data : {"templateId":templateId},
		   success : function (data){
			   //$("#templateIntroduce").val(data);
			   $("#editorContent").val(data);
				editor.html(data);
		   }
	   }) */
   }
   
   function preViem(){
	   $("#modalDiv").html($("#editorContent").val());
	   $("#hiddenButton").trigger("click");
   }
   
   function deletTemplateDoc(templateId){
	   $.ajax({
		   type : "POST",
		   url : "<s:url value='/editor1/deletTemplateDocById.html'/>",
		   data : {"templateId":templateId},
		   success : function (data){
			   alert(data);
			   location.reload();
		   },
		   error : function(){
			   alert("未知错误!请稍后重试.");
		   }
	   })
   }
</script>
</body>
</html>