<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">通知书</div>
	
	<ul style="maring:0px;padding:0px;">
	<li class="active"> 
		<a href="<s:url value='/notice/list.html?currentPage=1'/>"><h5>通知监控</h5>
		</a>
	</li>
	<li  class=""> 
	<a href="<s:url value='/notice/showUploadForm.html'/>"><h5>上传通知书</h5></a>
	</li>
	<li  class=""> 
	<a href="<s:url value='/notice/search.html?page.currentPage=1&noticeProcessStatus=1'/>"><h5>应处理</h5></a>
	</li>
	<li>
	  <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=1&noticeProcessStatus=1'/>">
	<h5>新案受理 </h5>
	 </a>
	</li> 

	<li> 
	 <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=2&noticeProcessStatus=1'/>">
	缴费通知
	 </a>
	</li> 

	<li>
	 <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=3&noticeProcessStatus=1'/>">
	补正审查 
	 </a>
	</li>

	 <li>
	 <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=4&noticeProcessStatus=1'/>">
	专利授权 
	 </a>
	</li> 

	 <li>
	 <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=5&noticeProcessStatus=1'/>">
	权利丧失 
	   </a>
	</li>

	<li> 
	   <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=6&noticeProcessStatus=1'/>">
	手续合格 
	 </a>
	</li>
	 <li>
	 <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=8&noticeProcessStatus=1'/>">
	驳回决定 
	 </a>
	</li>					        
	<!--  <li>
	 <a href="<s:url value='/notice/search.html?page.currentPage=1&noticeType=7&noticeProcessStatus=1'/>">
	其他 
	 </a>
	</li>
		 -->			 			
  			
	</ul>
</div>	