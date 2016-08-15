<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">专利撰写</div>
	
	<ul style="maring:0px;padding:0px;">
	<li class="active"> 
		<a href="<s:url value='/editor/newPatentType.html'/>">
		<h5>新建专利</h5>
		</a>
	</li>
	
	<se:authorize access="hasRole('ROLE_PROXY_ORG')">
		<li class="active"> 
			<a href="<s:url value='/employee/getCustomerSupportList.html'/>?proxyOrgId=2">
			<h5>客服管理</h5>
			</a>
		</li>
		<li class="active"> 
			<a href="<s:url value='/editor/newPatentDoc.html'/>?patentType=1">
			<h5>技术员管理</h5>
			</a>
		</li>
		<li class="active"> 
			<a href="<s:url value='/editor/newPatentDoc.html'/>?patentType=1">
			<h5>流程员管理</h5>
			</a>
		</li>
	</se:authorize>
	
	
	<li class="active"> 
		<a href="<s:url value='/proposer/list.html'/>">
		<h5>常用申请人</h5>
		</a>
	</li>	
	
	<li class="active"> 
		<a href="<s:url value='/inventor/list.html'/>">
		<h5>常用发明人</h5>
		</a>
	</li>		
	<!-- 
	<li class="active"> 
		<a href="<s:url value='/editor/newPatentDoc.html'/>?patentType=1">
		<h5>新建发明</h5>
		</a>
	</li>
	<li  class=""> 
		<a href="<s:url value='/editor/newPatentDoc.html'/>?patentType=2">
		<h5>新建实用新型</h5>
		</a>
	</li>

	<li  class=""> 
		<a href="<s:url value='/editor/newPatentDoc.html'/>?patentType=3">
		<h5>新建外观设计</h5>
		</a>
	</li>
 	 -->		
	</ul>
</div>