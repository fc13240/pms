<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<div class="top navbar-fixed-top" style="background:#ffffff;">
	<div class="toolbar">
	  <div class="container clear">
	      <div class="mod-sitemap-wecome f-fl"> <span>您好，欢迎光临龙图腾软件管理！</span></div>
	   
		  <div class="mod-sitemap clear">
		    <div class="head-top-rk f-fr">
		      <div class="item">
		      龙图腾首页&nbsp;&nbsp; <a href="http://so.lotut.com/" target="_blank" rel="nofollow"><font style="color:#666">龙图腾专利检索</font></a>
		     <!-- <img src="<s:url value='/temp/images/user2.png'/>" width="35px;" /> --> 
			  <span class="user-info">
			  <small>欢迎您!</small>
			  <se:authentication property="principal.username" />
			  </span>
			  <a href="javascript:$('#logoutForm').submit();" style="color:#666;">退出</a>
		
			 <form action="<s:url value='/user/logout.html'/>" method="post" id="logoutForm">
			 <se:csrfInput/>
			 <input type="submit" style="display:none;" />
			 </form>		        
		      
		     </div>
		    </div>
		  </div>
	  </div>
	</div>
	<div style="height:70px;margin-left:180px;">
	<img src="<s:url value='/temp/images/logo.png'/>">
	</div>
	<div class="nav clear">
	    <div class="container"> 
	      <!-- 主菜单-特色服务 all-category -->

	      <!-- 主菜单-特色服务 all-category end / --> 
	      <!-- 主菜单-列表 menu  -->
	      <ul class="menu">
	        <li><a href="<s:url value='/patent/list.html?currentPage=1'/>">我的专利</a></li>
	        <li><a href="<s:url value='/notice/list.html?currentPage=1'/>" >通知书</a></li>
	        <li><a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>" >专利交费</a></li>
	        <li><a href="<s:url value='/friend/list.html'/>">我的好友</a></li>
	        <li><a href="<s:url value='/user/detail.html'/>">用户中心</a></li>
	       
	      </ul>
	      <!-- 主菜单-列表 menu end / --> 
	    </div>
	</div>	
	
</div>	
