<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="top" style="min-width:1300px;height:80px;position:fixed;top:0px;z-index:10;">

	<div class="top-left"><img src="<s:url value='/temp/images/logo.png'/>" /></div>
	<div class="top-right">
		<div class="top-search">
			<div class="search_box" id="Text1" style="display:none;">
			<input type="text" name="search" placeholder="&nbsp;&nbsp;搜索你要的..."/>
			<a href="javascript:;">搜索</a>
			</div>   
			<div id="Button1" onClick="hidslt()" style="display:block;" class="top-sbtn" >
			<a href="http://so.lotut.com/" target="_blank" rel="nofollow"><font color="#FFF">国内外专利检索</font></a>
			<img src="<s:url value='/temp/images/search.png'/>" />
			</div>
		</div>
		<div class="top-user" id="top-user">
			<img src="<s:url value='/temp/images/user.png'/>" />
			<span class="user-info">
				<small>欢迎您!</small>
				<se:authentication property="principal.username" />
			</span>
			<a href="javascript:$('#logoutForm').submit();"><img src="<s:url value='/temp/images/exit.png'/>" class="top-exit"/></a>
	
			<form action="<s:url value='/user/logout.html'/>" method="post" id="logoutForm">
			<se:csrfInput/>
			<input type="submit" style="display:none;" />
			</form>	
		</div>
	</div>
</div>