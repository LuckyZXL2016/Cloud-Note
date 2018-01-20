<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html
	class=" js flexbox flexboxlegacy rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent">
<head lang="en">
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<title>云笔记</title>
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>/images/page3/0408f819.css">
</head>
<body>
	<div style="height: 780px;" class="container">
		<div id="header">
			<div id="header-warp">
				<div id="header-right">
					<a id="register" 
						target="_blank">注册</a>
					<div id="user-info">
					<span id="dropdown-button">登录网页版</span> <i id="dropdown"></i>
					<ul id="dropdown-list">
						<li id="web1"><a id="web-title2">登录云笔记</a></li>
						<li class="divider"><a></a></li>
						<li ><a >下载</a></li>
						<li class="divider" id="logout-divider"><a></a></li>
						<li id="logout"><a>注销</a></li>
					</ul>
				</div>
				</div>
				<a id="logo"  title="云笔记"></a>
				<ul id="header-nav">
					<li class="" id="index-tab"><a href="<%=basePath%>"
						>首页</a></li>
					<li class="nav-current" id="noteintro-tab"><a
						>云笔记</a></li>
					<li id="groupintro-tab"><a
						>云协作</a></li>
					<li id="download-tab"><a
						>下载</a></li>
					<li id="blog-tab"><a >博客</a></li>
					<li id="charge-tab"><a
						>会员</a></li>
				</ul>
			</div>
		</div>
		<div class="top">
			<img style="left: -120.5px; top: 0px; width: auto; height: 100%;"
				class="top_bg" src="<%=basePath%>/images/page3/top_bg_compress.png">
			<div style="top: 235px; display: block;" class="top_bd">
				<div class="note_title"></div>
				<a class="top_download"
					target="_blank"></a>
			</div>
		</div>
		<div style="display: block;" class="computer">
			<img style="left: 231.5px; top: 120px;" class="computer_bg"
				src="<%=basePath%>/images/page3/computer_bg.png">
			<div class="no-css3">
				<div style="left: 967.5px; top: 302px; display: block;" class="row1"></div>
				<div style="left: 967.5px; top: 310px; display: block;" class="row2"></div>
				<div style="left: 967.5px; top: 318px; display: block;" class="row3"></div>
				<div style="left: 967.5px; top: 326px; display: block;" class="row4"></div>
				<div style="left: 967.5px; top: 333px; display: block;" class="row5"></div>
				<div style="left: 967.5px; top: 341px; display: block;" class="row6"></div>
				<div style="left: 967.5px; top: 349px; display: block;" class="row7"></div>
				<div style="left: 967.5px; top: 357px; display: block;" class="row8"></div>
				<div style="left: 967.5px; top: 365px; display: block;" class="row9"></div>
				<div style="left: 1014.5px; top: 335px; display: block;"
					class="row10"></div>
				<div style="left: 1139.5px; top: 330px;"
					class="flower flower_rotate"></div>
				<div style="left: 1143.5px; top: 385px;" class="water"></div>
			</div>
		</div>
		<div style="display: block;" class="synchronous">
			<img style="left: 231.5px; top: 120px;" class="synchronous_bg"
				src="<%=basePath%>/images/page3/synchronous_bg.png">
			<div class="no-css3">
				<div style="left: 301.5px; top: 232px; display: block;"
					class="mobile_balloon balloon_rotate">
					<div class="mobile_check">
						<div class="check_cover1 checkshow"></div>
					</div>
				</div>
				<div style="left: 499.5px; top: 300px; display: block;"
					class="pad_balloon balloon_rotate">
					<div class="pad_check">
						<div class="check_cover2 checkshow"></div>
					</div>
				</div>
				<div style="left: 379.5px; top: 382px;" class="pc_balloon">
					<div class="pc_check">
						<div class="pc_synchronize pc_synchronize_rotate"></div>
					</div>
				</div>
			</div>
		</div>
		<div style="display: block;" class="cloud">
			<img style="left: 231.5px; top: 120px;" class="cloud_bg"
				src="<%=basePath%>/images/page3/cloud_bg.png">
			<div class="no-css3">
				<div style="left: 804.5px; top: 375px;" class="key_nail"></div>
				<div style="left: 792.5px; top: 413px;" class="cloud_key key_rotate"></div>
			</div>
		</div>
		<div style="display: block;" class="explore">
			<img style="left: 231.5px; top: 120px;" class="explore_bg"
				src="<%=basePath%>/images/page3/explore_bg.png">
			<div class="no-css3">
				<div style="left: 243.5px; top: 380px;" class="hand"></div>
				<div style="left: 270.5px; top: 280px;" class="magnifier">
					<div class="magnifier_plus"></div>
					<div class="plus_cover plus_screen"></div>
				</div>
				<div style="left: 285.5px; top: 296px; display: block;"
					class="ways ways_rotate"></div>
				<div style="left: 480.5px; top: 280px; display: block;"
					class="friends_circle"></div>
				<div style="left: 625.5px; top: 303px; display: block;"
					class="weibo"></div>
				<div style="left: 574.5px; top: 380px; display: block;"
					class="email"></div>
			</div>
		</div>
		<div style="display: block;" class="end">
			<div style="height: 558px;" class="download">
				<img style="top: 143.5px;" class="download_bg"
					src="<%=basePath%>/images/page3/download_bg.png"> <a
					style="top: 411.5px;" class="download_btn"
					target="_blank"></a>
			</div>
			<div id="footer">
				<ul id="ft-follow-us">
					<li><a id="weibo"
						target="_blank"></a></li>
					<li><a id="wechat"><img
							src="<%=basePath%>/images/page3/e5ea2639.png"></a></li>
					<li><a id="qq"><img
							src="<%=basePath%>/images/page3/d984692a.png"></a></li>
				</ul>
				<ul id="ft-links">
					<li><a
						target="_blank">官方贴吧</a></li> ·
					<li><a 
						target="_blank">空间兑换</a></li> ·
					<li><a target="_blank">开放平台</a></li>
					·
					<li><a target="_blank">云协作企业版</a></li>
				</ul>
				<ul id="ft-about-links">
					<li><a 
						target="_blank">关于我们</a></li> |
					<li><a 
						target="_blank">联系我们</a></li> |
					<li><a 
						target="_blank">服务条款</a></li> |
					<li><a 
						target="_blank">隐私协议</a></li> |
					<li><a 
						target="_blank">帮助</a></li> |
					<li><a 
						target="_blank">更新日志</a></li>
				</ul>
				<div id="copyright"></div>
			</div>
		</div>
	</div>
	<div class="dots">
		<div class="dot dot1 active"></div>
		<div class="dot dot2"></div>
		<div class="dot dot3"></div>
		<div class="dot dot4"></div>
		<div class="dot dot5"></div>
		<div class="dot dot6"></div>
	</div>
	<script src="<%=basePath%>/images/page3/rlog.js" async=""
		type="text/javascript"></script>
	<script style="color: rgb(0, 0, 0);"
		src="<%=basePath%>/images/page3/1875d44e.js"></script>
	<script src="<%=basePath%>/images/page3/b58ec580.js"></script>
</body>
<script>
	$("#web-title2").click(function(){
		location.href = "<%=request.getContextPath()%>/login/showloginpage2";
})
	
</script>
</html>