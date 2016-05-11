<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>通知书</title>
<%@ include file="_css.jsp" %>

</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_notice.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">通知书</span>
	</div>
	<div id="menu">
	  <div style="height:33px;">
	    <ul id="nav">
	      <p>快捷处理：</p>
	      <li><a href="#" class="selected">专利类型</a></li>
<!-- 	      <li><a href="#" class="">处理期限</a></li> -->
		  <li><a href="#" class="">通知状态</a></li>
	      <li><a href="#" class="">通知类型</a></li>
	      <li><a href="#" class="">纸件申请</a></li>
	      <li><a href="#" class="">期限监控</a></li>
	    </ul>
	  </div>
	  <div id="menu_con" style="min-width:1100px;">
	    <div class="tag" style="display:block"> 
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&patentType=1&noticeProcessStatus=1'/>">
	        <li>发明 (<c:out value='${patentTypeCount[(1).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> <a href="<s:url value='/notice/search.html?page.currentPage=1&patentType=2&noticeProcessStatus=1'/>">
	        <li>实用新型 (<c:out value='${patentTypeCount[(2).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&patentType=3&noticeProcessStatus=1'/>">
	        <li>外观设计 (<c:out value='${patentTypeCount[(3).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	      </ul>	
	     </div>
		<div class="tag" style="display:none"> 
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeProcessStatus=1'/>">
	        <li>未处理 (<c:out value='${processStatusCount[(1).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeProcessStatus=2'/>">
	        <li>已处理 (<c:out value='${processStatusCount[(2).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeProcessStatus=3'/>">
	        <li>已放弃 (<c:out value='${processStatusCount[(3).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a>
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeProcessStatus=4'/>">
	        <li>处理中 (<c:out value='${processStatusCount[(4).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	      </ul>	
	     </div>
	    <div class="tag"  style="display:none">
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=1&noticeProcessStatus=1'/>">
	        <li>新案受理 (<c:out value='${noticeTypeCount[(1).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a>  
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=2&noticeProcessStatus=1'/>">
	        <li>费用相关 (<c:out value='${noticeTypeCount[(2).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=3&noticeProcessStatus=1'/>">
	        <li>补正审查 (<c:out value='${noticeTypeCount[(3).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=4&noticeProcessStatus=1'/>">
	        <li>授权登记 (<c:out value='${noticeTypeCount[(4).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=5&noticeProcessStatus=1'/>">
	        <li>权利丧失 (<c:out value='${noticeTypeCount[(5).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=6&noticeProcessStatus=1'/>">
	        <li>手续合格 (<c:out value='${noticeTypeCount[(6).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=7&noticeProcessStatus=1'/>">
	        <li>其他 (<c:out value='${noticeTypeCount[(7).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a>
	      </ul>
	    </div>
	    <div class="tag"  style="display:none">
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&paperApplyType=1&noticeProcessStatus=1'/>">
	        <li>未申请 (<c:out value='${paperApplyTypeCount[(1).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a>  
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&paperApplyType=2&noticeProcessStatus=1'/>">
	        <li>申请纸件 (<c:out value='${paperApplyTypeCount[(2).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&paperApplyType=3&noticeProcessStatus=1'/>">
	        <li>处理中 (<c:out value='${paperApplyTypeCount[(3).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&paperApplyType=4&noticeProcessStatus=1'/>">
	        <li>无发送 (<c:out value='${paperApplyTypeCount[(4).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&paperApplyType=5&noticeProcessStatus=1'/>">
	        <li>无纸件 (<c:out value='${paperApplyTypeCount[(5).intValue()]["noticeCount"]}' default="0"/>)</li>
	        </a> 
	      </ul>
	    </div>
	    <div class="tag" style="display:none">
	      <ul class="qxjk-ul">
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&timeLimitType=1&noticeProcessStatus=1'/>">
	        <li>已超期 (<c:out value='${remainDayCount[(1).intValue()]["count(*)"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&timeLimitType=2&noticeProcessStatus=1'/>">
	        <li>一周内(<c:out value='${remainDayCount[(2).intValue()]["count(*)"]}' default="0"/>)</li>
	        </a> <a href="<s:url value='/notice/search.html?page.currentPage=1&timeLimitType=3&noticeProcessStatus=1'/>">
	        <li>两周内 (<c:out value='${remainDayCount[(3).intValue()]["count(*)"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&timeLimitType=4&noticeProcessStatus=1'/>">
	        <li>一月内 (<c:out value='${remainDayCount[(4).intValue()]["count(*)"]}' default="0"/>)</li>
	        </a> 
	        <a href="<s:url value='/notice/search.html?page.currentPage=1&timeLimitType=5&noticeProcessStatus=1'/>">
	        <li>一月以上 (<c:out value='${remainDayCount[(5).intValue()]["count(*)"]}' default="0"/>)</li>
	        </a> 	        
	      </ul>	
	    </div>
	  </div>
	</div>
	<!--menu end-->	
	<div class="lt-box">
	<form action="<s:url value='/notice/search.html'/>" method="get">
	  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
	  <div class="t-third">
	    <ul>
	      <li>
	        <p>专利类型</p>
	        <label id="lblSelect">
	        <select id="selectPointOfInterest" name="patentType">
	          <option value="">全部</option>
	          <c:forEach items="${patentTypes}" var="patentType">
	            <option value="<c:out value='${patentType.patentTypeId}'/>">
	            <c:out value="${patentType.typeDescription}"/>
	            </option>
	          </c:forEach>
	        </select>
	        </label>
	      </li>
	      <li>
	        <p>通知状态</p>
	        <label id="lblSelect">
	        <select id="selectPointOfInterest" name="noticeProcessStatus">
	          <option value="">全部</option>
	          <c:forEach items="${noticeProcessStatus}" var="processStatus">
	            <option value="<c:out value='${processStatus.processStatusId}'/>">
	            <c:out value="${processStatus.processStatusDescription}"/>
	            </option>
	          </c:forEach>
	        </select>
	        </label>
	      </li>
	      <li>
	        <p>通知类型</p>
	        <label id="lblSelect">
	        <select id="selectPointOfInterest" name="noticeType">
	          <option value="">全部</option>
	          <c:forEach items="${noticeTypes}" var="noticeType">
	            <option value="<c:out value='${noticeType.noticeTypeId}'/>">
	            <c:out value="${noticeType.noticeTypeDescription}"/>
	            </option>
	          </c:forEach>
	        </select>
	        </label>
	      </li>
	      <li>
	        <p>纸质申请</p>
	        <label id="lblSelect">
	        <select id="selectPointOfInterest" name="paperApplyType">
	          <option value="">全部</option>
	          <c:forEach items="${paperApplyTypes}" var="paperApplyType">
	            <option value="<c:out value='${paperApplyType.paperTypeId}'/>">
	            <c:out value="${paperApplyType.paperTypeDescription}"/>
	            </option>
	          </c:forEach>
	        </select>
	        </label>
	      </li>
	      <li>
	        <p>发文日起始</p>
	        <input  type="text" onclick="WdatePicker({el:'startAppDateId'})" style="height:18px;" class="form-control" id="startAppDateId"  name="startDispatchDate" placeholder="发文日开始" value="" readonly="readonly" >
	      </li>
	      <li>
	        <p>发文日截止</p>
	        <input type="text" onclick="WdatePicker({el:'endAppDateId'})" style="height:18px;" class="form-control" id="endAppDateId" name="endDispatchDate" placeholder="发文日结束" value="" readonly="readonly" >
	      </li>
	      <li style="width: 385px;">
	        <p>关键字</p>
	        <input name="keyword" id="keywordId" value="" placeholder="申请号/名称/申请人/内部编码" class="t-input"/>
	        <button>查询</button>
	      </li>
	    </ul>
	  </div>
	</form>
	</div>
	<!--search box end-->

	
	<div class="lt-box">
	  <div class="main-container" id="main-container">
		<div class="row">
		  <div class="col-xs-12">
			<!-- PAGE CONTENT BEGINS -->
			<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
			  <div class="ta-top" style="margin:8px;"> <a href="javascript:batchProcessNotice(4)">
				<button class="t-btn1">置为处理中</button>
				</a> <a href="javascript:batchProcessNotice(2)">
				<button class="t-btn2">置为已处理</button>
				</a> <a href="javascript:batchShare()">
				<button class="t-btn3">专利分享</button>
				</a> <a href="javascript:batchGrabFees()">
				<button class="t-btn4">官费查询</button>
				</a> <a href="javascript:batchChangeNoticePaperType(2)">
				<button class="t-btn4">批量申请纸件</button>
				</a>
				<!-- 							<button class="t-btn6">表格导出</button> -->
			  </div>
			  </span> </div>
			<table id="simple-table" class="table table-striped table-bordered table-hover">
			  <thead>
				<tr class="simple_bag">
				  <th class="center"> <label class="pos-rel">
					<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
					<span class="lbl"></span> </label>
				  </th>
				  <th class="center" width="30">序号</th>
				  <th>申请号/专利号</th>
				  <th width="170">专利名称</th>
				  <th>第一申请人 </th>
				  <th>案件状态 </th>
				  <th>共享人</th>
				  <th>发文日</th>
				  <th>通知书名称</th>
				  <th width="90px">纸质申请</th>
				  <th>期限</th>
				  <th>通知状态</th>
				  <!-- 							<th>预览</th> -->
				  <th>下载</th>
				  <th width="70px">操作</th>
				</tr>
			  </thead>
			  <tbody>
				<c:forEach items="${notices}" var="notice" varStatus="status">
				  <tr>
					<td class="center"><label class="pos-rel"> <span class="batch-share-item">
					  <input type="checkbox" class="check-item" notice="${notice.noticeId}" patent="<c:out value='${notice.patent.patentId}'/>">
					  <span class="lbl"></span></label></td>
					<td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
					<td><c:out value="${notice.patent.appNo}"/>
					</td>
					<td><c:out value="${notice.patent.name}"/></td>
					<td><c:out value="${notice.patent.firstAppPerson}"/></td>
					<td>
					
					${notice.noticeStatusText}
					
					</td>
					<td><c:out value="${notice.patent.shareUsersAsString}"/></td>
					<td><fmt:formatDate value="${notice.dispatchDate}" pattern="yyyy-MM-dd"/></td>
					<td><a id="download" href="javascript: void(0);" onClick="javascript:window.open('<s:url value="/notice/preview.html"/>?notice=${notice.noticeId}')">
					  <c:out value="${notice.name}"/>
					  </a> </td>
					<td><label id="lblSelect">
					  <select class="form-control" onChange="javascript:changePaperApplyType('${notice.noticeId}', this)">
						<c:forEach items="${paperApplyTypes}" var="paperApplyType"> <option value="<c:out value='${paperApplyType.paperTypeId}'/>" 
								  
							  
						  <c:if test="${paperApplyType.paperTypeId==notice.paperApplyType.paperTypeId}">selected="selected"</c:if>
						  >
						  <c:out value="${paperApplyType.paperTypeDescription}"/>
						  </option>
						</c:forEach>
					  </select>
					  </label>
					</td>
					<td><c:choose>
						<c:when test="${notice.remainDays == -1}"> 已超期 </c:when>
						<c:otherwise>
						  <c:out value="${notice.remainDays}"/>
						</c:otherwise>
					  </c:choose>
					</td>
					<td><label id="lblSelect">
					  <select id="selectPointOfInterest" onChange="javascript:processNotice('${notice.noticeId}', this)">
						<option>全部</option>
						<c:forEach items="${noticeProcessStatus}" var="processStatus"> <option value="<c:out value='${processStatus.processStatusId}'/>" 
								  
							  
						  <c:if test="${processStatus.processStatusId==notice.processStatus.processStatusId}">selected="selected"</c:if>
						  >
						  <c:out value="${processStatus.processStatusDescription}"/>
						  </option>
						</c:forEach>
					  </select>
					  </label>
					</td>
					<%-- 							<td><a href="javascript: void;" onclick="javascript:window.open('<s:url value="/patent/detail/"/><c:out value="${notice.patent.patentId}"/>.html')"> --%>
					<%-- 								<img src="<s:url value='/temp/images/look.png'/>" /> --%>
					<!-- 								</a> -->
					<!-- 							</td> -->
					<td><a href="<s:url value='/notice/download.html'/>?notice=${notice.noticeId}"> <img src="<s:url value='/temp/images/download.png'/>" /> </a> </td>
					<td><a href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${notice.patent.patentId}'/>">
					  分享
					  </a>&nbsp;
					  <a target="_blank" href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${notice.patent.patentId}'/>">
					  缴费
					  </a> </td>
				  </tr>
				</c:forEach>
			  </tbody>
			</table>
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
				  <input type="text" id="page.pageNo" style="width:50px;height:15px" name="currentPage" onKeyDown="gotoPageForEnter(event)"/>
				  <a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
				  <select onChange="setPageSize()" id="pageSizeSelect">
					<option value="10">10</option>
					<option value="20">20</option>
					<option value="50">50</option>
					<option value="100">100</option>
				  </select>
				  条记录 </span> </div>
			  </c:if>
			</div>
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
				<input type="text" id="page.pageNo" style="width:50px;height:15px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
				<a href="javascript:void;" onClick="javascript:gotoPage()">跳转</a> <span> 每页
				<select onChange="setPageSize()" id="pageSizeSelect">
				  <option value="10">10</option>
				  <option value="20">20</option>
				  <option value="50">50</option>
				  <option value="100">100</option>
				</select>
				条记录 </span> </div>
			</c:if>
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
	</div>


</div>




       


<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>

<script type="text/javascript">
function changePaperApplyType(notice, selectElement) {
	paperApplyType = 1;
	for (var i = 0; i < selectElement.length; i++) {
		if (selectElement.options[i].selected == true) {
			paperApplyType = selectElement.options[i].value;
		}
	}		

	$.ajax({
		url: "<s:url value='/notice/changePaperType.html'/>?notice=" + notice + "&paperApplyType=" + paperApplyType,
		type: 'get', 
		success: function(data) {
			if (data == "no-permission") {
				$("<div>共享人只能把[纸质申请]修改为[申请纸件]</div>").dialog({
					modal: true,
					buttons: {
						Ok: function() {
							$(this).dialog("close");
						}
					}	
				});		

				return;
			}
			
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});
			
		}
	});			
}

function processNotice(notice, selectElement) {
	processStatus = 1;
	for (var i = 0; i < selectElement.length; i++) {
		if (selectElement.options[i].selected == true) {
			processStatus = selectElement.options[i].value;
		}
	}		

	$.ajax({
		url: "<s:url value='/notice/processNotice.html'/>?notice=" + notice + "&processStatus=" + processStatus,
		type: 'get', 
		success: function(data) {
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});
		}
	});			
}
</script>

<script type="text/javascript">

// 通知书处理状态
function batchProcessNotice(processStatus) {
		var noticeSelected = false;
		var notices = []

		var noticeCheckboxes = $('tr td input.check-item');
		for (var i = 0; i < noticeCheckboxes.length; i++) {
			if (noticeCheckboxes[i].checked) {
				noticeSelected = true;
				break;
			}
		}
		if (!noticeSelected) {
			$("<div>请选择通知书</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});	
			return;
		}
			
		for (var i = 0; i < noticeCheckboxes.length; i++) {
			if (noticeCheckboxes[i].checked) {
				notices.push(noticeCheckboxes[i].getAttribute("notice"));
			}
		}	
		$.ajax({
			url: "<s:url value='/notice/processNotices.html'/>?notices=" + notices + "&processStatus=" + processStatus, 
			type: 'get', 
			success: function() {
				$("<div>操作成功</div>").dialog({
					modal: true,
					buttons: {
						Ok: function() {
							$(this).dialog("close");
							location.reload();
						}
					}	
				});
			}
		});			
		
	}
	
	
	
	function processNotice(notice, selectElement) {
	
		processStatus = 1;
		for (var i = 0; i < selectElement.length; i++) {
			if (selectElement.options[i].selected == true) {
				processStatus = selectElement.options[i].value;
			}
		}		
		$.ajax({
				url: "<s:url value='/notice/processNotices.html'/>?notices=" + notice + "&processStatus=" + processStatus,
				type: 'get', 
				success: function(data) {
					$("<div>操作成功</div>").dialog({
						modal: true,
						buttons: {
							Ok: function() {
							$(this).dialog("close");
							}
						}	
					});
				}
			});
	}	
			jQuery(function($) {
				//initiate dataTables plugin

				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
			
			})
		</script> 

<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.check-item', 'tr td input.check-item');
		formutil.clickItemCheckbox('tr th input.check-item', 'tr td input.check-item');
	});
	
	function batchShare() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniquePatentNos = [];
		if (!patentSelected) {
			//formutil.alertMessage('请选择专利');
			formutil.alertMessage('请选择专利');
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");
				
		location.href = "<s:url value='/patent/showFriends.html'/>?patents=" + patents;
	}
	
	
	function batchGrabFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniquePatentNos = [];
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			return;
		}
		
		
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");		
		window.open("<s:url value='/fee/batchGrabFees.html'/>?patents=" + patents);		
		
	}	
	function batchFee() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			return;
		}
			
		var patentNos = formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patent');
		
		 window.open("<s:url value='/patent/showFriends.html'/>?patentNos=" + patentNos);
	}	
	
	function getFeeInfo(patentId) {
		window.open("/fee/list?patentId=" + patentId);
	}
	
	
	function gotoPage() {
		var pageNo = document.getElementById("page.pageNo").value;
		
		if(isNaN(pageNo)){
			alert("请输入数值");
			return;
		}
		
		if(pageNo==""){
			alert("请输入数值")
			return;
		}
		
		pageNo=parseInt(pageNo);
		
		if(pageNo<1 || pageNo > parseInt("${page.totalPages}")){
			alert("只能输入1-${page.totalPages}之间的数值");
			return;
		}
		var url = "<s:url value='/notice/list.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
				url = "<s:url value='/notice/search.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
		</c:if>
		
		location.href = url
	}
	
	function gotoPageForEnter(event) {
		var e = event ? event : window.event;
				
		if(event.keyCode == 13) {
			gotoPage();
		}
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
</script>
<script type="text/javascript">
function batchChangeNoticePaperType(paperApplyType) {
	var noticeSelected = false;
	var notices = []

	var noticeCheckboxes = $('tr td input.check-item');
	for (var i = 0; i < noticeCheckboxes.length; i++) {
		if (noticeCheckboxes[i].checked) {
			noticeSelected = true;
			break;
		}
	}
	if (!noticeSelected) {
		$("<div>请选择通知书</div>").dialog({
			modal: true,
			buttons: {
				Ok: function() {
					$(this).dialog("close");
				}
			}	
		});	
		return;
	}
		
	for (var i = 0; i < noticeCheckboxes.length; i++) {
		if (noticeCheckboxes[i].checked) {
			notices.push(noticeCheckboxes[i].getAttribute("notice"));
		}
	}	
	$.ajax({
		url: "<s:url value='/notice/batchChangePaperType.html'/>?notices=" + notices + "&paperApplyType=" + paperApplyType, 
		type: 'get', 
		success: function() {
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
						location.reload();
					}
				}	
			});
		}
	});			
	
}
</script>
    <%@ include file="_footer_js.jsp" %>
</body>
</html>