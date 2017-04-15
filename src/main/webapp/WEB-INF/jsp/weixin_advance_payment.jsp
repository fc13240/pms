<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="spring" prefix="s"%>
<%@ taglib uri="security" prefix="se"%>
<%@ taglib uri="c" prefix="c"%>
<%@ taglib uri="fmt" prefix="fmt"%>
<%@ taglib uri="spring-form" prefix="form"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>龙图腾微信收银台</title>
<%@ include file="_css.jsp"%>

<style type="text/css">
	body{
		font-family: Microsoft Yahei;
		font-size: 1.8em;
	}
	.title{
	 	font-family: Microsoft Yahei;
	 	font-size: 1.2em;
	 	font-weight: 700;
	 
	} 
	.container{
	 	margin: 200px auto 200px auto;
	 	max-width: 1050px;
	 
	}
	.trade-info-top{
		background-color: #EBEBEB;
		height: 80px;
		
	}
	.trade-info{
		width : 50%;
		display: inline-block;
		float: left;
		height: 100px;
		padding-left: 5px;
	}
	.trade-info-fee{
		width : 50%;
		float: left;
		display: inline-block;
		height: 100px;
	}
	.trade-info-fee span{
		position: relative;
		min-width: 300px;
		left: 50%;
		top: 35%;
		text-align: center;
	}

	.weixin-fee{
		margin-top: 10px;
		border: 1px solid #E3E3E3;
		height: 55px;
	
	}

	.weixin-pay-image{
		width: 280px;
		height: 280px;
		margin: auto;
	}
	.weixin-pay-hint-image{
		width: 260px;
		margin: auto;
	}
</style>

</head>
<body>
	<div class="container">
		<div class="title">
			<span>
				龙图腾微信收银台
			</span>
		</div>
		<div class="trade-info-top">
			<div class="trade-info">
				<p >
					订单编号:${order.id }
				</p>
				<p style="margin-bottom: 0px;">
					订单说明:微信支付
				</p>
			</div>
			<div class="trade-info-fee">
				<span>
					应付金额:￥${order.amount }元
				</span>
			</div>
		</div>
		<div>
			<div class="weixin-fee">
				<div style="float: left;">
					<img alt="" src="<s:url value='/static/weixin/wePayLogo.png'/> " width="150px" height="40px"/>
				</div>
				<div style="float: right;">
					<span>
						支付:<span style="color: #EE9A49">${order.amount } </span>元
					</span>
				</div>

			</div>
			
			<div>
				<div class="weixin-pay-image" onmouseover="getWeixinExampleImg()" onmouseout="wipeWeixinImg()">
					<img alt="" src="<s:url value='/weixinPay/payImage.html?orderId=${order.id }'/> " width="280px" height="280px" />
				</div>
			</div>
			<div>
				<div class="weixin-pay-hint-image">
					<img alt="" src="<s:url value='/static/weixin/wePayStateText.png'/> " width="260px" />
				</div>
			</div>
		</div>
	</div>


	<div style="display: none;" id="weExampleImg" style="width: 200px;height: 400px">
		<img src="<s:url value='/static/weixin/weExample.png'/>" />

	</div>
</body>

<script type="text/javascript">
	function getWeixinExampleImg(){
		var divTop = $(".weixin-pay-image").offset().top-120;
		var divLeft = $(".weixin-pay-image").offset().left+$(".weixin-pay-image").width()-40;
		$("#weExampleImg").css({"position":"absolute","top":divTop,"left":divLeft,"display":"block"})
	}

	function wipeWeixinImg(){
		$("#weExampleImg").css("display","none")
	}
</script>
</html>