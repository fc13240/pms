<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>龙图腾专利管理系统——我的专利</title>
<%@ include file="_css.jsp" %>

<script type="text/javascript" src="<s:url value='/static/js/modernizr.js'/>"></script>
<script type="text/javascript" src="<s:url value='/static/js/spin.js'/>"></script>

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
				<div class="lt-box">
					<div style="background:#f5fafe;border-top: solid 1px #eee;border-left: solid 1px #eee;border-right: solid 1px #eee;height:50px;"> <span class="input-group-btn" >
			          <div class="ta-top" style="margin:8px;">
			          <c:if test="${accountType==0}"> 
			          <a href="<s:url value='/patentOfficeAccount/add_form.html'/>">
			            <button style="width:130px;" class="button button-primary  button-rounded">添加电子账户</button>  
			            </a>
			            </c:if> 
			          </div>
			          </span> </div>
			        <table id="simple-table" class="table table-striped table-bordered table-hover" >
			          <thead>
			            <tr class="simple_bag">
			              <th class="center" width="25"> <label class="pos-rel">
			                <input type="checkbox" class="patent-check-item" id="checkall"  name="checkall" />
			                <span class="lbl"></span> </label>
			              </th>
			              <th class="center" width="20">序号</th>
			              <th width="110">中国专利电子申请的用户名</th>
			              <th width="170">用户代码</th>
			              <th width="90">登陆密码 </th>
			              <th width="90" >更新时间</th>
			              <th width="60">操作</th>
			            </tr>
			          </thead>
			          <tbody>
			            <c:forEach items="${accounts}" var="account" varStatus="status">
			              <tr>
			                <td class="center"><label class="pos-rel"> <span class="batch-share-item">
			                  <input type="checkbox" class="patent-check-item" patent="<c:out value='${patent.patentId}'/>">
			                  <span class="lbl"></span></label></td>
			                <td class="center"> ${status.count + (page.currentPage-1)*page.pageSize} </td>
			                <td><c:out value="${account.name}"/>
			                </td>
			                <td><c:out value="${account.username}"/></td>
			                <td><c:out value="${account.password}"/></td>
			                <td><fmt:formatDate value="${account.patentUpdateTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
			                <td>
			                	<c:if test="${accountType==0}">
			                	<a href="JavaScript:void(0)" onclick="checkLogin('${account.username}','${account.password}','${account.accountId}','${account.userId}')">
			                  		验证登录 
			                  	</a>&nbsp;
			                  	</c:if>
			                	<a  href="JavaScript:void(0)" onclick="autoUpdatePatents('${account.username}','${account.password}','${account.accountId}','${account.userId}')">
			                  		自动更新
			                  	</a>&nbsp;
			                  	<c:if test="${accountType==0}">
			                	<a href="javascript:void(0)" onclick="updateAccount('${account.accountId}')">
			                  		修改</a>&nbsp;
			                  	<a href="JavaScript:void(0)" onclick="deleteAccount('${account.accountId}')">
			                                                             删除 
			                    </a> 
			                    </c:if>                                   
			                  </td>
		
			              </tr>
			            </c:forEach>
			          </tbody>
			        </table>				
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>	





	<div class="lt-box">
	  <div class="main-container" id="main-container">
	    <!-- PAGE CONTENT BEGINS -->
	    <div class="row">
	      <div class="col-xs-12">
	        
	 
	      </div>
	    </div>

	    <!--search box end-->
	  </div>
	</div>
  
  
 <!--list end --> 
</div>

<script src="<s:url value='/static/datepicker/WdatePicker.js'/>"></script>
<script type="text/javascript">
	$(function(){
		formutil.clickAllCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
		formutil.clickItemCheckbox('tr th input.patent-check-item', 'tr td input.patent-check-item');
	});
	
	function updateAccount(accountId) {
		window.open("<s:url value='/patentOfficeAccount/detail.html'/>?accountId=" + accountId);
	}
	
	function deleteAccount(accountId) {
		$.ajax({
			url: "<s:url value='/patentOfficeAccount/delete.html'/>?accountId="+ accountId,
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
	}
	function autoUpdatePatents(username,password,accountId,userId) {
		var opts = {
				  lines: 13, // The number of lines to draw
				  length: 7, // The length of each line
				  width: 4, // The line thickness
				  radius: 10, // The radius of the inner circle
				  corners: 1, // Corner roundness (0..1)
				  rotate: 0, // The rotation offset
				  color: '#000', // #rgb or #rrggbb
				  speed: 1, // Rounds per second
				  trail: 60, // Afterglow percentage
				  shadow: false, // Whether to render a shadow
				  hwaccel: false, // Whether to use hardware acceleration
				  className: 'spinner', // The CSS class to assign to the spinner
				  zIndex: 2e9, // The z-index (defaults to 2000000000)
				  top: '200px', // Top position relative to parent in px
				  left: '600px' // Left position relative to parent in px
				};
		var target = document.getElementById('simple-table');
		var spinner = new Spinner(opts).spin(target);		
		$.ajax({
			url: "<s:url value='/patentOfficeAccount/autoUpdatePatents.html'/>?username="+username + "&password="+password+"&accountId="+accountId+"&userId="+userId,
			type: 'get', 
			success: function() {
				spinner.stop();
				formutil.alertMessage('更新成功！',true);
			},
			error:function(){
				spinner.stop();
				formutil.alertMessage('更新失败，请稍后重试！');
			}
		});		
	}
	
	function checkLogin(username,password,accountId,userId) {
		$.ajax({
			url: "<s:url value='/patentOfficeAccount/checkLogin.html'/>?username="+username + "&password="+password+"&accountId="+accountId+"&userId="+userId,
			type: 'get', 
			success: function(success) {
				
				if(success=="true"){
					formutil.alertMessage('验证成功！');
				}else{
					formutil.alertMessage('账户异常或网络繁忙，请检查后重试！');
				}
			},
			error:function(){
				formutil.alertMessage('服务器错误!请联系管理员');
			}
		});		
	}

</script>

<script type="text/javascript">
/* 	$(function() {
		formutil.setElementValue("#pageSizeSelect", ${page.pageSize});
	}); */
	
	function setPageSize() {
		var pageSize = $("#pageSizeSelect").val();
		
		$.ajax({
			url: "<s:url value='/user/setPageSize.html'/>?pageSize=" + pageSize, 
			type: 'get', 
			success: function() {
				location.reload();
			}
		});		
	}	
</script>

</body>
</html>