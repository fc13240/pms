<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>基本信息</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_user.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 20px;font-weight: 300;line-height: 24px;">基本信息</span>
	</div>
	
	<div class="lt-third" style="background:#fff;margin-top:10px;">
		<form action="<s:url value='/user/updateUserDetail.html'/>" method="POST">
			
       	<h5>联系人名称:</h5>
		<input class="selectPointOfInterest" type="text" name="receiver" required/>
		<br>	  
       	<h5>手机或固话:</h5>
		<input class="selectPointOfInterest" type="text" name="phone" required/>
		<br> 
       	<h5>通讯地址:</h5>
		<select name="province" id="province" onchange="loadCities()" required>
		  <option value=''>请选择</option>
		  <c:forEach items="${provinces}" var="province">
			<option value="${province.id}">${province.name}</option>
		  </c:forEach>
		</select>
		<select name="city" id="city" onchange="loadDistricts()" required>
		  <option value=''>请选择</option>
		</select>
		<select name="district" id="district" onchange="loadStreets()" required>
		  <option value=''>请选择</option>
		</select>
		<select name="street" id="street" required>
		  <option value=''>请选择</option>
		</select>		
		<br> 		  
       	<h5>详细地址:</h5>
		<input class="selectPointOfInterest" type="text" name="detailAddress" required/>
		<br>   
		<div style="height:20px;"></div> 
		<button type="submit" style="width:90px;" class="t-btn2">保存</button>	
		</form>		
	</div>


</div>

<script type="text/javascript">
	function updateDetail(){
		var username = $("#username").val();
		var name = $("#name").val();
		var email = $("#email").val();
		var phone = $("#phone").val();
		var url = "<s:url value='/user/updateUserDetail.html'/>?username=" +username +"&name="+ name+"&email="+email+"&phone="+phone;
		location.href = url
	}
</script>
</body>
</html>