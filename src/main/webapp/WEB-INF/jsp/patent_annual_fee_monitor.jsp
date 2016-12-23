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
				</div>
				<!-- menu end -->
				<!-- search begin -->
				
			
				
				<div class="lt-box">
					<div class="search-box">
						<table class="search-table" width="100%">
							<tr>
								<td>
									<a href="javascript:return void" onclick="batchCancelAnnualFeeMonitor()" >
										<button style="width:140px;" class="button button-primary  button-rounded"  data-toggle="tooltip" data-placement="right">批量取消年费监控</button>
									</a>
								</td>
								<td>
									<form class="form-inline" action="<s:url value='/patent/searchUserAnnualFeeMonitorPatents.html'/>" method="get">
									  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
									  <div class="t-third">
			
									  <table class="search-table">
										  <tr>
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
								
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!--search form end-->
				<div class="lt-box">
<%-- 					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
					  </span> </div> --%>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th class="center" width="15"> <label class="pos-rel">
							<input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
							<span class="lbl"></span> </label>
						  </th>
						  <th class="center" width="35">序号</th>
						  <th width="65">专利类型</th>
						  <th width="100">申请号/专利号</th>
						  <th width="130">专利名称</th>
						  <th width="90">第一申请人 </th>
						  <th width="110" class="hidden-480"><i class="ace-icon fa fa-clock-o bigger-110 hidden-480"></i>申请日/年费日</th>
						  <th width="110">更新时间/案件状态</th>
						  <th width="180">内部编码/共享人</th>
						  <th width="130">交易类型/价格/状态</th>
						  <th width="80">操作</th>
						</tr>
					  </thead>
					  <tbody>
						<c:forEach items="${patents}" var="patent" varStatus="status">
						  <tr >
							<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">
							  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
							  </span>
							  <span class="lbl"></span></label></td>
							<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
							<td style="text-align:center"><c:out value="${patent.patentType.typeDescription}"/></td>
							<td style="text-align:center">
								<a href="<s:url value='/patent/getOverviewPatent.html'/>?appNo=${patent.appNo}" target="_blank">
									<c:out value="${patent.appNo}"/>
								</a>
							</td>
							<td class="hidden-480" style="text-align:center"><c:out value="${patent.name}"/></td>
							<td style="text-align:center"><c:out value="${patent.appPerson}"/></td>
							<td class="hidden-480" style="text-align:center">
								<fmt:formatDate value="${patent.appDate}" pattern="yyyy-MM-dd"/>
								<br/>
								<c:choose>
									<c:when test="${patent.isWithinMonth==1 }">
										<font color="red"><fmt:formatDate value="${patent.appDate}" pattern="M月dd日"/></font>
									</c:when>
									<c:otherwise>
										<fmt:formatDate value="${patent.appDate}" pattern="M月dd日"/>
									</c:otherwise>
								</c:choose>
								
							
							</td>
							<td class="hidden-480" style="text-align:center">
								<fmt:formatDate value="${patent.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/><br/>
								<c:out value="${patent.patentStatusText}"/>
							</td>
							<td style="text-align:center">
								<%-- <input style="width:180px;" type="text" value="<c:out value='${patent.internalCode}'/>" size="90" onChange="changeInternalCode('<c:out value='${patent.patentId}'/>', this.value)"/> --%>
								<c:out value='${patent.internalCode}'/>
								<br/>
								<c:forEach items="${patent.shareUsers}" var="shareUser" varStatus="s">								
									<a href="javascript:return void" onclick="searchShareUserDetail(${shareUser.userId})" >
						        		<c:out value="${shareUser.username}"/>
						        		<c:if test="${!s.last}">;</c:if>
						        	</a>					        	
						        </c:forEach>
							</td>
							<td style="text-align:center" width="120px">
								<c:if test="${not empty patent.salePatentGood }">
									<c:if test="${patent.salePatentGood.transactionType==1 }">转让价</c:if>
									<c:if test="${patent.salePatentGood.transactionType==2 }">许可价</c:if>
									${patent.salePatentGood.price }元<br/>
									<c:if test="${patent.transactionStatus==1}">
										待交易
				 	                </c:if>
				 	                 <c:if test="${patent.transactionStatus==2}">
					                  	<font color="red">已预订</font>
				 	                  </c:if>
				 	                 <c:if test="${patent.transactionStatus==3}">
					                  	<font color="red">已付款待变更</font>
				 	                  </c:if>
				 	                  <c:if test="${patent.transactionStatus==4}">
					                  	<font color="red">已变更待合格</font>
				 	                  </c:if>
				 	                 <c:if test="${patent.transactionStatus==5}">
					                  	<font color="red">交易成功</font>
				 	                  </c:if>
								</c:if>
								<c:if test="${empty patent.salePatentGood }">
	 			                  	   <a target="_blank" href="<s:url value='/patent/goods.html'/>?patent=<c:out value='${patent.patentId}'/>">
					                  	<button class="t-btn2" value="1" data-toggle="tooltip" data-placement="bottom" title="加入r.lotut.com商城">发布交易</button> 
				 	                  </a>
								</c:if>
								
							</td>
							<td style="text-align:center"><a  href="<s:url value='/patent/showFriends.html'/>?patents=<c:out value='${patent.patentId}'/>">
							  分享
							  </a>&nbsp;
							  <a target="_blank" href="<s:url value='/fee/grabFees.html'/>?patent=<c:out value='${patent.patentId}'/>">
							  交费
							  </a>
							  <br>
							   <a   style="color:red" href="javascript:return void" onclick="delectPatent('<c:out value='${patent.patentId}'/>')">
							  删除
							  </a>
							  <a target="_blank" href="<s:url value='/patent/showRemarks.html'/>?patentId=<c:out value='${patent.patentId}'/>">
							  备注
							  </a>
							 <a target="_blank" href="<s:url value='/patent/showPatentDetail.html'/>?patentId=${patent.patentId}&ownerId=${patent.ownerId}">
							  修改
							  </a> 
							  <br>
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
<iframe id="patentExcelFileFrame" style="display:none"></iframe>	

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
$(function () {
	  $('[data-toggle="tooltip"]').tooltip()
	});
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	
 	function batchAddGoods() {
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
		
		var patentIds = uniquePatentNos.join(",");
		$.ajax({
			url:"<s:url value='/patent/batchAddGoods.html'/>?patentIds=" + patentIds,
			type:"get",
				success: function(data) {
					formutil.alertMessage(data,true);	
				},
				error: function() {
					formutil.alertMessage('批量发布失败');
				}
		});
	}
	 
	
	
	
	
	
	function batchDelectPatents() {
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
		var patentIds = uniquePatentNos.join(",");
		$.ajax({
			url:"<s:url value='/patent/deletePatents.html'/>?patentIds=" + patentIds,
			type:"get",
				success: function(data) {
					formutil.alertMessage('删除操作成功',true);	
				},
				error: function() {
					formutil.alertMessage('删除操作失败',true);
				}
		});
	}
	
	

	//改变日期显示颜色
	$(function() {
	   $(".fee_date").each(function (){
		 var fee_date=$(this).html();
		 var value = fee_date.replace(/[^0-9]/ig,"|");
		 var array_fee_date = value.split("|");
		 var fee_month=array_fee_date[0];
		 var fee_day=array_fee_date[1];
		 var fee_days=Number(fee_month)*30+Number(fee_day);

		 oDate = new Date();
		 var month=oDate.getMonth()+1;
		 var day=oDate.getDate();
		 var current_days=month*30+day;
		 var Differ=current_days-fee_days;
		 
	     if(Differ<31&&Differ>-31){
	 		$(this).addClass("red");

	 	 }	

		   
	   });	

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
		
		var url = "<s:url value='/patent/getUserAnnualFeeMonitorPatents.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
			url = "<s:url value='/patent/searchUserAnnualFeeMonitorPatents.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
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
	
	function exportPatents(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.patent-check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择要导出的专利');
			return;
		}
		var patents = formutil.getAllCheckedCheckboxValues('tr td input.patent-check-item', 'patent');
		var iframe = document.getElementById('patentExcelFileFrame');
		iframe.src = "<s:url value='/patent/exportPatents.html'/>?patentIds=" + patents;
		
	}
	
	function searchShareUserDetail(shareUserId){
		var url = "<s:url value='/user/searchShareUserDetail.html'/>?shareUserId=" + shareUserId;
		window.open(url);
	}
	
	function exportLOTUTExcel(){
		var iframe = document.getElementById('patentExcelFileFrame');
		iframe.src = "<s:url value='/patent/exportLOTUTExcel.html'/>";
		
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

function  delectPatent(patentIds){
	$.ajax({
		url:"<s:url value='/patent/deletePatents.html'/>?patentIds=" + patentIds,
		type:"get",
			success: function(data) {
				formutil.alertMessage('删除操作成功',true);	
			},
			error: function() {
				formutil.alertMessage('删除操作失败',true);
			}
	});
}

function batchCancelAnnualFeeMonitor() {
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
	var patentIds = uniquePatentNos.join(",");
	$.ajax({
		url:"<s:url value='/patent/batchCancelAnnualFeeMonitor.html'/>?patentIds=" + patentIds,
		type:"post",
		async:false,
		success: function(data) {
			formutil.alertMessage(data,true);
			window.location.reload();
		},
		error: function() {
			formutil.alertMessage('批量取消监控失败');
		}
	});
}
</script>

</body>