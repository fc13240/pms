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
	
	<div class="t-third">
	  <div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div class="row">
		  <div class="col-xs-12">
			<div class="patent-detail-caption">
			  <h4>基本信息编辑</h4>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;
			<form action="<s:url value='/user/updateUserDetail.html'/>" method="POST">
			<table class="table table-striped">
			  <tr>
				<td class="f-tar td-w125"><h4 class="lab">真实姓名/名称：</h4></td>
				<td class="ps-relative"><input class="ipt" type="text" name="name" id="name" style="height:30px;width:200px;"  value="${user.name}" maxlength="30">
<!-- 				  <label style=""> -->
<!-- 				  <input class="radios"  type="radio" name="sex" value="0"   checked /> -->
<!-- 				  先生</label> -->
<!-- 				  <label style=""> -->
<!-- 				  <input class="radios"  type="radio" name="sex" value="1"   /> -->
<!-- 				  女士</label> -->
				</td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125"><h4 class="lab">电子邮件：</h4></td>
				<td>
				  <input class="email"  name="email" id="email" type="text" style="height:30px;width:200px;"value="${user.email}" maxlength="25" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125"><h4 class="lab">手机或电话号：</h4></td>
				<td>
				  <input class="phone" name="phone" id="phone" type="text" style="height:30px;width:200px;" value="${user.phone}" maxlength="30" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125"></td>
				<td><input class="orange-red-btn" name="dosubmit" id="dosubmit" style="background:red;color:#FFF " value="保&nbsp;&nbsp;存" type="submit" ></td>
			  </tr>
			</table>
			</form>
			<!-- /.span -->
		  </div>
		  <!-- /.row -->
		</div>
	  </div>
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