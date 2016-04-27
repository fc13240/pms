<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>好友列表</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
 
<<<<<<< HEAD
<div style="min-width:1300px;height:1500px; background:#F3F3F5;">
	<div style="float:left;width:5%;">
		<%@ include file="_left_nav.jsp" %>
	</div>
	<div style="float:left;width:95%;">

        <div class="center-cconcenct">
        	<!-- 代码 开始 -->
            <div id="change-t"><img src="<s:url value='/temp/images/tab.png'/>"  class="cgh"/></div>
			<div style="float:left;width:9%;">
				<%@ include file="_left_nav_friend.jsp" %>
			</div>
			<div class="con-list" style="float:left;width:91%;">
				<div class="t-ti">
					<hr class="t-hr">
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">好友列表</span>
				</div>
                <div style="height:30px;"></div>

				<div class="row" style="margin-top:30px;margin-left:20px;width:500px;">

				    <!-- PAGE CONTENT BEGINS -->
<%-- 				    <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" > <a id="download" href="<s:url value='/notice/preview.html'/>?notice=${notice.noticeId}"> --%>
<%-- 				      <c:out value="${notice.name}"/> --%>
<%-- 				      </a> <a id="download" href="<s:url value='/friend/searchForm.html'/>"> --%>
<!-- 				      <button style="margin:8px;" type="button" class="btn btn-info btn-sm">添加好友</button> -->
<%-- 				      </a> <a href="<s:url value='/friend/request/list.html'/>">> --%>
<!-- 				      <button style="margin:8px;" type="button" class="btn btn-purple btn-sm">好友请求处理</button> -->
<%-- 				      </a> </span> </div> --%>
				    <table id="simple-table" class="table table-striped table-bordered table-hover">
				      <thead>
				        <tr class="simple_bag">
				          <th>序号</th>
				          <th>用户名</th>
				          <th>姓名</th>
				          <th>操作</th>
				        </tr>
				      </thead>
				      <tbody>
				        <c:forEach items="${friends}" var="friend" varStatus="status">
				          <tr>
				            <td>${status.count}</td>
				            <td><c:out value="${friend.username}"/></td>
				            <td><c:out value="${friend.name}"/></td>
				            <td><a  href="<s:url value='/friend/delete/'/><c:out value='${friend.userId}.html'/>">删除好友</a></td>
				          </tr>
				        </c:forEach>
				      </tbody>
				    </table>
				</div>               
                
			</div>
=======
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
        <li class=""> <a href="<s:url value='/patent/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-desktop"></i> <span class="menu-text"> 我的专利 </span> </a> </li>
        <li class=""> <a href="<s:url value='/notice/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-list"></i> <span class="menu-text"> 我的通知书 </span> </a> </li>
        <li class="active"> <a href="<s:url value='/friend/list.html?currentPage=1'/>"> <i class="menu-icon fa fa-pencil-square-o"></i> <span class="menu-text"> 好友管理 </span> </a> </li>
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
              <ul class="breadcrumb">
                <li> <i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a> </li>
                <li> <a href="#">好友管理</a> </li>
              </ul>
              <!-- /.breadcrumb --> 
            </div>
    <!-- /section:basics/content.breadcrumbs -->  
    		<div class="page-content"> 

                <div class="row" style="margin-top:30px;">
                    <div class="col-xs-12"> 
                      <!-- PAGE CONTENT BEGINS -->

                          <div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;">	                                
	                                <div class="input-group-btn" >
										<a id="download" href="<s:url value='/friend/searchForm.html'/>">
										<button style="margin:8px;" type="button" class="btn btn-info btn-sm">添加好友</button>
										</a>
										<a href="<s:url value='/friend/request/list.html'/>">>
										<button style="margin:8px;" type="button" class="btn btn-purple btn-sm">好友请求处理</button>
										</a>
		                                <div>
											<form action="<s:url value='/friend/searchUserFriends.html'/>" method="GET"  role="search">
												<div class="form-group">
												 <input type="text" id="form-field-1" style="height:45px;width:450px;" name="keyword" id="keywordId" placeholder="用户名/姓名" value="" />
												 <button type="submit" class="btn btn-primary friend-query" >查询</button>
												</div>
											</form>		                                
		                                </div> 										
									</div> 
                          </div>      
                          <table id="simple-table" class="table table-striped table-bordered table-hover">
                            <thead>
                              <tr class="simple_bag">
								<th>序号</th>
								<th>用户名</th>
								<th>姓名</th>
								<th>邮箱</th>
								<th>电话</th>
								<th>操作</th>
                              </tr>
                            </thead>
                            <tbody>
							<c:forEach items="${friends}" var="friend" varStatus="status">
								<tr>
									<td>${status.count}</td>
									<td><c:out value="${friend.username}"/></td>
									<td><c:out value="${friend.name}"/></td>
									<td><c:out value="${friend.email}"/></td>
									<td><c:out value="${friend.phone}"/></td>
									<td><a  href="<s:url value='/friend/delete/'/><c:out value='${friend.userId}.html'/>">删除好友</a></td>
								</tr>
							</c:forEach>
                            </tbody>
                          </table>
                      
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
>>>>>>> cb89780cb5d3aebbfa5e8935947dacdaf47e02a0
         
        </div>
		<!--container end-->
    </div>
</div>
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
<<<<<<< HEAD
=======
<script type="text/javascript">
	function searchUserFriends(){
		var keyword = $("#keywordId").val();
		var url = "<s:url value='/friend/searchUserFriends.html'/>?keyword="+keyword;
		window.open(url);
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
<script src="<s:url value='/static/js/jquery.validate.min.js'/>"></script>
<script src="<s:url value='/static/js/validate_messages_cn.js'/>"></script>	 
>>>>>>> cb89780cb5d3aebbfa5e8935947dacdaf47e02a0
</body>
</html>