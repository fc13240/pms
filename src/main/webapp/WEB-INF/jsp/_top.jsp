<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div style="position: fixed;z-index: 99999; left:20px; top:0px; width:100px; height:100px;">
<img src="<s:url value='/temp/images/logo_long.png'/>" width="80px;">
</div>
<div class="top navbar-fixed-top" style="background:#ffffff;">
	<div class="toolbar">
	  <div class="container clear">
	      <div class="mod-sitemap-wecome f-fl"> <span></span></div>
		  <div class="mod-sitemap clear">
		    <div class="head-top-rk f-fr">
		      <div class="item">
			 您好,
			  <se:authentication property="principal.username" />!
			欢迎使用龙图腾专利管家！
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
		<img src="<s:url value='/temp/images/logo.png'/>" style="width:220px;">
	</div>
	<div class="nav clear">
	    <div class="" style="margin-left:127px;"> 
	      <!-- 主菜单-列表 menu  -->
	      <ul class="menu">
	        <li><a href="<s:url value='/patent/list.html?currentPage=1'/>">我的专利</a></li>
	        <li><a href="<s:url value='/notice/list.html?currentPage=1'/>" >通知书</a></li>
	        <li><a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>" >专利交费</a></li>
	        <li><a href="<s:url value='/friend/list.html'/>">我的好友</a></li>
	        <li><a href="<s:url value='/user/detail.html'/>">用户中心</a></li>
	        <li><a href="<s:url value='/user/instructions.html'/>">操作指南</a></li>
	      </ul>
	      <!-- 主菜单-列表 menu end / --> 
	    </div>
	</div>	
</div>	
