<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String basePath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>云笔记</title>
<meta name="keywords"
	content="云笔记 - 记录，成为更好的自己, , office, 办公软件, 云笔记, 印象笔记, 笔记, tower, 云笔记, 笔记, 团队协作, 协作, etc.">
<meta name="description"
	content="云笔记是个人与团队的线上资料库，信息全平台覆盖， 随时随地、随心访问所有资料。团队成员在这里高效协作，无缝沟通。网易出品，安全可靠。2500万用户的选择。">
<link type="text/css" rel="stylesheet"
	href="<%=basePath%>/styles/7ac21bf4.css">
<script src="<%=basePath%>/javascripts/rlog.js" async=""
	type="text/javascript"></script>
<script src="<%=basePath%>/javascripts/67b4ad50.js"></script>
</head>
<body>
	
	<div id="header">
		<div id="header-warp">
			<div id="header-right">
				<a id="register" href="">注册</a>
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
				<li class="nav-current" id="index-tab"><a
					>首页</a></li>
				<li id="noteintro-tab"><a target="_blank" href="http://192.168.0.220:8081/inote/login/showloginpage3"
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
	<div id="doc2">
		<div id="hd">
			<div class="bd-wrap">
				<div class="bd">
					<div class="slogan"></div>
					<div id="download-btn-container">
						<a data-vlog="/sd_index.v"
							href="http://download.ydstatic.com/notewebsite/downloads/YNote.exe"
							id="download-btn" class="logit ynote-download"
							data-logname="index.windowsBanner.download-btn-windows"></a>
						<div style="width: 140px;" id="ynote-version"></div>
					</div>
				</div>
				<div class="fixed-bottom" id="download-bar">
					<ul class="download-bar-list">
						<li class="windows-download"><a
							href="http://download.ydstatic.com/notewebsite/downloads/YNote.exe"></a>
						</li>
						<li class="mac-download"><a
							href="https://itunes.apple.com/cn/app/youdao-note/id692678875?ls=1&amp;mt=12"></a>
						</li>
						<li class="android-download">
							<div class="download-bar-sub">
								<div class="btn-normal">
									<div class="download-qrcode">
										<img src="<%=basePath%>/images/84f03692.png" alt="二维码下载">
									</div>
								</div>
								<div class="btn-normal">
									<a
										>本地下载</a>
								</div>
							</div>
						</li>
						<li class="iphone-download">
							<div class="download-bar-sub">
								<div class="btn-normal">
									二维码下载
									<div class="download-qrcode">
										<img src="<%=basePath%>/images/84f03692.png" alt="二维码下载">
									</div>
								</div>
								<div class="btn-normal">
									<a
										>App
										Store下载</a>
								</div>
							</div>
						</li>
						<li class="ipad-download"><a
							></a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div id="bd" class="clearfix">
			<ul class="intros">
				<li><a class="btn-video-play cboxElement">
						<div>
							<img src="<%=basePath%>/images/a1a70e40.png" alt="一分钟快速认识云协作"><img
								src="<%=basePath%>/images/71fec3d9.png" alt="play"
								class="video-play"><span class="intro-desc"><p>一分钟，快速认识云协作</p></span>
						</div>
				</a> <a ><span
						class="intro-more">更多视频 &gt;</span></a></li>
				<li class="intro-platform">
					 <a					>
						<div>
							<img src="<%=basePath%>/images/20f4ba23.png" alt="云协作企业版"><span
								class="intro-desc"><p>云协作企业版，来了！</p></span>
						</div>
				</a> <a ><span
						class="intro-more">更多产品动态 &gt;</span></a>
				</li>
				<li>
					<div>
						<img src="<%=basePath%>/images/02e7cce7.png" alt="AppStore精选效率APP">
					</div> 
				</li>
			</ul>
		</div>
		<div id="footer">
			<ul id="ft-follow-us">
				<li><a href="http://weibo.com/youdaonote" id="weibo"
					target="_blank"></a></li>
				<li><a id="wechat"><img
						src="<%=basePath%>/images/e5ea2639.png"></a></li>
				<li><a id="qq"><img src="<%=basePath%>/images/d984692a.png"></a></li>
			</ul>
			<ul id="ft-links">
				<li><a
					target="_blank">官方贴吧</a></li> ·
				<li><a 
					target="_blank">空间兑换</a></li> ·
				<li><a >开放平台</a></li>
				·
				<li><a  target="_blank">云协作企业版</a></li>
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
	<div class="dialog-mask"></div>
	<div style="display: none;" id="cboxOverlay"></div>
	<div style="display: none;" tabindex="-1" role="dialog" class=""
		id="colorbox">
		<div id="cboxWrapper">
			<div>
				<div style="float: left;" id="cboxTopLeft"></div>
				<div style="float: left;" id="cboxTopCenter"></div>
				<div style="float: left;" id="cboxTopRight"></div>
			</div>
			<div style="clear: left;">
				<div style="float: left;" id="cboxMiddleLeft"></div>
				<div style="float: left;" id="cboxContent">
					<div style="float: left;" id="cboxTitle"></div>
					<div style="float: left;" id="cboxCurrent"></div>
					<button id="cboxPrevious" type="button"></button>
					<button id="cboxNext" type="button"></button>
					<button id="cboxSlideshow"></button>
					<div style="float: left;" id="cboxLoadingOverlay"></div>
					<div style="float: left;" id="cboxLoadingGraphic"></div>
				</div>
				<div style="float: left;" id="cboxMiddleRight"></div>
			</div>
			<div style="clear: left;">
				<div style="float: left;" id="cboxBottomLeft"></div>
				<div style="float: left;" id="cboxBottomCenter"></div>
				<div style="float: left;" id="cboxBottomRight"></div>
			</div>
		</div>
		<div
			style="position: absolute; width: 9999px; visibility: hidden; display: none; max-width: none;"></div>
	</div>
</body>
<script>
	$("#web-title2").click(function(){
		location.href = "<%=request.getContextPath()%>/login/showloginpage2";
})
	
</script>
</html>