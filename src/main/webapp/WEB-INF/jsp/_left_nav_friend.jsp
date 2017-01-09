<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">我的好友</div>
	
	<ul style="maring:0px;padding:0px;">
	<li class="active"> 
		<a href="<s:url value='/friend/list.html'/>">
		<h5>好友列表</h5>
		</a>
	</li>
	<li  class=""> 
		<a href="<s:url value='/friend/searchForm.html'/>">
		<h5>添加好友</h5>
		</a>
	</li>

	<li  class=""> 
		<a href="<s:url value='/friend/request/list.html'/>">
		<h5>好友请求</h5>
		</a>
	</li>
	
	<se:authorize access="hasRole('ROLE_PLATFORM')">
		<li class="active"> 
			<a href="<s:url value='/employee/getTopProxyOrgList.html'/>">
			<h5>顶级机构</h5>
			</a>
		</li>
	</se:authorize>	
	
	<se:authorize access="hasRole('ROLE_PROXY_ORG')">
		<li class="active"> 
			<a href="<s:url value='/employee/getProxyOrgList.html'/>">
			<h5>合作机构</h5>
			</a>
		</li>
		<li class="active"> 
			<a href="<s:url value='/employee/getCustomerSupportList.html'/>">
			<h5>客服管理</h5>
			</a>
		</li>
		<li class="active"> 
			<a href="<s:url value='/employee/getTechPersonList.html'/>">
			<h5>技术员管理</h5>
			</a>
		</li>
		<li class="active"> 
			<a href="<s:url value='/employee/getProcessPersonList.html'/>">
			<h5>流程员管理</h5>
			</a>
		</li>
	</se:authorize>
	
 			
	</ul>
	<span style="color:red;position:absolute;left:24px;bottom:18px;"><h5>QQ交流群：<br/>276618231</h5></span>
	
	
</div>