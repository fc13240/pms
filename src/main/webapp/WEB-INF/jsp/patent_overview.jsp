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
<title>龙图腾专利管家-用户指南</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>

<div class="lt-con" style="min-width:1100px;">
<div style="margin-top:500px;"></div>
<p>${patent.patentType.typeDescription }专利：${patent.name }(${patent.appNo })&nbsp;${patent.patentStatusText }</p>


	<table id="simple-table" class="table table-striped table-bordered table-hover" style="width: 1100px;">
		 <tr class="simple_bag">
			  <td class="center" width="170px">申请号/专利号：</td>
			  <td>${patent.appNo }</td>
			  <td class="center" width="170px">专利类型：</td>
			  <td>${patent.patentType.typeDescription }</td>
		 </tr>
		 <tr class="simple_bag">
			  <td class="center" width="170px">专利名称：</td>
			  <td>${patent.name }</td>
			  <td class="center" width="170px">内部编码：</td>
			  <td>${patent.internalCode }</td>
		 </tr>
		 <tr class="simple_bag">
			  <td class="center" width="170px">第一申请人：</td>
			  <td>${patent.appPerson }</td>
			  <td class="center" width="170px">共享人：</td>
			  <td>
			  	<c:forEach items="#{patent.shareUsers }" var="shareUser">
			  		 ${shareUser.username }&nbsp;
			  	</c:forEach>
			  
			  
			  </td>
		 </tr>
		 <tr class="simple_bag">
			  <td class="center" width="170px">申请日：</td>
			  <td><fmt:formatDate value="${patent.appDate }" pattern="yyyyMMdd"/></td>
			  <td class="center" width="170px">缴年费日：</td>
			  <td>每年<fmt:formatDate value="${patent.appDate }" pattern="MM月dd日"/></td>
		 </tr>
		 <tr class="simple_bag">
			  <td class="center" width="170px">案件状态：</td>
			  <td>${patent.patentStatusText }</td>
			  <td class="center" width="170px">更新时间：</td>
			  <td><fmt:formatDate value="${patent.createTime }" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
		 </tr>
		 <c:if test="${not empty patentRemarks }">
		 	<tr class="simple_bag">
			  <td class="center" width="170px">备注信息：</td>
			  <td colspan="3">
			  	<c:forEach items="${patentRemarks }" var="patentRemark" varStatus="status">
			  	 	${patentRemark.content } <c:if test="${!status.last }"><br/></c:if>
			  	</c:forEach>
			  </td>
		 </tr>
		 </c:if>
	</table>
	
	<br/>
	通知信息
	<table id="simple-table" class="table table-striped table-bordered table-hover" style="width: 1100px;">
		<tr>
			<th style="text-align: center">序号</th>
			<th style="text-align: center">发文日</th>
			<th style="text-align: center">通知书名称</th>
			<th style="text-align: center">发文序号</th>
			<th style="text-align: center">是否查看</th>
			<th style="text-align: center">剩余天数</th>
			<th style="text-align: center" width="175px">是否处理</th>
			<th style="text-align: center" width="105px">纸件申请</th>
			<th style="text-align: center">操作</th>
		</tr>
	<c:forEach items="${notices }" var="notice" varStatus="status">
		<tr class="simple_bag">
		  <td style="text-align: center">${status.count }</td>
		  <td style="text-align: center"><fmt:formatDate value="${notice.dispatchDate }" pattern="yyyy-MM-dd"/></td>
		  <td style="text-align: center">${notice.name }</td>
		  <td style="text-align: center">${notice.dispatchSequence }</td>
		  <td style="text-align: center"><span id="notice_read_span${notice.noticeId }">
		  	<c:choose>
		  		<c:when test="${not empty notice.noticeViewStatus }">
		  			已查看
		  		</c:when>
		  		<c:otherwise>
		  			未查看
		  		</c:otherwise>
		  	</c:choose>
		  	
		  	</span>
		  </td>
		  <td style="text-align: center">${notice.remainDays }</td>
		  <td style="text-align: center">
		  	<select class="selectPointOfInterest form-control" >
		  		<c:forEach items="${noticeProcessStatuses }" var="noticeProcessStatus">
		  			<option value="${noticeProcessStatus.processStatusId }"
		  				<c:if test="${notice.processStatus.processStatusId==notice.processStatus.processStatusId }">selected="selected"</c:if>
		  			>
		  				${noticeProcessStatus.processStatusDescription }
		  			</option>
		  		</c:forEach>
		  	</select>
		  </td>
		  <td style="text-align: center">
		  	<select class="selectPointOfInterest form-control" >
		  		<c:forEach items="${paperApplyTypes }" var="paperApplyType">
		  			<option value="${paperApplyType.paperTypeId }"
		  				<c:if test="${notice.paperApplyType.paperTypeId==notice.paperApplyType.paperTypeId }">selected="selected"</c:if>
		  			>
		  				${paperApplyType.paperTypeDescription }
		  			</option>
		  		</c:forEach>
		  	</select>
		  </td>
		  <td style="text-align: center">
			<a href="<s:url value='/notice/download.html'/>?notice=${notice.noticeId}" onclick="changeNoticeReadStatus(${notice.noticeId})"> 下载 </a> 
		  </td>
		 </tr>
	</c:forEach>
	</table>
	
	<br/>
	缴费信息
	<table id="simple-table" class="table table-striped table-bordered table-hover" style="width: 1100px;">
		<tr>
			<th style="text-algin:center" width="110px">发布日</th>
			<th style="text-algin:center" width="60px">转让方</th>
			<th style="text-algin:center" width="70px">交易类型</th>
			<th style="text-algin:center" width="70px">交易价格</th>
			<th style="text-algin:center" width="80px">交易状态</th>
			<th style="text-algin:center" width="110px">交易日</th>
			<th style="text-algin:center">说明</th>
		</tr>
		<tr class="simple_bag">
		  <td style="text-algin:center" align="center">
		  	<fmt:formatDate value="${good.addDate }" pattern="yyyy-MM-dd"/>
		  </td>
		  <td style="text-algin:center">${good.transferor }</td>
		  <td style="text-algin:center">
		  	<c:if test="${good.transactionType==1 }">转让</c:if>
		  	<c:if test="${good.transactionType==2 }">许可</c:if>
		  </td>
		  	
		  <td style="text-algin:center">${good.price }</td>
		  <td style="text-algin:center">
		  	<c:if test="${good.status==0 }">待发布</c:if>
		  	<c:if test="${good.status==1 }">待交易</c:if>
		  	<c:if test="${good.status==2 }">已预订</c:if>
		  	<c:if test="${good.status==3 }"> 已付款待变更</c:if>
		  	<c:if test="${good.status==4 }"> 已变更待合格</c:if>
		  	<c:if test="${good.status==5 }"> 交易成功</c:if>
		  </td>
		  <td style="text-algin:center">
		  	<fmt:formatDate value="${good.transactionDate }" pattern="yyyy-MM-dd"/>
		  </td>
		  <td style="text-algin:center">${good.description }</td>
		 </tr>
	</table>
</div>
</body>


<script type="text/javascript">
function changeNoticeReadStatus(noticeId){
	setTimeout(function(){
		$.ajax({
			url: "<s:url value='/notice/changeNoticeReadStatus.html'/>?notices=" + noticeId, 
			type: 'get', 
			dataType:"text",
			success: function(totalCount) {
				$("#notice_read_span"+noticeId).html("已查看");
			}
		});		
	}, 100);	
	
}
</script>
</html>