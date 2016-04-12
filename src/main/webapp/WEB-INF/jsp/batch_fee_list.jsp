<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<title>专利缴费</title>

<!-- bootstrap & fontawesome -->
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
		<li class="light-blue">
			<a data-toggle="dropdown" href="#" class="dropdown-toggle">
				<img class="nav-user-photo" src="<s:url value='/static/avatars/user.jpg'/>" alt="Jason's Photo" />
			<span class="user-info">
				<small>Welcome,</small>
				Jason
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
<script type="text/javascript">
				try{ace.settings.check('main-container' , 'fixed')}catch(e){}
			</script> 

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
        <li class="active"> <a href="<s:url value='/patent/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-desktop"></i> <span class="menu-text"> 我的专利 </span> </a> </li>
        <li class=""> <a href="<s:url value='/notice/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-list"></i> <span class="menu-text"> 我的通知书 </span> </a> </li>
        <li class=""> <a href="<s:url value='/friend/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text"> 好友管理 </span> </a> </li>
        <li class=""> <a href="<s:url value='/sharePatent/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-list-alt"></i> <span class="menu-text"> 分享管理 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/patent/showUploadForm.html'/>"> <i class="menu-icon fa fa-calendar"></i> <span class="menu-text"> 添加专利 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/notice/showUploadForm.html'/>"> <i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> 添加通知书 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>"><i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> 官费监控 </span> </a> </li>
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
                <li> <a href="#">我的专利</a> </li>
              </ul>
              <!-- /.breadcrumb --> 
            </div>
    <!-- /section:basics/content.breadcrumbs -->  
    		<div class="page-content"> 

                
                <!-- /.page-header -->
				<div class="row">
					<div class="col-lg-12">
						<table class="table table-bordered patent-table table-striped">	
							<tr>
								<th colspan="9">应缴费信息</th>
							</tr>			
							<tr>
								<th colspan="9">
									<input type="checkbox" class="fee-check-item">
									<span class="batch-share"><a href="javascript:updateMonitorStatus(2)">加入监控</a></span>
									<span class="batch-share"><a href="javascript:updateMonitorStatus(1)">放弃监控</a></span>
								</th>		
							</tr>
							<tr>
								<th>序号</th>
								<th>申请号/专利号</th>
								<th>专利名称</th>
								<th>第一申请人</th>
								<th>案件状态</th>
								<th>缴费种类</th>
								<th>缴费截止日</th>
								<th>缴费金额</th>
								<th>监控状态</th>
							</tr>
							<c:forEach items="${fees}" var="fee" varStatus="status">
								<tr>
									<td>
										<span class="batch-share-item"><input type="checkbox" class="fee-check-item" feeId="${fee.feeId}"></span>
										${status.index+1}
									</td>
									<td>${fee.patent.appNo}</td>
									<td>${fee.patent.name}</td>
									<td>${fee.patent.firstAppPerson}</td>
									<td>${fee.patent.patentStatus.statusDescription}</td>
									<td>${fee.feeType}</td>
									<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
									<td>${fee.amount} </td>
									<td>${fee.monitorStatus.monitorStatusDescription}</td>
								</tr>
							</c:forEach>	
						</table>
						
					<c:if test="${! empty emptyFeePatents}">
						<table class="table table-bordered patent-table table-striped">	
							<tr><th colspan="5">以下专利没有查询到应缴费信息</th></tr>
							<tr>
								<th>序号</th>
								<th>申请号/专利号</th>
								<th>专利名称</th>
								<th>第一申请人</th>
							</tr>			
							
							<c:forEach items="${emptyFeePatents}" var="patent" varStatus="status">
								<tr>
									<td>${status.index+1}</td>
									<td>${patent.appNo}</td>
									<td>${patent.name}</td>
									<td>${patent.firstAppPerson}</td>
								</tr>				
							</c:forEach>
						</table>
					</c:if>		
					
					<c:if test="${! empty failedPatents}">
						<table class="table table-bordered patent-table table-striped">	
							<tr><th colspan="5">以下专利查询应缴费信息失败</th></tr>
							<tr>
								<th>序号</th>
								<th>申请号/专利号</th>
								<th>专利名称</th>
								<th>第一申请人</th>
							</tr>			
							
							<c:forEach items="${failedPatents}" var="patent" varStatus="status">
								<tr>
									<td>${status.index+1}</td>
									<td>${patent.appNo}</td>
									<td>${patent.name}</td>
									<td>${patent.firstAppPerson}</td>
								</tr>				
							</c:forEach>
						</table>
					</c:if>		
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





<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>

<script src="<s:url value='/static/js/bootbox.js'/>"></script>
<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
		formutil.clickItemCheckbox('tr th input.fee-check-item', 'tr td input.fee-check-item');
	});
	
	function updateMonitorStatus(status) {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		
		if (!feeSelected) {
			formutil.alertMessage('请选择应缴费记录');
			return;
		}
		
		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'feeId');
		
		location.href = "<s:url value='/fee/changeMonitorStatus.html'/>?fees=" + fees + "&monitorStatus=" + status;
	}	
	
	
	
	
	function updateMonitorStatus(status) {
		var feeSelected = formutil.anyCheckboxItemSelected('tr td input.fee-check-item');
		
		if (!feeSelected) {
			formutil.alertMessage('请选择应缴费记录');
			return;
		}

		var fees = formutil.getAllCheckedCheckboxValues('tr td input.fee-check-item', 'feeId');
		
		location.href = "<s:url value='/fee/batchChangeMonitorStatus.html'/>?fees=" + fees + "&monitorStatus=" + status;
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