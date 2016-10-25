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
<title>添加新闻-龙图腾专利管家</title>
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
<style type="text/css">
.wrap {
    padding: 20px 20px 20px;
}
.nav-tabs1 {
height:37px;
    border-bottom: 1px solid #ddd;
}
.nav1 {
    margin-bottom: 20px;
    margin-left: 0;
    list-style: none;
}
.nav-tabs1>li {
    margin-bottom: -1px;
}


.nav-tabs1>li>a, .nav-pills>li>a {
    padding-right: 12px;
    padding-left: 12px;
    margin-right: 2px;
    line-height: 14px;
}
.nav-tabs1>li>a {
    padding-top: 8px;
    padding-bottom: 8px;
    line-height: 20px;
    border: 1px solid transparent;
    -webkit-border-radius: 4px 4px 0 0;
    -moz-border-radius: 4px 4px 0 0;
    border-radius: 4px 4px 0 0;
}
.nav1>li>a {
    display: block;
}
.nav-tabs1>li, .nav-pills>li {
    float: left;
}
.nav-tabs1>.active>a, .nav-tabs1>.active>a:hover, .nav-tabs1>.active>a:focus {
    color: #95a5a6;
    cursor: default;
    background-color: #fff;
    border: 1px solid #ddd;
    border-bottom-color: transparent;
}
.table_con{
    width: 100%;
    margin-bottom: 20px;
    border: 1px solid #ddd;
    border-collapse: separate;
    border-left: 0;
    -webkit-border-radius: 3px;
    -moz-border-radius: 3px;
    border-radius: 3px;
}
.table_con th, .table_con td {
    border-left: 1px solid #ddd;
}
.table_con th, .table_con td {
    vertical-align: middle;
}
.table_con th, .table_con td {
    padding: 8px;
    line-height: 20px;
    text-align: left;
    vertical-align: top;
    border-top: 1px solid #ddd;
}
</style>					
					
					<div class="hy_zx_r02">
						<div class="wrap">
							<ul class="nav1 nav-tabs1">
								<li class="active"><a>新闻发布</a></li> 
								<li><a href="/admin.php/news/zr_list.html">返回列表</a></li>
							</ul>
						</div>
						<div class="lou-content" style="padding:10px;">
							<form method="post" action="/admin.php/news/zr_add.html">
							<table class="table_con">
								<tbody><tr>
									<th width="80">新闻分类</th>
									<td>
										<select name="classid" id="classid" onchange="bindSortChild()" required="required">
											<option value="">--请选择--</option>						
											<option value="1">行业新闻</option>
											<option value="2">热点聚焦</option> 						
										</select> 
									</td>
								</tr>
								<tr>
									<th>标题</th>
									<td>
										<input type="hidden" name="news_type" value="2">
										<input name="news_name" id="txtTitle" style="width:400px;" type="text" size="40" required="required" placeholder="请输入标题">
										<span class="form-required">*</span>
									</td>
								</tr>
								<tr>
									<th>作者</th>
									<td>
									<input name="zr_price" type="text" onkeyup="DigitalKeyup1(this)" id="zfree" size="40">
									</td>
								</tr>								
								<tr>
									<th>来源</th>
									<td>
									<input name="zr_price" type="text" onkeyup="DigitalKeyup1(this)" id="zfree" size="40">
									</td>
								</tr>								
								<tr>
									<th>关键字</th>
									<td>
											<select name="status" id="select4" required="required">
											<option value="0">--请选择--</option>
											<option value="1">营业中</option>
											<option value="2">未营业</option>
											</select>
									</td>
								</tr>
								<tr>
									<th>缩略图</th>
									<td>
										<select name="qid" id="district" onchange="load_streets()" required="required">
											<option value="0">--请选择--</option>						
											<option value="1">玄武</option><option value="2">鼓楼</option><option value="3">白下</option><option value="4">秦淮</option><option value="5">下关</option><option value="6">雨花台</option><option value="7">浦口</option><option value="8">栖霞</option><option value="9">江宁</option><option value="10">六合</option><option value="11">高淳</option><option value="12">溧水</option><option value="13">建邺</option><option value="14">大厂</option><option value="15">南京周边</option> 						
										</select>
										&nbsp;&nbsp;&nbsp;&nbsp;片区：
										<select name="pid" id="street" required="required">
										<option value="0">--请选择--</option>
										</select>
									</td>
								</tr>
								<tr>
									<th>摘要</th>
									<td><input name="address" style="width:400px;" type="text" id="address" size="40"></td>
								</tr>
								<tr>
									<th>内容</th>
									<td><input name="mianji" type="text" id="size" size="10" required="required">㎡</td>
								</tr>

								</tbody>
							</table>	
							<div class="form-actions">
								<button class="btn btn-primary js-ajax-submit" type="submit">提交</button>
								<a class="btn" href="/index.php?g=&amp;m=AdminPost&amp;a=index">返回</a>
							</div>		
							</form>
						</div>
						
					</div>					
					
					
					
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