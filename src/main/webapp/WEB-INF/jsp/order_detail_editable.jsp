<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="spring" prefix="s" %>
<%@ taglib uri="security" prefix="se" %>
<%@ taglib uri="c" prefix="c" %>
<%@ taglib uri="fmt" prefix="fmt" %>
<%@ taglib uri="spring-form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
<title>控制台</title>
<%@ include file="_css.jsp" %>

</head>
<body class="no-skin">

<%@ include file="_nav.jsp"%>

<!-- /section:basics/navbar.layout -->
<div class="main-container" id="main-container">
	<%@ include file="_main_menu.jsp"%>
  <div class="main-content">
    <div class="main-content-inner">
      <!-- #section:basics/content.breadcrumbs -->
      <div class="breadcrumbs" id="breadcrumbs">
        <ul class="breadcrumb">
          <li> <i class="ace-icon fa fa-home home-icon"></i> <a href="#">主页</a> </li>
          <li> <a href="#">订单详情</a> </li>
        </ul>
      </div>
      <div class="page-content">
        <div class="row">
          <div class="col-xs-12">
          	<table class="table table-striped table-bordered table-hover">
	            <thead>
	              <tr class="simple_bag">
	              	<th>
	              		${order.orderStatus.statusDescription}订单
	              	</th>
	              </tr>
	            </thead>  
	            <tbody>
	            	<tr>
	            		<td>
			                 <table class="table table-striped table-bordered table-hover">
			                    <thead>
			                      <tr class="simple_bag">
			                      	<th>序号</th>
									<th>申请号/专利号</th>
									<th>专利名称</th>
									<th>第一申请人</th>
									<th>案件状态</th>
									<th>缴费截止日</th>
									<th>缴费种类</th>
									<th>缴费金额</th>
									<th>发票抬头</th>
			                      </tr>
			                    </thead>
			                    <tbody>
								
								<c:forEach items="${order.feeList}" var="fee" varStatus="status">
								<tr>
									<td class="center">${status.count}</td>
									<td>${fee.patent.appNo}</td>
									<td>${fee.patent.name}</td>
									<td>${fee.patent.firstAppPerson}</td>
									<td>${fee.patent.patentStatus.statusDescription}</td>
									<td><fmt:formatDate value="${fee.deadline}" pattern="yyyy-MM-dd"/></td>
									<td>${fee.feeType}</td>
									<td>${fee.amount} </td>
									<td>${fee.invoiceTitle}</td>
								</tr>
								</c:forEach>								
			                    </tbody>
			                  </table> 	            		
	            		</td>
	            	</tr>
	            </tbody>        	
          	</table>
          
         	<table class="table table-striped table-bordered table-hover">
	            <thead>
	              <tr class="simple_bag">
	              	<th>
	              		订单信息
	              	</th>
	              </tr>
	            </thead>  
	            <tbody>
	            	<tr>
	            		<td>
			                 <table class="table table-striped table-bordered table-hover">
					            <thead>
					              <tr class="simple_bag">
					              	<th>订单编号</th>
					              	<th>支付方式</th>
					              	<th>下单时间</th>
					              </tr>
					            </thead>			                 
			                    <tbody>
									<tr>
										<td>${order.id}</td>
										<td>${order.paymentMethod.paymentMethod}</td>
										<td><fmt:formatDate value="${order.createTime}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
									</tr>															
			                    </tbody>
			                  </table> 	            		
	            		</td>
	            	</tr>
	            </tbody>        	
          	</table>		
          	
          	<c:if test="${order.postAddress != null}">
         	<table class="table table-striped table-bordered table-hover">
	            <thead>
	              <tr class="simple_bag">
	              	<th>
	              		收货人信息
	              	</th>
	              </tr>
	            </thead>  
	            <tbody>
	            	<tr>
	            		<td>
	            			
			                 <table class="table table-striped table-bordered table-hover">
					            <thead>
					              <tr class="simple_bag">
					              	<th>收货人姓名</th>
					              	<th>地址</th>
					              	<th>电话</th>
					              </tr>
					            </thead>			                 
			                    <tbody>
									<tr>
										<td>
										${order.postAddress.receiver}
										</td>
										<td>
										${order.postAddress.provinceName}${order.postAddress.cityName}${order.postAddress.districtName}${order.postAddress.streetName}${order.postAddress.detailAddress}
										</td>
										<td>
										${order.postAddress.phone}
										</td>
									</tr>															
			                    </tbody>
			                  </table> 	        		
	            		</td>
	            	</tr>
	            </tbody>        	
          	</table>  
          	</c:if>  
          	<table class="table table-striped table-bordered table-hover">
	            <thead>
	              <tr class="simple_bag">
	              	<th>
	              		快递信息
	              	</th>
	              </tr>
	            </thead>  
	            <tbody>
	            	<tr>
	            		<td>
							<form action="<s:url value='/order/updateUserOrderContactAddresses.html'/>" method="post">
							<se:csrfInput/>
								快递单编号:<input type="text" name="receiver" id="receiver" value="${order.postAddress.receiver}" required/>
								快递公司:<input type="text" name="receiver" id="receiver" value="${order.postAddress.receiver}" required/>
								发送时间:
								快递员姓名:<input type="text" name="detailAddress" id="detailAddress"  value="${order.postAddress.detailAddress}" required/>		
								快递员联系方式:<input type="text" name="phone" id="phone" value="${order.postAddress.phone}" required/>
								<input type="hidden" name="orderId" id="orderId" value="${order.id}"/>
								<input type="submit" value="保存" />																							
							</form>
	            		</td>
	            	</tr>
	            </tbody>        	
          	</table>
          	
          	
         	<table class="table table-striped table-bordered table-hover">
	            <thead>
	              <tr class="simple_bag">
	              	<th>
	              		结算信息
	              	</th>
	              </tr>
	            </thead>  
	            <tbody>
	            	<tr>
	            		<td>
			                 <table class="table table-striped table-bordered table-hover">
			                    <tbody>
									<tr>
										<td>商品金额</td>
										<td>￥${order.amount}</td>
									</tr>															
			                    </tbody>
			                  </table> 	 
	            		</td>
	            	</tr>
	            </tbody>        	
          	</table>           	      	
          					
          </div>
        </div>
		<%@ include file="_footer.jsp"%>
    </div>
  </div>
</div>
<%@ include file="_js.jsp"%>
</div>
	<script type="text/javascript">
			function addDefaultOption(selectElem) {
				selectElem.append("<option value=''>请选择</option>");
			}
			
			function resetSelect() {
				for (var i = 0; i < arguments.length; i++) {
					var selectObj = arguments[i];
					selectObj.empty();
					addDefaultOption(selectObj);
				}
			}
			
			function addOptions(selectObj, options) {
				$.each(options, function(index, val){
					selectObj.append("<option value='" + val.id + "'>" + val.name + "</option>");
				});	
			}
			
			function loadCities() {
				var province = $("#province").val();
				
				resetSelect($("#city"), $("#district"), $("#street"));
				
				if (province != "") {
					$.ajax({
						url: "<s:url value='/user/getCitiesByProvince.html'/>?province=" + province,
						type: 'get',
						dataType: 'json',
						success: function(cities) {
							var city = $("#city");
							
							resetSelect(city);
							addOptions(city, cities);
						}
					})
				} 
			}
			
			function loadDistricts() {
				var city = $("#city").val();
			
				resetSelect($("#district"), $("#street"));
				
				if (city != "") {
					$.ajax({
						url: "<s:url value='/user/getDistrictsByCity.html'/>?city=" + city,
						type: 'get',
						dataType: 'json',
						success: function(districts) {
							var district = $("#district");
							
							resetSelect(district);
							addOptions(district, districts);
						}
					})
				}
			}
			
			function loadStreets() {
				var district = $("#district").val();
				
				resetSelect($("#street"));
				
				if (district != "") {
					$.ajax({
						url: "<s:url value='/user/getStreetsByDistrict.html'/>?district=" + district,
						type: 'get',
						dataType: 'json',
						success: function(streets) {
							var street = $("#street");
							
							resetSelect(street);
							addOptions(street, streets);
						}
					})
				} 
			}
	
	</script>
	
	<script type="text/javascript">
		function remind(){
			$("<div>操作成功</div>").dialog({
				modal: true,
				buttons: {
					Ok: function() {
					$(this).dialog("close");
					}
				}	
			});
		}
	
	</script>
</body>
</html>
