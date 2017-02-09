<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">商标交易</div>
	
	<ul style="maring:0px;padding:0px;">
	
	<li class="active"> 
		<a href="<s:url value='/brand/list.html'/>">
		<h5>交易列表</h5>
		</a>
	</li> 	
	<li class="active">
		<a href="<s:url value='/brand/showUploadForm.html'/>">
		<h5>批量上传</h5>
		</a>
	</li>
	<li class="active"> 
		<a href="<s:url value='/brand/getBrandManagementlist.html'/>">
		<h5>返回商标管理</h5>
		</a>
	</li>	
	<%-- <li class="active">
		<a href="<s:url value='/brand/brandAddForm.html'/>">
		<h5>商标添加</h5>
		</a>
	</li> --%>
	<%-- <se:authorize access="hasAnyRole('ROLE_TRADER','ROLE_PLATFORM')">
	<li class="active">
		<a href="<s:url value='/brand/getWechatOrderList.html'/>">
		<h5>购买记录</h5>
		</a>
	</li> 
	</se:authorize> --%>

	</ul>
</div>