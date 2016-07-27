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
	<meta http-equiv="X-Frame-Options" content="SAMEORIGIN"> 
	<title>测试页面</title>
	<!-- 编辑器控件 -->
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/default/default.css" />
	<link rel="stylesheet" href="${base }/plugins/kindeditor/themes/simple/simple.css" />
	<link rel="stylesheet" href="${base }/plugins/kindeditor/plugins/code/prettify.css" />
	<link href="${base }/static/css/edit_instruct.css?v=2.3.20150415" type="text/css" rel="stylesheet" />
	<script src="${base }/static/js/tab_change.js" type="text/javascript"></script>   <!--tabChange-->
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
	            <div class="left_top">
	                <div class="cl" id="div_ipctype">
	                    <div class="bt" value="1" onclick="setipcType(1,this);">
	                        发明</div>
	                    <div class="bth" value="2" onclick="setipcType(2,this);" style="margin-left: 0px;">
	                        实用新型</div>
	                </div>
	                <div class="left_help">
	                    <a href="javascript:void(0);" onclick="helperv6();">专利模板类型选择</a>
	                </div>
	            </div>
	            
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
	                        <a href="selfwritelist.aspx" target="_blank">返回模板列表</a></div>
	                    <div class="save" onclick="save_selfwrite();">
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
	

						<!-- 编辑区 ：发明名称/技术领域/背景技术/发明内容/具体实施方式-->
						<div class="content" id="content0">
							<div class="title">
								发明名称
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
															<input type="text" id="inventIntroduce" style="width: 848px" class="form-control" placeholder="发明带名称"/>
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
						<div class="content" id="content1" style="display: none;">
							<div class="title">
								技术领域
							</div>
							<div class="cl">
								<div id="editor1" thisid="2124" thistempid="0">
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
								背景技术
							</div>
							<div class="cl">
								<div id="editor2" thisid="2293" thistempid="0">
									
									<div class="textarea" name="tooltip">
										<div class="wraper">
										        <form id="form2" name="form2" class="registerform" action="" onsubmit="return false;" method="post">
										        	<div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="backTech" style="width: 848px" class="form-control" placeholder="背景技术"/>
														</span>
													</div>
													<div style="height:20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent2" name="content" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(backTech,3,editor2,editorContent2);">提 交</button>
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
								发明内容
							</div>
							<div class="cl">
								<div id="editor3" thisid="5632" thistempid="0">
									<div class="textarea" name="tooltip">
											<div class="wraper">
												<span>发明内容-->存在问题</span> <br/>
										        <form id="form3" name="form3" class="registerform" action="" onsubmit="return false;" method="post">
										        <div class="title" style="margin-left: 0px;">
													<span>模板简述</span> <br/>
													<span >
														<input type="text" id="inventProblem" style="width: 848px" class="form-control" placeholder="发明问题简述"/>
													</span>
												</div>
												<div style="height: 20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent3" name="contentProblem"  class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(inventProblem,4,editor3,editorContent3);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
								<div id="editor3_1" thisid="5633" thistempid="0">
									<div class="textarea" name="tooltip">
										<div class="wraper">
											<span>发明内容-->发明权利要求</span> <br/>
										        <form id="form4" name="form4" class="registerform" action="" onsubmit="return false;" method="post">
											        <div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="inventClaim" style="width: 848px" class="form-control" placeholder="发明权利要求"/>
														</span>
													</div>
													<div style="hegiht: 20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent4" name="contentRight" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                       <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(inventClaim,5,editor4,editorContent4);">提 交</button>
										                    </td>
										                </tr>
										            </table>
										        </form>
										   </div>
									</div>
								</div>
								<div id="editor3_2" thisid="5634" thistempid="0">
									<div class="textarea" name="tooltip">
											<div class="wraper">
												<span>发明内容-->发明效果</span> <br/>
										        <form id="form5" name="form5" class="registerform" action="" onsubmit="return false;" method="post">
										            <div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="inventEffect" style="width: 848px" class="form-control" placeholder="发明带来的效果"/>
														</span>
													</div>
													<div style="hegiht: 20px;"></div>
										            <table width="100%" style="table-layout:fixed;padding-left: 10px;" border="0">
										            	<tr>
										                    <td style="width:520px;">
										                    	<textarea rows="3" cols="10" id="editorContent5" name="contentEffect" class="editorContent" style="width:520px;height:200px;visibility:hidden;" ></textarea>
										                    </td>
										            	</tr>
										                <tr>
										                    <td style="padding:10px 0 18px 0;">
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(inventEffect,6,editor5,editorContent5);">提 交</button>
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
								具体实施方式
							</div>
							<div class="cl">
								<div id="editor4" thisid="2514" thistempid="0">
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
											
						<!-- 摘要 -->
						<div class="content" id="content7" thisid="" style="display: none;">
							
							<div class="title">
								摘要
							</div>
							<div class="cl">
								<div id="editor7" thisid="" thistempid="" photo_fid="">
									<div class="textarea" name="tooltip"> 
										<div class="wraper">
										        <form id="form7" name="form7" class="registerform" action="" onsubmit="return false;" method="post">
										            <div class="title" style="margin-left: 0px;">
														<span>模板简述</span> <br/>
														<span >
															<input type="text" id="abstract" style="width: 848px" class="form-control" placeholder="摘要" />
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
										                    <td style="padding:10px 0 18px 0;">
										                         <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(abstract,9,editor7,editorContent7);">提 交</button>
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
						<div class="content" id="content6" style="display: none; overflow: hidden;">
							<div name="claims" style="float: left; width: 98%">
								<div class="title">
									权利要求书
								</div>
								<div class="cl">
									<div id="editor6" thistempid="" thisid="">
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
															<input type="text" id="rightClaim" style="width: 848px" class="form-control" placeholder="摘要" />
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
										                        <button type="button" class="btn btn-default" id="submit" onclick="addPatentTemplate(rightClaim,8,editor8,editorContent8);">提 交</button>
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
	    </div>
	    </div>
	    <script type="text/javascript">
			function addPatentTemplate(title,patentPatentDocSectionTypeId,editorValue,editorContent){
				var templateTitle = title.value;
				var content=editorValue.html();
				$.ajax({
					type : "POST",
					url : "<s:url value='/editor1/addPatentTemplate.html'/>",
					data : {"content":content,"templateTitle":templateTitle,"patentDocSectionType.patentDocSectionId":patentPatentDocSectionTypeId},
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
			function submitForm(){
				$.ajax({
					type: "POST",
					url: "<s:url value='/editor/addEditorText.html'/>",
					data: {"":editor1.html()},
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
			
			function findText(editorId){
				var url = "<c:url value='/editor/findTextById.html'/>?editorId="+editorId;
				location.href=url;
			};
			
			function inserTest(){
				var text=editor.text();
				KindEditor.insertHtml('#editorContent1', text);
			};
			function pop(){
					var text=editor.text();
					var dialog = KindEditor.dialog({
				        width : 500,
				        title : '测试窗口',
				        body : '<div style="margin:10px;"><strong>'+text+'</strong></div>',
				        closeBtn : {
				                name : '关闭',
				                click : function(e) {
				                        dialog.remove();
				                }
				        },
				        yesBtn : {
				                name : '确定',
				                click : function(e) {
				                        alert(this.value);
				                }
				        },
				        noBtn : {
				                name : '取消',
				                click : function(e) {
				                        dialog.remove();
				                }
				        }
				});
			}
	</script>	
</body>
</html>