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
<title>龙图腾专利管家-星标通知</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_brand_management.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding: 10px 0 0 0;">
					<div class="search-box">
						<table class="search-table" width="960px">
							<form class="form-inline" action="<s:url value='/brandNotice/searchStarTarget.html'/>" method="get">
							<tr>
								<td >发文起始日期</td>
								<td>发文结束日期</td>
								<td>关键字</td>
							</tr>
							<tr>
								<td width="130px">
									<input class="form-control" style="width:108px;height:34px;"  type="text" onclick="WdatePicker({el:'startDispatchDateId',dateFmt:'yyyy-MM-dd'})" id="startDispatchDateId" name="startDispatchDate" placeholder="发文日开始" value="" readonly="readonly" >							  
								</td>
								<td width="130px">
									<input class="lt-input form-control" style="width:108px;height:34px;" type="text" onclick="WdatePicker({el:'endDispatchDateId',dateFmt:'yyyy-MM-dd'})"  id="endDispatchDateId" name="endDispatchDate" placeholder="发文日结束" value="" readonly="readonly" >						  
								</td>
								<td >
									  <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
									  <div class="t-third">
			
									  <table class="search-table">
										  <tr>
											  <td>
												<input name="keyword" style="display:inline;width:400px;" id="keywordId" value="" placeholder="商标类别、申请号/注册号、商标名称、专有权人、法律状态" class="t-input form-control"/>							  
											  </td>
											  <td>
											  	<button class="button button-caution button-rounded" type="submit" style="width:80px;">查询</button>
											  </td>
										  </tr>							  
									  </table>
									  </div>
									
								
								</td>
								
							</tr>
							</form>
							<tr>
								<td>
							  		<a href="javascript:return void" onclick="batchCancelStarTargetNotice()">
										<button style="width:140px;" class="button button-caution button-rounded">批量取消星标通知</button>
									</a>
						  		</td>
							
							</tr>
						</table>
					</div>
				</div>
				<!--search form end-->
				<div class="lt-box">
				  <div class="main-container" id="main-container">
					<div class="row">
					  <div class="col-xs-12">
						<!-- PAGE CONTENT BEGINS -->
						<table id="simple-table" class="table table-striped table-bordered table-hover">
						  <thead>
							<tr class="simple_bag">
							  <th class="center"> <label class="pos-rel">
								<input type="checkbox" class="check-item" id="checkall"  name="checkall" />
								<span class="lbl"></span> </label>
							  </th>
							  <th class="center" width="50">序号</th>
							  <th width="100px">商标类别</th>
							  <th width="160px">申请号/注册号</th>
							  <th>商标名称/图样 </th>
							  <th>专有权人/共享人</th>
							  <th width="110px">申请日/发文日</th>
							  <th>法律状态</th>
							  <th width="160px">通知查看/名称</th>
							  <th width="90px">操作</th>
							</tr>
						  </thead>
						  <tbody>
							<c:forEach items="${notices}" var="notice" varStatus="status">
							  <tr>
								<td class="center" style="text-align:center"><label class="pos-rel"> <span class="batch-share-item">

								  <input style="text-align:center" type="checkbox" class="check-item" notice="${notice.noticeId}" brand="<c:out value='${notice.brand.id}'/>"></span>

								  <span class="lbl"></span></label></td>
								<td class="center" style="text-align:center"> ${status.count + (page.currentPage-1)*page.pageSize}
								
								 </td>
								<td style="text-align:center"><c:out value="${notice.brand.brandCategory.categoryId}"/>
									<br/><c:out value="${notice.brand.brandCategory.categoryName}"/>
								</td>
								<td style="text-align:center"><c:out value="${notice.brand.appNo}"/>
									<br/><c:out value="${notice.brand.brandNo}"/>
								</td>
								<td style="text-align:center"><c:out value="${notice.brand.name}"/>
									<br/><a>下载图样</a>
								</td> 
								<td style="text-align:center">
									<c:out value="${notice.brand.appPerson}"/><br/>
									<c:forEach items="${notice.brand.shareUsers}" var="shareUser" varStatus="s">								
										<a href="javascript:return void" onclick="searchShareUserDetail(${shareUser.userId})" >
						        			<c:out value="${shareUser.username}"/>
						        			<c:if test="${!s.last}">;</c:if>
						        		</a>					        	
						       	 	</c:forEach>
								</td>
					
								
								<td style="text-align:center"><fmt:formatDate value="${notice.brand.appDate}" pattern="yyyy-MM-dd"/>
									<br/><fmt:formatDate value="${notice.dispatchDate}" pattern="yyyy-MM-dd"/>
								</td>
								<td style="text-align:center"><span>${notice.brand.brandLegalStatus.legalStatusName}</span></td>
								<td style="text-align:center" class="date_status">
									<span class="readStatus" id="readStatusSpan${notice.noticeId}" >
										<c:choose>
											<c:when test="${not empty notice.noticeViewStatus }"> 已查看 </c:when>
											<c:otherwise>未查看
											</c:otherwise>
									  	</c:choose>
									</span>
									<br/>
									<span><a><c:out value="${notice.noticeType.noticeTypeDescription}"/></a></span>
								
								</td >
								
								<td style="text-align:center">
									<a href="<s:url value='/notice/showFriends.html'/>?brands=<c:out value='${notice.brand.id}'/>">
									  分享
									  </a>&nbsp;
									  <a target="_blank" href="<s:url value='/brandNotice/getBrandNoticeRemark.html'/>?brandNoticeId=${notice.noticeId}">
								            备注
								    </a>
									  <br/>
									  <a target="_blank" href="">
									  查看
									  </a>&nbsp;
									  <a href="<s:url value='/notice/download.html'/>?notice=${notice.noticeId}" onclick="changeNoticeReadStatus(${notice.noticeId})"> 下载 </a> 
									  
								 </td>
							  </tr>
							</c:forEach>
						  </tbody>
						</table>
						<!-- 分页功能 start -->
						<div style="height:30px;background:#fff;">
							<input type="hidden" value="${wayOfPaging }" id="wayOfPaging"/>
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
			
						<!-- /.span -->
					  </div>
					  <!-- /.row -->
					</div>
				  </div>
				</div>
				<!-- list end -->
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	

<iframe id="noticeExcelFileFrame" style="display:none"></iframe>

       


<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>


<Script language="javascript">
function GetRequest() {
  
  var url = location.search; //获取url中"?"符后的字串
   var theRequest = new Object();
   if (url.indexOf("?") != -1) {
      var str = url.substr(1);
      strs = str.split("&");
      for(var i = 0; i < strs.length; i ++) {
         theRequest[strs[i].split("=")[0]]=(strs[i].split("=")[1]);
      }
   }
   return theRequest;
}
</Script>
<Script language="javascript">

var Request = new Object();
Request = GetRequest();
var select1;
selected_type = Request['selectType'];
//alert(selected_type);
//如果存在 selected_type,循环清空选中 selected的class，并根据值选中指定的selected
if(selected_type!=undefined){
	//alert("存在selected_type");
	$("#nav li a").removeClass("selected");
	
	$("#menu_con .tag").css('display','none');
	if(selected_type='5'){
		$("#nav li a").eq(4).addClass("selected");
		$("#menu_con .tag").eq(4).css('display','block');
	}
}
</Script>


<script type="text/javascript">
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

<script type="text/javascript">
function selectClick(){
	$("#roleUser option[value='1']").hide();
	$("#roleUser option[value='3']").hide();
	$("#roleUser option[value='4']").hide();
	$("#roleUser option[value='5']").hide();
}
function changeRoleUserPaperApplyType(notice,selectElement) {
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
<script type="text/javascript">

// 通知书处理状态
function batchProcessNotice(processStatus) {
		var noticeSelected = false;
		var notices = []

		var noticeCheckboxes = $('tr td input.check-item');
		for (var i = 0; i < noticeCheckboxes.length; i++) {
			if (noticeCheckboxes[i].checked) {
				noticeSelected = true;
				break;
			}
		}
		if (!noticeSelected) {
			$("<div>请选择通知书</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
					}
				}	
			});	
			return;
		}
			
		for (var i = 0; i < noticeCheckboxes.length; i++) {
			if (noticeCheckboxes[i].checked) {
				notices.push(noticeCheckboxes[i].getAttribute("notice"));
			}
		}
		
		$.ajax({
			url: "<s:url value='/notice/batchChangeNoticeViewStatus.html'/>?notices=" + notices, 
			type: 'get', 
			success: function() {
				
			}
		});
		
		
		$.ajax({
			url: "<s:url value='/notice/processNotices.html'/>?notices=" + notices + "&processStatus=" + processStatus, 
			type: 'get', 
			success: function(data) {
				$("<div>操作成功</div>").dialog({
					modal: true,
					buttons: {
						Ok: function() {
							$(this).dialog("close");
							location.reload(); 
						}
					}	
				});
			}
		});			
		
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
			jQuery(function($) {
				//initiate dataTables plugin

				//And for the first simple table, which doesn't have TableTools or dataTables
				//select/deselect all rows according to table header checkbox
				var active_class = 'active';
				$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
					var th_checked = this.checked;//checkbox inside "TH" table header
					
					$(this).closest('table').find('tbody > tr').each(function(){
						var row = this;
						if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
						else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
					});
				});
				
				//select/deselect a row when the checkbox is checked/unchecked
				$('#simple-table').on('click', 'td input[type=checkbox]' , function(){
					var $row = $(this).closest('tr');
					if(this.checked) $row.addClass(active_class);
					else $row.removeClass(active_class);
				});
			
				
			
				/********************************/
				//add tooltip for small view action buttons in dropdown menu
				$('[data-rel="tooltip"]').tooltip({placement: tooltip_placement});
				
				//tooltip placement on right or left
				function tooltip_placement(context, source) {
					var $source = $(source);
					var $parent = $source.closest('table')
					var off1 = $parent.offset();
					var w1 = $parent.width();
			
					var off2 = $source.offset();
					//var w2 = $source.width();
			
					if( parseInt(off2.left) < parseInt(off1.left) + parseInt(w1 / 2) ) return 'right';
					return 'left';
				}
				
			
			})
		</script> 

<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.check-item', 'tr td input.check-item');
		formutil.clickItemCheckbox('tr th input.check-item', 'tr td input.check-item');
	});
	
	$(function(){
		//date_status  treatment_status qixian
		
		
		
		  $(".date_status").each(function () {
			  var list_name=$(this).children(".treatment_status").find("option:selected").val();
			 //alert(list_name);
			  if (list_name!=1)
			  {
				  $(this).children(".qixian").css("display","none");
			 
			  }
			   
		   });	
		
		
	});	
	function batchShare() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniquePatentNos = [];
		if (!patentSelected) {
			//formutil.alertMessage('请选择专利');
			formutil.alertMessage('请选择专利');
			return;
		}
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");
				
		location.href = "<s:url value='/patent/showFriends.html'/>?patents=" + patents;
	}
	
	
	function batchGrabFees(){
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniquePatentNos = [];
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			return;
		}
		
		
		var patents_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patent');
		for (var i = 0; i < patents_checked.length; i++) {
			if ($.inArray(patents_checked[i], uniquePatentNos) == -1) {
				uniquePatentNos.push(patents_checked[i]);
			}
		}		
		var patents = uniquePatentNos.join(",");		
		window.open("<s:url value='/fee/batchGrabFees.html'/>?patents=" + patents);		
		
	}	
	function batchFee() {
		var patentSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		
		if (!patentSelected) {
			formutil.alertMessage('请选择专利');
			return;
		}
			
		var patentNos = formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'patent');
		
		 window.open("<s:url value='/patent/showFriends.html'/>?patentNos=" + patentNos);
	}	
	
	function getFeeInfo(patentId) {
		window.open("/fee/list?patentId=" + patentId);
	}
	
	
	function gotoPage() {
		var pageNo = document.getElementById("page.pageNo").value;
		
		if(isNaN(pageNo)){
			alert("请输入数值");
			return;
		}
		
		if(pageNo==""){
			alert("请输入数值")
			return;
		}
		
		pageNo=parseInt(pageNo);
		
		if(pageNo<1 || pageNo > parseInt("${page.totalPages}")){
			alert("只能输入1-${page.totalPages}之间的数值");
			return;
		}
		var wayOfPaging="${wayOfPaging}";
		var url = null;
		if(wayOfPaging=="normal"){
			url = "<s:url value='/brandNotice/noticeStarTargetList.html'/>?currentPage=" + pageNo;
		}else if(wayOfPaging=="unreadNotice"){
			url = "<s:url value='/brandNotice/unreadNotice.html'/>?currentPage=" + pageNo;
			
		}else{
			url = "<s:url value='/brandNotice/noticeStarTargetList.html'/>?currentPage=" + pageNo;
			
		}
		
		<c:if test="${searchCondition != null}">
				url = "<s:url value='/brandNotice/search.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
		</c:if>
		
		location.href = url;
	}
	
	function gotoPageForEnter(event) {
		var e = event ? event : window.event;
				
		if(event.keyCode == 13) {
			gotoPage();
		}
	}
	
	function exportNotices(){
		var noticeSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		
		if (!noticeSelected) {
			formutil.alertMessage('请选择要导出的通知书');
			return;
		}
		var notices = formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'notice');
		var iframe = document.getElementById('noticeExcelFileFrame');
		iframe.src = "<s:url value='/notice/exportNotices.html'/>?noticeIds=" + notices;
		
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
	function batchCancelStarTargetNotice() {
		var noticeSelected = formutil.anyCheckboxItemSelected('tr td input.check-item');
		var uniqueNoticeNos = [];
		if (!noticeSelected) {
			formutil.alertMessage('请选择通知书');
			return;
		}
		var notices_checked=formutil.getAllCheckedCheckboxValues('tr td input.check-item', 'notice');
		for (var i = 0; i < notices_checked.length; i++) {
			if ($.inArray(notices_checked[i], uniqueNoticeNos) == -1) {
				uniqueNoticeNos.push(notices_checked[i]);
				
			}
		}
		var noticeIds = uniqueNoticeNos.join(",");
		$.ajax({
			url:"<s:url value='/brandNotice/batchCancelStarTargetMonitor.html'/>?noticeIds=" + noticeIds,
			type:"post",
			success: function(data) {
				formutil.alertMessage(data,true);	
			},
			error: function() {
				formutil.alertMessage('批量监控失败');
			}
		});
	}
		
</script>
<script type="text/javascript">
function batchChangeNoticePaperType(paperApplyType) {
	var noticeSelected = false;
	var notices = []

	var noticeCheckboxes = $('tr td input.check-item');
	for (var i = 0; i < noticeCheckboxes.length; i++) {
		if (noticeCheckboxes[i].checked) {
			noticeSelected = true;
			break;
		}
	}
	if (!noticeSelected) {
		$("<div>请选择通知书</div>").dialog({
			modal: true,
			buttons: {
				Ok: function() {
					$(this).dialog("close");
				}
			}	
		});	
		return;
	}
		
	for (var i = 0; i < noticeCheckboxes.length; i++) {
		if (noticeCheckboxes[i].checked) {
			notices.push(noticeCheckboxes[i].getAttribute("notice"));
		}
	}	
	$.ajax({
		url: "<s:url value='/notice/batchChangePaperType.html'/>?notices=" + notices + "&paperApplyType=" + paperApplyType, 
		type: 'get', 
		success: function() {
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
						location.reload();
					}
				}	
			});
		}
	});			
	
}


function batchChangeNoticeViewStatus() {
	var noticeSelected = false;
	var notices = []

	var noticeCheckboxes = $('tr td input.check-item');
	for (var i = 0; i < noticeCheckboxes.length; i++) {
		if (noticeCheckboxes[i].checked) {
			noticeSelected = true;
			break;
		}
	}
	if (!noticeSelected) {
		$("<div>请选择通知书</div>").dialog({
			modal: true,
			buttons: {
				Ok: function() {
					$(this).dialog("close");
				}
			}	
		});	
		return;
	}
		
	for (var i = 0; i < noticeCheckboxes.length; i++) {
		if (noticeCheckboxes[i].checked) {
			notices.push(noticeCheckboxes[i].getAttribute("notice"));
		}
	}	
	$.ajax({
		url: "<s:url value='/notice/batchChangeNoticeViewStatus.html'/>?notices=" + notices, 
		type: 'get', 
		success: function() {
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
						$(this).dialog("close");
						location.reload();
					}
				}	
			});
		}
	});			
	
}

function changeNoticeReadStatus(noticeId){
	setTimeout(function(){
		$.ajax({
			url: "<s:url value='/notice/changeNoticeReadStatus.html'/>?notices=" + noticeId, 
			type: 'get', 
			dataType:"text",
			success: function(totalCount) {
				$("#unreadNoticeCountForA").text("未查看"+totalCount+"件");
				$("#readStatusSpan"+noticeId).html("已查看");
			}
		});		
	}, 100);	
	
}

function searchShareUserDetail(shareUserId){
	var url = "<s:url value='/user/searchShareUserDetail.html'/>?shareUserId=" + shareUserId;
	window.open(url);
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
    <%@ include file="_footer_js.jsp" %>
</body>
</html>