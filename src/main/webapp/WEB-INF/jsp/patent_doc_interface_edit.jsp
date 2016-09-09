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
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-Frame-Options" content="SAMEORIGIN">  
	<title>外观设计撰写</title>
	<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap.min.css'/>">
	<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap-theme.min.css'/>">
	<c:import url="common/kindEditor2.jsp"></c:import>
	<script type="text/javascript" src="<s:url value='/temp/js/jquery_from.js'/>"></script>
	 <link rel="stylesheet" type="text/css" href="<s:url value='/static/js/jquery.autocomplete.css'/>"/>
    <script type="text/javascript" src="<s:url value='/static/js/jquery.autocomplete.js'/>"></script>
	
	
	<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="<s:url value='/temp/css/common.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
	<link rel="stylesheet" href="<s:url value='/temp/css/buttons.css'/>" class="ace-main-stylesheet" id="main-ace-style" />
	<link rel="stylesheet" media="screen" href="<s:url value='/temp/css/jquery-ui.min.css'/>" />
	<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
	<script type="text/javascript">
	var i= 1;
			$(function(){
				// 初始化插件
				$("#zyupload").zyUpload({
					width            :   "650px",                 // 宽度
					height           :   "400px",                 // 宽度
					itemWidth        :   "140px",                 // 文件项的宽度
					itemHeight       :   "115px",                 // 文件项的高度
					url              :   "<s:url value='/kindeditor/uploadInterFacePic.html'/>?patentDocId=${patentDoc.patentDocId}", 
					fileType         :   ["jpg","png","jpeg"],// 上传文件的类型
					fileSize         :   51200000,                // 上传文件的大小
					multiple         :   false,                    // 是否可以多个文件上传
					dragDrop         :   false,                   // 是否可以拖动上传文件
					tailor           :   false,                   // 是否可以裁剪图片
					del              :   false,                    // 是否可以删除文件
					finishDel        :   false,  				  // 是否在上传文件完成后删除预览
					/* 外部获得的回调接口 */
					onSelect: function(selectFiles, allFiles){    // 选择文件的回调方法  selectFile:当前选中的文件  allFiles:还没上传的全部文件
						console.info("当前选择了以下文件：");
						console.info(selectFiles);
						if (allFiles.length > 1) {
							
							alert("每次只能上传一张，请先上传之前的图片再选择！");
							for (var i = 1; i < allFiles.length; i++) {
								console.log(allFiles[i]);
								ZYFILE.funDeleteFile(allFiles[i].index, true);
								return false;
							}
						}
						

						return true;
					},
					onDelete: function(file, files){              // 删除一个文件的回调方法 file:当前删除的文件  files:删除之后的文件
						console.info("当前删除了此文件：");
						console.info(file.name);
					},
					onSuccess: function(file, response){
						// 文件上传成功的回调方法
						var Jresponse=$.parseJSON(response);
						$("#patentImgUrl").append("<input type='hidde' id='patentUrl' name='attachmentUrl' value='"+Jresponse["url"]+"'/>");
						$("#patentImgUrl").append("<input type='hidde' id='seqNo' name='seqNo' value='"+Jresponse["count"]+"'/>");
						savePatentImgUrl();
						$("#patentImgUrl").empty();
						$("#piciLlus2").val("");
					},
					onFailure: function(file, response){          // 文件上传失败的回调方法
						console.info("此文件上传失败：");
						console.info(file.name);
					},
					onComplete: function(response){           	  // 上传完成的回调方法
						console.info("文件上传完成");
						console.info(response);
					}
				});
				
				

				loadImgs();
				
				
				
			});
			
		</script> 
</head>

<body style="background-color: #FFF" id="dlstCircleArticle" onload="searGuide(this)" >
<style>
.model1:hover .button{display:block}
.picL9 li{
overflow: hidden;
position: relative;
float: left;
display: inline;
width: 199px;
height: 170px;
margin: 1px 0 0 1px;}
</style>	
	
		<div id="mincontent" style="min-height: 581px;">
	        
	        
	    <input id="hiduserid" type="hidden" value="UC1706F442C97E4C58977D24E340EBF66">
	    <div class="body">
	        <div class="left" style="height: 700px;">
	        	<div class="left_top">
		               <div class="cl" id="div_ipctype">
		               <c:if test="${patentDoc.patentType==1 }">
		                   	<div class="bt" style="margin-left:65px;">发明</div>
		               </c:if>
		               		<c:if test="${patentDoc.patentType==2 }">
		               <div class="bt"  style="margin-left:65px;">实用新型</div>
		               </c:if>
		               <c:if test="${patentDoc.patentType==3 }">
		               		<div class="bt" style="margin-left:65px;">外观</div>
		               </c:if>
		               </div>
		           </div>
				<!--申请文件九部分标签切换 -->
				<div class="tab" id="tabWrap"> 
					<div style="display:block" class="tab1" value="0" name="tabs" onclick="tabChange(0);">
						请求书
					</div>
					<div class="tab1h" value="1" name="tabs" onclick="tabChange(1);">
						简要说明
					</div>
					<div class="tab1h" value="2" name="tabs" onclick="tabChange(2);">
						图片或照片
					</div>
					<div style="display:none" class="tab1h" value="3" name="tabs" onclick="tabChange(3,true,false);">
						权利要求
					</div>
					<div style="display:none" class="tab1h" value="4" name="tabs" onclick="tabChange(4);">
						摘要
					</div>
					<div style="display:none" class="tab1h" value="5" name="tabs" onclick="tabChange(5);">
						图片或照片
					</div>
					<div class="tab1h" value="6" name="tabs" onclick="tabChange(6);">
						上传附件
					</div>
				</div>
	
	        </div>
	        <div class="right">
	            <div class="center" style="overflow: hidden; height: 642px; width: 75%;">
	                <!--center-top start -->
	                <div class="center_top">
	                    <div class="backedit">
	                        <a href="javascript:return void" onclick="returnSavePatentDoc(${patentDoc.patentDocId});" >返回撰写列表</a>
	                         <a href="javascript:return void" onclick="savePatentDoc(${patentDoc.patentDocId});">
								<button class="button button-primary  button-rounded"  data-placement="bottom" >保存</button>
							 </a>
	                    </div>
	                    <div class="top_right">
	                        <div class="review" onclick="preview_selfwrite('${patentDoc.patentDocId}','${patentDoc.patentType}');">
	                            <i class="icon"></i>预览
	                        </div>
	                        <input type="hidden" id="patentType" value="${patentDoc.patentType }"/>
	                    </div>
	                </div>
	                <div id="overflowcenter" style="overflow-y: auto; overflow-x: hidden;height:610px; width: 1060px;">
	                    <!-- center-top end-->
	                    <!-- 撰写小贴士start-->
	                    
						<!--撰写小贴士 -->
						<input id="whichTip" type="hidden" name="name" value="2">
						<input id="tipIdHid" type="hidden" name="name" value="1223">
						
	                    
						<!-- 编辑区 ：发明名称/技术领域/背景技术/发明内容/具体实施方式-->
						<div class="content" id="content1" style="display:none">
							<div class="cl">
								<div id="editor0" thistempid="1">
									<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
									<input type="hidden" value="" id="divtitletips">
									<div class="textarea" name="tooltip">
										    <div class="wraper">
										        <form id="form" name="form" class="registerform" action="" onsubmit="return false;" method="post">
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent" name="name" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patentDoc.manual }</textarea>
										                    </td>
										            	</tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
						</div>
						
						<!--上传附件div  -->
						<div class="content" id="content6" thisid="2514" style="display: none;">
							<div class="title">
								上传附件
							</div>
							
							<div class="cl">
								<div class="lt-box" style="height:300px;padding:20px;">

									<form id="patentDocAttachment" action="<s:url value='/editor/uploadFile.html'/>"  method="post" enctype="multipart/form-data" class="form-horizontal">  
									<input style="display:none;"  id="patentAttachmentFile" name="file" type="file" />
									<input class="selectPointOfInterest form-control"  style="width:300px;display:inline;" type="text" id="filename" name="filename" placeholder="请选择文件" readonly="readonly">
									<button type="button" onclick="$('input[id=patentAttachmentFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
									<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded" onclick="uploadAttachmentFile()">上传</button>
									<c:if test="${not empty patentDoc.patentDocAttachmentFile }">
										<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded"  onclick="downloadAttachmentFile(${patentDoc.patentDocId})">下载附件</button>
				                    </c:if>
									</form> 
									<div style="height:10px;">&nbsp;</div> 
									<span style="color:#666;">友情提示：将所需的附件一次性打包成压缩文件格式上传(zip,rar等)，不建议上传其他格式的文件!
									</span>
								</div>
							</div>
						</div>
						
						<!--请求协议书div  -->
						<div class="content" id="content0" thisid="2514">
							
							<div class="title">
								专利名称:
								<%-- <div style="margin-left: 33px;">
									<input class="selectPointOfInterest form-control"  style="width:600px;display:inline;" type="text" id="patentName" name="patentName" placeholder="请输入专利名称"  value="${patentDoc.name}">
								</div> --%>
								<div id="editor1" thistempid="1">
 									<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
									<input type="hidden" value="" id="divtitletips"> 
									<div class="textarea" name="tooltip">
										    <div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td>
									                    	<textarea rows="3" cols="10" id="editorContent1" name="name" class="editorContent" style="width:520px;height:200px;visibility:hidden;">
									                    	${patentDoc.name }
									                    	</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
									</div>
								</div>
							</div>
							<div class="cl">
								<div>
									<div>
									
									</div>
									<div>
										<br/>
										<br/>
										<!-- <h2 style="float: left;padding-top:5px;padding-right:5px;">申请人:</h2> -->
										<span style="float:left;padding-top:5px;padding-right:5px;font-weight: bold;font-size:14px;margin-left:25px;">申请人</span>
										<button type="button" style="width:120px;float: left;" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonAppersonModal" id="testBtn">
											选择常用申请人
										</button>
										<button  style="margin-left:20px;width:90px;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#addAppPersonModal">
												新增申请人
										</button>
										<div style="margin-top:10px;" id="appersonDiv">
											<table id="simple-table" class="table table-striped table-bordered table-hover">
											  <thead>
												<tr class="simple_bag">
												  <!-- <th><input type="checkbox"/></th>
												  <th>序号</th> -->
												  <th>姓名或名称</th>
												  <th>证件号码</th>
												  <th>邮编地址</th>
												  <th>费减备案状态</th>
												  <th>备案证件号</th>
												  <th>备案年度</th>
												  <th>其他信息</th>
												  <th>操作</th>
												</tr>
											  </thead>
											  <tbody id="appersonTab">
											  		<c:if test="${not empty patentDocAppPersons }">
											  			<c:forEach items="${patentDocAppPersons }" var="patentDocAppPerson">
															<tr>
																<td style="text-align:center">${patentDocAppPerson.name }</td>
																<td style="text-align:center">${patentDocAppPerson.idNumber }</td>
																<td style="text-align:center">${patentDocAppPerson.postcodeAddress }</td>
																<td style="text-align:center">${patentDocAppPerson.feeReduceTransactionStatus }</td>
																<td style="text-align:center">${patentDocAppPerson.transactionIdentity }</td>
																<td style="text-align:center">${patentDocAppPerson.transactionYear }</td>
																<td style="text-align:center">${patentDocAppPerson.otherInformation }</td>
																<td style="text-align:center"><a href="javascript:deletePatentDocApperson(${patentDocAppPerson.personId })">删除</a><a style='margin-left:20px;' href="javascript:updatePatentDocApperson(${patentDocAppPerson.personId })">修改</a></td>
															</tr>
											  			
											  			</c:forEach>
											  		</c:if>
											  
											  </tbody>
											</table>
										</div>
									</div>
									<div style="margin-top: 60px;">
										<hr>
										<br/>
										<br/>
										<!-- <h3 style="float:left;padding-top:5px;padding-right:5px;">发明人:</h3> -->
										<span style="float:left;padding-top:5px;padding-right:5px;font-weight: bold;font-size:14px;margin-left:25px;">发明人</span>
										<button type="button" style="width:120px;float:left;" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonInventorModal">
											选择常用发明人
										</button>
										<button type="button" style="margin-left:20px;width:90px;" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#addInventorModal">
											新增发明人
										</button>
										<div style="margin-top:10px;" id="inventorDiv">
											<table id="simple-table" class="table table-striped table-bordered table-hover">
											  <thead>
												<tr class="simple_bag">
												  <!-- <th><input type="checkbox"/></th>
												  <th>序号</th> -->
												  <th>姓名</th>
												  <th>证件号码</th>
												  <th>国籍</th>
												  <th>电话</th>
												  <th>邮箱</th>
												  <th>其他信息</th>
												  <th>操作</th>
												</tr>
											  </thead>
											  <tbody id="inventorTab">
											  	  <c:if test="${not empty patentDocInventors }">
											  	  		<c:forEach items="${patentDocInventors }" var="patentDocInventor">
												  	  		<tr>
																<td style='text-align:center'>${patentDocInventor.inventorName}</td>
																<td style='text-align:center'>${patentDocInventor.inventorNumber}</td>
																<td style='text-align:center'>${patentDocInventor.inventorNationality}</td>
																<td style='text-align:center'>${patentDocInventor.inventorMobile}</td>
																<td style='text-align:center'>${patentDocInventor.inventorEmail}</td>
																<td style='text-align:center'>${patentDocInventor.inventorOtherInformation}</td>
																<td style='text-align:center'><a href='javascript:deletePatentDocInventor(${patentDocInventor.inventorId})'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor(${patentDocInventor.inventorId})'>修改</a></td>
															</tr>
														</c:forEach>	
											  	  </c:if>
											  </tbody>
											</table>
										</div>
									</div>
									<div style="margin-top: 60px;">	
										<hr>
										<!-- <button type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonContactModal">选择常用联系人</button> -->
										<br/>
										<br/>
										<!-- <h2 style="float:left;padding-top:5px;padding-right:5px;">联系人:</h2> -->
										<span style="float:left;padding-top:5px;padding-right:5px;font-weight: bold;font-size:14px;margin-left:25px;">联系人</span>
										<button type="button" style="width:130px;float:left;" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#commonContactModal">选择常用联系人</button>
										
										<%-- <div id="contactDiv">
											<textarea rows="6" cols="50" id="contactPerson" class="t-input form-control" style="resize: none;width:750px;" placeholder="添加联系人地址"><c:if test="${not empty patentDoc.contactPerson }">
													${patentDoc.contactPerson }</c:if></textarea>
										</div> --%>
										<br/>
										<br/>
										<div style="margin-top:10px" id="contactDiv">
											<table id="simple-table" class="table table-striped table-bordered table-hover">
											  <thead>
												<tr class="simple_bag">
												 <th>联系人</th>
												 <th>所在地区</th>
												 <th>地址</th>
												 <th>联系电话</th>
												 <th>操作</th>
												</tr>
											  </thead>
											  <tbody id="contactTab">
										  		<c:if test="${not empty contactAddress }">
											  	  		<tr>
															<td style="text-align:center">${contactAddress.receiver}</td>
														  	<td style="text-align:center">${contactAddress.provinceName} ${contactAddress.cityName} ${contactAddress.districtName}</td>
														    <td style="text-align:center">${contactAddress.detailAddress}</td>
														    <td style="text-align:center">${contactAddress.phone}</td>
							 								<td style="text-align:center"><a href='javascript:updateContact(${contactAddress.id})'>修改</a></td>
														</tr>
										  	 	 </c:if>
											  </tbody>
											</table>
										</div>
									</div>
								</div>
								<div style="margin-top:60px;">
									<!-- <h2 style="margin-top:20px;">其他信息</h2> -->
									<span style="float:left;padding-top:5px;padding-right:5px;font-weight: bold;font-size:14px;margin-left:25px;margin-top:20px;">其他信息</span>
									<br/>
									<%-- <input type="text" style="width:700px;" class="t-input form-control" id="otherInformation" placeholder="请填写，若没有则可以不填写。" value="${patentDoc.otherInformation}"/> --%>
									<%--  不要删除以防又要使用-->
									<%-- <h2 style="margin-top:20px;">附件</h2>
									<form action="<s:url value='/petition/uploadPatentDocFile.html'/>" id="uploadFileForm" method="post" enctype="multipart/form-data" class="form-horizontal">
										<input style="display:none" type="file" id="patentDocFile" name="file"/>
										<input style="width:300px;display:inline;" type="text" id="patentDocFilename"  class="selectPointOfInterest form-control" placeholder="请选择文件" readonly="readonly" onclick="$('input[id=patentDocFile]').click();"/>
										<button type="button" onclick="$('input[id=patentDocFile]').click();" class="t-btn3 button button-primary  button-rounded">浏览</button>
										<button type="button" onclick="uploadPatentDocFile()" class="t-btn3 button button-primary  button-rounded">上传</button>
										<c:if test="${not empty patentDoc.attachmentUrl }">
											<button type="button" onclick="downloadPatentDocFile(${patentDoc.patentDocId })" class="t-btn3 button button-primary  button-rounded">下载</button>
										</c:if>
									</form> --%>
									
									
									<textarea id="otherInformation" style="width:700px;" class="t-input form-control" rows="10" cols="60" placeholder="请填写，若没有则可以不填写。">${patentDoc.otherInformation }</textarea>
								</div>
							</div>
						</div>
						<input id="hideditor3id" type="hidden" autocomplete="off">
						<input id="hidtempid" type="hidden">
						<input id="hidtooltip" type="hidden">
											
						<!-- 摘要 -->
						<div class="content" id="content4" thisid="" style="display: none;">
							
							<div class="title">
								摘要
							</div>
							<div class="cl">
								<div id="editor7" thisid="" thistempid="" photo_fid="">
									<div class="textarea" name="tooltip"> 
										<div class="wraper">
										        <form id="form7" name="form7" class="registerform" action="" onsubmit="return false;" method="post">
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent7" name="abstractDescription" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patentDoc.abstractDescription }</textarea>
										                    </td>
										            	</tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
							</div>
							
						</div>

	
	                    
						<!-- 权利要求及要素表 -->
						<div class="content" id="content3" style="display: none; overflow: hidden;">
							<div name="claims" style="float: left; width: 98%">
								<div class="title">
									权利要求书
								</div>
								<div class="cl">
									<div id="editor6" thistempid="" thisid="">
										<div id="divclaim" style="clear:both;display:block;float:left;width:80%;"></div>
										<input type="hidden" value="" id="divclaimtips">
										<div class="textarea" name="tooltip">
											<div class="wraper">
										        <form id="form8" name="form8" class="registerform" action="" onsubmit="return false;" method="post">
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent8" name="rightClaim" class="editorContent"style="width:520px;height:200px;visibility:hidden;" >${patentDoc.rightClaim }</textarea>
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
	              
						<!-- 附图及说明 -->
	
						<!-- content start-->
						<input type="hidden" id="ft_hidSrc" value="">
						<input type="hidden" id="ft_hidFid" value="">
						<div class="content" id="content2" style="display: none;">
							<div class="box" id="content5-1">
								<div style="margin:10px" class="upimg1" onclick="addPic();">
									新增附图</div>
									<div style="margin:10px" class="upimg1" onclick='javascript:window.open("<s:url value='/editor/downloadInterFacePic.html'/>?patentDocId=${ patentDoc.patentDocId}")' >
									下载附图</div>
								<div class="picBox">
									<ul class="picL9" id="picLsy2" >
										
									</ul>
								</div>
							</div>
						<div class="content" id="content5_build" style="display: none;">
							
							<div style="height: 20px">
							</div>
							<div id="piclist" class="title1" onclick="piclistShow();loadImgs()" style="padding-left: 40px; color:#444; font-size:14px; font-weight:bold;
								display: none; cursor: pointer">
								返回附图列表
							</div>
							 
							
							<div class="img_edit" id="origin">
								<div class="imgfl" id="picBianHao">
								</div>
								<div class="imgfr">
								 <form id="patentUrlForm" name="patentUrlForm"  method="post" enctype="multipart/form-data" class="form-horizontal">
								 	<input id="patentDocId" type="hidden" name="patentDocId" value="${patentDoc.patentDocId}">
								 	<input id="patentDocAttachmentFile" type="hidden" name="patentDocAttachmentFile" value="${patentDoc.patentDocAttachmentFile}">
									
									
									<font size="3" font_family="Microsoft YaHei" color="black">图片名称:</font>
									<input type="text"  id="piciLlus2"   list="companys" name="caption"   onchange="picName()" onfocus="piciLlusFc(this);" onblur="piciLlusBl(this);" style="color: #999" value="" autocomplete="off" required>
										<datalist id="companys">
										<option value="主视图">
										<option value="后视图">
										<option value="左视图">
										<option value="右视图">
										<option value="俯视图">
										<option value="仰视图">
										<option value="立体图">
										<option value="使用状态图">
										</datalist>
									
									
									<div id=patentImgUrl style="display:none"><!-- 自动插入ImgUrl --></div>
									
								</form>
									<div id="zyupload" class="zyupload"></div>
								 	
								</div>
							</div>
						</div>
	
	                    
						<!-- 摘要附图 -->							
						</div>
						<!-- content end-->
						<!-- content start-->

						<style type="text/css">
							.borderRed
							{
								border: #d7e4ea 1px solid;
								padding: 9px;
								float: left;
								width: 100px;
								cursor: pointer;
								margin: 4px 18px 0;
							}
						</style>
						<!-- content start-->
						<div class="content" id="content5" style="display: none;">
							<div style="height: 80px">
							</div>
								<div class="upimg1" onclick="findAttachmentImg();" id="choseAbs" style="
									left: 280px; margin-top: 0;float:left;">
									从附图中选择</div>
							<div class="picBox">
								<ul class="picL" id="picLsy" >
									
								</ul>
							</div>
							<div>
							<h3 style="margin-left: 30px;font-family:微软雅黑;margin-top: 50px;">摘要附图：</h3>
							</div>
							<div class="picBox" id="picLsy3">
								<c:if test="${patentDoc.abstractImg != null}">
										<img src='${base}${patentDoc.abstractImg}' alt='' width='400' height='300'/>
								</c:if>
							</div>
						</div>
						<!-- content end-->
	
						<div id="div_float_show" style="position: absolute; display: none; width: 1000px">
					</div>
	
	                </div>
	                <!-- content end-->
	            </div>
	            
	
	<input type="hidden" id="tempId" name="name" value="">
	<div class="right1" style="height: 647px; width: 25%;">
	    <div class="data_title">
	        <i class="icon"></i>撰写指南和模板
	        
	    </div>
	    <input type="hidden" id="hidmodelbutton" value="100060010000">
	    <div id="modelbutton" class="modelbutton" onclick="modelbuttonclick();" style="position: fixed; top: 230px; left: 1294.5px; display: none;">
	        +设为模板</div>
	    <div class="right_right_bot" tab_name="content0" style="height: 600px; overflow-x: hidden; overflow-y: auto;">
	        <div class="data_menu">
	            <div class="menud" id="modelS" onclick="searGuide(this)">
	                撰写指南</div>	
	            <div class="menud" id="modelS" onclick="searModel(this)">
	                模板库</div>
	        </div>
			<div>
				<div class="model-list">
			        <div style="float: right; padding-right: 15px; display: block;" id="kbpage"><span id="templateSectionId" style="display:none;">1</span><a style="color:#ccc" href="javascript:upPage();" id="topUpPage">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:downPage();" id="topDownPage">下一页</a></div>
			        <div class="model" style="overflow-x: hidden; overflow-y: auto;">
			            <div id="modelWrap" style="display: block;"></div>
		
						<div id="hiddenmodel" style="display: none;"></div>
			        </div>
			        
			        <div style="float: right; padding-right: 15px; padding-top: 5px; display: block;" id="kbpage2"><a style="color:#ccc" href="javascript:upPage();" id="bottomUpPage">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:downPage();" id="bottomDownPage">下一页</a></div>
			        
			        <div id="scBs" class="shousou" onclick="bigSmall(this);">
			        </div>
			        <input type="hidden" name="name" value="small" id="hidBorS">
		        </div>
		        <div class="guide-list" style="display:none;"><!--load 指南 然后控制 display -->
		        <span>撰写指南:</span>
		        </div>
			</div> 
	    </div>
	</div>
	
	        </div>
	
	    </div>
	    <div id="hiddivselfhint"></div>
	    <input id="hidselfhint" type="hidden" value="0">
	    <input id="hidselfexample" type="hidden" value="0">
	    <input id="hidfocusid" type="hidden" value="">
	    <input id="hidtooptipbtn2tabvalue" value="" type="hidden">
	    <div class="selfuc1">
	        
	<!-- 撰写帮助：帮助，引导操作，新手上路 -->
	  
	 <style>
	*{margin:0px;padding:0px;list-style-type:none;}
	.v_out{width:748px;margin:20px auto;overflow:hidden;}
	.v_show{width:640px;overflow:hidden;position:relative;height:600px;float:left}
	.v_cont{ width:6650px;position:absolute;left:0px;top:0px;}
	.v_cont ul{float:left;text-align:center;line-height:50px;}
	/*.v_cont ul li{width:665px;height:250px;float:left;margin-top:3px;}*/
	
	/*---圆圈---*/
	.v_out_p{position:relative;overflow:visible}
	.circle{position:absolute;left: 40px;top: 290px;}
	.circle li{width:120px;height:60px;float:left;margin-right:10px;background:#ccc}
	.circle .circle-cur{background:#f00}
	
	/*---切换---*/
	 
	.prev,.next{float:left;padding:85px 9px 0}
	.prev a{ background:url(usercontrol/sprite.png);}
	 
	
	.next a{background:url(usercontrol/sprite.png); background-position: right top; right: 0;}
	 
	.prev,.prev a,.next,.next a{width:36px;height:98px; display:block}
	   ul, li {
	    clear: none;
	    }li {
	    float: left;
	    width: 638px;
	} 
	    .step5_lb {  
	    left: 692px; 
	    top: -15px; 
	}
	</style>

	

	
	<div id="choosePicDiv" style="display: none; position:absolute; width: 1000px">
	    <div class="daochu_bg">
	    </div>
	    <div class="pic_select" style="width: 70%; left: 15%">
	        <div class="daochu_top">
	            <div class="daochu_tit">
	                从附图中选择</div>
	            <div class="close" onclick="abstactShow();">
	            </div>
	        </div>
	        <div class="pic_cl" id="ab_picList">
	            
	        </div>
	        <div class="daochu_cancel">
	            <div class="daochu_cancel1" onclick="beAbstract();return false;">
	                确定
	            </div>
	            <div class="daochu_cancel1h" id="cancleAbs" onclick="abstactShow();">
	                取消
	            </div>
	        </div>
	    </div>
	</div>

	<input type="hidden" name="name" value="" id="patentIdHid">
	</div>
	</div>
<!-- commonAppersonModal -->
<div class = "modal fade" id = "commonAppersonModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1000px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="appersonModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	从常用申请人中选择
            </h4>
         </div>

	         <div class = "modal-body" >	
				<a href="javascript:return void" onclick="batchAddAppPerson()" >
				<button style="display: inline-block;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以添加多个申请人哦！">添加申请人</button>
				</a>
			    <input style="display: inline-block;width:400px;margin-left:200px;" type="text" class="t-input form-control" id="searchAppersonName" placeholder="请输入申请人姓名" onkeydown="if(event.keyCode==13){searchAppPerson(this.value);}"/>
			     <button style="display: inline-block;" class="button button-caution button-rounded" type="button" style="width:80px;" onclick="searchAppPerson($('input[id=searchAppersonName]').val())">搜索</button>
				<table id="simple-table" class="table table-striped table-bordered table-hover">
				  <thead>
					<tr class="simple_bag">
					  <th class="center"> <label class="pos-rel">
						<input style="width:15px;" type="checkbox" class="apperson-check-item">
						<span class="lbl"></span> </label>
					  </th>
					  <th class="center" width="50">序号</th>
					  <th width="90px">姓名或名称</th>
					  <th>证件号码 </th>
					  <th>邮编及地址</th>
					  <th width="120px">其它信息</th>
					</tr>
				  </thead>
				  <tbody id="commonAppPersonTab">
					<c:forEach items="${appPersons}" var="appPerson" varStatus="status">
					  <tr>
						<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
						<input type="checkbox" class="apperson-check-item" appPerson="<c:out value='${appPerson.appPersonId}'/>"></span>
						<span class="lbl"></span></label>
						</td>
						<td class="center" style="text-align:center"> ${status.count} </td>
						<td style="text-align:center"><c:out value="${appPerson.name}"/></td>
						<td style="text-align:center"><c:out value="${appPerson.idNumber}"/></td>
						<td>${appPerson.postcodeAddress}</td>
						<td style="text-align:center"><c:out value="${appPerson.otherInfo}"/></td>
					  </tr>
					</c:forEach>
				  </tbody>
				</table>
			
	      </div>
	       
      </div>
    </div>
</div>

<!--addAppPersonModal  -->
<div class = "modal fade" id = "addAppPersonModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" >
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="addAppPersonModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	添加新的申请人
            </h4>
         </div>
	         <div class = "modal-body" id="modal-body">
					 <h5>姓名或名称:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalAppPersonName"/>
					<span style="color: red; display: none;" id=appPersonNameError>该处应输入不大于20字段</span>
					<br>
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="modalPhoneRece" type="text" />
					<span style="color: red; display: none;" id=appPersonPhoneError>请输入正确的证件号码</span>
					<br>		  
					<h5>邮编及地址:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="modalPostcodeAddress" type="text"/>
					<span style="color: red; display: none;" id="appPersonPostcodeAddress">请输入正确的邮编及地址</span>
					<br>
					<h5>费减备案状态:</h5>
					<select id="modalFeeReduceTransactionStatus" class="form-control" style="width:136px;display:inline;"  required>	
					  <option value="未备案">未备案</option>
					  <option value="委托中">委托中</option>
					  <option value="备案成功">备案成功</option>
					  <option value="备案失败">备案失败</option>
					</select>
					<br>
					<h5>备案证件号:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalTransactionIdentityId"/>
					<br>
					<h5>备案年度:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalTransactionYear"/>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalOtherInfo"/>
					<input type="hidden" name="patentDocId" value="${patentDoc.patentDocId}">
					<br/>
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitAppPersonForm()">保存</button>
					<button type="button" style="width:90px;margin-left:280px" class="button button-primary  button-rounded" onclick="resetAppPersonForm()">取消</button>
	         </div>
      </div>
   </div>
</div>

<!--updateAppPersonModal  -->
<button id="hiddenUpdateAppPersonModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateAppPersonModal">
</button>
<div class = "modal fade" id = "updateAppPersonModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" >
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateAppPersonModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	修改申请人信息
            </h4>
         </div>
	         <div class = "modal-body" id="modal-body">
	         
					<input type="hidden" id="updateModalPersonId"  required/>
					 <h5>姓名或名称:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalAppPersonName"/>
					<span style="color: red; display: none;" id=updateAppPersonName>请输入长度不超过20字符</span>
					<br>
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="updateModalPhoneRece" type="text" required onblur="validatePhoneNumber(this.value)"/>
					<span style="color: red; display: none;" id=updatePhoneReceError>请输入正确的证件号码</span>
					<br>		  
					<h5>邮编及地址:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="updateModalPostcodeAddress" type="text" required/>
					<br>
					<h5>费减备案状态:</h5>
					<select id="updateModalFeeReduceTransactionStatus" class="form-control" style="width:136px;display:inline;"  required>	
					  <option value="未备案">未备案</option>
					  <option value="委托中">委托中</option>
					  <option value="备案成功">备案成功</option>
					  <option value="备案失败">备案失败</option>
					</select>
					<br>
					<h5>备案证件号:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalTransactionIdentityId"/>
					<br>
					<h5>备案年度:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalTransactionYear"/>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalOtherInfo"/>
					<br/>
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitUpdateAppPersonForm()">保存</button>
					<button type="button" style="width:90px;margin-left:280px" class="button button-primary  button-rounded" onclick="reseAppPersontUpdateForm()">取消</button>
	         </div>
      </div>
   </div>
</div>



<!--commonInventorModal  -->
<div class = "modal fade" id = "commonInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:1000px;">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="inventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	从常用发明人中选择
            </h4>
         </div>
	         <div class = "modal-body">
	           
	           
	           <a href="javascript:return void" onclick="batchAddInventor()" >
				<button style="display: inline-block;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以添加多个发明人批量哦！">添加发明人</button>
				</a>
				<input style="display: inline-block;width:400px;margin-left:200px;" type="text" class="t-input form-control" id="searchInventorName" placeholder="请输入发明人姓名" onkeydown="if(event.keyCode==13){searchInventor(this.value);}"/>
			     <button style="display: inline-block;" class="button button-caution button-rounded" type="button" style="width:80px;" onclick="searchInventor($('input[id=searchInventorName]').val())">搜索</button> 
				<table id="simple-table" class="table table-striped table-bordered table-hover">
				<thead>
				<tr class="simple_bag">
					  <th class="center"> <label class="pos-rel">
						<input type="checkbox" class="inventor-check-item" name="checkall" />
						<span class="lbl"></span> </label>
					  </th>
					  <th class="center">序号</th>
					  <th>姓名</th>
					  <th>证件号码</th>
					  <th>国籍</th>
					  <th>电话</th>
					  <th>邮箱</th>
					  <th>其它信息</th>
					</tr>
				  </thead>
				  <tbody id="commonInventorTab">
					<c:forEach items="${inventors}" var="inventor" varStatus="status">
					  <tr>
					  	<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
						<input type="checkbox" class="inventor-check-item" inventor="<c:out value='${inventor.inventorId}'/>"/></span>
						<span class="lbl"></span></label>
						</td>
						<td class="center" style="text-align:center"> ${status.count} </td>
						<td style="text-align:center"><c:out value="${inventor.inventorName}"/></td>
						<td style="text-align:center"><c:out value="${inventor.inventorNumber}"/></td>
						<td style="text-align:center"><c:out value="${inventor.inventorNationality}"/></td>
						<td>${inventor.inventorMobile}</td>
						<td style="text-align:center"><c:out value="${inventor.inventorEmail}"/></td>
						<td style="text-align:center"><c:out value="${inventor.inventorComment}"/></td>
						
					  </tr>
					</c:forEach>
				  </tbody>
				</table>
	           
	         </div>
      </div>
   </div>
</div>


<!--addInventorModal  -->
<div class = "modal fade" id = "addInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:540px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="addInventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	添加新的发明人
            </h4>
         </div>
	         <div class = "modal-body">

	           <div class="lt-box" style="padding:20px;">
			       	<h5>姓名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorName" required onblur="validateInfoNumber(this.value)"/>
					<span style="color: red; display: none;" id=inventorNameError>该处应输入不大于20字段</span>
					<br>	   
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorNumber" required onblur="validatePhoneNumber(this.value)"/>
					<span style="color: red; display: none;" id=inventorNumberError>请输入正确的证件号码</span>
					<br>		  
			       	<h5>国籍:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;"  type="text" id="modalInventorNationality" value="中国" required onblur="validateInfoNumber1(this.value)"/>
					<span style="color: red; display: none;" id="inventorNationalityError">该处应输入不大于20字段</span>
					<br>		  
			       	<h5>电话:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorMobile" required onblur="validateInfoNumber2(this.value)"/>
					<span style="color: red; display: none;" id="inventorMobileError">请输入正确的电话号码</span>
					<br>		  
			       	<h5>邮箱:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorEmail" required onblur="validateInfoNumber3(this.value)"/>
					<span style="color: red; display: none;" id="inventorEmailError">请输入正确的邮箱</span>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="modalInventorComment"  onblur="validateCommentNumber(this.value)"/>
					<span style="color: red; display: none;" id="commentError">该处应输入不大于50字段</span>
					<br>      
					<div style="height:20px;"></div> 
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitInventorForm()">保存</button>		
					<button type="button" style="width:90px;margin-left:275px;" class="button button-primary  button-rounded" onclick="resetAddInventorModal()">取消</button>		
				</div>
	      </div>
	   </div>
	</div>
</div>


<!--updateInventorModal  -->
<button id="hiddenUpdateInventorModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateInventorModal">
</button>
<div class = "modal fade" id = "updateInventorModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:540px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateInventorModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	修改发明人信息
            </h4>
         </div>
	         <div class = "modal-body">
	           <div class="lt-box" style="padding:20px;">
					<input type="hidden" id="updateModalInventorId" required onblur="validateInfoNumber(this.value)"/>
			       	<h5>姓名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorName" required onblur="validateInfoNumber(this.value)"/>
					<span style="color: red; display: none;" id=updateInventorName>该处应输入不大于20字段</span>
					<br>	   
					<h5>证件号码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorNumber" required onblur="validatePhoneNumber(this.value)"/>
					<span style="color: red; display: none;" id=updateInventorNumber>请输入正确的证件号码</span>
					<br>		  
			       	<h5>国籍:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;"  type="text" id="updateModalInventorNationality" value="中国" required onblur="validateInfoNumber1(this.value)"/>
					<span style="color: red; display: none;" id=updateInventorNationality>该处应输入不大于20字段</span>
					<br>		  
			       	<h5>电话:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorMobile" required onblur="validateInfoNumber2(this.value)"/>
					<span style="color: red; display: none;" id=updateInventorMobile>请输入正确的电话号码</span>
					<br>		  
			       	<h5>邮箱:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorEmail" required onblur="validateInfoNumber3(this.value)"/>
					<span style="color: red; display: none;" id=numberError3>请输入正确的邮箱</span>
					<br>
					<h5>其他信息:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" type="text" id="updateModalInventorOtherInformation"  onblur="validateCommentNumber(this.value)"/>
					<br>      
					<div style="height:20px;"></div> 
					<button type="button" style="width:90px;" class="button button-primary  button-rounded" onclick="submitUpdateInventorForm()">保存</button>		
					<button type="button" style="width:90px;margin-left:275px;" class="button button-primary  button-rounded" onclick="resetUpdateInventorForm()">取消</button>		
				</div>
	      </div>
	   </div>
	</div>
</div>

<!--commonContactModal  -->
<div class = "modal fade" id = "commonContactModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:750px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="commonContactModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	从常用联系人中选择
            </h4>
         </div>
	         <div class = "modal-body">
				<div class="lt-box" style="padding:20px;">
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <%-- <th class="center"> <label class="pos-rel">
							<input type="checkbox" class="contact-check-item" name="checkall" />
							<span class="lbl"></span> </label>
						  </th> --%>
						  <th>序号</th>
						  <th>联系人</th>
						  <th>所在地区</th>
						  <th>地址</th>
						  <th>联系电话</th>
						  <th>操作</th>
						</tr>
					  </thead>
					  <c:forEach items="${contactAddresses}" var="address" varStatus="status">
						<tr>
						  <%-- <td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							<input type="checkbox" class="contact-check-item" contact="<c:out value='${address.id}'/>"/></span>
							<span class="lbl"></span></label>
						  </td> --%>
						  <td class="center" style="text-align:center;">${status.count}</td>
						  <td style="text-align:center;">${address.receiver}</td>
						  <td style="text-align:center;">${address.provinceName} ${address.cityName} ${address.districtName}
						  </td>
						  <td style="text-align:center;">${address.detailAddress}</td>
						  <td style="text-align:center;">${address.phone}</td>
						  <td style="text-align:center;"><a href="javascript:void(0);" onclick="settingContact(${address.id})">设为联系人</a></td>
						</tr>
					  </c:forEach>
					</table>
				</div>
	           
	      </div>
	   </div>
	</div>
</div>


<!--updateContactModal  -->

<button id="hiddenUpdateContactModal" style="display:none;" type="button" class = "button button-caution button-rounded" data-toggle = "modal" data-target = "#updateContactModal">
</button>
<div class = "modal fade" id = "updateContactModal" tabindex = "-1" role = "dialog" 
   aria-labelledby = "myModalLabel" aria-hidden = "true" >
   
   <div class = "modal-dialog" style="width:750px">
      <div class = "modal-content">
         
         <div class = "modal-header">
            <button type = "button" class = "close" data-dismiss = "modal" aria-hidden = "true" id="updateContactModalCloseBtn">
               ×
            </button>
            
            <h4 class = "modal-title" id = "myModalLabel">
            	修改联系人信息
            </h4>
         </div>
	         <div class = "modal-body">
				<div class="lt-box" style="padding:20px;">
						<h5>联系人名称:</h5>
	  
					  	<input type="text" class="form-control" style="height: 40px; width: 300px;" name="receiver" id="receiver"/>
					  
						<h5>通讯地址:</h5>
	  
					  <select name="province" style="width:136px;display:inline;" class="form-control" id="province" onchange="loadCities()" required>
						<option value='${contactAddress.province}' id="waitForProvinceName">value='${contactAddress.provinceName}'</option>
						<c:forEach items="${provinces}" var="province">
						  <option value="${province.id}">${province.name}</option>
						</c:forEach>
					  </select>
					  <select name="city" class="form-control"  style="width:226px;display:inline;" id="city" onchange="loadDistricts()" required>
						<option value='${contactAddress.city}' id="waitForCity">value='${contactAddress.cityName}'</option>
					  </select>
					  <select name="district" class="form-control"  style="width:226px;display:inline;" id="district">
						<option value='${contactAddress.district}' id="waitForDistrict">${contactAddress.districtName}</option>
					  </select>
					  <h5>详细地址:</h5>
					  <input type="text" class="form-control" style="width:300px;" name="detailAddress" id="detailAddress"/>
					  	 <%--  value="${contactAddress.detailAddress}" required --%>
					  <h5>手机或固话</h5>
					  <input type="text" class="form-control" style="width:300px;" name="phone" id="phone" 
					  		minlength="6" maxlength="15" onblur="validatePhoneNumber(this.value)" value="${contactAddress.phone}" required/>
					  	<!--value="${contactAddress.phone}"   -->
					  <span	style="color: red; display: none;" id=phoneError>请输入正确的手机或者电话号</span>
					 <input type="hidden" class="form-control" name="id" id="contactId" value="${contactAddress.id}"/>
					  <div style="height: 20px;"></div>
					  <button type="button" class="button button-primary  button-rounded" onclick="submitUpdateContactForm()">保存</button>
					  <button type="button" style="width:90px;margin-left:500px;" class="button button-primary  button-rounded" onclick="resetUpdateInventorForm()">取消</button>
				</div>
	      </div>
	   </div>
	</div>
</div>
<script type="text/javascript">
	
	var p=1;
	$('input[id=patentFile]').change(function() {  
		$('#filename').val($(this).val());  
	});
	function savePatentImgUrl() {
		if ($("#patentUrl").length > 0) {
			var caption = $("#piciLlus2").val();
			var attachmentUrl = $("#patentUrl").val();
			var patentDocId=$("#patentDocId").val();
			var seqNo=$("#seqNo").val();
			$.ajax({
				type : "POST",
				url : "<s:url value='/editor/savePatentImgUrl.html'/>",
				data : {
					"caption" : caption,
					"attachmentUrl" : attachmentUrl,
					"seqNo":seqNo,
					"patentDocId":patentDocId
				},
					success: function(data){
				},
				error : function() {
					alert("上传失败！稍后再试！");
				}
			});
		}else{
			alert("请选择上传图片!");
		}
	}
	 function templatebuttonclick(i,patentDocSectionId){
		 if(patentDocSectionId==1){
			 editor.appendHtml($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==2){
			 editor8.appendHtml($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==3){
			 editor7.appendHtml($("#templateContent"+i).html());
		 }
		 else{
			 
		 }
	}
	 
	 function downPage(){
		 var sectionId = $("#templateSectionId").html();
		 ++p;
		 var totoalPage=getTotalPageBySectionId(sectionId);
		 if(totoalPage>1){
			 if(p>=totoalPage){
				p=totoalPage;
				$("#topDownPage").css("color","#ccc");
				$("#bottomDownPage").css("color","#ccc");
			 }
		 	loading(sectionId,p);
		 	$("#topUpPage").css("color","#0085d0");
		 	$("#bottomUpPage").css("color","#0085d0");
		 }else{
			$("#topDownPage").css("color","#ccc");
			$("#bottomDownPage").css("color","#ccc");
			$("#topUpPage").css("color","#ccc");
		 	$("#bottomUpPage").css("color","#ccc");
		 }
	 }
	 function upPage(){
		 var sectionId = $("#templateSectionId").html();
		 --p;
		 if(p<=1){
			 p=1;
			$("#topUpPage").css("color","#ccc");
			$("#bottomUpPage").css("color","#ccc");
		 }
		$("#topDownPage").css("color","#0085d0");
		$("#bottomDownPage").css("color","#0085d0");
		 loading(sectionId,p);
	 }
	function loadingInterfaceTemplate(sectionId){
		 var patentType=${patentDoc.patentType };
		 $("#templateSectionId").html(sectionId);
		 var totoalPage=getTotalPageBySectionId(sectionId);
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTemplateList.html'/>",
			 data : {"sectionId":sectionId,"patentType":patentType},
			 success : function (data){
				 var obj= $.parseJSON(data);
				 $("#modelWrap").empty();
				 $("#hiddenmodel").empty();
				 $.each(obj,function(i,item){
					 $("#modelWrap").append("<div class='model1 model_list"+i+"' style='overflow-x: hidden; overflow-y: hidden;height:158px;'>"+
						"<div class='title'>模板&nbsp;"+(i+1)+":"+item.templateTitle+"</div>"+ 
					 		"<div class='content' style='height:105px;overflow-y:hidden;'>"+
				 				"<p class='small'>"+
									"<span>"+item.content+"</span>"+
								"</p>"+
							"</p>"+
						    "<div class='button' style='z-index:500000;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
						  "</div>"+
					   "</div>");
					 $("#modelWrap span").css("color","black");
				 	 $("#hiddenmodel").append("<div id='templateContent"+i+"'>"+item.content+"</div>");
				 });
			 },error : function (){
				 
			 }
		 });
		 
		 
	 } 
 	function loading(sectionId,currentPage){
 		 var patentType=${patentDoc.patentType };
		 $("#templateSectionId").html(sectionId);
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTemplateListByPage.html'/>",
			 data : {"sectionId":sectionId,"currentPage":currentPage,"patentType":patentType},
			 success : function (data){
				 var obj= $.parseJSON(data);
				 $("#modelWrap").empty();
				 $("#hiddenmodel").empty();
				 $.each(obj,function(i,item){
					 $("#modelWrap").append("<div class='model1 model_list"+i+"' style='overflow-x: hidden; overflow-y: hidden;height:158px;'>"+
						 "<div class='title'>模板&nbsp;"+(i+1)+":"+item.templateTitle+"</div>"+
						 	 "<div class='content' style='height:105px;overflow-y:hidden;'>"+
				 				"<p class='small'>"+
									"<span>"+item.content+"</span>"+
								"</p>"+
							"</p>"+
						    "<div class='button' style='z-index:500000;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
						  "</div>"+
					   "</div>");
					 $("#modelWrap span").css("color","black");
				 	 $("#hiddenmodel").append("<div id='templateContent"+i+"'>"+item.content+"</div>");
				 });
			 },error : function (){
				 
			 }
		 });
	 }
 	
	 function findAttachmentImg(){
		 var patentDocId=$("#patentDocId").val();
		 var base = "${base}";
		 $.ajax({
				type : "POST",
				url : "<s:url value='/editor/getAttachmentById.html'/>",
				data : {"patentDocId":patentDocId
				},
					success: function(data){
						$("#picLsy").empty();
						
					var obj= $.parseJSON(data);
					$.each(obj,function(i,item){
						var  httpImgUrl=base+item.attachmentUrl;
						 $("#picLsy").append(
								 "<li id="+item.attachmentId+">"+
									"<a href='#'>"+
										"<img src='"+httpImgUrl+"' alt='' width='200' height='150'/>"+
									"</a>"+
									"<div class='text'>"+
									
										"<b>"+item.caption+"</b>"+
										"<p>"+"<a href='javascript:settingAbstractImg("+"&apos;"+item.attachmentUrl+"&apos;"+")'>设为摘要附图</a>"+
										"</p>"+
									"</div>"
								+"</li>"
						);
						 
					 });
					hoverImg();
				},
				error : function() {
					alert("操作失败");
				}
		});
	 }
	 
	 
	 
	function getTotalPageBySectionId(sectionId){
		var totalPageForSectionId=0;
		var patentType=${patentDoc.patentType};
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTotalPage.html'/>",
			 data : {"sectionId":sectionId,"patentType":patentType},
			 async: false,
			 success : function (data){
				 totalPageForSectionId=data;
			 },error : function (){
			 }
		 });
		 return totalPageForSectionId;
	 } 
</script>
<script type="text/javascript">
function hoverImg(){

	$("#picLsy li").hover(function(){
		$(this).find('.text:not(:animated)').animate({top:"0px"}, {easing:"easeInOutExpo"}, 50, function(){});
	},function () {
		$(this).find('.text').animate({top:"149px"}, {easing:"easeInOutExpo"}, 50, function(){});
	});

};
function hoverImg2(){

	$("#picLsy2 li").hover(function(){
		$(this).find('.text:not(:animated)').animate({top:"0px"}, {easing:"easeInOutExpo"}, 50, function(){});
	},function () {
		$(this).find('.text').animate({top:"149px"}, {easing:"easeInOutExpo"}, 50, function(){});
	});

};

function delectImg(value){
	 $.ajax({
			type : "POST",
			url : "<s:url value='/editor/delectAttachmentById.html'/>",
			data : {"attachmentId":value},
				success: function(data){
					alert("删除成功！");
					$("#"+value).hide();
			},
			error : function() {
				alert("操作失败");
			}
	});
}

function settingAbstractImg(value){
	var patentDocId=$("#patentDocId").val();
	var base = "${base}";
	$.ajax({
		type : "POST",
		url : "<s:url value='/editor/savePatentAbstractImg.html'/>",
		data : {"abstractImg":value,"patentDocId":patentDocId},
			success: function(data){
				var httpImgUrl=base+value;
				 $("#picLsy3").html(
							"<a href='#'>"+
							"<img src='"+httpImgUrl+"' alt='' width='400' height='300'/>"+
							"</a>"
						);
		},
		error : function() {
			alert("操作失败");
		}
});
}
</script>
<script type="text/javascript">
function returnSavePatentDoc(value){
	var name=$("#editorContent1").val();
	var manual=$("#editorContent").val();
	var abstractDescription=$("#editorContent7").val();
	var rightClaim=$("#editorContent8").val();
	//var contactPerson = $("#contactPerson").val();
	var otherInformation = $("#otherInformation").val();
	$.ajax({
		type: "POST",
		url: "<s:url value='/editor/savePatentDoc.html'/>",
		data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":value,"otherInformation":otherInformation},
		success: function(data){
			location.href="<s:url value='/editor/patentDocList.html'/>";
		},
		error: function(){
			location.href="<s:url value='/editor/patentDocList.html'/>";
		}
	});
};


function savePatentDoc(value){
	var name=$("#editorContent1").val();
	var manual=$("#editorContent").val();
	var abstractDescription=$("#editorContent7").val();
	var rightClaim=$("#editorContent8").val();
	var contactPerson = $("#contactPerson").val();
	var otherInformation = $("#otherInformation").val();
	$.ajax({
		type: "POST",
		url: "<s:url value='/editor/savePatentDoc.html'/>",
		data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":value,"contactPerson":contactPerson,"otherInformation":otherInformation},
		success: function(data){
			alert("操作成功");
		},
		error: function(){
			alert("操作失败");
		}
	});
};

function preview_selfwrite(patentDocId,patentType){
	var patentDocId=patentDocId;
	var patentType=patentType;
	var name=$("#patentName").val();
	var manual=$("#editorContent").val();
	var abstractDescription=$("#editorContent7").val();
	var rightClaim=$("#editorContent8").val();
	$.ajax({
		type: "POST",
		url: "<s:url value='/editor/savePreviewPatentDoc.html'/>",
		data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":patentDocId},
		success: function(data){
		},
		error: function(){
			alert("数据未保存");
		}
	});
	window.open("<s:url value='/editor/previewPatentDoc.html'/>?patentDocId="+patentDocId+"&patentType="+patentType)
	
}

function loadImgs(){
	var patentDocId=$("#patentDocId").val();
	var base = "${base}";
	 $.ajax({
			type : "POST",
			url : "<s:url value='/editor/getAttachmentById.html'/>",
			data : {"patentDocId":patentDocId
			},
				success: function(data){
					$("#picLsy2").empty();
					var obj= $.parseJSON(data);
					$.each(obj,function(i,item){
						var  httpImgUrl=base+item.attachmentUrl;
						 $("#picLsy2").append(
 								 "<li id="+item.attachmentId+">"+
									"<img src='"+httpImgUrl+"' alt='' width='200' height='150'/><br/>"+
									"<div style='margin-left:60px'>"+
									"<a href='javascript:void(0);'" + "id=link" + item.seqNo  + " onclick='updateImgName("+"&apos;"+item.attachmentId+"&apos;"+","+item.seqNo+")'>"+item.caption+"</a>"+"|&nbsp"+
									"<a href='javascript:delectImg("+item.attachmentId+")'>删除图片</a>"+
									
								"</div>"
								
								+"</li>"
						);
						 
					 });
					 
			},
			error : function() {
				alert("操作失败");
			}
	});
}
</script>
<script type="text/javascript">

	$('input[id="patentAttachmentFile"]').change(function() {
		$('#filename').val($(this).val());  
	});
	
	function uploadAttachmentFile(){
		
		var hideForm = $('#patentDocAttachment'); 
		var options = {
			dataType : "json", 
			data: {'file': $("#patentAttachmentFile").val()},
			beforeSubmit : function() {
				var name=$("#filename").val();
				var mime = name.toLowerCase().substr(name.lastIndexOf("."));
				if(mime ==".zip" || mime ==".rar"){
					return true;
				}else{
					alert("请上传压缩文件包！");
					return false;
				}
			}, 
			success : function(result) {
				uploadSuccess(result); 
			}, 
			error : function() {
				alert("上传失败"); 
			} 
		}; 
		hideForm.ajaxSubmit(options); 
	}
	function uploadSuccess(value){
		var patentDocId=$("#patentDocId").val();
		$.ajax({
			type: "POST",
			url: "<s:url value='/editor/savePatentDocAttachmentFile.html'/>",
			data: {"patentDocId":patentDocId,"patentDocAttachmentFile":value},
			success: function(data){
				alert("保存成功");
			},
			error: function(){
				alert("保存失败");
			}
		});
	}
	function downloadFile(){
		var patentDocId=$("#patentDocId").val();
		$.ajax({
			type :'GET',
			url : "<s:url value='/editor/getPatentDocAttachmentFile.html'/>?patentDocId="+patentDocId,
			success : function(){
				
			},
			error: function(){
				alert("下载失败");
			}
		})
	}
	
	function searModel(){
		
		$('.model-list').show();
		$('.guide-list').hide();
		
	}
	function searGuide(){
		
		$('.model-list').hide();
		$('.guide-list').show();
		
	}
	
	function picName() {
		var picName = $("#piciLlus2").val();
		
		$.ajax({
			url: "<s:url value='/user/setPicName.html'/>?picName=" + encodeURI(picName), 
			type: 'get', 
			success: function() {
				
			}
		});		
	}
	
	function updateImgName(value,linkSeqNo){
		var caption = prompt("请输入新名称", "");
		if (caption != null && caption != "") {
			$.ajax({
				url: "<s:url value='/editor/updateAttachmentImgName.html'/>", 
				data:{"caption":caption,"attachmentId":value},
				type: 'post', 
				success: function(data) {
						$("#link" + linkSeqNo).html(caption);
				}
			});
		}
	}
</script>
<script type="text/javascript">
$(function(){
	formutil.clickAllCheckbox('tr th input.apperson-check-item', 'tr td input.apperson-check-item');
	formutil.clickItemCheckbox('tr th input.apperson-check-item', 'tr td input.apperson-check-item');		

	formutil.clickAllCheckbox('tr th input.inventor-check-item', 'tr td input.inventor-check-item');
	formutil.clickItemCheckbox('tr th input.inventor-check-item', 'tr td input.inventor-check-item');		

	//formutil.clickAllCheckbox('tr th input.contact-check-item', 'tr td input.contact-check-item');
	//formutil.clickItemCheckbox('tr th input.contact-check-item', 'tr td input.contact-check-item');		
});
function batchAddAppPerson(){
	var appPersonSelected = formutil.anyCheckboxItemSelected('tr td input.apperson-check-item');
	var uniqueappPersonNos = []
	if (!appPersonSelected) {
		formutil.alertMessage('请选择申请人');
		
		return;
	}
	var appPerson_checked=formutil.getAllCheckedCheckboxValues('tr td input.apperson-check-item', 'appPerson');
	for (var i = 0; i < appPerson_checked.length; i++) {
		if ($.inArray(appPerson_checked[i], uniqueappPersonNos) == -1) {
			uniqueappPersonNos.push(appPerson_checked[i]);
		}
	}		
	var appPersonIds = uniqueappPersonNos.join(",");
	var patentDocId = ${patentDoc.patentDocId};
	$.ajax({
		type : "POST",
		//url : "<s:url value='/petition/findAppPersonNameById.html'/>?appPersonIds="+appPersonIds,
		url : "<s:url value='/petition/addPatentDocAppPerson.html'/>?appPersonIds="+appPersonIds+"&patentDocId="+patentDocId,
		async :false,
		success : function (data){
			var obj= $.parseJSON(data);
			$("#appersonTab").empty();
			$.each(obj,function(i,item){
				$("#appersonTab").append(
						"<tr>"+
						//"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
						//"<input type='checkbox' class='check-item' appPerson=<c:out value='"+item.personId+"'/>'>"+
						//"<span class='lbl'></span></label>"+
						//"</td>"+
						//"<td class='center' style='text-align:center'><input type='checkbox' class='check-item'/></td>"+
						//"<td class='center' style='text-align:center'>"+i+"</td>"+
						"<td style='text-align:center'>"+item.name+"</td>"+
						"<td style='text-align:center'>"+item.idNumber+"</td>"+
						"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
						"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
						"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
						"<td style='text-align:center'>"+item.transactionYear+"</td>"+
						"<td style='text-align:center'>"+item.otherInformation+"</td>"+
						"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
						"</tr>"
				)
			})
		}
		
	});
	
	$("#appersonModalCloseBtn").trigger("click");
	$('input:checkbox').removeAttr('checked');
	
}

function deleteAppPerson(appPerson){
	$("#"+appPerson).remove();
}



function batchAddInventor(){
	var inventorSelected = formutil.anyCheckboxItemSelected('tr td input.inventor-check-item');
	var uniqueInventorNos = []
	if (!inventorSelected) {
		formutil.alertMessage('请选择发明人');
		
		return;
	}
	var inventor_checked=formutil.getAllCheckedCheckboxValues('tr td input.inventor-check-item', 'inventor');
	for (var i = 0; i < inventor_checked.length; i++) {
		if ($.inArray(inventor_checked[i], uniqueInventorNos) == -1) {
			uniqueInventorNos.push(inventor_checked[i]);
		}
	}		
	var inventorIds = uniqueInventorNos.join(",");
	var patentDocId = ${patentDoc.patentDocId};
	$.ajax({
		type : "POST",
		//url : "<s:url value='/petition/findInventorNameById.html'/>?inventorIds="+inventorIds,
		url : "<s:url value='/petition/addPatentDocInventor.html'/>?inventorIds="+inventorIds+"&patentDocId="+patentDocId,
		async :false,
		success : function (data){
			var obj= $.parseJSON(data);
			$("#inventorTab").empty();
			$.each(obj,function(i,item){
				$("#inventorTab").append(
						"<tr>"+
						"<td style='text-align:center'>"+item.inventorName+"</td>"+
						"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
						"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
						"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
						"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
						"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
						"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
						"</tr>"	
				)
			})
		}
		
	});
	
	$("#inventorModalCloseBtn").trigger("click");
	$('input:checkbox').removeAttr('checked');
	
}
function deleteTag(tag){
	tag.parentNode.removeChild(tag); 
}


function submitAppPersonForm(){
	var appPersonName =$("#modalAppPersonName").val();
	//var appPersonType =$("#modalAppPersonType").val();
	var phoneRece =$("#modalPhoneRece").val();
	var postcodeAddress =$("#modalPostcodeAddress").val();
	var feeReduceTransactionStatus =$("#modalFeeReduceTransactionStatus").val();
	var transactionIdentityId =$("#modalTransactionIdentityId").val();
	var transactionYear =$("#modalTransactionYear").val();
	var otherInfo =$("#modalOtherInfo").val();
	
	   //validateAppPersonFormWayTwo(postcodeAddress,"appPersonPostcodeAddress")
	var patentDocId =${patentDoc.patentDocId};
	if(validateAppPersonFormWayOne(phoneRece,"appPersonPhoneError")&
	   validateAppPersonFormWayTwo(appPersonName,"appPersonNameError")&
	   validateAppPersonFormWayTwo(postcodeAddress,"appPersonPostcodeAddress")
	   ){
		var formData ={"name":appPersonName,"idNumber":phoneRece,"postcodeAddress":postcodeAddress,"otherInfo":otherInfo,"feeReduceTransactionStatus":feeReduceTransactionStatus,
				       "transactionIdentityId":transactionIdentityId,"transactionYear":transactionYear,"patentDocId":patentDocId};
		
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/addCommonAppPerson.html'/>",
			data : formData,
			async : false,
			success : function(data){
				var obj= $.parseJSON(data);
				$("#appersonTab").empty();
				$.each(obj,function(i,item){
					$("#appersonTab").append(
							"<tr>"+
							"<td style='text-align:center'>"+item.name+"</td>"+
							"<td style='text-align:center'>"+item.idNumber+"</td>"+
							"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
							"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
							"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
							"<td style='text-align:center'>"+item.transactionYear+"</td>"+
							"<td style='text-align:center'>"+item.otherInformation+"</td>"+
							"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
							"</tr>"
					)
				})
				
			},error:function (){
				
			}
		});
		resetAppPersonForm();
	};
}


function resetDefaultValue(){
	//$("#addAppPersonModalCloseBtn").trigger("click");
	$("#modalAppPersonName").val("");
	$("#modalPhoneRece").val("");
	$("#modalPostcodeAddress").val("");
	$("#modalOtherInfo").val("");
	$("#modalFeeReduceTransactionStatus").val("未备案");
	$("#modalTransactionIdentityId").val("");
	$("#modalTransactionYear").val("");
}
function resetAppPersonForm(){
	$("#addAppPersonModalCloseBtn").trigger("click");
	resetDefaultValue();
}
function submitInventorForm(){
	var  modalInventorName= $("#modalInventorName").val();
	var  modalInventorNumber= $("#modalInventorNumber").val();
	var  modalInventorNationality = $("#modalInventorNationality").val();
	var  modalInventorMobile = $("#modalInventorMobile").val();
	var  modalInventorEmail= $("#modalInventorEmail").val();
	var  modalInventorComment= $("#modalInventorComment").val();
	var  patentDocId = ${patentDoc.patentDocId};
	if(validateAppPersonFormWayTwo(modalInventorName,"inventorNameError")&
	   validateAppPersonFormWayThree(modalInventorNumber,"inventorNumberError")&
	   validateAppPersonFormWayThree(modalInventorNationality,"inventorNationalityError")&
	   validateAppPersonFormWayThree(modalInventorMobile,"inventorMobileError")
	){
		var formData={"inventorName":modalInventorName,"inventorNumber":modalInventorNumber,"inventorNationality":modalInventorNationality,"inventorMobile":modalInventorMobile,"inventorEmail":modalInventorEmail,"inventorComment":modalInventorComment,"patentDocId":patentDocId};
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/addCommonInventor.html'/>",
			data : formData,
			async : false,
			success : function (data){
				var obj= $.parseJSON(data);
				$("#inventorTab").empty();
				$.each(obj,function(i,item){
					$("#inventorTab").append(
							"<tr>"+
							"<td style='text-align:center'>"+item.inventorName+"</td>"+
							"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
							"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
							"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
							"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
							"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
							"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
							"</tr>"	
					)
				})
			}
		});
		resetAddInventorModal();
	}else{
	}
}

function resetAddInventorModal(){
	$("#addInventorModalCloseBtn").trigger("click");
	$("#modalInventorName").val("");
	$("#modalInventorNumber").val("");
	$("#modalInventorNationality").val("中国");
	$("#modalInventorMobile").val("");
	$("#modalInventorEmail").val("");
	$("#modalInventorComment").val("");
}

function batchAddAddress(){
	var contactSelected = formutil.anyCheckboxItemSelected('tr td input.contact-check-item');
	var uniqueContactNos = []
	if (!contactSelected) {
		formutil.alertMessage('请选择联系人');
		
		return;
	}
	var contact_checked=formutil.getAllCheckedCheckboxValues('tr td input.contact-check-item', 'contact');
	for (var i = 0; i < contact_checked.length; i++) {
		if ($.inArray(contact_checked[i], uniqueContactNos) == -1) {
			uniqueContactNos.push(contact_checked[i]);
		}
	}		
	var contactIds = uniqueContactNos.join(",");
	alert(contactIds);
	
	$.ajax({
		type : 'POST',
		url : "<s:url value='/petition/findContactNameById.html'/>?contactIds="+contactIds,
		success : function (data){
			var obj = $.parseJSON(data);
			$.each(obj,function(i,item){
				$("#contactTextarea").append(item.receiver+"&nbsp;"+item.provinceName+item.cityName+item.districtName+"&nbsp;"+item.phone+";"+"&nbsp;")
			})
		},error :function (){
			
		}
		
	})
}
function searModel(){
	
	$('.model-list').show();
	$('.guide-list').hide();
	
}
function searGuide(){
	
	$('.model-list').hide();
	$('.guide-list').show();
	
}

function deletePatentDocApperson(personId){
	var patentDocId=${patentDoc.patentDocId};
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/deletePatentDocApperson.html'/>",
		data:{"personId":personId,"patentDocId":patentDocId},
		success : function (data){
			var obj= $.parseJSON(data);
			$("#appersonTab").empty();
			$.each(obj,function(i,item){
				$("#appersonTab").append(
						"<tr>"+
						//"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
						//"<input type='checkbox' class='check-item' appPerson=<c:out value='"+item.personId+"'/>'>"+
						//"<span class='lbl'></span></label>"+
						//"</td>"+
						//"<td class='center' style='text-align:center'><input type='checkbox' class='check-item'/></td>"+
						//"<td class='center' style='text-align:center'>"+i+"</td>"+
						"<td style='text-align:center'>"+item.name+"</td>"+
						"<td style='text-align:center'>"+item.idNumber+"</td>"+
						"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
						"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
						"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
						"<td style='text-align:center'>"+item.transactionYear+"</td>"+
						"<td style='text-align:center'>"+item.otherInformation+"</td>"+
						"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
						"</tr>"
				)
			})
		}
	})
}

function updatePatentDocApperson(personId){
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/findAppPersonById.html'/>",
		data : {"personId":personId},
		success : function (data){
			var obj = $.parseJSON(data);
			$("#updateModalPersonId").val(obj["personId"]);
			$("#updateModalAppPersonName").val(obj["name"]);
			$("#updateModalPhoneRece").val(obj["idNumber"]);
			$("#updateModalPostcodeAddress").val(obj["postcodeAddress"]);
			$("#updateModalOtherInfo").val(obj["otherInformation"]);
			$("#updateModalFeeReduceTransactionStatus").val(obj["feeReduceTransactionStatus"]);
			$("#updateModalTransactionIdentityId").val(obj["transactionIdentity"]);
			$("#updateModalTransactionYear").val(obj["transactionYear"]);
			$("#hiddenUpdateAppPersonModal").trigger("click");
		},error : function (){
			
		}
	})
}




function submitUpdateAppPersonForm(){
	var personId = $("#updateModalPersonId").val();
	var name = $("#updateModalAppPersonName").val();
	var idNumber = $("#updateModalPhoneRece").val();
	var postcodeAddress = $("#updateModalPostcodeAddress").val();
	var otherInformation = $("#updateModalOtherInfo").val();
	var feeReduceTransactionStatus = $("#updateModalFeeReduceTransactionStatus").val();
	var transactionIdentity =  $("#updateModalTransactionIdentityId").val();
	var transactionYear = $("#updateModalTransactionYear").val();
	var patentDocId=${patentDoc.patentDocId};
	
	if(validateAppPersonFormWayTwo(name,"updateAppPersonName")&
	   validateAppPersonFormWayTwo(idNumber,"updatePhoneRece")){
		var formData ={"personId":personId,"name":name,"idNumber":idNumber,"postcodeAddress":postcodeAddress,
				       "otherInformation":otherInformation,"feeReduceTransactionStatus":feeReduceTransactionStatus,
				       "transactionIdentity":transactionIdentity,"transactionYear":transactionYear,"patentDocId":patentDocId};
		$.ajax({
			type : "POST",
			url : "<s:url value='/petition/updatePatentDocApperson.html'/>",
			data : formData,
			success : function (data){
				var obj= $.parseJSON(data);
				$("#appersonTab").empty();
				$.each(obj,function(i,item){
					$("#appersonTab").append(
							"<tr>"+
							"<td style='text-align:center'>"+item.name+"</td>"+
							"<td style='text-align:center'>"+item.idNumber+"</td>"+
							"<td style='text-align:center'>"+item.postcodeAddress+"</td>"+
							"<td style='text-align:center'>"+item.feeReduceTransactionStatus+"</td>"+
							"<td style='text-align:center'>"+item.transactionIdentity+"</td>"+
							"<td style='text-align:center'>"+item.transactionYear+"</td>"+
							"<td style='text-align:center'>"+item.otherInformation+"</td>"+
							"<td style='text-align:center'><a href='javascript:deletePatentDocApperson("+item.personId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocApperson("+item.personId+")'>修改</a></td>"+
							"</tr>"
					)
				})
				
			},error : function (){
				
			}
		});
		reseAppPersontUpdateForm();
	
	}
}

function reseAppPersontUpdateForm(){
	$("#updateAppPersonModalCloseBtn").trigger("click");
	$("#updateModalAppPersonName").val();
	$("#updateModalPhoneRece").val();
	$("#updateModalPostcodeAddress").val();
	$("#updateModalOtherInfo").val();
	$("#updateModalFeeReduceTransactionStatus").val("未备案");
	$("#updateModalTransactionIdentityId").val();
	$("#updateModalTransactionYear").val();
}

function deletePatentDocInventor(inventorId){
	var patentDocId=${patentDoc.patentDocId};
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/deletePatentDocInventor.html'/>",
		data:{"inventorId":inventorId,"patentDocId":patentDocId},
		success : function (data){
			var obj= $.parseJSON(data);
			$("#inventorTab").empty();
			$.each(obj,function(i,item){
				$("#inventorTab").append(
						"<tr>"+
						"<td style='text-align:center'>"+item.inventorName+"</td>"+
						"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
						"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
						"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
						"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
						"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
						"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
						"</tr>"	
				)
			})
		}
	})
}


function updatePatentDocInventor(inventorId){
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/findInventorById.html'/>",
		data : {"inventorId":inventorId},
		success : function (data){
			var obj = $.parseJSON(data);
			var inventorId = $("#updateModalInventorId").val(obj["inventorId"]);
			var  inventorName= $("#updateModalInventorName").val(obj["inventorName"]);
			var  inventorNumber= $("#updateModalInventorNumber").val(obj["inventorNumber"]);
			var  inventorNationality = $("#updateModalInventorNationality").val(obj["inventorNationality"]);
			var  inventorMobile = $("#updateModalInventorMobile").val(obj["inventorMobile"]);
			var  inventorEmail= $("#updateModalInventorEmail").val(obj["inventorEmail"]);
			var  inventorOtherInformation= $("#updateModalInventorOtherInformation").val(obj["inventorOtherInformation"]);
			var  patentDocId = ${patentDoc.patentDocId};
			var formData={"inventorId":inventorId,"inventorName":inventorName,"inventorNumber":inventorNumber,
					      "inventorNationality":inventorNationality,"inventorMobile":inventorMobile,
					      "inventorEmail":inventorEmail,"inventorComment":inventorOtherInformation,"patentDocId":patentDocId};
			$("#hiddenUpdateInventorModal").trigger("click");
		},error : function (){
			
		}
	})
}



function submitUpdateInventorForm(){
	var inventorId = $("#updateModalInventorId").val();
	var  inventorName= $("#updateModalInventorName").val();
	var  inventorNumber= $("#updateModalInventorNumber").val();
	var  inventorNationality = $("#updateModalInventorNationality").val();
	var  inventorMobile = $("#updateModalInventorMobile").val();
	var  inventorEmail= $("#updateModalInventorEmail").val();
	var  inventorOtherInformation= $("#updateModalInventorOtherInformation").val();
	var  patentDocId = ${patentDoc.patentDocId};
	updateModalInventorName
	if(validateAppPersonFormWayTwo(inventorName,"updateInventorName")&
	   validateAppPersonFormWayThree(inventorNumber,"updateInventorNumber")&
	   validateAppPersonFormWayThree(inventorNationality,"updateModalInventorNationality")&
	   validateAppPersonFormWayThree(inventorMobile,"updateModalInventorMobile")&
	   validateAppPersonFormWayThree(inventorOtherInformation,"updateModalInventorOtherInformation")
	   ){
	   
		var formData={"inventorId":inventorId,"inventorName":inventorName,"inventorNumber":inventorNumber,
				      "inventorNationality":inventorNationality,"inventorMobile":inventorMobile,
				      "inventorEmail":inventorEmail,"inventorOtherInformation":inventorOtherInformation,"patentDocId":patentDocId};
		$.ajax({
			type :"POST",
			url : "<s:url value='/petition/updatePatentDocInventor.html'/>",
			data : formData,
			success :function (data){
				var obj= $.parseJSON(data);
				$("#inventorTab").empty();
				$.each(obj,function(i,item){
					$("#inventorTab").append(
							"<tr>"+
							"<td style='text-align:center'>"+item.inventorName+"</td>"+
							"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
							"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
							"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
							"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
							"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
							"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
							"</tr>"	
					)
				})
			},error : function (){
				
			}
		});
		resetUpdateInventorForm();
		
	}
}

function reseAppPersontUpdateForm(){
	$("#updateAppPersonModalCloseBtn").trigger("click");
	$("#updateModalAppPersonName").val();
	$("#updateModalPhoneRece").val();
	$("#updateModalPostcodeAddress").val();
	$("#updateModalOtherInfo").val();
	$("#updateModalFeeReduceTransactionStatus").val("未备案");
	$("#updateModalTransactionIdentityId").val();
	$("#updateModalTransactionYear").val();
}

function deletePatentDocInventor(inventorId){
	var patentDocId=${patentDoc.patentDocId};
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/deletePatentDocInventor.html'/>",
		data:{"inventorId":inventorId,"patentDocId":patentDocId},
		success : function (data){
			var obj= $.parseJSON(data);
			$("#inventorTab").empty();
			$.each(obj,function(i,item){
				$("#inventorTab").append(
						"<tr>"+
						"<td style='text-align:center'>"+item.inventorName+"</td>"+
						"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
						"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
						"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
						"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
						"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
						"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
						"</tr>"	
				)
			})
		}
	})
}

function updatePatentDocInventor(inventorId){
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/findInventorById.html'/>",
		data : {"inventorId":inventorId},
		success : function (data){
			var obj = $.parseJSON(data);
			var inventorId = $("#updateModalInventorId").val(obj["inventorId"]);
			var  inventorName= $("#updateModalInventorName").val(obj["inventorName"]);
			var  inventorNumber= $("#updateModalInventorNumber").val(obj["inventorNumber"]);
			var  inventorNationality = $("#updateModalInventorNationality").val(obj["inventorNationality"]);
			var  inventorMobile = $("#updateModalInventorMobile").val(obj["inventorMobile"]);
			var  inventorEmail= $("#updateModalInventorEmail").val(obj["inventorEmail"]);
			var  inventorOtherInformation= $("#updateModalInventorOtherInformation").val(obj["inventorOtherInformation"]);
			var  patentDocId = ${patentDoc.patentDocId};
			var formData={"inventorId":inventorId,"inventorName":inventorName,"inventorNumber":inventorNumber,
					      "inventorNationality":inventorNationality,"inventorMobile":inventorMobile,
					      "inventorEmail":inventorEmail,"inventorComment":inventorOtherInformation,"patentDocId":patentDocId};
			$("#hiddenUpdateInventorModal").trigger("click");
		},error : function (){
			
		}
	})
}

/* function submitUpdateInventorForm(){
	var inventorId = $("#updateModalInventorId").val();
	var  inventorName= $("#updateModalInventorName").val();
	var  inventorNumber= $("#updateModalInventorNumber").val();
	var  inventorNationality = $("#updateModalInventorNationality").val();
	var  inventorMobile = $("#updateModalInventorMobile").val();
	var  inventorEmail= $("#updateModalInventorEmail").val();
	var  inventorOtherInformation= $("#updateModalInventorOtherInformation").val();
	var  patentDocId = ${patentDoc.patentDocId};
	var formData={"inventorId":inventorId,"inventorName":inventorName,"inventorNumber":inventorNumber,
			      "inventorNationality":inventorNationality,"inventorMobile":inventorMobile,
			      "inventorEmail":inventorEmail,"inventorOtherInformation":inventorOtherInformation,"patentDocId":patentDocId};
	$.ajax({
		type :"POST",
		url : "<s:url value='/petition/updatePatentDocInventor.html'/>",
		data : formData,
		success :function (data){
			var obj= $.parseJSON(data);
			$("#inventorTab").empty();
			$.each(obj,function(i,item){
				$("#inventorTab").append(
						"<tr>"+
						"<td style='text-align:center'>"+item.inventorName+"</td>"+
						"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
						"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
						"<td style='text-align:center'>"+item.inventorMobile+"</td>"+
						"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
						"<td style='text-align:center'>"+item.inventorOtherInformation+"</td>"+
						"<td style='text-align:center'><a href='javascript:deletePatentDocInventor("+item.inventorId+")'>删除</a><a style='margin-left:20px;' href='javascript:updatePatentDocInventor("+item.inventorId+")'>修改</a></td>"+
						"</tr>"	
				)
			})
		},error : function (){
			
		}
	});
	resetUpdateInventorForm();
} */

function resetUpdateInventorForm(){
	$("#updateInventorModalCloseBtn").trigger("click");
	$("#updateModalInventorId").val("");
	$("#updateModalInventorName").val("");
	$("#updateModalInventorNumber").val("");
	$("#updateModalInventorNationality").val("中国");
	$("#updateModalInventorMobile").val("");
	$("#updateModalInventorEmail").val("");
	$("#updateModalInventorOtherInformation").val("");
}

function downloadAttachmentFile(value){
	var iframe = document.getElementById('fileFrame');
	iframe.src = "<s:url value='/editor/getPatentDocAttachmentFile.html'/>?patentDocId="+value;
}

function downloadAttachmentFile(value){
	var iframe = document.getElementById('fileFrame');
	iframe.src = "<s:url value='/editor/getPatentDocAttachmentFile.html'/>?patentDocId="+value;
}
$('input[id=patentDocFile]').change(function() {  
	$('#patentDocFilename').val($(this).val());  
});
function uploadPatentDocFile(){
	var uploadForm=$("#uploadFileForm");
	var patentDocId = ${patentDoc.patentDocId};
	var option={
			dataType : "json",
			//contentType : false,
			data : {"file":$("#patentDocFile").val(),"patentDocId":patentDocId},
			beforeSubmit : function (){
				var filename = $("#patentDocFilename").val();
				var suffix = filename.toLowerCase().substr(filename.lastIndexOf("."));
				if(suffix ==".zip"||suffix==".rar"){
					return true;
				}else{
					alert("请选择指定类型的文件后，再进行上传");
					return false;
				}
			},
			success : function (result){
				alert(result);
			}
	}
	uploadForm.ajaxSubmit(option);
}

function downloadPatentDocFile(patentDocId){
	var iframe = document.getElementById('fileFrame');
	iframe.src="<s:url value='/petition/getPatentAttachmentFile.html'/>?patentDocId="+patentDocId;
}

function validateAppPersonFormWayOne(value,id) {
		if (value.length>50||value.length==0) {
			$("#"+id).css("display","block");
			return false;
		} else {
			$("#"+id).css("display","none");
			return true;
		}
}

function validateAppPersonFormWayTwo(value,id) {
		if (value.length>20||value.length==0) {
			$("#"+id).css("display","block");
			return false;
		} else {
			$("#"+id).css("display","none");
			return true;
		}
}

function validateAppPersonFormWayThree(value,id) {
		if (value.length>20||value.length==0) {
			$("#"+id).css("display","block");
			return false;
		} else {
			$("#"+id).css("display","none");
			return true;
		}
}



function settingContact(addressId){
	var patentDocId = ${patentDoc.patentDocId};
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/settingContact.html'/>",
		data : {"patentDocId":patentDocId,"addressId":addressId},
		async : false,
		success : function (reult){
			$("#contactTab").empty();
			var obj = $.parseJSON(reult);
			$.each(obj,function(i,item){
				$("#contactTab").append(
						"<tr>"+
						  "<td style='text-align:center'>"+item.receiver+"</td>"+
						  "<td style='text-align:center'>"+item.provinceName+item.cityName+item.districtName+"</td>"+
						  "<td style='text-align:center'>"+item.detailAddress+"</td>"+
						  "<td style='text-align:center'>"+item.phone+"</td>"+
						  "<td style='text-align:center'><a href='javascript:updateContact("+item.id+")'>修改</a></td>"+
						"</tr>"	
				)
			})
			
		}
	});
	
	$("#commonContactModalCloseBtn").trigger("click");
	
}


function updateContact(contactId){
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/findContactById.html'/>",
		data :{"id":contactId},
		async : false,
		success : function(result){
			var contact = $.parseJSON(result);
			$("#receiver").val(contact["receiver"]);
			$("#waitForProvinceName").val(contact["province"]);
			$("#waitForProvinceName").html(contact["provinceName"]);
			$("#waitForCity").val(contact["city"]);
			$("#waitForCity").html(contact["cityName"]);
			$("#waitForDistrict").val(contact["district"]);
			$("#waitForDistrict").html(contact["districtName"]);
			$("#detailAddress").val(contact["detailAddress"]);
			$("#contactId").val(contact["id"]);
			$("#phone").val(contact["phone"]);
		}
	});
	$("#hiddenUpdateContactModal").trigger("click");
}

/* function updateContact(contactId){
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/updateContact.html'/>",
		data :
	})
} */








function loadCities() {
	var province = $("#province").val();
	
	resetSelect($("#city"), $("#district"), $("#street"));
	
	if (province != "") {
		$.ajax({
			url: "<s:url value='/user/getCitiesByProvince.html'/>?province=" + province,
			type: 'get',
			dataType: 'json',
			success: function(cities) {
				var city = $("#city");
				
				resetSelect(city);
				addOptions(city, cities);
			}
		})
	} 
}

function loadDistricts() {
	var city = $("#city").val();

	resetSelect($("#district"), $("#street"));
	
	if (city != "") {
		$.ajax({
			url: "<s:url value='/user/getDistrictsByCity.html'/>?city=" + city,
			type: 'get',
			dataType: 'json',
			success: function(districts) {
				var district = $("#district");
				
				resetSelect(district);
				addOptions(district, districts);
			}
		})
	}
}


function addDefaultOption(selectElem) {
	selectElem.append("<option value=''>请选择</option>");
}

function resetSelect() {
	for (var i = 0; i < arguments.length; i++) {
		var selectObj = arguments[i];
		selectObj.empty();
		addDefaultOption(selectObj);
	}
}

function addOptions(selectObj, options) {
	$.each(options, function(index, val){
		selectObj.append("<option value='" + val.id + "'>" + val.name + "</option>");
	});	
}


function submitUpdateContactForm(){
	var receiver = $("#receiver").val();
	var province = $("#province").val();
	//$("#waitForProvinceName").html(contact["provinceName"]);
	var city = $("#city").val();
	//$("#waitForCity").html(contact["cityName"]);
	var district = $("#district").val();
	//$("#waitForDistrict").html(contact["districtName"]);
	var detailAddress = $("#detailAddress").val();
	var id = $("#contactId").val();
	var phone = $("#phone").val();
	var patentDocId = ${patentDoc.patentDocId};
	var formData = {"id":id,"receiver":receiver,"province":province,"city":city,"district":district,
					"detailAddress":detailAddress,"phone":phone,"patentDocId":patentDocId};
	$.ajax({
		type : "POST",
		url : "<s:url value='/petition/updateContact.html'/>",
		data : formData,
		async : false,
		success : function (reult){
			$("#contactTab").empty();
			var obj = $.parseJSON(reult);
			$.each(obj,function(i,item){
				$("#contactTab").append(
						"<tr>"+
						  "<td style='text-align:center'>"+item.receiver+"</td>"+
						  "<td style='text-align:center'>"+item.provinceName+item.cityName+item.districtName+"</td>"+
						  "<td style='text-align:center'>"+item.detailAddress+"</td>"+
						  "<td style='text-align:center'>"+item.phone+"</td>"+
						  "<td style='text-align:center'><a href='javascript:updateContact("+item.id+")'>修改</a></td>"+
						"</tr>"	
				)
			})
		}
	});
	
	$("#updateContactModalCloseBtn").trigger("click");
}

function searchAppPerson(keyword){
	$.ajax({
		url : "<s:url value='/petition/searchAppPerson.html'/>",
		data :{"keyword":keyword},
		success : function (data){
			var obj = $.parseJSON(data);
			$("#commonAppPersonTab").empty();
			$.each(obj,function(i,item){
				$("#commonAppPersonTab").append(
						"<tr>"+
						"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
						"<input type='checkbox' class='apperson-check-item' appPerson="+item.appPersonId+"></span>"+
						"<span class='lbl'></span></label>"+
						"</td>"+
						"<td class='center' style='text-align:center'>"+i+" ${status.count} </td>"+
						"<td style='text-align:center'>"+item.name+"</td>"+
						"<td style='text-align:center'>"+item.idNumber+"</td>"+
						"<td>"+item.postcodeAddress+"</td>"+
						"<td style='text-align:center'>"+item.otherInfo+"</td>"+
					  "</tr>"	
				)
			})
		}
	})
	
}

function searchInventor(keyword){
	$.ajax({
		url : "<s:url value='/petition/searchInventor.html'/>",
		data :{"keyword":keyword},
		success : function (data){
			var obj = $.parseJSON(data);
			$("#commonInventorTab").empty();
			$.each(obj,function(i,item){
				$("#commonInventorTab").append(
						"<tr>"+
							"<td class='center' style='text-align:center'><label class='pos-rel'> <span class='batch-share-item'>"+
							"<input type='checkbox' class='inventor-check-item' inventor="+item.inventorId+"></span>"+
							"<span class='lbl'></span></label>"+
							"</td>"+
							"<td class='center' style='text-align:center'> "+i+" </td>"+
							"<td style='text-align:center'>"+item.inventorName+"</td>"+
							"<td style='text-align:center'>"+item.inventorNumber+"</td>"+
							"<td style='text-align:center'>"+item.inventorNationality+"</td>"+
							"<td>"+item.inventorMobile+"</td>"+
							"<td style='text-align:center'>"+item.inventorEmail+"</td>"+
							"<td style='text-align:center'>"+item.inventorComment+"</td>"+
					"</tr>"
				)
			})
		}
	})
	
}

</script>
<iframe id="fileFrame" style="display:none"></iframe>
</body>
</html>