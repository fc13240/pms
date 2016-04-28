<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<div class="left-nav" style="width:76px;position:fixed;top:80px;">
		  <div style="clear:both;height:20px;"></div>
		  <ul>
			<a href="#">
			<li> <img src="<s:url value='/temp/images/home.png'/>" />
			  <h5>首页</h5>
			</li>
			</a> 
		    <a href="<s:url value='/main.html'/>">
			<li class="left-nav-active"> <img src="<s:url value='/temp/images/setting.png'/>" />

			  <h5>我的专利</h5>

			</li>
			</a> 
			<a href="<s:url value='/notice/list.html?currentPage=1'/>">
			<li> <img src="<s:url value='/temp/images/purse.png'/>" />

			  <h5>通知书</h5>

			</li>
			</a>			
			
			<a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>">
			<li> <img src="<s:url value='/temp/images/purse.png'/>" />

			  <h5>专利缴费</h5>

			</li>
			</a>
<!-- 			<li class="nav-jy"> -->
<!-- 			  <p>专利<br /> -->
<!-- 				交易</p> -->
<!-- 			</li> -->
			<a href="<s:url value='/friend/list.html'/>">
			<li> <img src="<s:url value='/temp/images/friend.png'/>" />
			<h5>我的好友</h5>

			</li>
			</a>

			<a href="<s:url value='/user/detail.html'/>">
			<li> <img src="<s:url value='/temp/images/data.png'/>" />
			  <h5>用户中心</h5>

			</li>
			</a> <a href="#">

			</a>
		  </ul>
		</div>