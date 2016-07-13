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
<title>龙图腾专利管家——联系地址</title>
<%@ include file="_css.jsp" %>
</head>
<body>
<%@ include file="_top.jsp" %>
<div class="lt-con" style="min-width:1100px;">
	<div class="container-fluid" >

		<div class="row" style="margin-left:-30px;min-width:1100px;">
		
			<!--left begin-->
		  <div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_user.jsp" %>
		  </div>
		  <!--left end-->
		  <!--right begin-->
		  <div class="col-xs-offset-1 col-xs-11">
			<div class="lt-right">
				<div style="height:10px;"></div>
				<div class="lt-box" style="padding:20px;">
				  <form>
					<button type="button" style="width: 100px;margin:20px;" class="button button-rounded button-primary" onclick="javascript:addAddress()">增加地址</button>
					<table id="simple-table" class="table table-striped table-bordered table-hover">
					  <thead>
						<tr class="simple_bag">
						  <th>序号</th>
						  <th>联系人</th>
						  <th>所在地区</th>
						  <th>地址</th>
						  <th>联系电话</th>
						  <th>操作功能</th>
						</tr>
					  </thead>
					  <c:forEach items="${contactAddresses}" var="address" varStatus="status">
						<tr>
						  <td class="center">${status.count}</td>
						  <td>${address.receiver}</td>
						  <td>${address.provinceName} ${address.cityName} ${address.districtName}
						  </td>
						  <td>${address.detailAddress}</td>
						  <td>${address.phone}</td>
						  <td><a href="<s:url value='/user/updateUserContactAddressesFrom.html'/>?id=<c:out value='${address.id}'/>"> 编辑 </a> <a href="<s:url value='/user/deleteUserContactAddresses.html'/>?id=<c:out value='${address.id}'/>">
							<!-- 		           						<button class="t-btn4">删除</button> -->
							删除 </a>
							<c:if test="${!address.defaultAddress}"> <a style="margin-left:30px;" href="<s:url value='/user/defaultUserContactAddresses.html'/>?id=<c:out value='${address.id}'/>"> 设为默认 </a> </c:if>
							<c:if test="${address.defaultAddress}"> <span style="margin-left:30px;">默认地址</span> </c:if>
						  </td>
						</tr>
					  </c:forEach>
					</table>
				  </form>
				</div>
			</div>

		  </div>		
		  <!--right end-->	
		  
		</div>

	</div>

</div>



<script type="text/javascript">
	function addAddress(){
		var url = "<s:url value='/user/contactAddressAddForm.html'/>";
		location.href = url
	}
</script>
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