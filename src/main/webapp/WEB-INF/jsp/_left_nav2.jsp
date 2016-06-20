<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">我的专利</div>
	
	<ul style="maring:0px;padding:0px;">
	<li  class=""> <a href="<s:url value='/patent/list.html?currentPage=1'/>">
	<h5>专利列表</h5>
	</a> 
	</li>
	<li  class=""> <a  href="<s:url value='/patent/searchPatent.html?q='/>">
	<h5>搜索添加</h5>
	</a> 
	</li>	
	<li  class=""> <a href="<s:url value='/patent/showUploadForm.html'/>">
	<h5>批量上传</h5>
	</a> 
	</li>
	<li  class=""> <a  href="<s:url value='/patent/addPatentFrom.html'/>">
	<h5>单个添加</h5>
	</a> 
	</li>
	<li  class=""> <a href="<s:url value='/patentOfficeAccount/list.html'/>">
	<h5>自动更新</h5>
	</a> 
	</li>   			
	</ul>
</div>