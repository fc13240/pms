<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">商标管理</div>
	
	<ul style="maring:0px;padding:0px;">
	
	<li class="active"> 
		<a href="<s:url value='/brand/list.html'/>">
		<h5>商标列表</h5>
		</a>
	</li> 		
	<li class="active">
		<a href="<s:url value='/brand/addBrandForm.html'/>">
		<h5>商标添加</h5>
		</a>
	</li> 
	<li class="active">
		<a href="<s:url value='/brand/buyRecords.html'/>">
		<h5>购买记录</h5>
		</a>
	</li> 
	<!-- <se:authorize access="hasAnyRole('ROLE_NEWS')">
	</se:authorize>  -->
	<%-- <li class="active"> 
		<a href="<s:url value='/article/getArticleTypeList.html'/>">
		<h5>分类管理</h5>
		</a>
	</li> --%> 

	</ul>
</div>