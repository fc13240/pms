<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>

<!DOCTYPE html>
<html>
<head>
	<title>专利管理</title>
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/bootstrap.min.css'/>" />
	<link rel="stylesheet" media="screen" href="<s:url value='/static/css/jquery-ui.min.css'/>" />


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
        <li class="purple"> <a data-toggle="dropdown" class="dropdown-toggle" href="#"> <i class="ace-icon fa fa-bell icon-animated-bell"></i> <span class="badge badge-important">8</span> </a> </li>
        <!-- #section:basics/navbar.user_menu -->
        <li class="light-blue" style="z-index:9999;"> <a data-toggle="dropdown" href="#" class="dropdown-toggle"> <img class="nav-user-photo" src="<s:url value='/static/avatars/user.jpg'/>" alt="Jason's Photo" /> <span class="user-info" style="line-height:35px;"> 欢迎,admin </span> <i class="ace-icon fa fa-caret-down"></i> </a>
          <ul class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
            <li> 
            <form action="<s:url value='/user/logout.html'/>" method="post" id="logoutForm">
            <se:csrfInput/>
            <a href="javascript:$('#logoutForm').submit();" style="z-index: 999;"> <i class="ace-icon fa fa-power-off"></i> 退出 </a>
             
            </form>
            
            </li>
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
      <script type="text/javascript">
                        try{ace.settings.check('sidebar' , 'fixed')}catch(e){}
                    </script>
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
        <li class=""> <a href="<s:url value='/notice/list.html'/>"> <i class="menu-icon fa fa-list"></i> <span class="menu-text"> 我的通知书 </span> </a> </li>
        <li class=""> <a href="<s:url value='/friend/list.html'/>"> <i class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text"> 好友管理 </span> </a> </li>
        <li class=""> <a href="<s:url value='/sharePatent/list.html'/>"> <i class="menu-icon fa fa-list-alt"></i> <span class="menu-text"> 分享管理 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/patent/showUploadForm.html'/>"> <i class="menu-icon fa fa-calendar"></i> <span class="menu-text"> 添加专利 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/notice/showUploadForm.html'/>"> <i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> 添加通知书 </span> </a> <b class="arrow"></b> </li>
        <li class=""> <a href="<s:url value='/fee/monitoredFeeList.html'/>"><i class="menu-icon fa fa-picture-o"></i> <span class="menu-text"> 官费监控 </span> </a> </li>
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
                <li> <a href="#">修改密码</a> </li>
              </ul>
              <!-- /.breadcrumb --> 
            </div>
    <!-- /section:basics/content.breadcrumbs -->  
    		<div class="page-content"> 

               
						<div class="row">
							<div class="col-xs-12">
								<!-- PAGE CONTENT BEGINS -->
								<div class="alert alert-block alert-success">
									<button type="button" class="close" data-dismiss="alert">
										<i class="ace-icon fa fa-times"></i>
									</button>

									<i class="ace-icon fa fa-check green"></i>

									欢迎来到
									<strong class="green">
										龙图腾专利管理系统
										<small>(v1.0.0)</small>
									</strong>
								</div>

								<div class="row">
									<div class="space-6"></div>

							

									<div class="vspace-12-sm"></div>

									<div class="col-sm-5">
										
										<form action="<s:url value='/user/changePassword.html'/>" method="post">									
										<se:csrfInput/>
												请输入原密码：<input type="text" class="form-control" name="lastPassword" id="count" placeholder="原始密码" />
												请输入新密码：<input type="text" class="form-control" name="newPassword" id="count" placeholder="新密码" />
												<div style="margin-top:30px; float:left;width:300px;">
												<input type="submit" class="width-35 pull-right btn btn-sm btn-primary" style="font-size:16px;" value="提交">
												</div>
										</form>								

									
									</div><!-- /.col -->
								</div><!-- /.row -->



					<!-- /.row -->

								<!-- PAGE CONTENT ENDS -->
							</div><!-- /.col -->
						</div><!-- /.row -->                

				
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

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='../assets/js/jquery1x.js'>"+"<"+"/script>");
</script>
<![endif]--> 
<script type="text/javascript">
			if('ontouchstart' in document.documentElement) document.write("<script src='<s:url value='/static/js/jquery.mobile.custom.js'/>'>"+"<"+"/script>");
		</script> 
<script src="<s:url value='/static/js/bootstrap.js'/>"></script> 

<!-- page specific plugin scripts --> 
<script src="<s:url value='/static/js/dataTables/jquery.dataTables.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/jquery.dataTables.bootstrap.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/extensions/buttons/dataTables.buttons.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/extensions/buttons/buttons.flash.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/extensions/buttons/buttons.html5.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/extensions/buttons/buttons.print.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/extensions/buttons/buttons.colVis.js'/>"></script> 
<script src="<s:url value='/static/js/dataTables/extensions/select/dataTables.select.js'/>"></script> 

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


<script src="<s:url value='/static/js/jquery-1.11.3.js'/>"></script>
<script src="<s:url value='/static/js/bootstrap.min.js'/>"></script>
<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script src="<s:url value='/static/js/formutil.js'/>"></script>
<script src="<s:url value='/static/js/jquery-ui.min.js'/>"></script>

<script src="<s:url value='/static/js/bootbox.js'/>"></script>

<!-- the following scripts are used in demo only for onpage help and you don't need them -->
<link rel="stylesheet" href="<s:url value='/static/css/ace.onpage-help.css'/>" />
<link rel="stylesheet" href="<s:url value='/static/docs/assets/js/themes/sunburst.css'/>" />
<script type="text/javascript"> ace.vars['base'] = '..'; </script> 
<script src="<s:url value='/static/js/ace/elements.onpage-help.js'/>"></script> 
<script src="<s:url value='/static/js/ace/ace.onpage-help.js'/>"></script> 
<script src="<s:url value='/static/docs/assets/js/rainbow.js'/>"></script> 
<script src="<s:url value='/static/docs/assets/js/language/generic.js'/>"></script> 
<script src="<s:url value='/static/docs/assets/js/language/html.js'/>"></script> 
<script src="<s:url value='/static/docs/assets/js/language/css.js'/>"></script> 
<script src="<s:url value='/static/docs/assets/js/language/javascript.js'/>"></script>
<script src="<s:url value='/static/js/date-time/WdatePicker.js'/>"></script>

</body>
</html>