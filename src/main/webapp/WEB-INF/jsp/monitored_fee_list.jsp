<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<title>官方监控</title>

<!-- bootstrap & fontawesome -->
<link rel="stylesheet" href="<s:url value='/static/css/jquery-ui.min.css'/>" />
<link rel="stylesheet" href="<s:url value='/static/css/bootstrap.css'/>" />
<link rel="stylesheet" href="<s:url value='/static/css/font-awesome.css'/>" />

<!-- page specific plugin styles -->

<!-- text fonts -->
<link rel="stylesheet" href="<s:url value='/static/css/ace-fonts.css'/>" />

<!-- ace styles -->
<link rel="stylesheet" href="<s:url value='/static/css/ace.css'/>" class="ace-main-stylesheet" id="main-ace-style" />

<!--[if lte IE 9]>
			<link rel="stylesheet" href="../assets/css/ace-part2.css" class="ace-main-stylesheet" />
		<![endif]-->

<!--[if lte IE 9]>
		  <link rel="stylesheet" href="../assets/css/ace-ie.css" />
		<![endif]-->

<!-- inline styles related to this page -->

<!-- ace settings handler -->
<script src="<s:url value='/static/js/ace-extra.js'/>"></script>

<!-- HTML5shiv and Respond.js for IE8 to support HTML5 elements and media queries -->

<!--[if lte IE 8]>
		<script src="../assets/js/html5shiv.js"></script>
		<script src="../assets/js/respond.js"></script>
		<![endif]-->	
	
</head>
<body class="no-skin">
<!-- #section:basics/navbar.layout -->
<div id="navbar" class="navbar navbar-default"> 
  <script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed')}catch(e){}
			</script>
  <div class="navbar-container" id="navbar-container"> 
    <!-- #section:basics/sidebar.mobile.toggle -->
    <button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar"> <span class="sr-only">Toggle sidebar</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
    
    <!-- /section:basics/sidebar.mobile.toggle -->
    <div class="navbar-header pull-left"> 
      <!-- #section:basics/navbar.layout.brand --> 
      <a href="#" class="navbar-brand"> <small> <i class="fa fa-leaf"></i> 龙图腾专利管理系统 </small> </a> 
      
      <!-- /section:basics/navbar.layout.brand --> 
      
      <!-- #section:basics/navbar.toggle --> 
      
      <!-- /section:basics/navbar.toggle --> 
    </div>
    
    <!-- #section:basics/navbar.dropdown -->
    <div class="navbar-buttons navbar-header pull-right" role="navigation">
      <ul class="nav ace-nav">
        <li class="purple"> 
        	<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
        		<i class="ace-icon fa fa-bell icon-animated-bell"></i> 
        		<span class="badge badge-important">8</span> 
        	</a>
			<ul class="dropdown-menu-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">
				<li class="dropdown-header">
					<i class="ace-icon fa fa-exclamation-triangle"></i>
					8 条消息
				</li>
	
				<li class="dropdown-content">
					<ul class="dropdown-menu dropdown-navbar navbar-pink">
						<li>
							<a href="#">
								<div class="clearfix">
									<span class="pull-left">
										<i class="btn btn-xs no-hover btn-pink fa fa-comment"></i>
										新的消息
									</span>
									<span class="pull-right badge badge-info">+4</span>
								</div>
							</a>
						</li>
		
						<li>
							<a href="#">
								<div class="clearfix">
									<span class="pull-left">
										<i class="btn btn-xs btn-primary fa fa-user"></i>
										好友请求
									</span>
									<span class="pull-right badge badge-success">+4</span>
								</div>
							</a>
						</li>
	
					</ul>
				</li>
	
				<li class="dropdown-footer">
					<a href="#">
						See all notifications
						<i class="ace-icon fa fa-arrow-right"></i>
					</a>
				</li>
			</ul>
 
        </li>
		<!-- #section:basics/navbar.user_menu -->
		<li class="light-blue" style="z-index:9999;">
			<a data-toggle="dropdown" href="#" class="dropdown-toggle">
				<img class="nav-user-photo" src="<s:url value='/static/avatars/user.jpg'/>" alt="Jason's Photo" />
			<span class="user-info">
				<small>Welcome,</small>
				<se:authentication property="principal.username" />
			</span>
		
			<i class="ace-icon fa fa-caret-down"></i>
			</a>
		
				<ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
				
					<li>
						<a href="<s:url value='/user/changePasswordForm.html'/>">
							<i class="ace-icon fa fa-user"></i>
							修改密码
						</a>
					</li>
				
					<li class="divider"></li>
					<li>
						<a href="javascript:$('#logoutForm').submit();">
							<i class="ace-icon fa fa-power-off"></i>
							退出
						</a>
					</li>
						<form action="<s:url value='/user/logout.html'/>" method="post" id="logoutForm">
						            <se:csrfInput/>
									<input type="submit" style="display:none;" />
						             
						</form>								
		
					</ul>
		</li>
  

        <!-- /section:basics/navbar.user_menu -->
      </ul>
    </div>
    
    <!-- /section:basics/navbar.dropdown --> 
  </div>
  <!-- /.navbar-container --> 
</div>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">

<!-- sidebar -->
    <div id="sidebar" class="sidebar                  responsive"> 
     
      <div class="sidebar-shortcuts" id="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
          <button class="btn btn-success"> <i class="ace-icon fa fa-signal"></i> </button>
          <button class="btn btn-info"> <i class="ace-icon fa fa-pencil"></i> </button>
          
          <!-- #section:basics/sidebar.layout.shortcuts -->
          <button class="btn btn-warning"> <i class="ace-icon fa fa-users"></i> </button>
          <button class="btn btn-danger"> <i class="ace-icon fa fa-cogs"></i> </button>
          
          <!-- /section:basics/sidebar.layout.shortcuts --> 
        </div>
        <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini"> <span class="btn btn-success"></span> <span class="btn btn-info"></span> <span class="btn btn-warning"></span> <span class="btn btn-danger"></span> </div>
      </div>
      <!-- /.sidebar-shortcuts -->
      
      <ul class="nav nav-list">
        <li> <a href="<s:url value='/main.html'/>"> <i class="menu-icon fa fa-tachometer"></i> <span class="menu-text"> 控制台 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/patent/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-desktop"></i> <span class="menu-text"> 我的专利 </span> </a> </li>
        <li class=""> <a href="<s:url value='/notice/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-list"></i> <span class="menu-text"> 我的通知书 </span> </a> </li>
        <li class=""> <a href="<s:url value='/friend/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text"> 好友管理 </span> </a> </li>
        <li class=""> <a href="<s:url value='/sharePatent/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-list-alt"></i> <span class="menu-text"> 分享管理 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/patent/showUploadForm.html'/>"> <i class="menu-icon fa fa-calendar"></i> <span class="menu-text"> 添加专利 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/notice/showUploadForm.html'/>"> <i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> 添加通知书 </span> </a> <b class="arrow"></b> </li>
        <li class="active"> <a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>"><i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> 官费监控 </span> </a> </li>
      </ul>
      <!-- /.nav-list --> 
      
      <!-- #section:basics/sidebar.layout.minimize -->
      <div class="sidebar-toggle sidebar-collapse" id="sidebar-collapse"> <i class="ace-icon fa fa-angle-double-left" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i> </div>
      
      <!-- /section:basics/sidebar.layout.minimize --> 
      <script type="text/javascript">
                        try{ace.settings.check('sidebar' , 'collapsed')}catch(e){}
                    </script> 
    </div>

<!-- sidebar -->
	<div class="main-content">
		<div class="main-content-inner">
    <!-- #section:basics/content.breadcrumbs -->
            <div class="breadcrumbs" id="breadcrumbs"> 
              <script type="text/javascript">
                                        try{ace.settings.check('breadcrumbs' , 'fixed')}catch(e){}
                                    </script>
              <ul class="breadcrumb">
                <li> <i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a> </li>
                <li> <a href="#">官费监控</a> </li>
              </ul>
              <!-- /.breadcrumb --> 
            </div>
            
    <!-- /section:basics/content.breadcrumbs -->  
    		<div class="page-content"> 


               <div class="search-header" style="margin:0 auto;width:610px;">
				<form action="<s:url value='/fee/search.html'/>" method="get">
                    <div class="widget-box collapsed" style="border:none;">
                        <div class="widget-header" style="background:none;padding:0px;border:none; margin-top:30px;">
                
                            <span class="widget-toolbar" style="border:none;padding:0px;">
                            <input type="hidden" id="default.page.nextPage" name="page.currentPage" value="1"/>
                            <input type="text" id="form-field-1" style="height:45px;width:450px;" name="keyword" id="keywordId" placeholder="申请号/名称/申请人/内部编码" value="" /><button class="btn btn-info" type="submit" style="height:45px;">搜索</button>
                            
                                <a href="#" data-action="collapse" style="margin-left:10px;">
                                    <button type="button" class="btn btn-sm btn-success">高级搜索</button>
                                    <i class="ace-icon fa fa-chevron-up" style="display:none;"></i>
                                </a>
                            </span>
                        </div>
                        <div class="widget-body" style="display: none;border-left:1px solid #CCC;border-right:1px solid #CCC;border-bottom:1px solid #CCC;boder-top:none;width:512px;margin-left:5px;">
                        	
	                            <div class="widget-main">
	                                <div>
	                                专利类型
	                                <select id="patentType" name="patentType" >
									  <option value="">全部</option>
									  <option value="1">发明</option>
									  <option value="2">实用新型</option>
									  <option value="3">外观设计</option>
									
	                                </select>
	                                
	                                	
	                                </div>
	                                <div style="margin-top:10px;">缴费状态
	                                <select id="paymentStatus" name="paymentStatus" >
									  <option value="">全部</option>
									  <option value="1">应缴</option>
									  <option value="2">已支付</option>	
									  <option value="3">已缴</option>							 
	                                </select>	
			                  
	                                </div>
	                                <div style="margin-top:10px;">费用类型
	                                <select id="patentStatus" name="patentStatus" >
									  <option value="">全部</option>
									  <option value="1">申请费</option>
									  <option value="3">年登印费</option>
									  <option value="6">维持年费</option>							 
	                                </select>	
			
	                                </div>
	                                <div style="margin-top:10px;">
	                                    <div class="input-group">
	                                    <div style="float:left;line-height: 32px;">缴费截止日</div>
						                <div style="float:left;margin-left: 16px;" class="form-group" style="margin-left:15px;">
							                <div style="float:left;"><input  type="text" class="form-control" id="startAppDateId" name="startDeadline" placeholder="缴费截止日开始" value="" readonly="readonly" onclick="javascript:$('#start_date_img').click()"></div> 
											<div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'startAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="start_date_img"> - </div>
							                </div>	
						                
						                <div style="float:left;" class="form-group">
							                <div style="float:left;"><input type="text" class="form-control" id="endAppDateId" name="endDeadline" placeholder="缴费截止日结束" value="" readonly="readonly" onclick="javascript:$('#end_date_img').click()"> </div> 
											<div style="float:left;margin: 8px;"><img onclick="WdatePicker({el:'endAppDateId'})" src="<s:url value='/static/datepicker/skin/datePicker.gif'/>" width="16" height="22" align="absmiddle" id="end_date_img"></div>
				 							</div>
			 							<div style="clear:both;"></div>	
						                <style>
						            
	                
							             /*.simple_bag th{background:#f5fafe;}*/
							                .ui-jqgrid-view {margin-top: 30px;}
							                #grid-table_cb{border-left: 1px solid #E1E1E1;}
							                </style>			
	                                    </div>
	                                </div>
	                                <div style="width:60px;margin:0 auto;">
	                                <span class="input-group-btn">
										<button type="submit" class="btn btn-purple btn-sm">搜索</button>
									</span>
	                                </div>
	                            </div>
	                    	        
                        </div>
                    </div>
                </div>
                </form>

                <div class="row" style="margin-top:30px;">
                    <div class="col-xs-12"> 
                      <!-- PAGE CONTENT BEGINS -->
                      <div class="row">
                        <div class="col-xs-12">
                          <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;">	                                
	                                <span class="input-group-btn" >
										<a href="javascript:batchUpdateInvoiceTitles()"><button style="margin:8px;" type="button" class="btn btn-info btn-sm">批量修改发票抬头</button></a>							
										<a href="javascript:exportFees()"><button type="button" style="margin:8px;"  class="btn btn-purple btn-sm">批量导出</button></a>
										<a href="javascript:showOrderCreateForm()"><button type="button" class="btn btn-purple btn-sm">在线支付</button></a>
									</span> 
	                                                    
                          </div>
                          <table id="simple-table" class="table table-striped table-bordered table-hover">
                            <thead>
                              <tr class="simple_bag">
                                <th class="center"> <label class="pos-rel">
                                    <input type="checkbox" class="fee-check-item" onclick="calcTotalAmount()">
                                    <span class="lbl"></span> </label>
                                </th>
								<th>序号</th>
								<th>申请号/专利号</th>
								<th>专利名称</th>
								<th>第一申请人</th>
								<th>案件状态</th>
								<th>缴费截止日</th>
								<th>缴费种类</th>
								<th>缴费金额</th>
								<th>发票抬头</th>
								<th>费用状态</th>
                              </tr>
                            </thead>
                            <tbody>
							
							<c:forEach items="${fees}" var="fee" varStatus="status">
								<tr>
									<td>
										<span class="batch-share-item">
											<input type="checkbox" class="fee-check-item" fee="${fee.feeId}" amount="${fee.amount}" onclick="calcTotalAmount()">
										</span>
									</td>
									<td class="center">${status.count + (page.currentPage-1)*page.pageSize}</td>

									<td>${fee.patent.appNo}</td>
									<td>${fee.patent.name}</td>
									<td>${fee.patent.firstAppPerson}</td>
									<td>${fee.patent.patentStatus.statusDescription}</td>
									<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
									<td>${fee.feeType}</td>
									<td>${fee.amount} </td>
									<td><input type="text" value="${fee.invoiceTitle}" 
											onChange="changeInvoiceTitle('${fee.feeId}', this.value)" size="30"></td>
									<td>${fee.paymentStatus.payementStatusDescription}</td>
								</tr>
							</c:forEach>	
								<tr>
									<c:set var="totalAmount" value="0"></c:set>
									<c:forEach items="${fees}" var="fee">
										<c:set var="totalAmount" value="${totalAmount+fee.amount}"></c:set>
									</c:forEach>
									<td colspan="11">总计: ￥<span id="totalAmountSpan">${totalAmount}</span></td>
								</tr>							
                            </tbody>
                          </table>
                          
                          
                        <!-- CS:分页 -->
								<div class="row">
											<c:if test="${searchCondition == null}">
											<div class="col-lg-12">	
														共 ${page.totalPages} 页${page.totalRecords}条记录    第${page.currentPage} 页
														<a href="?currentPage=1">首页</a>
													<c:choose>
														<c:when test="${page.currentPage - 1 > 0}">
															<a href="?currentPage=${page.currentPage - 1}">上一页</a>
														</c:when>
														<c:when test="${page.currentPage - 1 <= 0}">
															<a href="?currentPage=1">上一页</a>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${page.totalPages==0}">
															<a href="?currentPage=${page.currentPage}">下一页</a>
														</c:when>
														<c:when test="${page.currentPage + 1 < page.totalPages}">
															<a href="?currentPage=${page.currentPage+1}">下一页</a>
														</c:when>
														<c:when test="${page.currentPage + 1 >= page.totalPages}">
															<a href="?currentPage=${page.totalPages}">下一页</a>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${page.totalPages==0}">
															<a href="?currentPage=${page.currentPage}">尾页</a>
														</c:when>
														<c:otherwise>
															<a href="?currentPage=${page.totalPages}">尾页</a>
														</c:otherwise>
													</c:choose>
											<input type="text" id="page.pageNo" style="width:50px;height:25px" name="currentPage" onkeydown="gotoPageForEnter(event)"/>
												<a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a>
												<span>
													每页
													<select onchange="setPageSize()" id="pageSizeSelect">
														<option value="10">10</option>
														<option value="20">20</option>
														<option value="50">50</option>
														<option value="100">100</option>
													</select>
													条记录
												</span>	
											</div>
											</c:if>
											<c:if test="${searchCondition != null}">
											<div class="col-lg-12">	
														共 ${page.totalPages} 页${page.totalRecords}条记录    第${page.currentPage} 页
														<a href="?page.currentPage=1&${searchCondition}">首页</a>
													<c:choose>
														<c:when test="${page.currentPage - 1 > 0}">
															<a href="?page.currentPage=${page.currentPage - 1}&${searchCondition}">上一页</a>
														</c:when>
														<c:when test="${page.currentPage - 1 <= 0}">
															<a href="?page.currentPage=1&${searchCondition}">上一页</a>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${page.totalPages==0}">
															<a href="?page.currentPage=${page.currentPage}&${searchCondition}">下一页</a>
														</c:when>
														<c:when test="${page.currentPage + 1 < page.totalPages}">
															<a href="?page.currentPage=${page.currentPage+1}&${searchCondition}">下一页</a>
														</c:when>
														<c:when test="${page.currentPage + 1 >= page.totalPages}">
															<a href="?page.currentPage=${page.totalPages}&${searchCondition}">下一页</a>
														</c:when>
													</c:choose>
													<c:choose>
														<c:when test="${page.totalPages==0}">
															<a href="?page.currentPage=${page.currentPage}&${searchCondition}">尾页</a>
														</c:when>
														<c:otherwise>
															<a href="?page.currentPage=${page.totalPages}&${searchCondition}">尾页</a>
														</c:otherwise>
													</c:choose>
										 	<!-- 分页功能 End -->
											<input type="text" id="page.pageNo" style="width:50px;height:25px" name="page.currentPage" onkeydown="gotoPageForEnter(event)"/>
												<a href="javascript:void;" onclick="javascript:gotoPage()">跳转</a>
												<span>
													每页
													<select onchange="setPageSize()" id="pageSizeSelect">
														<option value="10">10</option>
														<option value="20">20</option>
														<option value="50">50</option>
														<option value="100">100</option>
													</select>
													条记录
												</span>	
											</div>
											</c:if>
								</div>
                                <!-- CS:分页 --> 
                                
                                
                        </div>
                        <!-- /.span --> 
                      </div>
                      <!-- /.row --> 
                      
                    </div>
                </div>
                

                <div class="footer">
                  <div class="footer-inner">
                    <!-- #section:basics/footer -->
                    <div class="footer-content">
                      <span class="bigger-120">
                        <span class="blue bolder">龙图腾</span>
                        2013-2014
                      </span>

                      &nbsp; &nbsp;
         
                    </div>

                    <!-- /section:basics/footer -->
                  </div>
                </div>

                <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
                  <i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
                </a>
            </div>
        </div>
	</div>        

</div>
<!--[if !IE]> -->
		<script type="text/javascript">
			window.jQuery || document.write("<script src='<s:url value='/static/js/jquery.js'/>'>"+"<"+"/script>");
		</script>

<!-- <![endif]--> 

<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<s:url value='/static/js/jquery.mobile.custom.js'/>'>"+"<"+"/script>");
		</script> 
<script src="<s:url value='/static/js/bootstrap.js'/>"></script> 



<iframe id="feeExcelFileFrame" style="display:none"></iframe>	

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>

<script src="<s:url value='/static/js/bootbox.js'/>"></script>
<script type="text/javascript">
$(function(){
	formutil.clickAllCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
	formutil.clickItemCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
});	

function exportFees() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择要导出的记录');
		return;
	}	
	
	var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
	
	var iframe = document.getElementById('feeExcelFileFrame');
	iframe.src = "<s:url value='/fee/exportFees.html'/>?fees=" + fees;		
}

function batchUpdateInvoiceTitles() {
	var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
	
	if (!feeSelected) {
		formutil.alertMessage('请选择费用记录');
		return;
	}		
	
	var invoiceTitle = prompt("请输入发票抬头", "");
	if (invoiceTitle != null && invoiceTitle != "") {
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
		
		$.ajax({
			url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fees + "&invoiceTitle=" + invoiceTitle, 
			type: 'get', 
			success: function(data) {
				location.reload();
			}
		});
	} 
}

function changeInvoiceTitle(fee, invoiceTitle) {
	$.ajax({
		url: "<s:url value='/fee/changeInvoiceTitle.html'/>?fees=" + fee + "&invoiceTitle=" + invoiceTitle, 
		type: 'get', 
		success: function(data) {
			// location.reload();
		}
	});			
}



//CS:FeesCount
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
		var url = "<s:url value='/fee/monitoredFeeList.html'/>?currentPage=" + pageNo;
		
		<c:if test="${searchCondition != null}">
				url = "<s:url value='/fee/search.html'/>?page.currentPage=" + pageNo +"&"+"${searchCondition}";
		</c:if>
		
		location.href = url
	}
	
	function gotoPageForEnter(event) {
		var e = event ? event : window.event;
				
		if(event.keyCode == 13) {
			gotoPage();
		}
	}
	
	function calcTotalAmount() {
		var amounts = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'amount');
		var totalAmount = 0;
		var totalAmountSpan = $("#totalAmountSpan");
		var checkAllCheckbox = $("tr th input.fee-check-item");
		
		if (checkAllCheckbox.prop("checked")) {
			var allAmounts = formutil.getAllCheckboxValues('tr td input.fee-check-item', 'amount');
			
			for (var i = 0; i < allAmounts.length; i++) {
				totalAmount += parseInt(allAmounts[i]);
			}
			
			totalAmountSpan.text(totalAmount);
			return;
		}
		
		for (var i = 0; i < amounts.length; i++) {
			totalAmount += parseInt(amounts[i]);
		}
		
		totalAmountSpan.text(totalAmount);
	}
	
	function showOrderCreateForm() {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		
		if (!feeSelected) {
			formutil.alertMessage('请选择要支付的记录');
			return;
		}	
		
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'fee');
		
		window.open("<s:url value='/order/orderCreateForm.html'/>?fees=" + fees);	
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

<!-- ace scripts --> 
<script src="<s:url value='/static/js/ace/elements.scroller.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.colorpicker.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.fileinput.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.typeahead.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.wysiwyg.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.spinner.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.treeview.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.wizard.js'/>"></script> 
<script src="<s:url value='/static/js/ace/elements.aside.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.ajax-content.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.touch-drag.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.sidebar.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.sidebar-scroll-1.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.submenu-hover.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.widget-box.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.settings.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.settings-rtl.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.settings-skin.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.widget-on-reload.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.searchbox-autocomplete.js'/>"></script> 
</body>
</html>
