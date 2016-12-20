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
<body style="min-width: 1200px;">
<%@ include file="_top.jsp" %>
<style>
*{margin:0;padding:0}
#centerDiv{width:1110px;height:800px;position:absolute;top:30px;left:20px;}
</style>
<div id="centerDiv" class="lt-con" >
<div style="margin-top:250px;"></div>
<div>
<a href="#baseInfo" style="font-size:medium;margin-right: 100px;">基本信息</a>
<a href="#noticeInfo" style="font-size:medium;margin-right: 100px;">通知信息</a>
<a href="#transactionInfo" style="font-size:medium;margin-right: 100px;">交易信息</a>
<a href="http://cpquery.sipo.gov.cn/txnQueryFeeData.do?select-key:shenqingh=${patent.appNo }" target="_blank" style="font-size:medium;margin-right: 100px;">缴费信息</a>
<a href="http://cpquery.sipo.gov.cn/txnQueryDeliveryData.do?select-key:shenqingh=${patent.appNo }&select-key:zhuanlilx=&select-key:gonggaobj=&select-key:backPage=&inner-flag:open-type=window&inner-flag:flowno=" style="font-size:medium;margin-right: 100px;" target="_blank">发文信息</a>
<a href="javascript:void(0);" onclick="searchAppNo('${patent.appNo}')"style="font-size:medium">授权公告</a>

</div>
<%-- <p>${patent.patentType.typeDescription }专利：${patent.name }(${patent.appNo })&nbsp;${patent.patentStatusText }</p> --%>
<div style="margin-top:20px;"></div>

	<table id="baseInfo" class="table table-striped table-bordered table-hover" style="width: 1100px;">
		 <tr class="simple_bag">
			  <td class="center" width="170px"  style="text-align: center">申请号/专利号：</td>
			  <td style="text-align: center">${patent.appNo }</td>
			  <td class="center" width="170px"  style="text-align: center">专利类型：</td>
			  <td  style="text-align: center">${patent.patentType.typeDescription }</td>
		 </tr>
		 <tr class="simple_bag">
			  <td class="center" width="170px"  style="text-align: center">专利名称：</td>
			  <td  style="text-align: center">${patent.name }</td>
			  <td class="center" width="170px"  style="text-align: center">内部编码：</td>
			  <td  style="text-align: center">${patent.internalCode }</td>
		 </tr>
		 <tr class="simple_bag" style="text-align: center">
			  <td class="center" width="170px" style="text-align: center">第一申请人：</td>
			  <td style="text-align: center">${patent.appPerson }</td>
			  <td class="center" width="170px" style="text-align: center">共享人：</td>
			  <td style="text-align: center">
			  	<c:forEach items="#{patent.shareUsers }" var="shareUser" varStatus="status">
			  		 ${shareUser.username }&nbsp;
			  	</c:forEach>
			  
			  
			  </td>
		 </tr>
		 <tr class="simple_bag">
			  <td class="center" width="170px" style="text-align: center">申请日：</td>
			  <td style="text-align: center"><fmt:formatDate value="${patent.appDate }" pattern="yyyyMMdd"/></td>
			  <td class="center" width="170px" style="text-align: center">缴年费日：</td>
			  <td style="text-align: center">每年<fmt:formatDate value="${patent.appDate }" pattern="MM月dd日"/></td>
		 </tr>
		 <tr class="simple_bag" style="text-align: center">
			  <td class="center" width="170px" style="text-align: center">案件状态：</td>
			  <td style="text-align: center">${patent.patentStatusText }</td>
			  <td class="center" width="170px" style="text-align: center">更新时间：</td>
			  <td style="text-align: center"><fmt:formatDate value="${patent.createTime }" pattern="yyyy年MM月dd日 HH:mm:ss"/></td>
		 </tr>
		 <c:if test="${not empty patentRemarks }">
		 	<tr class="simple_bag" style="text-align: center">
			  <td class="center" width="170px" style="text-align: center">备注信息：</td>
			  <td colspan="3" style="text-align: center">
			  	<c:forEach items="${patentRemarks }" var="patentRemark" varStatus="status">
			  	${patentRemark.content }&nbsp;
			  	<c:if test="${status.index%4==0&&status.index!=0 }"><br/></c:if>
			  	</c:forEach>
			  </td>
		 </tr>
		 </c:if>
	</table>
	
	<br/>
	通知信息
	<table id="noticeInfo" class="table table-striped table-bordered table-hover" style="width: 1100px;">
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
		  <td style="text-align: center">
		  	<a href="<s:url value='/notice/preview.html?notice=${notice.noticeId }'/>" target="_blank">
		  		${notice.name }
		  	</a>
		  </td>
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
		  	<select class="selectPointOfInterest form-control" onChange="processNotice('${notice.noticeId}', this);changeNoticeReadStatus(${notice.noticeId})">
		  		<c:forEach items="${noticeProcessStatuses }" var="noticeProcessStatus">
		  			<option value="${noticeProcessStatus.processStatusId }"
		  				<c:if test="${notice.processStatus.processStatusId==noticeProcessStatus.processStatusId }">selected="selected"</c:if>
		  			>
		  				${noticeProcessStatus.processStatusDescription }
		  			</option>
		  		</c:forEach>
		  	</select>
		  </td>
		  <td style="text-align: center">
		  	<select class="selectPointOfInterest form-control" onchange="changePaperApplyType('${notice.noticeId}', this)">
		  		<c:forEach items="${paperApplyTypes }" var="applyType">
		  			<option value="${applyType.paperTypeId }"
		  				<c:if test="${notice.paperApplyType.paperTypeId==applyType.paperTypeId }">selected="selected"</c:if>
		  			>
		  				${applyType.paperTypeDescription }
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
	交易信息
	<table id="transactionInfo" class="table table-striped table-bordered table-hover" style="width: 1100px;">
		<tr>
			<th style="text-algin:center" width="110px">发布日</th>
			<th style="text-algin:center" width="80px">转让方</th>
			<th style="text-algin:center" width="70px">交易类型</th>
			<th style="text-algin:center" width="70px">交易价格</th>
			<th style="text-algin:center" width="80px">交易状态</th>
			<th style="text-algin:center" width="110px">交易日</th>
			<th style="text-algin:center">说明</th>
		</tr>
		<tr class="simple_bag">
		  <td style="text-algin:center">
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

<script type="text/javascript">
	window.onload = function(){
	    function box(){
	    var oBox = document.getElementById('centerDiv');
	    var L1 = oBox.offsetWidth;
	    var H1 = oBox.offsetHeight;
	    var Left = (document.documentElement.clientWidth-L1)/2;
	    var top = (document.documentElement.clientHeight-H1)/2;
	    oBox.style.left = Left+'px';
	    oBox.style.top = top+'px';
	    }
	    box();
	    window.onresize = function(){
	        box();
	    } 
	}
	
	function searchAppNo(value){
		var appNo=null;
		
		if(value.toString().length==13){
			var preffixAppNo = value.toString().substr(0,12);
			var suffixAppNo = value.toString().substr(-1).toLowerCase();
			var insertSymbol=".";
			appNo = preffixAppNo+insertSymbol+suffixAppNo;
		}else{
			appNo=value;
		}
		
		var searchUrl="http://so.lotut.com/patent/search/advanceSearch.html?page.currentPage=1&patentTypes=发明公布&patentTypes=发明授权"
			+"&patentTypes=实用新型&patentTypes=外观设计&publishNo=&startPublishDate=&endPublishDate=&appNo="+appNo
			+"&startAppDate=&endAppDate=&appPerson=&inventPerson=&address=&ipc=&patentName=&patentAbstract=&proxyOrg=&proxyPerson=";
		window.open(searchUrl);
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
				},
				error : function(){
					$("<div>操作失败，请稍后重试！</div>").dialog({
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
</script>
</html>