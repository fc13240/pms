<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
 
<div style="min-width:1300px;height:1500px; background:#F3F3F5;">
<<<<<<< HEAD

	<%@ include file="_left_nav.jsp" %>
	<%@ include file="_left_nav2.jsp" %>
	<div style="height:4000px;width:85%;position:absolute;left:210px;margin-top:100px; background:#fff;">
	<div style="height:200px;background:#deded;">33333</div>
		<div >123123</div>
=======
	<div style="float:left;width:70px;">
		<%@ include file="_left_nav.jsp" %>
>>>>>>> bd9f3b21ac0110c0c4dca86081530456b0a0037a
	</div>
<!-- 	<div style="float:left;margin-left:206px;min-width:1200px;"> -->
<!--         <div class="center-cconcenct"> -->
<!--         	代码 开始 -->
<%-- <%--             <div id="change-t"><img src="<s:url value='/temp/images/tab.png'/>"  class="cgh"/></div> --%> --%>

<!-- 				<div class="t-ti"> -->
<!-- 					<hr class="t-hr"> -->
<%-- 					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">专利概况</span> --%>
<!-- 				</div> -->
<!--                 <div style="height:30px;"></div> -->

<!-- 				<div class="t-box"> -->
<!-- 							欢迎使用龙图腾软件管理  -->
							
<!-- 							欢迎使用龙图腾软件管理   欢迎使用龙图腾软件管理   欢迎使用龙图腾软件管<br>理   欢迎<br>使用龙图腾软件管<br>理   欢迎使<br>用龙图腾软<br>件管理  <br> 欢<br>迎<br>使用龙图腾<br>软件管理<br>   欢迎使用龙图腾软件管理   欢迎使用龙图腾软件管理               -->
<!--                 </div>                 -->

         
<!--         </div> -->
<!-- 		<!--container end--> -->
<!--     </div> -->
</div>
<script>
	$(document).ready(function(){
	
		$("img[class=cgh]").click(function(){
			var ol = $('ol[class="hashTabber-nav hashTabber-sandstone"]')[0];
			var ols =$('.con-list')[0];
			if(ol.style.display=="inline-block"||ol.style.display==""){
					this.style.marginLeft="0px";
					this.src='<s:url value='/temp/images/tabs.png'/>';
					ol.style.display="none";
					ols.style.width="97%";
				}else{
					ol.style.display="inline-block";
					this.style.marginLeft="108px";
					this.src='<s:url value='/temp/images/tab.png'/>';
					ols.style.width="88%";
				}
		});
	});
</script>
</body>
</html>