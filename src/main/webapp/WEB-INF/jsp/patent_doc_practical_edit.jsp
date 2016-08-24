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
	<title>实用新型撰写</title>
	<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap.min.css'/>">
	<link rel="stylesheet" href="<s:url value='/temp/css/bootstrap-theme.min.css'/>">
	<c:import url="common/kindEditor.jsp"></c:import>
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
					url              :   "<s:url value='/kindeditor/uploadPic.html'/>",  // 上传文件的路径
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
						$("#patentImgUrl").append("<input type='hidden' id='patentUrl' name='attachmentUrl' value='"+Jresponse["url"]+"'/>");
						savePatentImgUrl();
						$("#patentImgUrl").empty();
						$('#piciLlus2').val("请填写附图说明，例如”图1为本发明实施例XX的方法流程示意图”。").css('color', '#999');
					    $('#picMarkiLlus2').val("请填写附图标记说明，例如“1杯子主体，2杯子把手”。").css('color', '#999');
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

<body style="background-color: #FFF" id="dlstCircleArticle" onload="loadingTemplate(1);searGuide(this)">
<style>
.model1:hover .button{display:block}
</style>	
	
		<div id="mincontent" style="min-height: 581px;">
	        
	        
	    <input id="hiduserid" type="hidden" value="UC1706F442C97E4C58977D24E340EBF66">
	    <div class="body">
	        <div class="left" style="height: 700px;">
				<!--申请文件九部分标签切换 -->
				<div class="tab" id="tabWrap"> 
					<div class="tab1" value="0" name="tabs" onclick="tabChange(0);">说明书</div>
					<div class="tab1h" value="1" name="tabs" onclick="tabChange(1);">
						说明书附图</div>
					<div class="tab1h" value="2" name="tabs" onclick="tabChange(2,true,false);">
						权利要求</div>
					<div class="tab1h" value="3" name="tabs" onclick="tabChange(3);">
						摘要</div>
					<div class="tab1h" value="4" name="tabs" onclick="tabChange(4);">
						摘要附图</div>
					<div class="tab1h" value="5" name="tabs" onclick="tabChange(5);">
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
	                        <a href="<s:url value='/editor/patentDocList.html'/>" >返回撰写列表</a>
	                         <a href="javascript:return void" onclick="savePatentDoc(${patentDoc.patentDocId});">
								<button class="button button-primary  button-rounded"  data-placement="bottom" >保存</button>
							 </a>
	                    </div>
	                    <div class="top_right">
	                        <div class="review" onclick="preview_selfwrite();">
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
						<div class="content" id="content0">
							<div class="title">
								专利名称
								<div style="margin-left: 33px;">
									<input class="selectPointOfInterest form-control"  style="width:600px;display:inline;" type="text" id="patentName" name="patentName" placeholder="请输入专利名称"  value="${patentDoc.name}">
								</div>
							</div>
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
						<div class="content" id="content5" thisid="2514" style="display: none;">
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
										<a href="<s:url value='/editor/getPatentDocAttachmentFile.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>" >
										<button style="margin-left:5px;" type="button" class="t-btn2 button button-caution button-rounded" >下载附件</button>
										</a>
				                    </c:if>
									</form> 
									<div style="height:10px;">&nbsp;</div> 
									<span style="color:#666;">友情提示：将所需的附件一次性打包成压缩文件格式上传(zip,rar等)，不建议上传其他格式的文件!
									</span>
								</div>
							</div>
						</div>
						
						<!--请求协议书div  -->
						<div class="content" id="content6" thisid="2514" style="display: none;">
							
							<div class="title">
								请求书
							</div>
							<div class="cl">
								<div>
									<table>
									<tr>
									<td>
									申请人:<input class="t-input form-control" type="text" name="proposer" placeholder="在已有申请人中搜索" style="width: 200px" onblur="loadProposer()"/> 
									</td>
									<td>
									<button class="button button-caution button-rounded" type="button">新增</button>
									</td>
									</tr>
									<tr>
									<td>
									发明人：<input class="t-input form-control" type="text" name="inventor" id="inventor" placeholder="在已有发明人中搜索" style="width: 200px" onblur="loadInventor()"/>
									</td>
									<td>
									<button class="button button-caution button-rounded" type="button">新增</button><br/>
									</td>
									</tr>
									<tr>
									<td>
									联系人：<input class="t-input form-control" type="text" name="contacts" placeholder="在已有联系人中搜索" style="width: 200px"/>
									</td>
									<td>
									<button class="button button-caution button-rounded" type="button">新增</button>
									</td>
									</tr>
									</table>
								</div>
							</div>
						</div>
						<input id="hideditor3id" type="hidden" autocomplete="off">
						<input id="hidtempid" type="hidden">
						<input id="hidtooltip" type="hidden">
											
						<!-- 摘要 -->
						<div class="content" id="content3" thisid="" style="display: none;">
							
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
							<div id="error_content7" style="margin-left: -50px; float: left; color: Red; text-align: right;" class="textarea"> 还可以输入300字
							</div>
						</div>
	<script type="text/plain" id="myEditor7_tools" style="display: none; width: 800px;
	    height: 240px;">
 
	</script>
	
	                    
						<!-- 权利要求及要素表 -->
						<div class="content" id="content2" style="display: none; overflow: hidden;">
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
						<div class="content" id="content1" style="display: none;">
							<div class="box" id="content5-1">
								<div class="upimg1" onclick="addPic();">
									新增附图</div>
								<div class="picBox">
									<ul class="picL" id="picLsy2" >
										
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
									<font size="3" font_family="Microsoft YaHei" color="black">附图说明:</font>
									<input id="piciLlus2" name="caption" type="text" onfocus="piciLlusFc(this);" onblur="piciLlusBl(this);" style="color: #999" value="" autocomplete="off" required>
									<p>
									<font size="3" font_family="Microsoft YaHei" color="black">附图标记:</font>
									</p>
									<input id="picMarkiLlus2" name="label" type="text" onfocus="picMarkiLlusFc(this);" onblur="picMarkiLlusBl(this);" style="color: #999" value="" autocomplete="off" required>
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
						<div class="content" id="content4" style="display: none;">
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
	        
	<!--导出申请文件 -->
	<style> 
	    /*进度条样式*/ 
	   h1{font-size:15px;} 
	.wrap{ 
	    font-size: 12px; 
	    clear:both;
	    margin:0 auto 0; 
	    overflow:auto;
	    width:200px;
	     padding-top:20px;
	} 
	
	.progressbar_1{ 
	    background-color:#eee; 
	    height:16px; 
	    width:150px; 
	    border:1px solid #bbb; 
	    color:#222; 
	} 
	.progressbar_1 .bar { 
	    background-color:#6CAF00; 
	    height:16px; 
	    width:0; 
	}
	
	 #div_float_show
	{
	    background-color: #acacac;
	    display: none;
	    left: 0;
	    filter: alpha(opacity=60);  
	    -moz-opacity: 0.6; 
	    opacity: 0.6;
	    position: absolute;
	    top: 0;
	    z-index: 3;
	} 
	</style>
	<input type="hidden" name="name" value="" id="patentIdHid">
	</div>
	</div>
	
	    </div>
	    <div id="getPA">
	    </div>
	
	    </div>
	    
	    
	     <script type="text/javascript">
			function submitForm(){
				$.ajax({
					type: "POST",
					url: "<s:url value='/editor/addEditorText.html'/>",
					data: {"editorContent":editor1.html()},
					success: function(data){
						if(data){
							alert(data)
							$("textarea[name=editorContent]").val("");
							editor1.html("");
							
						}
					},
					error: function(){
						alert("操作失败");
					}
				});
			};
			function alertText(){
				var x=$("#editorContent").val();
				alert(x);
				KindEditor.appendHtml('#editorContent1', x);
				
			};
			
			function findPatentDoc(patentDocId){
				
				var url = "<c:url value='/editor/findPatentDoc.html'/>?patentDocId="+patentDocId;
				location.href=url;
				
				
			};
			


	</script>
	<script type="text/javascript">
	var p=1;
	$('input[id=patentFile]').change(function() {  
		$('#filename').val($(this).val());  
	});
	function savePatentImgUrl() {
		if ($("#patentUrl").length > 0) {
			var caption = $("#piciLlus2").val();
			var label = $("#picMarkiLlus2").val();
			var attachmentUrl = $("#patentUrl").val();
			var patentDocId=$("#patentDocId").val();
			$.ajax({
				type : "POST",
				url : "<s:url value='/editor/savePatentImgUrl.html'/>",
				data : {
					"caption" : caption,
					"label" : label,
					"attachmentUrl" : attachmentUrl,
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
	function loadingTemplate(sectionId){
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
						 "<div class='title'>模板"+(i+1)+":"+item.templateTitle+"</div>"+
						 	 "<div class='content' style='height:105px;overflow-y:hidden;'>"+
				 				"<p class='small'>"+
									"<span>"+item.patentDocSectionType.patentDocSectionDesc+"：</span><span>"+item.content+"</span>"+
								"</p>"+
							"</p>"+
						    "<div class='button' style='z-index:500000;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
						  "</div>"+
					   "</div>");
					 $("#modelWrap span").css("color","black");
				 	 $("#hiddenmodel").append("<p id='templateContent"+i+"'>"+item.content+"</p>");
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
									"<span>"+item.patentDocSectionType.patentDocSectionDesc+"：</span><span>"+item.content+"</span>"+
								"</p>"+
							"</p>"+
						    "<div class='button' style='z-index:500000;' onclick='templatebuttonclick("+i+","+item.patentDocSectionType.patentDocSectionId+")'>+使用模板</div>"+
						  "</div>"+
					   "</div>");
					 $("#modelWrap span").css("color","black");
				 	 $("#hiddenmodel").append("<p id='templateContent"+i+"'>"+item.content+"</p>");
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
function savePatentDoc(value){
	var name=$("#patentName").val();
	var manual=$("#editorContent").val();
	var abstractDescription=$("#editorContent7").val();
	var rightClaim=$("#editorContent8").val();
	$.ajax({
		type: "POST",
		url: "<s:url value='/editor/savePatentDoc.html'/>",
		data: {"name":name,"manual":manual,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocId":value},
		success: function(data){
			alert("操作成功");
		},
		error: function(){
			alert("操作失败");
		}
	});
};

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
									"<a href='javascript:delectImg("+item.attachmentId+")'>"+
									"<img src='"+httpImgUrl+"' alt='' width='200' height='150'/>"+
									"</a>"+
									"<div class='text'>"+
										"<b>"+item.caption+"</b>"+
										"<p><a href='javascript:delectImg("+item.attachmentId+")'>删除图片</a></p>"+
									"</div>"
								+"</li>"
						);
						 
					 });
					hoverImg2();
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
	</script>
</body>
</html>