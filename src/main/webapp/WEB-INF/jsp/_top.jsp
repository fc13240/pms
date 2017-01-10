<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="position: fixed;z-index: 99999; left:20px; top:0px; width:100px; height:100px;">
<img src="<s:url value='/temp/images/logo_long.png'/>" width="80px;">
</div>
<div class="top navbar-fixed-top" style="background:#ffffff;">
	<div class="toolbar">
	  <div class="container clear">
	      <div class="mod-sitemap-wecome f-fl">
	      
	      <span></span>
	      <a href="http://r.lotut.com" style="margin-left:10px;" target="_blank">龙图腾商标专利交易</a>
	      <a href="http://g.lotut.com" style="margin-left:10px;">专利管家</a>
	      <a href="http://hao.lotut.com" style="margin-left:10px;" target="_blank">网址导航</a>
	      <a href="http://so.lotut.com" style="margin-left:10px;" target="_blank">专利检索</a>
	      <a href="http://s.lotut.com" style="margin-left:10px;" target="_blank">工业设计</a>
		<!-- <ul>
			<li><a href="http://www.lotut.com" target="_blank">龙图腾商标专利交易</a></li>
	        <li><a href="http://g.lotut.com" target="_blank">专利管家</a></li>
	        <li><a href="http://hao.lotut.com" target="_blank">网址导航</a></li>
	        <li class="cur"><a href="http://so.lotut.com">专利检索</a></li>
	        <li><a href="http://s.lotut.com" target="_blank">工业设计</a></li>
	    	</ul>  -->	
	      
	      </div>
		  <div class="mod-sitemap clear">
		    <div class="head-top-rk f-fr">
		      <div class="item">
			 您好,
			  <se:authentication property="principal.username" />!
			保密是我们的责任！
			  <a href="javascript:$('#logoutForm').submit();" style="color:#666;"><font color="red">退出</font></a>
		
			 <form action="<s:url value='/user/logout.html'/>" method="post" id="logoutForm">
			 <se:csrfInput/>
			 <input type="submit" style="display:none;" />
			 </form>		        
		      
		     </div>
		    </div>
		  </div>
	  </div>
	</div>
	<div style="height:80px;padding:5px;margin-left:120px;">
		<img src="<s:url value='/temp/images/logo.png'/>" style="height:47px;">
	</div>
	<div class="nav clear">
	    <div class="" style="margin-left:127px;"> 
	      <!-- 主菜单-列表 menu  -->
	      <ul class="menu">
	        <li><a href="<s:url value='/patent/list.html?currentPage=1'/>">我的专利</a></li>
	        <li><a href="<s:url value='/editor/patentDocList.html'/>">专利撰写</a></li>     
	        <li><a href="<s:url value='/notice/list.html?currentPage=1'/>" >通知书</a></li>
	        <li><a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>" >专利交费</a></li>
	        <li><a href="<s:url value='/patent/getUserTransactionPatents.html?currentPage=1'/>" >专利交易</a></li>
	        <li><a href="<s:url value='/friend/list.html'/>">我的好友</a></li>
	        <li><a href="<s:url value='/user/detail.html'/>">用户中心</a></li>
	        <li><a href="<s:url value='/appPerson/getUserFeeReduceAppPersonList.html'/>">费减备案</a></li>
	        <li><a href="<s:url value='/express/addExpressForm.html'/>">快递管理</a></li>
  	        <li><a href="<s:url value='/news/list.html'/>">新闻管理</a></li>
	        <li><a href="<s:url value='/article/list.html'/>">文章管理</a></li>
	        <li><a href="<s:url value='/brand/list.html'/>">商标交易</a></li>
	        <li><a href="<s:url value='/brand/getBrandManagementlist.html'/>">商标管理</a></li>
	        <li><a target="_blank" href="http://sm.lotut.com/user_instructions.html">操作指南</a></li>
	        
	      </ul>
	      <!-- 主菜单-列表 menu end / --> 
	    </div>
	</div>	
</div>	
