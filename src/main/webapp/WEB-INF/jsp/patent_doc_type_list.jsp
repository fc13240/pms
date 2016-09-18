<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家-专利撰写</title>
<%@ include file="_css.jsp" %>

</head>
<body>
<style type="text/css"> 

</style>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >
		<div class="row" style="margin-left:-30px;min-width:1100px;">
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				
				<!--search form end-->
				<div class="lt-box apply-four" style="padding:15px;">

				    <ul class="clearfloat">
			          <li class="list-app">
			            <i style="width: 150px;height: 110px;"></i>
			            <h5>发明专利</h5>
			            
			            <p class="apply-des">保护产品创新和方法创新<br>1-2年授权，20年保护期</p>
			            <a class="index-btn" target="_blank" href="<s:url value='/editor/newPatentDoc.html'/>?patentType=1">立即撰写</a>
			          </li>
			          <li class="list-app">
			            <i style="width: 150px;height: 110px;"></i>
			            <h5>实用新型</h5>
			           
			            <p class="apply-des">保护产品型状、构造等微创新<br>3-6个月授权，10年保护期</p>
			            <a class="index-btn" target="_blank" href="<s:url value='/editor/newPatentDoc.html'/>?patentType=2">立即撰写</a>
			          </li>
			          <li class="list-app">
			            <i style="width: 150px;height: 110px;"></i>
			            <h5>外观专利</h5>
			            
			            <p class="apply-des">保护产品外形、包装等<br>3-6个月授权，10年保护期</p>
			           <a class="index-btn" target="_blank" href="<s:url value='/editor/newPatentDoc.html'/>?patentType=3">立即撰写</a>
			          </li>
			 
			        </ul>
			
				</div>
				<!-- list end -->
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	
    <%@ include file="_footer_js.jsp" %>
</body>
</html>