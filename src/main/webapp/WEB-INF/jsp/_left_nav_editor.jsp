<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">专利撰写</div>
	
	<ul style="maring:0px;padding:0px;">
	<li class="active"> 
		<a href="<s:url value='/editor/patentDocList.html'/>">
		<h5>撰写列表</h5>
		</a>
	</li> 
	<li class="active"> 
		<a href="<s:url value='/editor/newPatentType.html'/>">
		<h5>在线撰写</h5>
		</a>
	</li> 		
	 <se:authorize access="hasAnyRole('ROLE_TRADER','ADMIN')">
	   <li>
   		<a href="<s:url value='/editor/choicePatentDocTemplateType.html'/>">
   		 	<h5>专利模板</h5>
   		</a>
	   		
	   </li>
	 </se:authorize>
	  
	<li class="active"> 
		<a href="<s:url value='/appPerson/list.html'/>">
		<h5>常用申请人</h5>
		</a>
	</li>	
	
	<li class="active"> 
		<a href="<s:url value='/inventor/list.html'/>">
		<h5>常用发明人</h5>
		</a>
	</li>
			
	</ul>
</div>