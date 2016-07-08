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
<title>龙图腾专利管家－我的专利！</title>
<%@ include file="_css.jsp" %>
<body>
<%@ include file="_top.jsp" %>



<div class="lt-con" style="min-width:1100px;">



	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">

		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <div class="col-xs-offset-1 col-xs-11">
		  
			<div class="lt-right">
			
			
				<div style="height:10px;"></div>
				<!-- menu begin -->
				<div class="lt-box">

					<div id="menu">
					  <div style="height:33px;">
						<ul id="nav">
						  <p>快捷处理：</p>
						  <li><a href="#" class="selected">专利类型</a></li>
						  <li><a href="#" class="">案件状态</a></li>
						  <li><a style="color:#FF0000;" href="<s:url value='/notice/list.html?selectType=5&currentPage=1'/>" class="">通知书监控中</a></li>
						  <li><a style="color:#FF0000;" href="<s:url value='/fee/monitoredFeeList.html?selectType=4&currentPage=1'/>" class="">交费监控中</a></li>
						</ul>
					  </div>
						
					  <div id="menu_con">
					  						
						<div class="tag" style="display:block; margin-left:-20px;"> 

						  <ul class="qxjk-ul"><li>
							<a href="<s:url value='/patent/search.html?page.currentPage=1&patentType=1'/>">
							发明专利 (<c:out value='${patentTypeCount[(1).intValue()]["patentCount"]}' default="0"/>)</a>
							</li>
							<li>
							 <a href="<s:url value='/patent/search.html?page.currentPage=1&patentType=2'/>">
							实用新型 (<c:out value='${patentTypeCount[(2).intValue()]["patentCount"]}' default="0"/>)
							</a> 
							</li>
							
							<li>
							<a href="<s:url value='/patent/search.html?page.currentPage=1&patentType=3'/>">外观设计(<c:out value='${patentTypeCount[(3).intValue()]["patentCount"]}' default="0"/>)
							</a> 							
							</li>

						  </ul>	    
						
						
						</div>
						<div class="tag"  style="display:none">
						  <ul class="qxjk-ul">
						  	<li>	      
								<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=1'/>">
								等待申请费 (<c:out value='${patentStatusCount[(1).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li> 
							
							<li>
							   	<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=2'/>">
								待答复 (<c:out value='${patentStatusCount[(2).intValue()]["patentCount"]}' default="0"/>)
								</a> 
							</li>
							
							<li>
								<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=3'/>">
								等年登印费 (<c:out value='${patentStatusCount[(3).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li>
							
							<li>
								<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=4'/>">
								待恢复 (<c:out value='${patentStatusCount[(4).intValue()]["patentCount"]}' default="0"/>)
								</a> 
							</li>
							
							<li>
							<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=5'/>">
							失效(<c:out value='${patentStatusCount[(5).intValue()]["patentCount"]}' default="0"/>)
							</a> 
							</li>
							
							<li>
								<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=6'/>">
								专利权维持 (<c:out value='${patentStatusCount[(6).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li>
							
							<li>
								<a href="<s:url value='/patent/search.html?page.currentPage=1&patentStatus=7'/>">
								其他 (<c:out value='${patentStatusCount[(7).intValue()]["patentCount"]}' default="0"/>)
								</a>
							</li>
						  </ul>
						</div>
					  </div>
					</div>				
				
				
				</div>
				<!-- menu end -->
				<!-- search begin -->
				
			
				
				<div class="lt-box">
					<div class="search-box">
					
					
					
						<form class="form-inline" action="<s:url value='/patent/search.html'/>" method="get">
						  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
						  <div class="t-third">

						  <table class="search-table">
							  <tr>
							  <td>专利类型</td>
							  <td>专利状态</td>
							  <td>申请日开始</td>
							  <td></td>
							  <td>申请日结束</td>
							  <td>关键字</td>
							  <td></td>	
							  </tr>
							  <tr>
							  <td>
								<select  style="width:100px;" class="selectPointOfInterest form-control" name="patentType">
								  <option value="">全部</option>
								  <c:forEach items="${allPatentTypes}" var="patentType">
									<option value="<c:out value='${patentType.patentTypeId}'/>">
									<c:out value="${patentType.typeDescription}"/>
									</option>
								  </c:forEach>
								</select>
							  </td>
							  <td>
								<select style="width:121px;" class="form-control" name="patentStatus">
								  <option value="">全部</option>
								  <c:forEach items="${allPatentStatus}" var="patentStatus">
									<option value="<c:out value='${patentStatus.patentStatusId}'/>">
									<c:out value="${patentStatus.statusDescription}"/>
									</option>
								  </c:forEach>
								</select>
							  </td>
							  <td>
								<input class="form-control" style="width:108px;height:34px;"  type="text" onclick="WdatePicker({el:'startAppDateId'})" id="startAppDateId" name="startAppDate" placeholder="申请日开始" value="" readonly="readonly" >							  
							  </td>
							  <td>-</td>
							  <td>
								<input class="lt-input form-control" style="width:108px;height:34px;" type="text" onclick="WdatePicker({el:'endAppDateId'})"  id="endAppDateId" name="endAppDate" placeholder="申请日结束" value="" readonly="readonly" >
							  </td>
							  <td>
								<input style="width:300px;height:34px;" name="keyword" id="keywordId" value="" placeholder="申请号/名称/申请人/内部编码/案件状态" class="t-input form-control"/>							  
							  </td>
							  <td>
							  <button class="button button-caution button-rounded" type="submit" style="width:80px;">查询</button>
							  </td>
							  </tr>							  
						  </table>
						  </div>
						</form>
					</div>
				</div>
				<!--search form end-->
				<div class="lt-box">
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  <div class="ta-top" style="margin-left:8px;">
					  	<table class="search-table">
					  	<tr>
					  	<td>
						  	<a href="javascript:return void"  onclick="batchGrabFees()">
							<button class="button button-caution button-rounded">在线交费</button> 
							</a>
						</td>
					  	<td>
							<a href="javascript:return void" onclick="batchShare()" style="margin-left:50px;">
							<button class="button button-primary  button-rounded">批量分享</button>
							</a> 
						</td>						
					  	</tr>
					  	</table>
					  </div>
					  </span> </div>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="15"> <label class="pos-rel">
							<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							<span class="lbl"></span> </label>
						  </th>
						  <th class="center" width="35">序号</th>
						  <th width="60">专利类型</th>
						  <th width="110">申请号/专利号</th>
						  <th width="170">专利名称</th>
						  <th width="90">第一申请人 </th>
						  <th width="90" class="hidden-480"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>申请日</th>
						  <th width="60">缴年费日</th>
						  <th width="70">案件状态</th>
						  <th width="50">内部编码</th>
						  <th width="90">共享人</th>
						  <th width="80">操作</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${patents}" var="patent" varStatus="status">
						  <tr >
							<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
							  <span class="lbl"></span></label></td>
							<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
														<td style="text-align:center"><c:out value="${patent.patentType.typeDescription}"/></td>
							<td style="text-align:center"><c:out value="${patent.appNo}"/>
							</td>
							<td class="hidden-480" style="text-align:center"><c:out value="${patent.name}"/></td>
							<td style="text-align:center"><c:out value="${patent.appPerson}"/></td>
							<td class="hidden-480" style="text-align:center"><fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/></td>
							<td class="hidden-480" style="text-align:center"><fmt:formatDate value="${patent.appDate}" pattern="M月dd日"/></td>
							<td style="text-align:center"><c:out value="${patent.patentStatusText}"/></td>
							<td style="text-align:center"><input style="width:60px;" type="text" value="<c:out value='${patent.internalCode}'/>" size="30" onChange="changeInternalCode('<c:out value='${patent.patentId}'/>', this.value)">
							</td>
							<td style="text-align:center"><c:out value="${patent.shareUsersAsString}"/>
							</td>
							<td style="text-align:center"><a  href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${patent.patentId}'/>">
							  分享
							  </a>&nbsp;
							  <a target="_blank" href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${patent.patentId}'/>">
							  交费
							  </a>
							  <br> 
							  <se:authorize access="hasRole('ROLE_TRADER')">
								  <c:if test="${patent.transactionStatus==null}">
	 			                  	   <a target="_blank" href="<s:url value='/patent/goods.html'/>?patent=<c:out value='${patent.patentId}'/>">
					                  	<button class="t-btn2">发布至交易网</button> 
				 	                  </a>
				 	                </c:if>
				 	                 <c:if test="${patent.transactionStatus != null}">
	 			                  	   <a >
					                  	<font color="red">${patent.transactionStatus}</font>
				 	                  </a>
				 	                  </c:if>
			 	               </se:authorize> 
							  </td>
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
			
		  </div>
		  
			<!--right end-->
		</div>
	</div>	
</div>

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
	
	
	function getFeeInfo(patentId) {
		window.open("/fee/list?patentId=" + patentId);
	}
	
	
	function changeInternalCode(patentId, internalCode) {
		$.ajax({
			url: "<s:url value='/patent/changeInternalCode.html'/>?patentId=" + patentId + "&internalCode=" + internalCode, 
			type: 'get', 
			success: function() {
				formutil.alertMessage('内部编码修改成功');	
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
	
	function exportFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择要导出的专利');
			return;
		}
		var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		var iframe = document.getElementById('patentExcelFileFrame');
		iframe.src = "<s:url value='/patent/exportPatents.html'/>?patentIds=" + patents;
		
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

</body>