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
<title>龙图腾专利管家－我的专利！</title>
<%@ include file="_css.jsp" %>
<style type="text/css">
.main2 {
    clear: both;
    background: #fff;
    border: #e6e6e6 1px solid;
    margin: 180px auto -44px;
    width: 1200px;
    border-radius: 8px;
    box-shadow: 0 0 4px #e6e6e6;
    padding: 15px 15px 15px 0px;
    overflow: auto;
}

.title1 a {
    line-height: 30px;
    color: #3d6dcc;
    cursor: pointer;
}

.tit_top {
    clear: both;
    margin: 9px 58px;
    width: 90%;
    border-bottom: #f2f2f2 3px solid;
    overflow: auto;
}
.title2 {
    color: #3691d6;
    font-size: 24px;
    font-weight: bold;
    padding: 0px 20px 20px 4px;
}
.uppic2 {
    background: url(images/buttons.png) no-repeat scroll -96px -59px;
    color: #999;
    float: right;
    font-size: 14px;
    height: 32px;
    line-height: 32px;
    margin-top: 8px;
    text-align: center;
    text-shadow: 1px 1px 0 #e6e6e6;
    width: 97px;
    cursor: pointer;
    margin-left: 44px;
    margin-bottom: 14px;
    margin-top: -30px;
}
.top1 {
    padding-top: 10px;
}
table {
    clear: both;
    width: 90%;
    margin: 0 auto;
    border: 1px solid #e1e6eb;
}
* {
    margin: 0;
    padding: 0;
    font-size: 12px;
    font-family: "microsoft yahei" ,宋体;
    color: #000;
    line-height: 18px;
    text-decoration: none;
}
.pageh3 {
    clear: both;
    float: right;
    padding-bottom: 10px;
    padding-top: 5px;
    width: 540px;
}
.title1 {
    line-height: 24px;
    width: 300px;
    max-width: 300px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
    cursor: pointer;
}
.odd {
    background: #f5f8fa;
}
table td {
    line-height: 30px;
    padding: 5px 0 5px 10px;
    color: #666;
}

table td a {
    line-height: 30px;
    color: #056dae;
    padding-right: 10px;
    cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function () {
		$("#table tr:even").css("background-color", "#f5f8fa");
	});
	
	</script>
</head>


	<body>
	<%@ include file="_top.jsp" %>
	<div class="col-xs-1 sidebar" style="min-width:100px;">
			<%@ include file="_left_nav_editor.jsp" %>
		  </div>
	<div id="replaceHere" style="margin:-23px 0 0 40px;">
<div class="main2">
    <div class="tit_top">
        <div class="title2">
            撰写列表</div>
   <!--      <div class="uppic2" onclick="adduser();">
        新建专利
            </div> -->
               
    </div>
    <div class="cl top1">
        
    </div>
    <table id="table" cellspacing="0" cellpadding="0" border="0">
        <tbody>
            <tr id="tr0" style="background: #f7f7f7; border-bottom: 1px solid #e1e6eb;">
                <td width="47%" valign="middle" height="30" align="left" class="td1h">
                    标题
                </td>
                <td width="13%" height="30" align="left" valign="middle" class="td1h">
                    创建时间
                </td>
                <td width="13%" height="30" align="left" valign="middle" class="td1h">
                    更新时间
                </td>
                <td width="27%" valign="middle" height="30" align="left" class="td1h td2">
                    操作
                </td>
            </tr>
            
           <c:forEach items="${patentDocs}" var="patentDoc" varStatus="status">

						   
            <tr >
                <td width="47%" valign="middle" align="left">
                    <div class="title1">
                        
                        <a target="_blank" href="<s:url value='/editor/findPatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
                            <c:out value="${patentDoc.name}"/></a></div>
                    
                </td>
                <td width="13%" valign="middle" align="left">
                    <fmt:formatDate value="${patentDoc.createTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td width="13%" valign="middle" align="left" class="td4">
                    <fmt:formatDate value="${patentDoc.lastUpdateTime}" pattern="yyyy-MM-dd"/>
                </td>
                <td width="27%" valign="middle" align="left">
                    <a target="_blank" href="<s:url value='/editor/findPatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">
								 编辑
					</a><a target="_blank" href="<s:url value='/editor/previewPatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">预览</a>
                    <a onclick=" exportLayerShow('3197');">导出</a>
                    <a href="<s:url value='/editor/deletePatentDoc.html'/>?patentDocsId=<c:out value='${patentDoc.patentDocsId}'/>">删除</a><a href="http://www.cponline.gov.cn/" target="_blank">提交申请</a>
                </td>
            </tr>
            
           
		</c:forEach>
            
        </tbody>
    </table>
    <div id="pageJn">
        <div class="pageh3">
             
                        <div class="pageh2">
    
</div>
        </div>
    </div>
</div>

</div>
<script type="text/javascript">
	function adduser(){
		window.open("<s:url value='/editor/inventionWriterForm.html'/>");
	}




</script>	
	</body>
</html>