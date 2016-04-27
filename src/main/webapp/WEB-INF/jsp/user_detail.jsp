<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人信息</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
 
<div style="min-width:1300px;height:1500px; background:#F3F3F5;">
	<div style="float:left;width:5%;">
		<%@ include file="_left_nav.jsp" %>
	</div>
	<div style="float:left;width:95%;">

        <div class="center-cconcenct">
        	<!-- 代码 开始 -->
            <div id="change-t"><img src="<s:url value='/temp/images/tab.png'/>"  class="cgh"/></div>
			<div style="float:left;width:9%;">
				<%@ include file="_left_nav_user.jsp" %>
			</div>
			<div class="con-list" style="float:left;width:91%;">
				<div class="t-ti">
					<hr class="t-hr">
					<span style="font-size: 16px;font-weight: 300;line-height: 24px;">基本信息</span>
				</div>
                <div style="height:30px;"></div>



				<div class="t-third">
				  <div class="col-xs-12">
				    <!-- PAGE CONTENT BEGINS -->
				    <div class="row">
				      <div class="col-xs-12">
				        <form action="<s:url value='/user/addContactAddress.html'/>" method="post">
				          <se:csrfInput/>
				          <div style="margin-bottom:10px;"> 真实姓名：
				            <input style="height:20px;" class="ipt" name="truename" id="name"   value="${user.name}" maxlength="10">
				          </div>
				          <div style="margin-bottom:10px;"> 电子邮件：
				            <input style="height:20px;" class="email"  id="email" type="text" value="${user.email}" maxlength="25" >
				          </div>
				          <div style="margin-bottom:10px;"> 手机或固话：
				          <input type="hidden" name="phone_info"  value="2">
				           <input style="height:20px;" id="phone" type="text" value="${user.phone}" maxlength="15" >
				          </div>
				          <div style="margin-bottom:10px;"> 详细地址:
				            <input style="height:20px;"  name="dosubmit" id="dosubmit" value="保&nbsp;&nbsp;存" type="button" onclick="javascript:updateDetail()">
				          </div>
				          <input type="submit" value="保存"/>
				        </form>
				        <!-- /.span -->
				      </div>
				      <!-- /.row -->
				    </div>
				  </div>
				</div>



                      
              
                
			</div>
         
        </div>
		<!--container end-->
    </div>
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