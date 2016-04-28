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
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">基本信息</span>
	</div>
	
	<div class="t-third">
	  <div class="col-xs-12">
		<!-- PAGE CONTENT BEGINS -->
		<div class="row">
		  <div class="col-xs-12">
			<div class="patent-detail-caption">
			  <h3>个人信息编辑</h3>
			</div>
			&nbsp&nbsp&nbsp&nbsp
			<table class="table table-striped">
			  <tr>
				<td class="f-tar td-w125"><h4 class="lab">真实姓名：</h4></td>
				<td class="ps-relative"><input class="ipt" type="text" name="truename" id="name" style="height:30px;width:200px;"  value="${user.name}" maxlength="10">
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
				<td><input type="hidden" name="email_info"  value="1">
				  <input class="email"  id="email" type="text" style="height:30px;width:200px;"value="${user.email}" maxlength="25" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125"><h4 class="lab">手机或电话号：</h4></td>
				<td><input type="hidden" name="phone_info"  value="2">
				  <input class="phone"  id="phone" type="text" style="height:30px;width:200px;" value="${user.phone}" maxlength="20" ></td>
			  </tr>
			  <tr>
				<td class="f-tar td-w125"></td>
				<td><input class="orange-red-btn" name="dosubmit" id="dosubmit" value="保&nbsp;&nbsp;存" type="button" onclick="javascript:updateDetail()"></td>
			  </tr>
			</table>
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