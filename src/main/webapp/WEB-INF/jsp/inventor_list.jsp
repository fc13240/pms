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
<title>龙图腾专利管家-发明人列表</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		  <div class="tit_top">
        <div class="title2">
           发明人列表</div>
               
    </div>
		<div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right" style="padding:10px 0 0 3px;" >
				    <div class="cl top1" style="height:10px;">
				    
					  <form class="form-inline" action="<s:url value='/inventor/searchInventor.html'/>" method="get">
					  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
					    <div class="form-group">
					    <input style="width:450px;height:34px;float:left;margin:0 5px 0 0 ;" name="keyword" id="keywordId" value="" placeholder="姓名/证件号" class="t-input form-control"/>	
					    
					     <button class="button button-caution button-rounded" type="submit" style="width:80px;">搜索文档</button>
					    </div>
					  </form>

    			</div>
		 <div class="col-xs-offset-1 col-xs-11">
			
			</div>
				<div style="height:10px;"></div>
					<div class="lt-box" style="padding:30px 0 0 0;">
							<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
						  <div class="ta-top" style="margin-left:8px;"> 
						  	<table class="search-table">
					  			<tr>
					  				<td>
									  	<button type="button" style="width: 100px;" class="button button-rounded button-primary" onclick="javascript:addInventor()">新增发明人</button>
					  				</td>
					  				<td>
										<a href="javascript:return void" onclick="batchShareInventor()" >
							             <button style="width:90px;margin-left:10px;"   class="button button-primary  button-rounded" data-toggle="tooltip" data-placement="bottom" title="可以把发明人批量分享给好友哦！">批量分享</button>
						                </a>
					  				</td>					  				
					  			</tr>
					  		</table>		
						  </div>
						  </span> </div>
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
						<tr class="simple_bag">
							  <th class="center" width="30px"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="50">序号</th>
							  <th width="100px">姓名</th>
							  <th width="100px">证件号码</th>
							  <th>国籍</th>
							  <th>电话</th>
							  <th>邮箱</th>
							  <th width="70px">附件</th>
							  <th width="100px">其他信息</th>
							   <th width="100px">共享人</th>
							  <!-- 							<th>预览</th> 
							  <th>下载</th>-->
							  <th width="100px">操作</th>
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
								<td style="text-align:center"><c:out value="${inventor.shareUsersAsString}"/></td>
								<td><a href="<s:url value='/inventor/findOneInventorInfo.html'/>?inventorId=<c:out value='${inventor.inventorId}'/>"> 编辑 </a> 
								<a onclick="return confirm('确认要删除？')" href="<s:url value='/inventor/deleteInventorInfo.html'/>?inventorId=<c:out value='${inventor.inventorId}'/>">删除 </a>
								<a href="<s:url value='/inventor/showFriends.html'/>?inventors=<c:out value='${inventor.inventorId}'/>">分享</a>
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
		
		var url = "<s:url value='/inventor/list.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
			url = "<s:url value='/inventor/searchInventor.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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