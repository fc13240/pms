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
			<div class="lt-right">
			
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:20px;">
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top: 10px;">
						<thead>
						<tr class="simple_bag">
							 <%--  <th class="center" width="20px"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th> --%>
							  <th class="center" width="20px">序号</th>
							  <!-- <th width="50px">操作账户</th>
							  <th width="140px">操作</th>
							  <th width="60px">分配对象</th>
							  <th width="40px">创建时间</th> -->
							  <th width="">操作记录</th>
							  <!-- <th width="90px">文档状态</th> -->
		
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${patentDocWorkflowHistories}" var="patentDocWorkflowHistory" varStatus="status">
							  <tr>
							  	<%-- <td class="center" style="text-align:center" width="10px"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="check-item" patentDocId="<c:out value='${patentDoc.patentDocId}'/>">
								<span class="lbl"></span></label>
								</td> --%>
								<td class="center" style="text-align:center">${status.count}</td>
								<td style="text-align:center">
									标题为&nbsp;${patentDocName}&nbsp;的文档由
									${patentDocWorkflowHistory.owner.username}在
									<fmt:formatDate value="${patentDocWorkflowHistory.actionTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
									${patentDocWorkflowHistory.patentDocAction.actionTypeDesc}
									<c:if test="${empty patentDocWorkflowHistory.shareUsersAsString}">
									</c:if>
									<c:if test="${not empty patentDocWorkflowHistory.shareUsersAsString}">
										:${patentDocWorkflowHistory.shareUsersAsString}
									</c:if>
								</td>
								<%-- <td style="text-align:center"><c:out value="${patentDocWorkflowHistory.owner.username}"/></td>
								<td style="text-align:center"><c:out value="${patentDocWorkflowHistory.patentDocAction.actionTypeDesc}"/></td>
								<td style="text-align:center"><c:out value="${patentDocWorkflowHistory.shareUsersAsString}"/></td>
								<td style="text-align:center"><fmt:formatDate value="${patentDocWorkflowHistory.actionTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
	
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						</div>
					<%-- <!-- 分页功能 start -->
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
			        </div>	--%>
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
</body>
</html>