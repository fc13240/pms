<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s"%>
<%@ taglib uri="security" prefix="se"%>
<%@ taglib uri="c" prefix="c"%>
<%@ taglib uri="fmt" prefix="fmt"%>
<%@ taglib uri="spring-form" prefix="form"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path;
%>
<c:set var="base" value="<%=basePath%>" scope="application"></c:set>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,Chrome=1" />
<meta http-equiv="X-UA-Compatible" content="IE=9" />
<title>龙图腾专利管家——添加新闻</title>
<%@ include file="_css.jsp"%>
</head>
<body>
<script src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<%@ include file="_top.jsp"%>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >
		<div class="row" style="margin-left:-30px;min-width:1100px;">
			  <div class="col-xs-1 sidebar" style="min-width:100px;">
				<%@ include file="_left_nav_news.jsp" %>
			  </div>
			  <!--left end-->
			  <!--right begin-->
			  <div class="col-xs-offset-1 col-xs-11">
				<div class="lt-right">
					<div style="height:10px;"></div>
			  </div>		
			  <!--right end-->	
			  
			</div>

	    </div>
	</div>
</div>




<script type="text/javascript">
	
</script>
</body>
</html>