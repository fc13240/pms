<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top navbar-fixed-top">
	<div class="container-fluid" style="min-width:1100px;background:#F3F3F5" >
		<div class="row">
		  <div class="col-xs-9">
			<img src="<s:url value='/temp/images/logo.png'/>"  />
		  </div>

		  <div class="col-xs-3">
		  
			<div class="top-search"> 
				<div id="Button1" onClick="hidslt()" style="display:block;" class="top-sbtn" >
				<a href="http://so.lotut.com/" target="_blank" rel="nofollow"><font color="#000">国内外专利检索</font></a>
				<a href="http://so.lotut.com/" target="_blank" rel="nofollow"><img src="<s:url value='/temp/images/search1.png'/>" /></a>
				</div>
			</div>
			<div class="top-user" id="top-user">
				<img src="<s:url value='/temp/images/user1.png'/>" />
				<span class="user-info">
					<small>欢迎您!</small>
					<se:authentication property="principal.username" />
				</span>
				<a href="javascript:$('#logoutForm').submit();"><img src="<s:url value='/temp/images/exit.png'/>" class="top-exit"/></a>

				<form action="<s:url value='/user/logout.html'/>" method="post" id="logoutForm">
				<se:csrfInput/>
				<input type="submit" style="display:none;" />
				</form>	
			</div>		  
		  
		  </div>
		</div>
	</div>
	<div class="top_nav" style="height:40px; float:left;">
		<div class="col-xs-1" style="min-width:100px;">
		
		</div>
	
		<div class="col-xs-11" style="min-width:100px;">
			<ul>
			<a href="<s:url value='/patent/list.html?currentPage=1'/>"><li class="nav-hover"><h4>我的专利</h4></li></a>
			<a href="<s:url value='/notice/list.html?currentPage=1'/>"><li><h4>通知书</h4></li></a>
			<a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>"><li><h4>专利缴费</h4></li></a>
			<a href="<s:url value='/friend/list.html'/>"><li><h4>我的好友</h4></li></a>
			<a href="<s:url value='/user/detail.html'/>"><li><h4>用户中心</h4></li></a>
			</ul>		
		</div>	


	</div>		
</div>	