<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家-撰写列表</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
    <div class="tit_top">
        <div class="title2">
            撰写列表</div>
               
    </div>
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/editor/searchPatentDoc.html'/>" method="get">
					  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
					    <div class="form-group">
					    <table class="search-table">
					    <tr>
					    	<td>专利类型</td>
						    <td>文档状态</td>
						    <td>关键字</td>
						    <td></td>
					    </tr>
					    <tr>
					    		<td>
								    <select style="width:121px;" class="form-control" name="patentType">
											<option value="">全部</option>
											<option value="1">发明</option>
											<option value="2">实用新型</option>
											<option value="3">外观</option>
									</select>
								</td>
						    	<td>
								    <select style="width:121px;" class="form-control" name="patentDocStatus">
											<option value="">全部</option>
											<option value="1">草稿</option>
											<option value="2">立案分配</option>
											<option value="3">已分配</option>
											<option value="4">专家撰写</option>
											<option value="5">待确认</option>
											<option value="6">待修改</option>
											<option value="7">定稿</option>
											<option value="8">撰写完成</option>
											<option value="9">待交局</option>
											<option value="10">已交局</option>
									</select>
						    	</td>
					    	<td>
					    		 <input style="width:450px;height:34px;float:left;margin:0 5px 0 0 ;" name="keyword" id="keywordId" value="" placeholder="文档名称" class="t-input form-control"/>	
					    	
					    	</td>
					    	<td>
					    		<button class="button button-caution button-rounded" type="submit" style="width:80px;">搜索文档</button>
					    	</td>
					    </tr>

					   
					    
					     
					    </table>
					    </div>
					  </form>

    			</div>
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:50px 0 0 0;">
							<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> 
							<span class="input-group-btn" >
							  	<div class="ta-top" style="margin-left:8px;"> 
							  
							  	<table class="search-table">
						  			<tr>
						  				<td>
			                                <a href="javascript:return void" onclick="batchShare()" >
											<button  class="button button-primary  button-rounded"   >批量分享</button>
											</a>
						  				</td>
						  	 <se:authorize access="hasRole('ROLE_USER') and not hasAnyRole('ROLE_TECH','ROLE_PLATFORM','ROLE_PROXY_ORG','ROLE_PROCESS','ROLE_CUSTOMER_SUPPORT')">  
 						  		<td>
		                            <a href="javascript:return void" onclick="batchEntrust()" >
									<button style="margin-left:10px;" class="button button-primary  button-rounded"  data-placement="bottom" >批量委托</button>
									</a>
						  		</td>
						  	 </se:authorize>
						  	 <se:authorize access="hasAnyRole('ROLE_PLATFORM','ROLE_PROXY_ORG')"> 
							  		 <td>
			                            <a href="javascript:return void" onclick="batchProxyOrg()" >
										<button style="width:120px;margin-left:10px;" class="button button-primary  button-rounded"  data-placement="bottom" >分配给代理机构</button>
										</a>
							  		</td>
						  	  </se:authorize>
						  		  <se:authorize access="hasRole('ROLE_PROXY_ORG')">  
							  		<td>
			                            <a href="javascript:return void" onclick="batchCustomerSupport()" >
										<button style="width:120px;margin-left:10px;" class="button button-primary  button-rounded"  data-placement="bottom" >分配给客服</button>
										</a>
							  		</td> 
						  		  </se:authorize>  
						  		  <se:authorize access="hasRole('ROLE_CUSTOMER_SUPPORT')">  
							  		<td>
			                            <a href="javascript:return void" onclick="batchTechPerson()" >
										<button style="width:120px;margin-left:10px;" class="button button-primary  button-rounded"  data-placement="bottom" >分配给技术员</button>
										</a>
							  		</td>
							  		
							  		<td>
			                            <a href="javascript:return void" onclick="batchProcessPerson()" >
										<button style="width:120px;margin-left:10px;" class="button button-primary  button-rounded" data-placement="bottom" >分配给流程员</button>
										</a>
							  		</td>
						  		  </se:authorize> 		   										  									  				
						  			</tr>
						  		</table>		
							  </div>
						  </span> 
						  </div>						
								
								
								
						<table id="simple-table" class="table table-striped table-bordered table-hover" >
						<thead>
						<tr class="simple_bag">
							  <th class="center" width="20px"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="20px">序号</th>
							  <th width="50px">专利类型</th>
							  <th width="140px">专利名称</th>
							  <th width="60px">定稿文件</th>
							  <th width="90px">交局文件</th>
							  <th width="90px">代理状态</th>
							  <th width="90px">案件状态</th>
							  <th width="90px">共享人</th>
							  <th width="50px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${patentDocs}" var="patentDoc" varStatus="status">
							  <tr>
							  	<td class="center" style="text-align:center" width="10px"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="check-item" patentDocId="<c:out value='${patentDoc.patentDocId}'/>" patentDocStatusId="<c:out value='${patentDoc.patentDocStatus.patentDocStatusId}'/>">
								<span class="lbl"></span></label>
								</td>
								<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
								<c:if test="${patentDoc.patentType==1}">
									<td style="text-align:center"><c:out value="发明专利"/></td>
								</c:if>
								<c:if test="${patentDoc.patentType==2}">
									<td style="text-align:center"><c:out value="实用新型"/></td>
								</c:if>
								<c:if test="${patentDoc.patentType==3}">
									<td style="text-align:center"><c:out value="外观设计"/></td>
								</c:if>
								<td style="text-align:center">${patentDoc.name}</td>
								
								<td style="text-align:center">
									<se:authorize access="hasRole('ROLE_TECH')">
											<c:if test="${patentDoc.patentDocStatus.patentDocStatusId == 7 || patentDoc.patentDocStatus.patentDocStatusId == 8}">
						                    	<a  href="<s:url value='/editor/showUploadForm.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">上传</a>
						       				</c:if>
					                   </se:authorize>
					       
				                   <c:if test="${patentDoc.patentDocUrl != null}">
				                    	<a  href="<s:url value='/editor/downloadPatentFile.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">下载</a>
				                    </c:if>
								
								</td>
								<td style="text-align:center">
									 
								<se:authorize access="hasRole('ROLE_PROCESS')">
									<c:if test="${patentDoc.patentDocStatus.patentDocStatusId==9}">
				                    	<a  href="<s:url value='/editor/showUploadPatentFileForm.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">上传</a>
				                     </c:if>
				                  </se:authorize>
				                    
				                   
				                   <c:if test="${patentDoc.attachmentUrl!=null}">
				                    	<a  href="<s:url value='/editor/downloadPatentStandardFile.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">下载</a>
				                    </c:if>
								
								</td>
								<td style="text-align:center"><c:out value="${patentDoc.patentDocProxyStatus.statusDescription}"/></td>
								<td style="text-align:center"><c:out value="${patentDoc.patentDocStatus.statusDescription}"/></td> 
								<td style="text-align:center" id="tdUsers${patentDoc.patentDocId}" >
									<a href="javascript:void(0);" onmouseover="loadPatentSharePerson(${patentDoc.patentDocId})" onmouseout="hiddenPatentSharePerson(${patentDoc.patentDocId})">查看</a>
									<span class="spanUsers" style="display:none;"></span>
								</td>
								<td style="text-align:center">
								
									 <se:authorize access="hasAnyRole('ROLE_PLATFORM','ROLE_PROXY_ORG','ROLE_CUSTOMER_SUPPORT')"> 
										<a target="_blank" href="<s:url value='/patentDocWorkflowHistory/getHistory.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&patentDocName=<c:out value='${patentDoc.name}'/>">
										历史
										</a>
									 </se:authorize>
									 <se:authorize access="hasRole('ROLE_PLATFORM')"> 
									  <c:if test="${patentDoc.patentDocStatus.patentDocStatusId == 1 && patentDoc.patentDocProxyStatus.patentDocProxyStatusId== 2 }  ">
										<a href="javascript:return void" onclick="denialofService(${patentDoc.patentDocId})" >
											拒绝委托
										</a>
										</c:if>
									</se:authorize>
									 <se:authorize access="hasRole('ROLE_TECH')">
									 	<c:if test="${patentDoc.patentDocStatus.patentDocStatusId == 4 || patentDoc.patentDocStatus.patentDocStatusId == 5 || patentDoc.patentDocStatus.patentDocStatusId == 6 }">  
										<a target="_blank" href="<s:url value='/patentDocWorkflow/updatePatentDocStatus.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&status=5">
										置为待确认
										</a>
										</c:if> 
									  </se:authorize>
									 	
 									  <se:authorize access="hasRole('ROLE_USER') and not hasAnyRole('ROLE_TECH','ROLE_PLATFORM','ROLE_PROXY_ORG','ROLE_PROCESS','ROLE_CUSTOMER_SUPPORT')">  
									 	 <c:if test="${patentDoc.patentDocStatus.patentDocStatusId == 5 || patentDoc.patentDocStatus.patentDocStatusId == 6 }"> 
											<a target="_blank" href="<s:url value='/patentDocWorkflow/updatePatentDocStatus.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&status=6">
											置为待修改
											</a>
											<a target="_blank" href="<s:url value='/patentDocWorkflow/updatePatentDocStatus.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&status=7">
											置为定稿
											</a>
										 </c:if>  
									  </se:authorize> 
								<se:authorize access="hasAnyRole('ROLE_TECH','ROLE_USER')">
									 <c:if test="${patentDoc.patentDocStatus.patentDocStatusId == 1 || patentDoc.patentDocStatus.patentDocStatusId == 2 || patentDoc.patentDocStatus.patentDocStatusId == 3 || patentDoc.patentDocStatus.patentDocStatusId == 4 ||patentDoc.patentDocStatus.patentDocStatusId == 5 || 
									 	patentDoc.patentDocStatus.patentDocStatusId == 6 }"> 
										<a target="_blank" href="<s:url value='/editor/editPatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&patentType=<c:out value='${patentDoc.patentType}'/>">
										编辑
										</a>
										</c:if>
									  </se:authorize> 
									   
									<a target="_blank" href="<s:url value='/editor/previewPatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&patentType=<c:out value='${patentDoc.patentType}'/>">
									预览
									</a>
									<a target="_blank" href="<s:url value='/editor/showFriends.html'/>?patentDocIds=<c:out value='${patentDoc.patentDocId}'/>">
									分享
									</a>
									
				                    <%-- <a onclick=" exportWord(${patentDoc.patentDocId});">导出</a> --%>
				                     <c:if test="${patentDoc.patentDocStatus.patentDocStatusId == 1 }">
					                    <a onclick="return confirm('确认要删除？')" href="<s:url value='/editor/deletePatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">
					                                                  删除
					               		</a>
				                     </c:if>
								</td>
	
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
					<!-- 分页功能 start -->
			        <div style="height:30px;background:#fff;">	
			          <c:if test="${searchCondition == null}">
			            <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?currentPage=1">首页</a>
			              <c:choose>
			                <c:when test="${page.currentPage - 1 > 0}"> <a href="?currentPage=${page.currentPage - 1}">上一页</a> </c:when>
			                <c:when test="${page.currentPage - 1 <= 0}"> <a href="?currentPage=1">上一页</a> </c:when>
			              </c:choose>
			              <c:choose>
			                <c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}">下一页</a> </c:when>
			                <c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?currentPage=${page.currentPage+1}">下一页</a> </c:when>
			                <c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?currentPage=${page.totalPages}">下一页</a> </c:when>
			              </c:choose>
			              <c:choose>
			                <c:when test="${page.totalPages==0}"> <a href="?currentPage=${page.currentPage}">尾页</a> </c:when>
			                <c:otherwise> <a href="?currentPage=${page.totalPages}">尾页</a> </c:otherwise>
			              </c:choose>
			              <!-- 分页功能 End -->
			              <input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
			              <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
			              <select onChange="setPageSize()" style="height:25px;" id="pageSizeSelect">
			                <option value="10">10</option>
			                <option value="20">20</option>
			                <option value="50">50</option>
			                <option value="100">100</option>
			              </select>
			              条记录 </span> </div>
			          </c:if>
			       
			        <c:if test="${searchCondition != null}">
			          <div class="col-lg-12"> 共 ${page.totalPages}页${page.totalRecords}条记录    第${page.currentPage} 页 <a href="?page.currentPage=1&${searchCondition}">首页</a>
			            <c:choose>
			              <c:when test="${page.currentPage - 1 > 0}"> <a href="?page.currentPage=${page.currentPage - 1}&${searchCondition}">上一页</a> </c:when>
			              <c:when test="${page.currentPage - 1 <= 0}"> <a href="?page.currentPage=1&${searchCondition}">上一页</a> </c:when>
			            </c:choose>
			            <c:choose>
			              <c:when test="${page.totalPages==0}"> <a href="?page.currentPage=${page.currentPage}&${searchCondition}">下一页</a> </c:when>
			              <c:when test="${page.currentPage + 1 < page.totalPages}"> <a href="?page.currentPage=${page.currentPage+1}&${searchCondition}">下一页</a> </c:when>
			              <c:when test="${page.currentPage + 1 >= page.totalPages}"> <a href="?page.currentPage=${page.totalPages}&${searchCondition}">下一页</a> </c:when>
			            </c:choose>
			            <c:choose>
			              <c:when test="${page.totalPages==0}"> <a href="?page.currentPage=${page.currentPage}&${searchCondition}">尾页</a> </c:when>
			              <c:otherwise> <a href="?page.currentPage=${page.totalPages}&${searchCondition}">尾页</a> </c:otherwise>
			            </c:choose>
			            <!-- 分页功能 End -->
			            <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
			            <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
			            <select onChange="setPageSize()" style="height:25px;" id="pageSizeSelect">
			              <option value="10">10</option>
			              <option value="20">20</option>
			              <option value="50">50</option>
			              <option value="100">100</option>
			            </select>
			            条记录 </span> </div>
			        </c:if>
			        </div>	
					</div>
				</div>
						

<iframe id="patentWorkFileFrame" style="display:none"></iframe>	
<script type="text/javascript">
	 function exportWord(value){
/*  		  $.ajax({
			 type : "POST",
			 url : "<s:url value='/editor/exportWord.html'/>?patentDocId="+value,
			 data : {"patentDocId":value},
			 success : function (data){
				 alert(data);
			 },error : function (){
				 
			 }
		 });  */
		  
		  var iframe = document.getElementById('patentWorkFileFrame');
		iframe.src = "<s:url value='/editor/exportWord.html'/>?patentDocId="+value;  
		 
	}


</script>		

<script type="text/javascript">

$('tr th input.check-item').click(function() {
	var checked = $(this).prop("checked");
	
	if (checked) {
		$('tr td input.check-item').each(function() {
			$(this).prop("checked", true);
		});
	} else {
		$('tr td input.check-item').each(function() {
			$(this).prop("checked", false);
		});
	}
});

$('tr td input.check-item').click(function() {
	var allChecked = true;
	var friendCheckboxes = $('tr td input.check-item');
	
	if ($(this).checked) {
		for (var i = 0; i < friendCheckboxes.length; i++) {
			if (!friendCheckboxes[i].checked) {
				allChecked = false;
				break;
			}
		}			
	} else {
		allChecked = false;
	}
	
	if (allChecked) {
		$('tr th input.check-item').prop("checked", true);
	} else {
		$('tr th input.check-item').prop("checked", false);
	}
});

function batchShare() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocId');
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");	
	location.href = "<s:url value='/editor/showFriends.html'/>?patentDocIds=" + patentDocIds;
}



function batchEntrust() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocId');
	var patentDocStatusIds=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocStatusId');
	
	for (var i = 0; i < patentDocStatusIds.length; i++) {
		if (patentDocStatusIds[i] == 2 || patentDocStatusIds[i] == 3 || patentDocStatusIds[i] == 4 || patentDocStatusIds[i] == 5 || patentDocStatusIds[i] == 6 || patentDocStatusIds[i] == 7 || 
				patentDocStatusIds[i] == 8 || patentDocStatusIds[i] == 9 || patentDocStatusIds[i] == 10 ) {
			formutil.alertMessage('选中的文档中包含已缴费的文档，请重新选择！');
			return;
		}
	}
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");	
	window.open("<s:url value='/patentDocWorkflow/createOrderForm.html'/>?patentDocIds=" + patentDocIds);
}


function gotoPage() {
	var pageNo = document.getElementById("page.pageNo").value;
	
	if (isNaN(pageNo)) {
		alert("请输入数值");
		return;
	}
	
	if(pageNo==""){
		alert("请输入数值")
		return;
	}
	
	pageNo = parseInt(pageNo);
	
	if (pageNo < 1 || pageNo > parseInt("${page.totalPages}")) {
		alert("只能输入1-${page.totalPages}之间的数值");
		return;
	}
	
	var url = "<s:url value='/editor/patentDocList.html'/>?currentPage=" + pageNo;
	
	<c:if test="${searchCondition != null}">
		url = "<s:url value='/editor/searchPatentDoc.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
	</c:if>
	
	
	location.href = url
	
}

function gotoPageForEnter(event) {
	var e = event ? event : window.event;
			
	if(event.keyCode == 13) {
		gotoPage();
	}
}

function batchProxyOrg() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocId');
	var patentDocStatusIds=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocStatusId');
 	for (var i = 0; i < patentDocStatusIds.length; i++) {
		if (  patentDocStatusIds[i] == 3 ||patentDocStatusIds[i] == 4 || patentDocStatusIds[i] == 5 || patentDocStatusIds[i] == 6 || 
				patentDocStatusIds[i] == 7 || patentDocStatusIds[i] == 8 || patentDocStatusIds[i] == 9|| patentDocStatusIds[i] == 10) {
			formutil.alertMessage('选中的文档中包含已分配过的文档，请重新选择！');
			return;
		}
	} 
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");	
	location.href = "<s:url value='/patentDocWorkflow/showProxyOrgs.html'/>?patentDocIds=" + patentDocIds;
}

function batchCustomerSupport() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocId');
	var patentDocStatusIds=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocStatusId');
	for (var i = 0; i < patentDocStatusIds.length; i++) {
		if (patentDocStatusIds[i] == 1 ||  patentDocStatusIds[i] == 4 || patentDocStatusIds[i] == 5 || patentDocStatusIds[i] == 6 || patentDocStatusIds[i] == 7 || 
				patentDocStatusIds[i] == 8 || patentDocStatusIds[i] == 9 || patentDocStatusIds[i] == 10 ) {
			formutil.alertMessage('选中的文档中包含已分配过的文档，请重新选择！');
			return;
		}
	}
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");	
	location.href = "<s:url value='/patentDocWorkflow/showCustomerSupports.html'/>?patentDocIds=" + patentDocIds;
}


function batchTechPerson() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocId');
	var patentDocStatusIds=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocStatusId');
	for (var i = 0; i < patentDocStatusIds.length; i++) {
		if (patentDocStatusIds[i] == 1 || patentDocStatusIds[i] == 2  || patentDocStatusIds[i] == 5 || patentDocStatusIds[i] == 6 || patentDocStatusIds[i] == 7 || 
				patentDocStatusIds[i] == 8 || patentDocStatusIds[i] == 9 || patentDocStatusIds[i] == 10 ) {
			formutil.alertMessage('选中的文档中包含已分配过的文档，请重新选择！');
			return;
		}
	}
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");	
	location.href = "<s:url value='/patentDocWorkflow/showTechPersons.html'/>?patentDocIds=" + patentDocIds;
}




function batchProcessPerson() {
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocId');
	var patentDocStatusIds=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocStatusId');
	
	for (var i = 0; i < patentDocStatusIds.length; i++) {
		if (patentDocStatusIds[i] == 1 || patentDocStatusIds[i] == 2 || patentDocStatusIds[i] == 3 || patentDocStatusIds[i] == 4 || patentDocStatusIds[i] == 5 || patentDocStatusIds[i] == 6 || 
				patentDocStatusIds[i] == 7 ) {
			formutil.alertMessage('选中的文档需先分配给技术员操作，请重新选择！');
			return;
		}
		if (  patentDocStatusIds[i] == 10) {
			formutil.alertMessage('选中的文档已包含进入流程的文档，请重新选择！');
			return;
		}
	}
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");	
	location.href = "<s:url value='/patentDocWorkflow/showProcessPersons.html'/>?patentDocIds=" + patentDocIds;
}

function denialofService(value){
	var patentDocStatusIds=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patentDocStatusId');
	for (var i = 0; i < patentDocStatusIds.length; i++) {
		if (patentDocStatusIds[i] != 1 ) {
			formutil.alertMessage('选中的文档已进入操作流程，无法拒绝！');
			return;
		}	
	}
	location.href="<s:url value='/patentDocWorkflow/updatePatentDocProxyStatus.html'/>?patentDocId="+value+"&status=4";
}
</script>
<script type="text/javascript">
	$(function() {
		formutil.setElementValue("#pageSizeSelect", ${page.pageSize});
	});
	
	function setPageSize() {
		var pageSize = $("#pageSizeSelect").val();
		
		$.ajax({
			url: "<s:url value='/user/setPageSize.html'/>?pageSize=" + pageSize, 
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
	}
	
	function loadPatentSharePerson(patentDocId){
		$.ajax({
			url: "<s:url value='/editor/searchShareUsers.html'/>?patentDocId="+patentDocId, 
			type: 'get',
			dataType: 'json',
			success: function(data) {
				$("#tdUsers" + patentDocId + " .spanUsers").css("display","block");
				$("#tdUsers" + patentDocId + " .spanUsers").html(data);
			}
		});
	}
	
	function hiddenPatentSharePerson(patentDocId){
		$("#tdUsers" + patentDocId + " .spanUsers").empty();
		$("#tdUsers" + patentDocId + " .spanUsers").css("display","none");
	}
</script>
</body>
</html>