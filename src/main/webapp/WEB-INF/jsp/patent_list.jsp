<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利</title>
<%@ include file="_css.jsp" %>
</head>
<body style="background:#F3F3F5;">
<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav2.jsp" %>
<div class="lt-con">
  <div class="t-ti">
    <hr class="t-hr">
    <span style="font-size: 16px;font-weight: 300;line-height: 24px;">我的专利</span> </div>
  <div style="height:30px;"></div>
  <div id="menu">
    <div style="height:33px;">
      <ul id="nav">
        <p>快捷处理：</p>
        <li><a href="#" class="">通知状态</a></li>
        <li><a href="#" class="">专利类型</a></li>
        <li><a href="#" class="">期限监控</a></li>
        <li><a href="#" class="selected">通知类型</a></li>
      </ul>
    </div>
    <div id="menu_con" style="min-width:1100px;">
      <div class="tag" style="display:none"> 这里是通知状态 </div>
      <div class="tag" style="display:none"> 这里是专利类型 </div>
      <div class="tag"  style="display:none"> 这里是期限监控 </div>
      <div class="tag"  style="display:block">
        <ul class="qxjk-ul">
          <a href="#">
          <li>新案受理 (6)</li>
          </a> <a href="#">
          <li>新案受理 (6)</li>
          </a> <a href="#">
          <li>费用相关 (6)</li>
          </a> <a href="#">
          <li>补正审查 (4)</li>
          </a> <a href="#">
          <li>授权登记 (1)</li>
          </a> <a href="#">
          <li>权利丧失 (0)</li>
          </a> <a href="#">
          <li>手续合格 (0)</li>
          </a> <a href="#">
          <li>其他 (2)</li>
          </a>
        </ul>
      </div>
    </div>
  </div>
  <!--menu end-->
  <div style="clear:both;height:30px;"></div>
  <form action="<s:url value='/patent/search.html'/>" method="get">
    <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
    <div class="t-third">
      <ul>
        <li>
          <p>专利类型</p>
          <select id="patentTypeId" name="patentType">
            <option value="">全部</option>
            <c:forEach items="${allPatentTypes}" var="patentType">
              <option value="<c:out value='${patentType.patentTypeId}'/>">
              <c:out value="${patentType.typeDescription}"/>
              </option>
            </c:forEach>
          </select>
        </li>
        <li>
          <p>专利状态</p>
          <label id="lblSelect">
          <select id="patentStatus" name="patentStatus">
            <option value="">全部</option>
            <c:forEach items="${allPatentStatus}" var="patentStatus">
              <option value="<c:out value='${patentStatus.patentStatusId}'/>">
              <c:out value="${patentStatus.statusDescription}"/>
              </option>
            </c:forEach>
          </select>
          </label>
        </li>
        <li>
          <p>申请期开始</p>
          <input  type="text" onclick="WdatePicker({el:'startAppDateId'})" style="height:18px;" id="startAppDateId" name="startAppDate" placeholder="申请日开始" value="" readonly="readonly" >
          <img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="18" align="absmiddle" id="start_date_img"> - </li>
        <li>
          <p>申请期结束</p>
          <input type="text" onclick="WdatePicker({el:'endAppDateId'})" style="height:18px;" id="endAppDateId" name="endAppDate" placeholder="申请日结束" value="" readonly="readonly" >
          <img onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img"> </li>
        <li style="width: 385px;">
          <p>关键字</p>
          <input name="keyword" id="keywordId" value="" placeholder="申请号/名称/申请人/内部编码" class="t-input"/>
          <button>查询</button>
        </li>
      </ul>
    </div>
  </form>
  <!--search box end-->
  <div style="clear:both;height:30px;"></div>
  <div class="t-table">
    <div class="main-container" id="main-container">
      <div class="row">
        <div class="col-xs-12">
          <!-- PAGE CONTENT BEGINS -->
          <div class="row">
            <div class="col-xs-12">
              <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
                <div class="ta-top" style="margin:8px;"> <a href="javascript:batchShare()">
                  <button class="t-btn3">批量分享</button>
                  </a> <a href="javascript:batchGrabFees()">
                  <button class="t-btn4">官费查询</button>
                  </a>
                  <!-- 							<button class="t-btn5">加入交易</button> -->
                </div>
                </span> </div>
              <table id="simple-table" class="table table-striped table-bordered table-hover">
                <thead>
                  <tr class="simple_bag">
                    <th class="center"> <label class="pos-rel">
                      <input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
                      <span class="lbl"></span> </label>
                    </th>
                    <th class="center" width="45">序号</th>
                    <th>申请号/专利号</th>
                    <th width="170">专利名称</th>
                    <th>第一申请人 </th>
                    <th width="90" class="hidden-480"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>申请日</th>
                    <th width="60">专利类型</th>
                    <th width="60">案件状态</th>
                    <th width="50">内部编码</th>
                    <th width="110">共享人</th>
                    <th width="200">操作</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach items="${patents}" var="patent" varStatus="status">
                    <tr>
                      <td class="center"><label class="pos-rel"> <span class="batch-share-item">
                        <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
                        <span class="lbl"></span></label></td>
                      <td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
                      <td><c:out value="${patent.appNo}"/>
                      </td>
                      <td class="hidden-480"><c:out value="${patent.name}"/></td>
                      <td><c:out value="${patent.appPerson}"/></td>
                      <td class="hidden-480"><fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/></td>
                      <td><c:out value="${patent.patentType.typeDescription}"/></td>
                      <td><c:out value="${patent.patentStatus.statusDescription}"/></td>
                      <td><input style="width:60px;" type="text" value="<c:out value='${patent.internalCode}'/>" size="30" onChange="changeInternalCode('<c:out value='${patent.patentId}'/>', this.value)">
                      </td>
                      <td><c:out value="${patent.shareUsersAsString}"/>
                      </td>
                      <td><a  href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${patent.patentId}'/>">
                        <button class="t-btn2">分享</button>
                        </a> <a target="_blank" href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${patent.patentId}'/>">
                        <button class="t-btn2">缴费</button>
                        </a> <a target="_blank" href="<s:url value='/patent/goods.html'/>?patent=<c:out value='${patent.patentId}'/>">
                        <button class="t-btn2">出售</button>
                        </a> </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
              <!-- 分页功能 start -->
              <div class="row">
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
                  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
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
          </div>
<<<<<<< HEAD
          <!-- /.span -->
=======
        </form>
        <!--search box end-->
        <div style="clear:both;height:30px;"></div>
        <div class="t-table">

			<div class="main-container" id="main-container">
			  <div class="row">
				<div class="col-xs-12">
				  <!-- PAGE CONTENT BEGINS -->
				  <div class="row">
					<div class="col-xs-12">
					  <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> 
					  <span class="input-group-btn" > 
						<div class="ta-top" style="margin:8px;">
							<a href="javascript:batchShare()"><button class="t-btn3">批量分享</button></a>
							<a href="javascript:batchGrabFees()"><button class="t-btn4">官费查询</button></a>
<!-- 							<button class="t-btn5">加入交易</button> -->
						</div>					  
					  </span> </div>
					  <table id="simple-table" class="table table-striped table-bordered table-hover">
						<thead>
						  <tr class="simple_bag">
							<th class="center"> <label class="pos-rel">
							  <input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							  <span class="lbl"></span> </label>
							</th>
							<th class="center" width="45">序号</th>
							<th>申请号/专利号</th>
							<th width="170">专利名称</th>
							<th>第一申请人 </th>
							<th width="90" class="hidden-480"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>申请日</th>
							<th width="60">专利类型</th>
							<th width="60">案件状态</th>
							<th width="50">内部编码</th>
							<th width="110">共享人</th>
							<th width="200">操作</th>
						  </tr>
						</thead>
						<tbody>
						  <c:forEach items="${patents}" var="patent" varStatus="status">
							<tr>
							  <td class="center"><label class="pos-rel"> <span class="batch-share-item">
								<input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
								<span class="lbl"></span></label></td>
							  <td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
							  <td>
								<c:out value="${patent.appNo}"/> 
							 </td>
							  <td class="hidden-480"><c:out value="${patent.name}"/></td>
							  <td><c:out value="${patent.appPerson}"/></td>
							  <td class="hidden-480"><fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/></td>
							  <td><c:out value="${patent.patentType.typeDescription}"/></td>
							  <td><c:out value="${patent.patentStatus.statusDescription}"/></td>
							  <td><input style="width:60px;" type="text" value="<c:out value='${patent.internalCode}'/>" size="30" onChange="changeInternalCode('<c:out value='${patent.patentId}'/>', this.value)">
							  </td>
							  <td><c:out value="${patent.shareUsersAsString}"/>
							  </td>
							  <td>  
							  
							   <a  href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${patent.patentId}'/>">
								<button class="t-btn3">分享</button>
								</a> 
							   <a target="_blank" href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${patent.patentId}'/>">
								<button class="t-btn4">缴费</button>
								</a> 						  
							   <a target="_blank" href="<s:url value='/patent/goods.html'/>?patent=<c:out value='${patent.patentId}'/>">
								<button class="t-btn1">出售</button>
								</a> 
							   </td>
							</tr>
						  </c:forEach>
						</tbody>
					  </table>
					  <!-- 分页功能 start -->
					  <div class="row">
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
						  <input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onKeyDown="gotoPageForEnter(event)"/>
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
				  </div>
				  <!-- /.span -->
				</div>
				<!-- /.row -->
			  </div>
			</div>

     
>>>>>>> bd9f3b21ac0110c0c4dca86081530456b0a0037a
        </div>
        <!-- /.row -->
      </div>
    </div>
  </div>
</div>

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
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
		var patents = uniquePatentNos.join(",");		
		location.href = "<s:url value='/patent/showFriends.html'/>?patents=" + patents;
	}
	function batchGrabFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			return;
		}
			
		var patentNos = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		
		 window.open("<s:url value='/fee/batchGrabFees.html'/>?patents=" + patentNos);		
		
	}	
	
// 	function batchFee() {
// 		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
// 		if (!patentSelected) {
// 			bootbox.alert('请选择专利');
// 			return;
// 		}
			
// 		var patentNos = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		
// 		 window.open("<s:url value='/fee/grabFees.html'/>?patent=" + patentNos);
// 	}	
	
	function getFeeInfo(patentId) {
		window.open("/fee/list?patentId=" + patentId);
	}
	
	
	function changeInternalCode(patentId, internalCode) {
		$.ajax({
			url: "<s:url value='/patent/changeInternalCode.html'/>?patentId=" + patentId + "&internalCode=" + internalCode, 
			type: 'get', 
			success: function(data) {
				//formutil.alertMessage('内部编码修改成功');	
			},
			error: function() {
				formutil.alertMessage('内部编码修改失败');
			}
		});	
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
		
		var url = "<s:url value='/patent/list.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
			url = "<s:url value='/patent/search.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
		</c:if>
		
		
		location.href = url
		
	}
	
	function gotoPageForEnter(event) {
		var e = event ? event : window.event;
				
		if(event.keyCode == 13) {
			gotoPage();
		}
	}
	
	
	function processPageEnter(event, pageInput) {
		var keyCode = event.keyCode ? event.keyCode 
                : event.which ? event.which 
                        : event.charCode;
		var isEnterKey = keyCode == 13;
		if (isEnterKey) {
			location.href = "<s:url value='/patent/search.html'/>?page.currentPage=" + pageInput.value +"&"+"${searchCondition}";
			$(pageInput).unbind('keydown');
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


<script>
var tabs=function(){
    function tag(name,elem){
        return (elem||document).getElementsByTagName(name);
    }
    //获得相应ID的元素
    function id(name){
        return document.getElementById(name);
    }
    function first(elem){
        elem=elem.firstChild;
        return elem&&elem.nodeType==1? elem:next(elem);
    }
    function next(elem){
        do{
            elem=elem.nextSibling;  
        }while(
            elem&&elem.nodeType!=1  
        )
        return elem;
    }
    return {
        set:function(elemId,tabId){
            var elem=tag("li",id(elemId));
            var tabs=tag("div",id(tabId));
            var listNum=elem.length;
            var tabNum=tabs.length;
            for(var i=0;i<listNum;i++){
                    elem[i].onclick=(function(i){
                        return function(){
                            for(var j=0;j<tabNum;j++){
                                if(i==j){
                                    tabs[j].style.display="block";
                                    //alert(elem[j].firstChild);
                                    elem[j].firstChild.className="selected";
                                }
                                else{
                                    tabs[j].style.display="none";
                                    elem[j].firstChild.className="";
                                }
                            }
                        }
                    })(i)
            }
        }
    }
}();
tabs.set("nav","menu_con");//执行      

</script>
<script>
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
</script>
</body>
</html>