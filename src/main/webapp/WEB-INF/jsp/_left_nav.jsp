<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
		<div class="left-nav">
		  <div style="clear:both;height:20px;"></div>
		  <ul>
			<a href="#">
			<li> <img src="<s:url value='/temp/images/home.png'/>" />
			  <p>首页</p>
			</li>
			</a> 
		    <a href="<s:url value='/main.html'/>">
			<li class="left-nav-active"> <img src="<s:url value='/temp/images/setting.png'/>" />
			  <p>我的专利</p>
			</li>
			</a> 
			<a href="<s:url value='/notice/list.html?currentPage=1'/>">
			<li> <img src="<s:url value='/temp/images/purse.png'/>" />
			  <p>通知书</p>
			</li>
			</a>			
			
			<a href="<s:url value='/fee/monitoredFeeList.html?currentPage=1'/>">
			<li> <img src="<s:url value='/temp/images/purse.png'/>" />
			  <p>专利缴费</p>
			</li>
			</a>
<!-- 			<li class="nav-jy"> -->
<!-- 			  <p>专利<br /> -->
<!-- 				交易</p> -->
<!-- 			</li> -->
			<a href="<s:url value='/friend/list.html'/>">
			<li> <img src="<s:url value='/temp/images/friend.png'/>" />
			  <p>我的好友</p>
			</li>
			</a>

			<a href="<s:url value='/user/detail.html'/>">
			<li> <img src="<s:url value='/temp/images/data.png'/>" />
			  <p>用户中心</p>
			</li>
			</a> <a href="#">

			</a>
		  </ul>
		</div>