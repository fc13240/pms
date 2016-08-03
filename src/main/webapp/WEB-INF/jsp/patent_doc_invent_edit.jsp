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
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  	<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
	<meta http-equiv="X-UA-Compatible" content="IE=9" />
	<meta http-equiv="X-Frame-Options" content="SAMEORIGIN">  
	<title>测试页面</title>
	<!-- 编辑器控件 -->
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/simple/simple.css" />
	<link rel="stylesheet" href="${base }/plugins/kindeditor/plugins/code/prettify.css" />
	<link href="${base }/static/css/edit_instruct.css?v=2.3.20150415" type="text/css" rel="stylesheet" />
	<script src="${base }/static/js/tab_change.js" type="text/javascript"></script>   <!--tabChange-->
	<c:import url="common/kindEditor.jsp"></c:import>
	 <script src="${base }/plugins/kindeditor/js-selfwrite.js" type="text/javascript"></script>
	<script src="${base }/plugins/kindeditor/selfwritefigure.js" type="text/javascript"></script>   <!--uploadImg-->
	<script src="${base }/plugins/kindeditor/selfwritefigure2.js" type="text/javascript"></script>   <!--uploadImg-->
	<script src="${base }/plugins/kindeditor/selfwritefigure2.js" type="text/javascript"></script>   <!--uploadImg--> 
	<link rel="stylesheet" href="${base }/temp/zyupload/skins/zyupload-1.0.0.css " type="text/css">
	<script type="text/javascript" src="${base }/temp/zyupload/zyupload.basic-1.0.0.js"></script>
	<script type="text/javascript" src="${base }/temp/zyupload/jquery.easing.min.js"></script>
	<link type="text/css" rel="stylesheet" media="screen" href="${base }/temp/zyupload/style.css" />
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
					fileType         :   ["jpg","png","js","exe"],// 上传文件的类型
					fileSize         :   51200000,                // 上传文件的大小
					multiple         :   false,                    // 是否可以多个文件上传
					dragDrop         :   false,                   // 是否可以拖动上传文件
					tailor           :   false,                   // 是否可以裁剪图片
					del              :   true,                    // 是否可以删除文件
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
						console.info("此文件上传成功：");
						console.info(file.name);
						console.info("此文件上传到服务器地址：");
						console.info(response);
						$("#uploadInf").append("<p>上传成功，文件地址是：" + Jresponse["url"] + "</p>");
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
				
			});
		
		</script> 
</head>

<body style="background-color: #FFF" id="dlstCircleArticle">
<style>
.model1:hover .button{display:block}
</style>	
		
		<div id="mincontent" style="min-height: 581px;">
	        
	        
	    <input id="hiduserid" type="hidden" value="UC1706F442C97E4C58977D24E340EBF66">
	    <div class="body">
	        <div class="left" style="height: 700px;">
				<!--申请文件九部分标签切换 -->
				<div class="tab" id="tabWrap"> 
					<div class="tab1" value="0" name="tabs" onclick="tabChange(0);">发明名称</div>
					<div class="tab1h" value="1" name="tabs" onclick="tabChange(1);">
						技术领域</div>
					<div class="tab1h" value="2" name="tabs" onclick="tabChange(2);">
						背景技术</div>
					<div class="tab1h" value="3" name="tabs" onclick="tabChange(3);">
						发明内容</div>
					<div class="tab1h" value="4" name="tabs" onclick="tabChange(4);">
						具体实施方式</div>
					<div class="tab1h" value="5" name="tabs" onclick="tabChange(5);">
						附图及说明</div>
					<div class="tab1h" value="6" name="tabs" onclick="tabChange(6,true,false);">
						权利要求</div>
					<div class="tab1h" value="7" name="tabs" onclick="tabChange(7);">
						摘要</div>
					<div class="tab1h" value="8" name="tabs" onclick="tabChange(8);">
						摘要附图</div>
				</div>
	
	        </div>
	        <div class="right">
	            <div class="center" style="overflow: hidden; height: 642px; width: 75%;">
	                <!--center-top start -->
	                <div class="center_top">
	                    <div class="backedit">
	                        <a href="<s:url value='/editor/PatentDocList.html'/>" >返回撰写列表</a></div>
	                    <div class="save" onclick="savePatentDoc();">
	                        <i class="icon"></i>
	                        <div class="span">保存</div>
	                    </div>
	                    <div class="export" onclick="export_selfwrite();" id="export_selfwrite">
	                        <i class="icon"></i>导出文件
	                    </div>
	                    
	                    <div class="top_right">
	                        <div class="review" onclick="preview_selfwrite();">
	                            <i class="icon"></i>预览
	                        </div>
	                        <div class="usehelp" onclick="helperv1('1');" style="margin-left: 20px">
	                            <i class="icon"></i>使用帮助
	                        </div>
	                        
	                    </div>
	                </div>
	                <div id="overflowcenter" style="overflow-y: auto; overflow-x: hidden;height:610px; width: 1060px;">
	                    <!-- center-top end-->
	                    <!-- 撰写小贴士start-->
	                    
						<!--撰写小贴士 -->
						<input id="whichTip" type="hidden" name="name" value="2">
						<input id="tipIdHid" type="hidden" name="name" value="1223">
						
						<div id="tipsList" style="border-top: #0085d0 1px solid; z-index: 6000000;">
							<div class="Writing_tips tip0" name="tips" style="display: block;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									专利名称就是根据要申请专利的技术内容给专利起个名字，模板库中已经涵盖了所有的专利名称模板，都是经过专家审核过的，直接选择一个套用就可以了哦。
								</p>
							</div>
							<div class="Writing_tips tip1" name="tips" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									这里指专利要求保护的技术所属或者直接应用的具体技术领域，这部分文字并不多^_^，选个模板填写你的内容吧。
								</p>
							</div>
							<div class="Writing_tips tip2" name="tips" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									不能光顾着写要申请的专利技术，总要告诉审查员们，你为什么要申请这件专利吧？这里只要讲一下目前的现有技术即可，如果能引用一篇或几篇相关专利或文献，结合分析，就能让大审们对你更有好感了。当然了，撰写仍有模板辅助，这件事瞬间就简单了，快去看看专业人员怎么写的吧。
								</p>
							</div>
							<div id="farmingS" class="Writing_tips tip3" name="tips" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									1)要解决的技术问题</p>
								<p>
									针对现有技术存在的问题，结合您的技术所能取得的效果，说说您的技术要解决的技术问题，简单说一下要解决的问题就可以了，不用说效果。一般别人都是写一小段，写多了审查人员也不介意，不过还是先看看模板吧，毕竟专利的表述是采用法律文书...<i class="cancelh" onclick="doLong('farming');">展开</i>
								</p>
							</div>
							<div class="Writing_tipsh tip4" name="tips_2" id="farmingL" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									1)要解决的技术问题</p>
								<p>
									针对现有技术存在的问题，结合您的技术所能取得的效果，说说您的技术要解决的技术问题，简单说一下要解决的问题就可以了，不用说效果。一般别人都是写一小段，写多了审查人员也不介意，不过还是先看看模板吧，毕竟专利的表述是采用法律文书的形式，套路都比较固定了。
								</p>
								<p>
									2)技术方案</p>
								<p>
									这部分内容看似不少，其实就是权利要求部分的内容，建议先看看模板吧，看完之后就会发现原来是对权利要求的进一步描述。写好权利要求这部分就解决了，还没写的还不快去写，一部分可是当两部分用啊。</p>
								<p>
									3)有益效果</p>
								<p>
									即由您申请专利的技术特征直接带来的，或者是由这些技术特征必然产生的效果。通常可以通过对申请专利的技术的结构特点与理论分析的结合而得出，或通过列出实验数据的方式予以说明。无论哪种方式都应通过与现有技术的比较而得出。</p>
								<p>
									4)发明内容部分所述的技术方案与权利要求所限定的相应技术方案的表述一致。 <i class="cancelhh" onclick="doShort('farming');">
										收起</i></p>
							</div>
							<div class="Writing_tips tip5" name="tips" style="display: none;">
							
								<p>
									<span>撰写指南</span>
									
								</p>
								<p>
									此部分应当详细、具体地描述实现发明或实用新型的优选方式，在适当情况下举例说明，有需要的话可以结合附图说明。每一条独立权利要求需要给出一个最佳实施方式或具体实施方式。此外从属权利要求的优先方案也应当在这一部分的具体实施方式中体现。
									具体实施方式部分所述的技术方案用于清楚、完整地说明权利要求所限定的相应技术方案。
								</p>
								
							</div>
							<div id="futushuomingS" class="Writing_tips tip6" name="tips" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									图1是燃煤锅炉节能装置的主视图；</p>
								<p>
									图2是图1所示节能装置的侧视图；</p>
								<p>
									图3是图2中的A向视图；<i class="cancelh" onclick="doLong('futushuoming');">展开</i></p>
							</div>
							<div id="futushuomingL" class="Writing_tipsh tip7" name="tips_2" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									图1是燃煤锅炉节能装置的主视图；</p>
								<p>
									图2是图1所示节能装置的侧视图；</p>
								<p>
									图3是图2中的A向视图；</p>
								<p>
									图4是沿图1中B-B线的剖视图；</p>
								<p>
									图5是示意性地显示制备石墨烯片的方法的示例性图；</p>
								<p>
									针对视图作简要说明即可，每一幅附图都要有附图说明，在零部件较多的情况下允许用列表的方式列出附图中具体零部件的名称。实用新型专利至少应当有一幅附图。<i class="cancelhh" onclick="doShort('futushuoming');">收起</i></p>
							</div>
							<div id="quanliS" class="Writing_tips tip8" name="tips" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									1)要解决的技术问题</p>
								<p>
									权利要求包括独立权利要求和从属权利要求，每一项权利要求都是一个独立的保护范围，从属权利要求是对独立权利要求技术内容的进一步限定，审查人员先审独立权利要求，如果独立权利要求具备授予专利权的条件，从属权利要求就不用审了...<i class="cancelh" onclick="doLong('quanli');">展开</i>
								</p>
							</div>
							<div id="quanliL" class="Writing_tipsh tip9" name="tips_2" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									1)要解决的技术问题</p>
								<p>
									权利要求包括独立权利要求和从属权利要求，每一项权利要求都是一个独立的保护范围，从属权利要求是对独立权利要求技术内容的进一步限定，审查人员先审独立权利要求，如果独立权利要求具备授予专利权的条件，从属权利要求就不用审了，如果独立权利要求不具备条件，由于从属权利要求又对独立权利要求的技术方案做了限定，这时从属权利要求就有作用了。
								</p>
								<p>
									2)独立权利要求
								</p>
								<p>
									①权利要求是提炼描述技术内容的主要特征，以后只要有这些特征的发明就都属于您的权利范围了。
								</p>
								<p>
									②技术特征其实就是您的技术新在哪里，要是审查人员发现别人已经申请过了，那就不能给您授权咯。
								</p>
								<p>
									③独立权利要求的表述分为前序部分和特征部分，不懂不要担心，权利要求的语句结构特别固定，模板库中已经为您准备了丰富的模板，马上参考改写吧。
								</p>
								<p>
									④对于产品的技术特征，主要指组合和连接关系，对于方法类的技术特征主要指流程步骤，都有讲解请参考模板，特征越少保护的范围越大，不要太啰嗦哦。
								</p>
								<p>
									⑤特征部分要求体现申请专利的技术的创新性点，没有创新怎么能作为技术特征呢？
								</p>
								<p>
									3)从属权利要求
								</p>
								<p>
									①从属权利要求的内容包括引用部分和限定部分，从属权利要求的语句结构更加简单，模板库中已经为您列出了从属权利要求的表述公式，马上参考改写吧。
								</p>
								<p>
									②可是为什么要从属权利要求呢？因为独立权利要求保护的范围较广，审查人员要是觉着您的独立权利要求描述的技术方案不新怎么办，所以要有从属权利要求，但是莫担心，从属权利要求的存在不会影响独立权利要求保护范围的。
								</p>
								<p>
									③那为什么会分成引用部分和限定部分呢，既然从属权利要求是对技术特征的进一步限定，那就要包含被引用的权利要求的所有特征了，这样引用就可以了，总不要再重新写一遍吧（*&gt;.&lt;*），限定部分就不一样了，它是对在前的权利要求中的技术特征进行限定。
								</p>
								<p>
									④从属权利要求写起来特别简单，快快去看看模板吧。
								</p>
								<p>
									4)权利要求所限定的相应技术方案与（说明书中）发明内容部分所述的技术方案的表述一致； 权利要求所限定的相应技术方案对（说明书中）具体实施方式部分所述的技术方案做清楚、简要地限定。
									<i class="cancelhh" onclick="doShort('quanli');">收起</i>
								</p>
							</div>
							<div class="Writing_tips" name="tips tip10" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									要文字部分应当写明发明或实用新型的名称和所属技术领域、所要解决的技术问题、 解决该问题的技术方案的要点以及主要用途。摘要的重点放到技术方案的要点上，将发明或实用新型的最本质内容公开出来。摘要文字部分出现的附图标记应当加上括号。摘要简明扼要，全部文字部分
									(包括标点符号)不得超过300个字。
								</p>
							</div>
							<div class="Writing_tips" name="tips tip11" style="display: none;">
								<p>
									<span>撰写指南</span>
								</p>
								<p>
									对于说明书中有附图的申请案，应当指定并提供一幅最能说明技术方案要点的附图。
								</p>
							</div>
						</div>
	
	                    <!-- 撰写小贴士 end-->
	                    <!-- content start-->
	                    
						<!-- 编辑区 ：发明名称/技术领域/背景技术/发明内容/具体实施方式-->
						<div class="content" id="content0">
							<div class="title">
								发明名称
							</div>
							<div class="cl">
								<div id="editor0" thistempid="1">
									<div class="instru">
										<div class="title2">
											注意套用模板时专利名称不得超过25个字，化学领域的某些申请允许最多到40个字，这个规定可要注意哦。<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。</div>
									</div>
									<div id="divtitle" style="clear:both;display:block;float:left;width:80%;"></div>
									<input type="hidden" value="" id="divtitletips">
									<div class="textarea" name="tooltip">
										    <div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;" >
									                    	<textarea rows="3" cols="10" id="editorContent" name="name" class="editorContent" style="width:520px;height:200px;visibility:hidden;">
									                    	${patent.name }
									                    	</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
									</div>
								</div>
							</div>
							<div id="error_content0" style="margin-left: -50px; float: left; color: Red; text-align: right;" class="textarea">
								您当前输入了 <span class="word_count2">0</span>个文字。<br> 
								<span class="word_surplus"></span>
							</div>
						</div>
						<div class="content" id="content1" style="display: none;">
							<div class="title">
								技术领域
							</div>
							<div class="cl">
								<div id="editor1" thisid="2124" thistempid="0">
									<div class="instru">
										<div class="title2">蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip">
										    <div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;">
									                    	<textarea rows="3" cols="10" id="editorContent1" name="techDomain" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.techDomain }</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content2" style="display: none;">
							<div class="title">
								背景技术
							</div>
							<div class="cl">
								<div id="editor2" thisid="2293" thistempid="0">
									<div class="instru">
										<div class="title2">
											引证文件应当是公开出版物，可以是专利文件，也可以是非专利文件，例如期刊、杂志、手册和书籍等。<br>
											引证专利文件的，至少要写明专利文件的国别、公开号；<br>
											引证非专利文件的，要写明这些文件的标题和详细出处，必要时给出译文并将译文放置在括号中。<br>
											引用专利：美国专利US 3676315号；<br>
											引用论文格式：Niyogi 等，“Solution Properties of Graphite and Graphene”， Nature，2006，128，7720<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip">
										<div class="wraper">
								            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
								            	<tr>
								                    <td style="width:520px;" >
								                    	<textarea rows="3" cols="10" id="editorContent2" name="backgoundTech" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.backgoundTech }</textarea>
								                    </td>
								            	</tr>
								            </table>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content3" style="display: none;">
							<div class="title">
								发明内容
							</div>
							<div class="cl">
								<div id="editor3" thisid="5632" thistempid="0">
									<div class="instru">
										<div class="title2">
											针对现有技术存在的问题，结合您的技术所能取得的效果，说说您的技术要解决的技术问题，简单说一下要解决的问题就可以了，不用说效果。<br>
											一般别人都是写一小段，写多了审查人员也不介意，不过还是先看看模板吧，毕竟专利的表述是采用法律文书的形式，套路都比较固定了。<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip">
											<div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;" >
									                    	<textarea rows="3" cols="10" id="editorContent3" name="contentProblem"  class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.contentProblem }</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
									</div>
								</div>
								<div id="editor3_1" thisid="5633" thistempid="0">
									<div class="instru">
										<div class="title2">
											这部分内容看似不少，其实就是权利要求部分的内容，建议先看看模板吧，看完之后就会发现原来是对权利要求的进一步描述。<br>
											写好权利要求这部分就解决了，还没写的还不快去写，一部分可是当两部分用啊。<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip">
										<div class="wraper">
								            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
								            	<tr>
								                    <td style="width:520px;">
								                    	<textarea rows="3" cols="10" id="editorContent4" name="contentRight" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.contentRight }</textarea>
								                    </td>
								            	</tr>
								            </table>
										   </div>
									</div>
								</div>
								<div id="editor3_2" thisid="5634" thistempid="0">
									<div class="instru">
										<div class="title2">
											即由您申请专利的技术特征直接带来的，或者是由这些技术特征必然产生的效果。<br>
											通常可以通过对申请专利的技术的结构特点与理论分析的结合而得出，或通过列出实验数据的方式予以说明。<br>
											无论哪种方式都应通过与现有技术的比较而得出。<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip">
											<div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;">
									                    	<textarea rows="3" cols="10" id="editorContent5" name="contentEffect" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.contentEffect }</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<div class="content" id="content4" style="display: none;overflow: auto;" >
							<div class="title">
								具体实施方式
							</div>
							<div class="cl">
								<div id="editor4" thisid="2514" thistempid="0">
									<div class="instru">
										<div class="title2">
											详细说明解决技术问题所采用的技术方案，并应当对权利要求的技术特征给予详细说明，以支持权利要求。<br>
											有附图的应当对照附图进行说明。<br>
											实施例是对具体实施方式的举例说明。<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip">
											<div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;" >
									                    	<textarea rows="3" cols="10" id="editorContent6" name="implementWay" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.implementWay }</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
									</div>
								</div>
							</div>
						</div>
						<input id="hideditor3id" type="hidden" autocomplete="off">
						<input id="hidtempid" type="hidden">
						<input id="hidtooltip" type="hidden">
											
						<!-- 摘要 -->
						<div class="content" id="content7" thisid="" style="display: none;">
							
							<div class="title">
								摘要
							</div>
							<div class="cl">
								<div id="editor7" thisid="" thistempid="" photo_fid="">
									<div class="upimg1" onclick="autoabstract();" style=" margin-left:50px">
										自动生成摘要</div>
									<div class="instru">
										<div class="title2">蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
										</div>
									</div>
									<div class="textarea" name="tooltip"> 
										<div class="wraper">
								            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
								            	<tr>
								                    <td style="width:520px;">
								                    	<textarea rows="3" cols="10" id="editorContent7" name="abstractDescription" class="editorContent" style="width:520px;height:200px;visibility:hidden;" >${patent.abstractDescription }</textarea>
								                    </td>
								            	</tr>
								            </table>
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
						<div class="content" id="content6" style="display: none; overflow: hidden;">
							<div name="claims" style="float: left; width: 98%">
								<div class="title">
									权利要求书
								</div>
								<div class="cl">
									<div id="editor6" thistempid="" thisid="">
										<div class="instru">
											<div class="title1">
												权利要求1</div>
											<div class="title2">
												独立权利要求：<br>
												①一项权利要求中有且只能有一个句号，且句号放在结尾，请参考模板格式。<br>
												②权利要求中可以有化学式或者数学式，必要时也可以有表格，但不得有插图。<br>
												③不要使用“如说明书……部分所述” 或者“如图……所示”的用语。<br>
												④一件专利申请应当至少有一项独立权利要求，如果有多个独立权利要求，那么他们描述的技术方案之间要包含一个或多个相同的或相应的特定技术特征，及属于一个总的发明构思，毕竟您只交一件专利申请的费用，怎么能要求国知局保护您的多个发明构思呢。<br>蓝色标记文字为撰写提示，例如<span class="title2span1">（产品类型的名称）</span>；草绿色标记文字为参考示例，例如<span class="title2span2">[碳石墨环轴密封结构]</span>。
											</div>
										</div>
										<div id="divclaim" style="clear:both;display:block;float:left;width:80%;"></div>
										<input type="hidden" value="" id="divclaimtips">
										<div class="textarea" name="tooltip">
											<div class="wraper">
									            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
									            	<tr>
									                    <td style="width:520px;">
									                    	<textarea rows="3" cols="10" id="editorContent8" name="rightClaim" class="editorContent"style="width:520px;height:200px;visibility:hidden;" >${patent.rightClaim }</textarea>
									                    </td>
									            	</tr>
									            </table>
										   </div>
										</div>
									</div>
								</div>
							</div>
							<div name="claims_ele" class="power_right" style="float: right; margin-top: 10px; width: 98%; display: none;">
							</div>
							<div style="clear: both; height: 260px;">
								<div class="upimg1" onclick="addnewclaim();" style=" margin-left:40px">
									+添加权利要求</div>
								<div class="upimg1" onclick="showclaimelement();">
									添加发明要素表</div>
								<div class="upimg1" onclick="showhelper(1);" id="noele">
									看看别人怎么写</div>
								<div class="upimg1" onclick="showhelper(3);" id="hasele" style="display: none;">
									看看别人怎么写</div>
							</div>
						</div>
						<div class="content" id="content6_ele" style="display: none; box-shadow: rgb(238, 238, 238) 2px 2px 2px inset; -webkit-box-shadow: rgb(238, 238, 238) 2px 2px 2px inset;">
							<div class="box" style="padding-top: 0">
								<div class="upimg1" onclick="returnclaims();">
									返回权利要求</div>
								<div class="power">
									<table id="content6_ele_table" width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td width="4%" align="left" class="tr1" style="min-width: 40px;">
												编号
											</td>
											<td width="18%" align="left" class="tr1">
												要素名称
											</td>
											<td width="40%" align="left" class="tr1">
												要素描述（组成部件、连接关系、方法流程、操作条件）
											</td>
											<td width="30%" align="left" class="tr1">
												要素限定（材料、形状）
											</td>
											<td width="8%" align="left" class="tr1">
												要素关系
											</td>
										</tr>
									</tbody></table>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tbody><tr>
											<td width="4%" valign="middle" class="td" style="min-width: 40px;">
												如：
											</td>
											<td width="18%" valign="middle" class="td">
												手写笔
											</td>
											<td width="40%" valign="middle" class="td">
												包括笔杆、书写头及弹性元件
											</td>
											<td width="30%" valign="middle" class="td">
												无
											</td>
											<td width="8%" valign="middle" class="td">
												无
											</td>
										</tr>
										<tr>
											<td valign="middle" class="instruct">
												说明：
											</td>
											<td valign="middle" class="instruct">
												该发明是手写笔
											</td>
											<td valign="middle" class="instruct">
												组成该发明手写笔的部件有：笔杆、书写头、弹性元件
											</td>
											<td valign="middle" class="instruct">
												针对该要素没有材料、形状等的限定
											</td>
											<td valign="middle" class="instruct">
												无要素关系
											</td>
										</tr>
									</tbody></table>
								</div>
								<div class="cl" style="padding-left: 20px;">
									<div class="upimg2" onclick="addnewclaimelement();">
										+添加要素</div>
									<div class="upimg3" onclick="showhelper(2);">
										看看别人怎么写</div>
									<div class="upimg3" onclick="showclaims();">
										添加到权利要求</div>
								</div>
							</div>
						</div>
	              
						<!-- 附图及说明 -->
						
						<!-- content start-->
						<input type="hidden" id="ft_hidSrc" value="">
						<input type="hidden" id="ft_hidFid" value="">
						<div class="content" id="content5" style="display: none;">
							
							<div class="box">
								<div class="upimg1" onclick="addPic();">
									新增附图</div>
								<div class="img_box" id="askPicList">
									
								</div>
							</div>
						</div>
						<!-- content end-->
						<!-- content start-->
						<div class="content" id="content5_build" style="display: none;">
							
							<div style="height: 20px">
							</div>
							<div id="piclist" class="title1" onclick="piclistShow();" style="padding-left: 40px; color:#444; font-size:14px; font-weight:bold;
								display: none; cursor: pointer">
								返回附图列表
							</div>
							 
							
							<div class="img_edit" id="origin">
								<div class="imgfl" id="picBianHao">
								</div>
								<div class="imgfr">
								 <form id="patentUrlFrom" name="patentUrlFrom"  method="post" enctype="multipart/form-data" class="form-horizontal">
								 	<input id="patentDocId" type="hidden" name="patentDocId" value="${patentDocId}">
									<input id="piciLlus2" name="caption" type="text" onfocus="piciLlusFc(this);" onblur="piciLlusBl(this);" style="color: #999" value="" autocomplete="off" required>
									<input id="picMarkiLlus2" name="label" type="text" onfocus="picMarkiLlusFc(this);" onblur="picMarkiLlusBl(this);" style="color: #999" value="" autocomplete="off" required>
									<div id=patentImgUrl style="display:none"><!-- 自动插入ImgUrl --></div>
									
								</form>
									<div id="zyupload" class="zyupload"></div>
								 	
								</div>
							</div>
						</div>
	
	                    
						<!-- 摘要附图 -->
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
						<div class="content" id="content8" style="display: none;">
							<div style="height: 80px">
							</div>
								<div class="upimg1" onclick="findAttachmentImg();" id="choseAbs" style="
									left: 280px; margin-top: 0;float:left;">
									从附图中选择</div>
							<div class="picBox">
								<ul class="picL" id="picLsy" >
									
								</ul>
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
	        <i class="icon"></i>撰写知识库
	        
	    </div>
	    <input type="hidden" id="hidmodelbutton" value="100060010000">
	    <div id="modelbutton" class="modelbutton" onclick="modelbuttonclick();" style="position: fixed; top: 230px; left: 1294.5px; display: none;">
	        +设为模板</div>
	    <div class="right_right_bot" tab_name="content0" style="height: 600px; overflow-x: hidden; overflow-y: auto;">
	        <div class="data_menu">
	            <div class="menud" id="modelS" onclick="searModel(this)">
	                模板库</div>
	
	        </div>
	
	        <div style="float: right; padding-right: 15px; display: block;" id="kbpage"><span id="templateSectionId" style="display:none;">1</span><a style="color:#ccc" href="javascript:upPage(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:downPage(2);">下一页</a></div>
	        <div class="model" style="overflow-x: hidden; overflow-y: auto;">
	            <div id="modelWrap" style="display: block;"></div>
				<div id="hiddenmodel" style="display: none;"></div>
	        </div>
	        
	        <div style="float: right; padding-right: 15px; padding-top: 5px; display: block;" id="kbpage2"><a style="color:#ccc" href="javascript:void(0);">上一页</a>&nbsp;&nbsp;<a style="color:#0085d0" href="javascript:showKindsDragModel(1,2,2);">下一页</a></div>
	        <div id="scBs" class="shousou" onclick="bigSmall(this);">
	        </div>
	        <input type="hidden" name="name" value="small" id="hidBorS">
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
	<div id="helperv1" style="display: none; left: 100px; top: 100px">
	    <div class="step1">
	        <img width="843" height="575" border="0" usemap="#Map" src="/skins/default/self/images/yindao_02.png">
	        <map name="Map">
	            <area href="javascript:void(0);" id="nextv1" coords="746,224,817,253" shape="rect">
	        </map>
	    </div>
	</div>
	<div id="helperv1_2" style="display: none;">
	    <div class="step2">
	        <img src="/skins/default/self/images/yindao_05.png" width="935" height="600" border="0" usemap="#Map2">
	        <map name="Map2">
	            <area shape="rect" id="nextv1_2" href="javascript:void(0);" coords="822,206,897,233">
	        </map>
	    </div>
	</div>
	<div id="helperv1_3" style="display: none;">
	    <div class="step4">
	        <img width="523" height="600" border="0" usemap="#Map4" src="/skins/default/self/images/yindao_16.png">
	        <map name="Map4">
	            <area id="nextv1_3" href="javascript:void(0);" coords="381,104,480,150" shape="rect">
	        </map>
	    </div>
	</div>
	<div id="helperv2" style="display: none;">
	    <div class="step3" style="display: none;">
	        <img alt="" src="/skins/default/self/images/yindao_24.png" width="616" height="600" border="0" usemap="#Map3">
	        <map name="Map3">
	            <area shape="rect" coords="502,332,571,373" id="nextv2" href="javascript:void(0);">
	        </map>
	        <div class="step3_top">
	            <div class="left_top" style="border: none">
	                <div class="cl">
	                    <div class="bth" onclick="setipcTypeByID(1,this);">
	                        发明</div>
	                    <div class="bth" style="margin-left: 10px;" onclick="setipcTypeByID(2,this);">
	                        实用新型</div>
	                </div>
	                <div class="left_help">
	                    <a href="javascript:void(0);" onclick="helperv6();">如何设置专利类型？</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div id="helperv7" style="display: none;">
	    <div class="step3">
	        <img alt="" src="/skins/default/self/images/yindao_24h.png" width="616" height="600" border="0" usemap="#Map3">
	        <div class="step3_top">
	            <div class="left_top" style="border: none">
	                <div class="cl">
	                    <div class="bth" onclick="setipcTypeByID(1,this);$('#nextv7').click();">
	                        发明</div>
	                    <div class="bth" style="margin-left: 10px;" onclick="setipcTypeByID(2,this);$('#nextv7').click();">
	                        实用新型</div>
	                </div>
	                <div class="left_help">
	                    <a href="javascript:void(0);" onclick="helperv6();">如何设置专利类型？</a>
	                    <input id="nextv7" type="button" style="display: none;">
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div id="helperv2_2" style="display: none;">
	    <div class="step5hh">
	        <div class="step5hhn" id="nextv2_2">
	        </div>
	        <div class="step5h" id="helper_templist" style="top:170px;">
	            <div class="step51" onclick="seltemp(1);">
	                备选模板1</div>
	            <div class="step51" onclick="seltemp(2);">
	                备选模板2</div>
	            <div class="step51" onclick="seltemp(3);">
	                备选模板3</div>
	        </div>
	    </div>
	    <input style="display: none;" id="nextv2_3" type="button" value="下一步">
	</div>
	<div id="helperv3" style="display: none;">
	    <div class="step3" style="display: none;">
	        <img alt="" src="/skins/default/self/images/yindao_24.png" width="616" height="600" border="0" usemap="#Map3">
	        <map name="Map3">
	            <area shape="rect" coords="502,332,571,373" id="nextv3" href="javascript:void(0);">
	        </map>
	        <div class="step3_top">
	            <div class="left_top" style="border: none">
	                <div class="cl">
	                    <div class="bth" style="cursor: inherit;">
	                        发明</div>
	                    <div class="bth" style="margin-left: 10px; cursor: inherit;">
	                        实用新型</div>
	                </div>
	                <div class="left_help">
	                    <a href="javascript:void(0);" style="cursor: inherit;">如何设置专利类型？</a>
	                </div>
	            </div>
	        </div>
	    </div>
	</div>
	<div id="helperv3_1" style="display: none;">
	    <div class="step5">
	        <div class="step5cl" id="nextv3_1">
	        </div>
	        <img width="502" height="161" src="/skins/default/self/images/yindao_09h.png">
	        <div class="step5h">
	            <div class="step52">
	                一种碳石墨环轴密封结构
	            </div>
	            <div class="step52">
	                治疗咳喘的中药组合物</div>
	            <div class="step52">
	                抓斗及其刮泥器</div>
	        </div>
	    </div>
	</div>
	<div id="helperv4" style="display: none;">
	    <div style="clear: both;">
	        新手上路</div>
	    <div style="clear: both;">
	        新手上路九个标签的帮助内容</div>
	    <div style="clear: both;">
	        <input type="checkbox" autocomplete="off" onchange="nohintv4();" id="nohintv4">不再提示</div>
	    <div style="clear: both;">
	        <input id="nextv4" type="button" value="跳过"></div>
	</div>
	<div id="helperv5" style="display: none;">
	    <div class="daochu_cl" style="height: 135px">
	        <div class="help_text" style="width: 270px; height: 150px">
	            专利撰写两步走：<br>
	            &nbsp;&nbsp;&nbsp;&nbsp;第一步，选择专利类型，<br>
	            &nbsp;&nbsp;&nbsp;&nbsp;第二步，选择撰写模板，<br>
	            &nbsp;&nbsp;&nbsp;&nbsp;接下来，开始撰写吧。
	        </div>
	    </div>
	    <div class="daochu_cancel1" style="clear: both; float: right">
	        <div class="daochu_cancel1" id="nextv5">
	            开始撰写
	        </div>
	    </div>
	</div>
	
	<div id="helperv6" style="display: none; position:relative">  
	        <div id="close_tc" class="step5_lb">
	        </div>
	       <div class="wrapper" style=" background:none;">   
	        <div class="v_out v_out_p">
	<div class="prev" style="opacity: 0.5;"><a href="javascript:void(0)"></a></div>
	<div class="v_show">
	
	<div class="v_cont">
	<ul>
	<li index="0"><img src="/self/usercontrol/lbt_01.png"></li>
	<li index="1"><img src="/self/usercontrol/lbt_04.png"></li>
	<li index="2"><img src="/self/usercontrol/lbt_06.png"></li>
	 
	</ul>
	</div>
	
	</div>
	
	<div class="next" style="opacity: 0.5;"><a href="javascript:void(0)"></a> </div>
	
	 
	</div>
	
		</div><!-- wrapper end -->
	         
	
	     
	</div>
	
	        
	<!--  创意描述 -->
	<div id="idealist" class="select" style="height: 300px; display:none;">
	    <div class="delete_top">
	        <div class="daochu_tit">
	            导入创意方案</div>
	        <div class="close" onclick="$('#idealistcancel').click();">
	        </div>
	    </div>
	    <div class="daochu_cl" style="height:180px;overflow-x:hidden;overflow-y:auto; ">
	        <div class="delete_text">
	            
	            
	        </div>
	    </div>
	    <div class="daochu_cancel">
	        <div class="daochu_cancel1" onclick="addschemebyid();">
	            确定
	        </div>
	        <div id="idealistcancel" class="daochu_cancel1h">
	            取消
	        </div>
	    </div>
	</div>
	<div class="select" id="ideanone" style="display:none;">
	    <div class="delete_top">
	        <div class="daochu_tit">
	            导入创意方案</div>
	        <div class="close" onclick="$('#ideanonecancel').click();">
	        </div>
	    </div>
	    <div class="daochu_cl">
	        <div class="delete_text">
	            您的创意暂时为空，无法导入<br>
	            <a href="http://idea.izhiliao.com.cn/Templete/TempleteList.aspx" target="_blank">马上去填创意方案</a>
	        </div>
	    </div>
	    <div class="daochu_cancel">
	        <div id="ideanonecancel" class="daochu_cancel1">
	            确定
	        </div>
	    </div>
	</div>
	
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
	
	
	
	<div id="exportFile" style="display:none">
	
	
	
	<div class="daochu" style="width:420px;margin-left:-155px;">
	<div class="daochu_top"><div class="daochu_tit">导出申请文件</div><div class="close" onclick="fileClose();"></div></div>
	<div class="daochu_cl">
	<div class="daochu_text">
	文件名：
	</div>
	<div class="daochu_input"><input id="name" name="" type="text" class="input">
	
	
	
	</div>
	</div> 
	<div class="daochu_cl1">
	<div class="daochu_clf">
	<div class="daochu_text1">
	设置字号
	</div>
	<div class="daochu_text2">
	<div class="daochu_type"><div id="wordsLess" value="1" class="active" onclick="fontMark1('wordsLess');">
	字数少
	</div>
	 四号字
	</div>
	<div class="daochu_type"><div id="wordsMore" value="2" class="daochu_type1" onclick="fontMark1('wordsMore');">
	字数多
	</div>
	 小四号字
	</div>
	</div>
	</div>
	<div class="daochu_clf">
	<div class="daochu_text1">
	设置字体
	</div>
	<div class="daochu_text2">
	<div class="daochu_typeh"><div id="song" value="3" class="active2" onclick="fontMark2('song');">
	宋体
	</div>
	</div>
	<div class="daochu_typeh"><div id="fsong" value="4" class="daochu_type1" onclick="fontMark2('fsong');">
	仿宋
	</div>
	</div>
	<div class="daochu_typeh"><div id="kaiti" value="5" class="daochu_type1" onclick="fontMark2('kaiti');">
	楷体
	</div>
	</div></div>
	</div>
	</div>
	<div class="daochu_cl1">  
	
	   <div class="wrap" id="process" style="display:none"> 
	        <div class="progressbar_1">
	            <div class="bar" id="bar">
	            </div>
	        </div> 
	    </div>
	    
	</div>
	 
	
	<div class="daochu_cancel">
	
	<div class="daochu_cancel1" onclick="fileExport();">
	导出
	</div> 
	<div class="daochu_cancel1h" id="closefile">
	取消
	</div>
	</div>
	
	</div>
	 
	</div>
	
	
	  <div id="div_float_show" style="position: absolute;  display: none;
	        width: 1000px">
	    </div> 
	
	<div id="tipSuc" style="display:none;margin:40px 160px;text-align:left;">  
	    <ul>
	        <li>文件已经成功导出。</li>
	        <li>成功存至：D:\Program Files</li>
	        <li>
	            <input type="button" name="name" value="打开文件夹" id="opnFile"></li>
	    </ul> 
	</div>
	<div id="tipFail" style="display:none;margin:40px 160px;text-align:left;">  
	    <div class="daochu_cl2">
	  <div class="delete_text">
	文件导出失败，请重试。
	
	</div>
	</div>
	<div class="daochu_cancel">
	  <div class="daochu_cancel1" id="again">
	重试
	</div>
	<div class="daochu_cancel1h" id="cancle">
	取消
	</div>
	</div> 
	</div>
	
	    </div>
	    <div id="getPA">
	    </div>
	
	    <div id="exportFile2" style="display: none">
	        <div class="daochu" style="width: 420px; margin-left: -155px; height: 260px;">
	            <div class="daochu_top">
	                <div class="daochu_tit">
	                    保存提示</div>
	                <div class="close" onclick="fileClose2();">
	                </div>
	            </div>
	            <div class="daochu_cl" style="text-align: center; font-weight: bold; font-size: 18px;
	                padding-top: 10px">
	                保存成功！
	            </div>
	            <div class="daochu_cl1">
	                <div class="daochu_clf">
	                    <div class="daochu_text1" style="width: 300px; font-weight: normal; line-height: 18px;
	                        font-size: 13px;">
	                        为了方便保管您的申请文件，建议保存之后导出申请文件到本地，同时提高您账户的安全等级设置。
	                    </div>
	                </div>
	            </div>
	            <div class="daochu_cancel" style="left: 20%; width: 230px;">
	                <div class="daochu_cancel1" onclick="export_inst();">
	                    立即导出
	                </div>
	                <div class="daochu_cancel1h" id="closefile2" style="float: right;">
	                    继续撰写
	                </div>
	            </div>
	        </div>
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
			
			function findPatentDoc(patentDocsId){
				
				var url = "<c:url value='/editor/findPatentDoc.html'/>?patentDocsId="+patentDocsId;
				location.href=url;
				
				
			};
			

			function savePatentDoc(){
				var patentDocId=$("#patentDocId").val();
				var patentType=${patentType};
				var name=editor.text();
				var techDomain=$("#editorContent1").val();
				var backgoundTech=$("#editorContent2").val();
				var contentProblem=$("#editorContent3").val();
				var contentRight=$("#editorContent4").val();
				var contentEffect=$("#editorContent5").val();
				var implementWay=$("#editorContent6").val();
				var abstractDescription=$("#editorContent7").val();
				var rightClaim=$("#editorContent8").val();
				$.ajax({
					type: "POST",
					url: "<s:url value='/editor/savePatentDoc.html'/>", 
					data: {"name":name,"patentType":patentType,"techDomain":techDomain,"backgoundTech":backgoundTech,"contentProblem":contentProblem,"contentRight":contentRight,
							"contentEffect":contentEffect,"implementWay":implementWay,"abstractDescription":abstractDescription,"rightClaim":rightClaim,"patentDocsId":patentDocId},
					success: function(data){
						alert("操作成功");
					},
					error: function(){
						alert("操作失败");
					}
				});
			}
	</script>
	<script type="text/javascript">
	var p=2;
	$('input[id=patentFile]').change(function() {  
		$('#filename').val($(this).val());  
	});
	


	 function loadingTemplate(sectionId){
		 
		 $("#templateSectionId").html(sectionId);
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTemplateList.html'/>?sectionId="+sectionId,
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
		 })
	 }


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
						alert("操作成功");

					},
					error : function() {
						alert("操作失败");
					}
			});
		}else{
			alert("请选择上传图片!");
		}
	}
	 function templatebuttonclick(i,patentDocSectionId){
		 if(patentDocSectionId==1){
			 editor.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==2){
			 editor1.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==3){
			 editor2.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==4){
			 editor3.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==5){
			 editor4.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==6){
			 editor5.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==7){
			 editor6.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==8){
			 editor7.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==9){
			 editor8.html($("#templateContent"+i).html());
		 }
		 else if(patentDocSectionId==10){
			 editor9.html($("#templateContent"+i).html());
		 }else{
			 
		 }
	}
	 
	 function downPage(currentPage){
		 var sectionId = $("#templateSectionId").html();
		 loading(sectionId,p);
		 p=++p;
		 
		 
	 }
	 function upPage(currentPage){
		 var sectionId = $("#templateSectionId").html();
		 p=--p;
		 loading(sectionId,p);
		 
		 
	 }
	 
 	function loading(sectionId,currentPage){
		 
		 $("#templateSectionId").html(sectionId);
		 $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/getTemplateListByPage.html'/>?sectionId="+sectionId+"&currentPage="+currentPage,
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
		 })
	 }
 	
	 function findAttachmentImg(){
		 var patentDocId=$("#patentDocId").val();
		 $.ajax({
				type : "POST",
				url : "<s:url value='/editor/getAttachmentById.html'/>",
				data : {"patentDocId":patentDocId
				},
					success: function(data){
						$("#picLsy").empty();
					var obj= $.parseJSON(data);
					$.each(obj,function(i,item){
						 $("#picLsy").append(
								 "<li id="+item.attachmentId+">"+
									"<a href='#'><img src='"+item.attachmentUrl+"' alt='' width='200' height='150'/></a>"+
									"<div class='text'>"+
										"<b>"+item.caption+"</b>"+
										"<p><a href='javascript:delectImg("+item.attachmentId+")'>删除图片</a></p>"+
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
</script>
<script type="text/javascript">
function hoverImg(){

	$("#picLsy li").hover(function(){
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
</script>
</body>
</html>