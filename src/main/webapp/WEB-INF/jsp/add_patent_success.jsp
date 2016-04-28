<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>


<%@ include file="_top.jsp" %>
<%@ include file="_left_nav.jsp" %>
<%@ include file="_left_nav_user.jsp" %>
<div class="lt-con">
	<div class="t-ti">
		<hr class="t-hr">
		<span style="font-size: 16px;font-weight: 300;line-height: 24px;">添加专利</span>
	</div>
	<div class="lt-box">
		<div class="widget-box">
		  <label class="block clearfix"> <span class="block input-icon input-icon-right" style="font-size:20px;"> 操作成功！ </span> </label>
		</div>
		<!-- /.widget-box -->
		<div class="toolbar center"> <a href="<s:url value='/patent/list.html'/>"  > <i class="ace-icon fa fa-arrow-left"></i> 返回 </a> </div>
		</div>
	</div>

</div>

</body>
</html>
			