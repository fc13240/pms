<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="X-Frame-Options" content="SAMEORIGIN"> 
	<title>龙图腾专利管家-添加模板</title>
	<c:import url="common/kindEditor.jsp"></c:import>
	<%@ include file="_css.jsp" %>
</head>

<body style="background-color: #FFF" id="dlstCircleArticle">
<style>
.model1:hover .button{display:block}
</style>	
	
		<div id="mincontent" style="min-height: 581px;">    
	    <input id="hiduserid" type="hidden" value="UC1706F442C97E4C58977D24E340EBF66">
	    <div class="body">
	        <div class="left" style="height: 612px;">
				<!--申请文件九部分标签切换 -->
				<div class="tab" id="tabWrap"> 
					<div class="tab1" value="0" name="tabs" onclick="tabChange(0);">说明书</div>
					<div style="display:none;" class="tab1h" value="1" name="tabs" onclick="tabChange(1);">
						说明书附图</div>
					<div class="tab1h" value="2" name="tabs" onclick="tabChange(2,true,false);">
						权利要求</div>
					<div class="tab1h" value="3" name="tabs" onclick="tabChange(3);">
						摘要</div>
					<div style="display:none;" class="tab1h" value="4" name="tabs" onclick="tabChange(4);">
						摘要附图</div>
					<div style="display:none;" class="tab1h" value="5" name="tabs" onclick="tabChange(5);">
						上传附件</div>
					<div style="display:none;" class="tab1h" value="6" name="tabs" onclick="tabChange(6);">
						请求书</div>
				</div>
	
	        </div>
	        <div class="right">
	            <div class="center" style="overflow: hidden; height: 642px; width: 75%;">
	                <!--center-top start -->
	                <div class="center_top">
	                    <div class="backedit">
	                        <a href="<s:url value='/editor/templateList.html?patentDocSectionId=1'/>" target="_blank">返回模板列表</a>
	                    </div>
	                </div>
	                <div id="overflowcenter" style="overflow-y: auto; overflow-x: hidden;height:610px; width: 1060px;">
	                    <!-- center-top end-->
						<!-- 编辑区 ：发明名称/技术领域/背景技术/发明内容/具体实施方式-->
						<div class="content" id="content0">
							<div class="title">
								说明书
							</div>
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
															<input type="text" id="inventIntroduce" style="width: 848px" class="form-control" placeholder="请填写说明书模板简述" required="required"/>
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
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(inventIntroduce,1,editor,editorContent);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content1" style="display: none;">
							<div class="title">
								说明书附图
							</div>
							<div class="cl">
								<div  thisid="2124" thistempid="0">
									<div class="textarea" name="tooltip">
										    <div class="wraper">
										        <form id="form1" name="form1" class="registerform" action="" onsubmit="return false;" method="post">
										        	<div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="techDomain" style="width: 848px" class="form-control" placeholder="技术领域"/>
														</span>
													</div>
													<div style="height:20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent1" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                    	<!-- <button type="button" class="btn btn-default" id="submit" onclick="addTechDomain();">提 交</button> -->
										                    	<button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(techDomain,2,editor1,editorContent1);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content2" style="display: none;">
							<div class="title">
								权利要求
							</div>
							<div class="cl">
								<div id="editor6" thisid="2293" thistempid="0">
									
									<div class="textarea" name="tooltip">
										<div class="wraper">
										        <form id="form2" name="form2" class="registerform" action="" onsubmit="return false;" method="post">
										        	<div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="rightClaim" style="width: 848px" class="form-control" placeholder="请填写权利要求模板简述" required="required"/>
														</span>
													</div>
													<div style="height:20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent8" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(rightClaim,2,editor8,editorContent8);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content3" style="display: none;">
							<div class="title">
								摘要
							</div>
							<div class="cl">
								<div id="editor7" thisid="5632" thistempid="0">
									<div class="textarea" name="tooltip">
											<div class="wraper">
										        <form id="form3" name="form3" class="registerform" action="" onsubmit="return false;" method="post">
										        <div class="title" style="margin-left: 0px;">
													<span>模板简述</span> <br/>
													<span >
														<input type="text" id="abstract" style="width: 848px" class="form-control" placeholder="请填写摘要模板简述" required="required"/>
													</span>
												</div>
												<div style="height: 20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent7" name="contentProblem"  class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(abstract,3,editor7,editorContent7);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content4" style="display: none;overflow: auto;" >
							<div class="title">
								摘要附图
							</div>
							<div class="cl">
								<div thisid="2514" thistempid="0">
									<div class="textarea" name="tooltip">
											<div class="wraper">
										        <form id="form6" name="form6" class="registerform" action="" onsubmit="return false;" method="post">
										        	<div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="implementWay" style="width: 848px" class="form-control" placeholder="具体实施方式" />
														</span>
													</div>
													<div style="height:20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent6" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(implementWay,7,editor6,editorContent6);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<input id="hideditor3id" type="hidden" autocomplete="off">
						<input id="hidtempid" type="hidden">
						<input id="hidtooltip" type="hidden">
											
						<!-- 上传附件 -->
						<div class="content" id="content7" thisid="" style="display: none;">
							
							<div class="title">
								上传附件
							</div>
							<div class="cl">
								<div  thisid="" thistempid="" photo_fid="">
									<div class="textarea" name="tooltip"> 
										<div class="wraper">
										        <form id="form7" name="form7" class="registerform" action="" onsubmit="return false;" method="post">
										            <div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" style="width: 848px" class="form-control" placeholder="摘要" />
														</span>
													</div>
													<div style="height:20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent7" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
							<div id="error_content7" style="margin-left: -50px; float: left; color: Red; text-align: right;" class="textarea"> 还可以输入300字
							</div>
						</div>
						<script type="text/plain" id="myEditor7_tools" style="display: none; width: 800px;height: 240px;"></script>
	
	                    
						<!-- 请求书 -->
						<div class="content" id="content6" style="display: none; overflow: hidden;">
							<div name="claims" style="float: left; width: 98%">
								<div class="title">
									请求书
								</div>
								<div class="cl">
									<div thistempid="" thisid="">
										<div class="instru">
										</div>
										<div id="divclaim" style="clear:both;display:block;float:left;width:80%;"></div>
										<input type="hidden" value="" id="divclaimtips">
										<div class="textarea" name="tooltip">
											<div class="wraper">
										        <form id="form8" name="form8" class="registerform" action="" onsubmit="return false;" method="post">
										        	<div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="requestBook" style="width: 848px" class="form-control" placeholder="摘要" />
														</span>
													</div>
													<div style="height:20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows= "3" cols="10" id="editorContent8" name="content" class="editorContent"style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(requestBook,8,editor8,editorContent8);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
										</div>
									</div>
								</div>
							</div>
							<div name="claims_ele" class="power_right" style="float: right; margin-top: 10px; width: 98%; display: none;">
							</div>
						</div>
	            </div>
	<input type="hidden" name="name" value="" id="patentIdHid">
	
	
	
	<div id="exportFile" style="display:none">
	</div>
	
	
	  <div id="div_float_show" style="position: absolute;  display: none;
	        width: 1000px">
	    </div> 
	
	    </div>

	    </div>
	    </div>
	    </div>
	    <script type="text/javascript">
			function addPatentTemplate(title,patentPatentDocSectionTypeId,editorValue,editorContent){
				var templateTitle = title.value;
				var content=editorValue.html();
				var patentType = ${patentType};
				$.ajax({
					type : "POST",
					url : "<s:url value='/editor/addPatentTemplate.html'/>",
					data : {"content":content,"templateTitle":templateTitle,"patentDocSectionType.patentDocSectionId":patentPatentDocSectionTypeId,"patentType.patentTypeId":patentType},
					success : function(data){
						alert(data);
						title.value="";
						editorContent.value="";
						editorValue.html("");
					},
					error : function(){
						
						alert("未知错误，请稍后重试！");
					}
				})
			}
			
	</script>	
</body>
</html>