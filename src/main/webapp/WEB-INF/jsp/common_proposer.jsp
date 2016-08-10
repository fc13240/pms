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
<title>龙图腾专利管家-通知书</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
	<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="50">序号</th>
							  <th width="90px">姓名或名称</th>
							  <th width="150px">申请人类型</th>
							  <th>证件号码 </th>
							  <th>邮编及地址</th>
							  <th>费减方案</th>
							  <th >委托书</th>
							  <th>附件</th>
							  <th width="120px">其它信息</th>
							  <th width="190px">共享人</th>
							  <!-- 							<th>预览</th> 
							  <th>下载</th>-->
							  <th width="130">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${notices}" var="notice" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"> ${status.count} </td>
								<td style="text-align:center"><c:out value="${notice.patent.appNo}"/>
								</td>
								<td style="text-align:center"><c:out value="${notice.patent.name}"/></td>
								<td style="text-align:center"><c:out value="${notice.patent.firstAppPerson}"/></td>
								<td>
								
								${notice.patent.patentStatusText}
								
								</td>
								<td style="text-align:center"><c:out value="${notice.patent.shareUsersAsString}"/></td>
								<td style="text-align:center"><fmt:formatDate value="${notice.dispatchDate}" pattern="yyyy-MM-dd"/></td>
								<td style="text-align:center"><a id="download" href="javascript: void(0);" onClick="javascript:window.open('<s:url value="/notice/preview.html"/>?notice=${notice.noticeId}')">
								  <c:out value="${notice.name}"/>
								  </a> </td>
								<td style="text-align:center">
								  <select class="form-control" onChange="javascript:changePaperApplyType('${notice.noticeId}', this)">
									<c:forEach items="${paperApplyTypes}" var="paperApplyType"> <option value="<c:out value='${paperApplyType.paperTypeId}'/>" 
											  
										  
									  <c:if test="${paperApplyType.paperTypeId==notice.paperApplyType.paperTypeId}">selected="selected"</c:if>
									  >
									  <c:out value="${paperApplyType.paperTypeDescription}"/>
									  </option>
									</c:forEach>
								  </select>
								
								</td>

								<td style="text-align:center" class="date_status">
								<span class="qixian">
								
									<c:choose>
										<c:when test="${notice.remainDays == -1}"> 已超期 </c:when>
										<c:otherwise>期限：
									  	<c:out value="${notice.remainDays}"/>天
										</c:otherwise>
								  	</c:choose>
								<br>
								</span>  	
								
								  <select  class="treatment_status selectPointOfInterest form-control" onChange="javascript:processNotice('${notice.noticeId}', this)">
									<c:forEach items="${noticeProcessStatus}" var="processStatus"> <option value="<c:out value='${processStatus.processStatusId}'/>" 
											  
										  
									  <c:if test="${processStatus.processStatusId==notice.processStatus.processStatusId}">selected="selected"</c:if>
									  >
									  <c:out value="${processStatus.processStatusDescription}"/>
									  </option>
									</c:forEach>
								  </select>
								  
								</td>
								<td style="text-align:center">
								<a href="<s:url value='/notice/download.html'/>?notice=${notice.noticeId}"> 下载 </a> 
								<a href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${notice.patent.patentId}'/>">
								  分享
								  </a>&nbsp;
								  <a target="_blank" href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${notice.patent.patentId}'/>">
								  交费
								  </a> </td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
</body>
</html>