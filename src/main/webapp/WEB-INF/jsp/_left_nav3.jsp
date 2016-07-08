<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="lt-left">
	<div class="lt-left-title">专利交易</div>
	
	<ul style="maring:0px;padding:0px;">
	 <se:authorize access="hasRole('ROLE_TRADER')"> 
  	<li  class=""> <a href="<s:url value='/patent/getUserTransactionPatents.html?currentPage=1'/>">
	<h5>商品列表</h5>
	</a> 
	</li>
	 </se:authorize>			
	</ul>
</div>