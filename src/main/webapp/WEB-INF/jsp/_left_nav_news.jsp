<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">新闻中心</div>
	
	<ul style="maring:0px;padding:0px;">
	
	<li class="active"> 
		<a href="<s:url value='/news/list.html'/>">
		<h5>新闻列表</h5>
		</a>
	</li> 		
	<li class="active"> 
		<a href="<s:url value='/news/addNewsForm.html'/>">
		<h5>新闻添加</h5>
		</a>
	</li> 
	<se:authorize access="hasAnyRole('ROLE_TRADER','ADMIN')">
	<li class="active"> 
		<a href="<s:url value='/news/getNewsTypeList.html'/>">
		<h5>分类管理</h5>
		</a>
	</li>
	</se:authorize> 
	</ul>
</div>