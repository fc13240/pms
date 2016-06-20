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
<title>龙图腾专利管家——电子账户信息</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav2.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
					<form action="<s:url value='/patentOfficeAccount/add.html'/>" method="POST">
					
					
					<h5>中国专利电子申请的用户名:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" name="name" id="name"  value="" maxlength="30"/>
					<br>	  
			       	<h5>用户代码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="phoneRece" type="text" value="" name="username" maxlength="25"/>
					<br> 	
			       	<h5>登陆密码:</h5>
					<input class="selectPointOfInterest form-control" style="width:460px;" id="phoneRece" type="text" value="" name="password" required/>
					<br> 
					<button  type="submit" class="button button-primary  button-rounded">保存</button>					
					
					
					</form>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	

</body>
</html>