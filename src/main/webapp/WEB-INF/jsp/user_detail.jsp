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

                <div class="row" style="margin-top:30px;margin-left:20px;">
                    <div class="col-xs-12"> 
                      <!-- PAGE CONTENT BEGINS -->
                      <div class="row">
                        <div class="col-xs-12">
                
							<div class="patent-detail-caption">个人信息</div>
							<table class="table table-striped">
								<tr>
		                            <td class="f-tar td-w125"><label class="lab">真实姓名：</label></td>
		                            <td class="ps-relative"><input class="ipt" name="truename" id="name"   value="${user.name}" maxlength="10">
		                                <label style="display:none"><input class="radios"  type="radio" name="sex" value="0"   checked />先生</label>
		                                <label style="display:none"><input class="radios"  type="radio" name="sex" value="1"   />女士</label>
		                            </td>
                        		</tr>
								<tr>
		                            <td class="f-tar td-w125"><label class="lab">电子邮件：</label></td>
		                            <td> <input type="hidden" name="email_info"  value="1">
		                            <input class="email"  id="email" type="text" value="${user.email}" maxlength="25" ></td>
                        		</tr>
								<tr>
		                            <td class="f-tar td-w125"><label class="lab">手机或电话号：</label></td>
		                            <td> <input type="hidden" name="phone_info"  value="2">
		                            <input class="email"  id="phone" type="text" value="${user.phone}" maxlength="15" ></td>
                        		</tr>
                        		<tr>
		                            <td class="f-tar td-w125"></td>
		                            <td><input class="orange-red-btn" name="dosubmit" id="dosubmit" value="保&nbsp;&nbsp;存" type="button" onclick="javascript:updateDetail()"></td>
		                            
                        		</tr>													
							</table>
                        </div>
                        <!-- /.span --> 
                      </div>
                      <!-- /.row --> 
                      
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