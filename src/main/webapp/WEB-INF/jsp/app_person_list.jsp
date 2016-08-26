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
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<title>龙图腾专利管家-通知书</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:20px 5px 5px 5px;">
							<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
						  <div class="ta-top" style="margin-left:8px;"> 
						  	<table class="search-table">
					  			<tr>
					  				<td>
									  	<button type="button" style="width: 100px;" class="button button-rounded button-primary" onclick="javascript:addAppPerson()">新增申请人</button>
										</a>
					  				</td>
					  				<td>
										<a href="javascript:return void" onclick="batchShareAppPerson()" >
								<button style="width:100px;margin-left:10px;" class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以把申请人批量分享给好友哦！">批量分享</button>
										</a> 
					  				</td>					  				
					  				<td>
									  	<button type="button" style="width:130px;margin-left:10px;" class="button button-rounded button-primary" onclick="downloadProxyTemplate()">下载委托书模板</button>
										</a> 
									</td>	
					  			</tr>
					  		</table>		
						  </div>
						  </span> </div>
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center"> <label class="pos-rel">
								<input style="width:10px;" type="checkbox" class="check-item">
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="30px">序号</th>
							  <th >姓名或名称</th>
							  <th>证件号码 </th>
							  <th>邮编及地址</th>
							  <th>费减备案状态</th>
							  <th>备案证件号</th>
							  <th>备案年度</th>
							  <th >委托书</th>
							  <th>附件</th>
							  <th width="100px">其他信息</th>
							  <th width="100px">共享人</th>
							  <!-- 							<th>预览</th> 
							  <th>下载</th>-->
							  <th width="110px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${appPersons}" var="appPerson" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="check-item" appPerson="<c:out value='${appPerson.appPersonId}'/>">
								<span class="lbl"></span></label>
								</td>
								<td class="center" style="text-align:center"> ${status.count} </td>
								<td style="text-align:center"><c:out value="${appPerson.name}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.idNumber}"/></td>
								<td style="text-align:center" class="hidden-480" ><c:out value="${appPerson.postcodeAddress}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.feeReduceTransactionStatus}"/></td>
								<td	style="text-align:center"><c:out value="${appPerson.transactionIdentityId}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.transactionYear}"/></td>
								<td style="text-align:center">
									<a  href="<s:url value='/appPerson/showProxyUploadForm.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">上传</a>
									<c:if test="${not empty appPerson.proxyUrl}">
                    				<a href="<s:url value='/appPerson/downloadProxyFile.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">下载</a> 
                    				</c:if>
								</td>
								<td style="text-align:center">
									<a  href="<s:url value='/appPerson/showAttachmentUploadForm.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">上传</a>
									<c:if test="${not empty appPerson.appPersonUrl }">
                    				<a   href="<s:url value='/appPerson/downloadAttachmentFile.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">下载</a>
                    				</c:if>
								</td>
								<td style="text-align:center"><c:out value="${appPerson.otherInfo}"/></td>
								<td style="text-align:center"><c:out value="${appPerson.shareUsersAsString}"/></td>
								<td><a href="<s:url value='/appPerson/findOneAppPersonInfo.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>"> 编辑 </a> 
								<a onclick="return confirm('确认要删除？')" href="<s:url value='/appPerson/deleteAppPersonInfo.html'/>?appPersonId=<c:out value='${appPerson.appPersonId}'/>">删除 </a>
								<a href="<s:url value='/appPerson/showFriends.html'/>?appPersons=<c:out value='${appPerson.appPersonId}'/>">分享</a>
								</td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div></div></div>
<script type="text/javascript">

	function addAppPerson(){
		var url = "<s:url value='/appPerson/contactAppPersonAddForm.html'/>";
		location.href = url
	}
	
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
	
	function batchShareAppPerson() {
		var appPersonSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniqueAppPersonNos = []
		if (!appPersonSelected) {
			formutil.alertMessage('请选择申请人');
			
			return;
		}
		var appPersons_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'appPerson');
		for (var i = 0; i < appPersons_checked.length; i++) {
			if ($.inArray(appPersons_checked[i], uniqueAppPersonNos) == -1) {
				uniqueAppPersonNos.push(appPersons_checked[i]);
			}
		}		
		var appPersons = uniqueAppPersonNos.join(",");		
		var url = "<s:url value='/appPerson/showFriends.html'/>?appPersons=" + appPersons;
		location.href= url
	}
		
		function downloadProxyTemplate(){
			location.href="<s:url value='/appPerson/downloadProxyTemplate.html'/>";
		}
		
		$(function(){
			
			
		})
</script>
<%-- <script>
	 $(document).ready(function(){
	
		$("img[class=cgh]").click(function(){
			var ol = $('ol[class="hashTabber-nav hashTabber-sandstone"]')[0];
			var ols =$('.con-list')[0];
			if(ol.style.display=="inline-block"||ol.style.display==""){
					this.style.marginLeft="0px";
					this.src='<s:url value='/temp/images/tabs.png'/>';
					ol.style.display="none";
					ols.style.width="97%";
				}else{
					ol.style.display="inline-block";
					this.style.marginLeft="108px";
					this.src='<s:url value='/temp/images/tab.png'/>';
					ols.style.width="88%";
				}
		});
	});
</script>				 --%>		
</body>
</html>