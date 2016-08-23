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
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
						<tr class="simple_bag">
							  <th class="center"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="50">序号</th>
							  <th width="90px">标题</th>
							  <th width="60px">创建时间</th>
							  <th width="80px">更新时间</th>
							  <th width="130px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${patentDocs}" var="patentDoc" varStatus="status">
							  <tr>
							  	<td class="center" style="text-align:center" width="10px"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="check-item" inventor="<c:out value='${patentDoc.patentDocId}'/>">
								<span class="lbl"></span></label>
								</td>
								<td class="center" style="text-align:center"> ${status.count} </td>
								<td style="text-align:center"><c:out value="${patentDoc.name}"/></td>
								<td style="text-align:center"><fmt:formatDate value="${patentDoc.createTime}" pattern="yyyy-MM-dd"/></td>
								<td style="text-align:center"><fmt:formatDate value="${patentDoc.lastUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								<td style="text-align:center">
									<a target="_blank" href="<s:url value='/editor/editPatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>&patentType=<c:out value='${patentDoc.patentType}'/>">
									编辑
									</a><a target="_blank" href="<s:url value='/editor/previewPatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">预览</a>
				                    <%-- <a onclick=" exportWord(${patentDoc.patentDocId});">导出</a> --%>
				                    <a onclick="return confirm('确认要删除？')" href="<s:url value='/editor/deletePatentDoc.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">删除</a>
				                    <a href="http://www.cponline.gov.cn/" target="_blank">提交申请</a>
				
				                    <a  href="<s:url value='/editor/showUploadForm.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">上传</a>
				                    <c:if test="${patentDoc.patentDocUrl != null}">
				                    <a  href="<s:url value='/editor/downloadPatentFile.html'/>?patentDocId=<c:out value='${patentDoc.patentDocId}'/>">下载</a>
				                    </c:if>
								</td>
	
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div></div></div>
						

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
	var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
	var uniquePatentNos = []
	if (!patentSelected) {
		formutil.alertMessage('请选择专利');
		
		return;
	}
	var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
	for (var i = 0; i < patents_checked.length; i++) {
		if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
			uniquePatentNos.push(patents_checked[i]);
		}
	}		
	var patentDocIds = uniquePatentNos.join(",");		
	location.href = "<s:url value='/editor/showFriends.html'/>?patentDocIds=" + patentDocIds;
}
</script>
</body>
</html>