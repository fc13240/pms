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
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<script type="text/javascript" src="<s:url value='/temp/js/jquery_from.js'/>"></script>
<link rel="stylesheet" href="<s:url value='/temp/css/praise.css'/>">
<title>龙图腾专利管家-新闻列表</title>
<%@ include file="_css.jsp" %>
</head>
<body>

<!--动态点赞开始-->
<div class="text-content">
	<h1>艾弗森、科比、詹姆斯，谁的得分能力更强？</h1>
	<p>
		科比、艾弗森、詹姆斯都是顶级的得分高手，科比进攻技巧多样、几乎没有攻击死角。艾弗森速度快如闪电、突破无解。詹姆斯身体素质惊人、碾压对手。<br />
		科比：“飞侠”科比拥有完美的身体素质，娴熟的进攻技巧，加上超强的求胜欲望。成就了不可阻挡的科比。科比的6大绝招，招招致命，并且科比可以自由切换，这让防死科比成为了不可能完成的任务。那些所谓的科比终结者，最后只能成为科比变得更强的垫脚石。3节62分，单场81分，科比视得分如探囊取物。<br/>
		艾弗森：“答案”艾弗森与科比同时出道，虽然身高矮了一些，但是艾弗森的得分能力毫不逊色。艾弗森的突破速度快如闪电，同时艾弗森拥有超强的弹跳、弹速也很快。艾弗森的敏捷性、柔韧性和协调性都非常的好，这让他的突破变得更加无解。艾弗森在球场上毫无畏惧，充满斗志，永不服输，4届得分王证明了他的实力。<br />
		詹姆斯：“小皇帝”詹姆斯，有很好的大局观，当时同时，他也拥有超强的得分能力。身高2.03米，体重113公斤，却拥有着后卫一样的速度与控球技巧。刚刚出道的詹姆斯以突破为主，后来的詹姆斯中距离投篮也渐渐成熟，让詹姆斯变得更加难以防守。
	</p>
</div>
<div class="praise">
	<span id="praise${article.id}" onclick="prasie(${article.id})"><img src="<s:url value='/temp/images/zan.png'/>" id="praise-img" class="animation" width="20px;" height="20px;"></span>
	<span id="praise-txt">1455</span>
	<span id="add-num"><em>+1</em></span>
</div>
<!--动态点赞结束-->

<script>
	/* @author:Romey
	 * 动态点赞
	 * 此效果包含css3，部分浏览器不兼容（如：IE10以下的版本）
	*/
	$(function(){
		$("#praise${article.id}").click(function(){
			var praise_img = $("#praise-img");
			var text_box = $("#add-num");
			var praise_txt = $("#praise-txt");
			var num=parseInt(praise_txt.text());
			$.ajax({
				type:"get",
				url: "<s:url value='/article/praise.html'/>?upVote=", 
			    success: function (data) {
			    	$(this).html("<img src='<s:url value='/temp/images/zan.png'/>' width='20px;' height='20px;' id='praise-img' class='animation' />");
					praise_txt.addClass("hover");
					text_box.show().html("<em class='add-animation'>+1</em>");
					$(".add-animation").addClass("hover");
					num +=1;
					praise_txt.text(num)
			    }
				
			})
		});
		
		$("#slander"+articleId).click(function(){
			$.ajax({
				type:"post",
				url: "<s:url value='/article/praise.html'/>", 
			    data: obj, 
			    success: function (data) {
			    	$(this).html("<img src='<s:url value='/temp/images/zan.png'/>' width='20px;' height='20px;' id='praise-img' class='animation' />");
					praise_txt.removeClass("hover");
					text_box.show().html("<em class='add-animation'>-1</em>");
					$(".add-animation").removeClass("hover");
					num -=1;
					praise_txt.text(num)
			    }
				
			})
			
		});
	})
	
	function onclick(id,number){
		var praise_img = $("#praise-img");
		var text_box = $("#add-num");
		var praise_txt = $("#praise-txt");
		var num=parseInt(praise_txt.text());
		$.ajax({
			type:"get",
			url: "<s:url value='/article/praise.html'/>?upVote="+number, 
		    success: function (data) {
		    	$("#praise"+id).html("<img src='<s:url value='/temp/images/zan.png'/>' width='20px;' height='20px;' id='praise-img' class='animation' />");
				praise_txt.addClass("hover");
				text_box.show().html("<em class='add-animation'>+1</em>");
				$(".add-animation").addClass("hover");
				num +=1;
				praise_txt.text(num)
		    }
			
		})
	}
</script>
</body>
</html>