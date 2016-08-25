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
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:20px;">
				 
		  				<button type="button" style="width: 100px;margin:20px;" class="button button-rounded button-primary" onclick="javascript:addInventor()">新增发明人</button>
		  				<a href="javascript:return void" onclick="batchShareInventor()" >
							<button class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以把发明人批量分享给好友哦！">批量分享</button>
						</a> 
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
						<tr class="simple_bag">
							  <th class="center"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="50">序号</th>
							  <th width="90px">姓名</th>
							  <th width="150px">证件号码</th>
							  <th>国籍</th>
							  <th>电话</th>
							  <th>邮箱</th>
							  <th>附件</th>
							  <th width="120px">其他信息</th>
							  <!-- 							<th>预览</th> 
							  <th>下载</th>-->
							  <th width="130">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${inventors}" var="inventor" varStatus="status">
							  <tr>
							  	<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="check-item" inventor="<c:out value='${inventor.inventorId}'/>">
								<span class="lbl"></span></label>
								</td>
								<td class="center" style="text-align:center"> ${status.count} </td>
								<td style="text-align:center"><c:out value="${inventor.inventorName}"/></td>
								<td style="text-align:center"><c:out value="${inventor.inventorNumber}"/></td>
								<td style="text-align:center"><c:out value="${inventor.inventorNationality}"/></td>
								<td	style="text-align:center">${inventor.inventorMobile}</td>
								<td style="text-align:center"><c:out value="${inventor.inventorEmail}"/></td>
								<td style="text-align:center">
									<a  href="<s:url value='/inventor/showUploadForm.html'/>?inventorId=<c:out value='${inventor.inventorId}'/>">上传</a>
									<c:if test="${not empty inventor.inventorUrl }">
                    				<a  href="<s:url value='/inventor/downloadAttachmentFile.html'/>?inventorId=<c:out value='${inventor.inventorId}'/>">下载</a>
                    				</c:if>
								</td>
								<td style="text-align:center"><c:out value="${inventor.inventorComment}"/></td>
								<td><a href="<s:url value='/inventor/findOneInventorInfo.html'/>?inventorId=<c:out value='${inventor.inventorId}'/>"> 编辑 </a> 
								<a onclick="return confirm('确认要删除？')" href="<s:url value='/inventor/deleteInventorInfo.html'/>?inventorId=<c:out value='${inventor.inventorId}'/>">删除 </a>
								<a href="<s:url value='/inventor/showFriends.html'/>?inventors=<c:out value='${inventor.inventorId}'/>">分享</a>
								</td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div></div></div>
<script type="text/javascript">
	function addInventor(){
		var url = "<s:url value='/inventor/contactInventorAddForm.html'/>";
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
	
	function batchShareInventor() {
		var inventorSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniqueinventorNos = []
		if (!inventorSelected) {
			formutil.alertMessage('请选择发明人');
			
			return;
		}
		var inventors_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'inventor');
		for (var i = 0; i < inventors_checked.length; i++) {
			if ($.inArray(inventors_checked[i], uniqueinventorNos) == -1) {
				uniqueinventorNos.push(inventors_checked[i]);
			}
		}		
		var inventors = uniqueinventorNos.join(",");		
		var url = "<s:url value='/inventor/showFriends.html'/>?inventors=" + inventors;
		location.href= url }
</script>

</body>
</html>