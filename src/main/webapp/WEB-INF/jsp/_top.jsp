<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top navbar-fixed-top">
	<div class="container-fluid" style="min-width:1100px;" >
		<div class="row">
		  <div class="col-xs-8">
			<img src="<s:url value='/temp/images/logo.png'/>"  />
		  </div>

		  <div class="col-xs-4">
		  
			<div class="top-search"> 
				<div id="Button1" onClick="hidslt()" style="display:block;" class="top-sbtn" >
				<a href="http://so.lotut.com/" target="_blank" rel="nofollow"><font color="#fff">龙图腾专利检索</font></a>
				<a href="http://so.lotut.com/" target="_blank" rel="nofollow"><img src="<s:url value='/temp/images/search.png'/>" /></a>
				</div>
			</div>
			<div class="top-user" id="top-user">
				<img src="<s:url value='/temp/images/user2.png'/>" />
				<span class="user-info" style="color:#fff;">
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
	<div class="top_nav" style="height:60px; float:left;">
		<div class="col-xs-1" style="min-width:100px;">
		
		</div>
	
		<div class="col-xs-11"  style="min-width:100px;">
		<!-- 	<div style="width:1000px;height:40px;margin-bottom:5px;background:#FF4351;" class="button-primary button-pill"> -->
			<ul >
			<a href="<s:url value='/patent/list.html?currentPage=1'/>"><li class="nav-hover"><span style="font-weight:900;margin-left:30px;text-transform: uppercase;font-size:14px;" class="button button-highlight button-pill">我的专利</span></li></a>
			<a href="<s:url value='/notice/list.html?currentPage=1'/>"><li><span style="font-weight:900;text-transform: uppercase;font-size:14px;" class="button button-highlight button-pill">通知书</span></li></a>
			<a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>"><li><span style="font-weight:900;text-transform: uppercase;font-size:14px;" class="button button-highlight button-pill">专利缴费</span></li></a>
			<a href="<s:url value='/friend/list.html'/>"><li><span style="font-weight:900;text-transform: uppercase;font-size:14px;" class="button button-highlight button-pill">我的好友</span></li></a>
			<a href="<s:url value='/user/detail.html'/>"><li><span style="font-weight:900;text-transform: uppercase;font-size:14px;" class="button button-highlight button-pill" >用户中心</span></li></a>
			</ul>
		<!-- </div>	 -->		
		</div>	


	</div>		
</div>	