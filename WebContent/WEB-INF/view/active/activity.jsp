<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath = request.getContextPath(); %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>New_note</title>
<link rel="stylesheet" href="<%=basePath%>/styles/edit.css"/>
<link rel="stylesheet" href="<%=basePath%>/styles/icon.css"/>
<link rel="stylesheet" href="<%=basePath%>/styles/prettify.min.css"/>
</head>

<body>
	<header class='clear_float'>
		<div class="logo"></div>
		<div class="loginbar">
		</div>
	</header>
	<div class="row clear_float">
<!-- alert -->
		<div class="alert_can" style='display:none;'>
			<div class="alert_background"></div>
			<div class="right_bottom">
				<div class="panel_can"><!-- panel容器 -->
					<!--div class="panel panel_deleteNote">
						<div class="panel_top">
							<h3 class="panel_title">收藏笔记</h3>
						</div>
						<div class="panel_middle">
							<h4>该笔记将被放至收藏笔记本,确认收藏吗?</h4>
						</div>
						<div class="panel_bottom">
							<input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="取 消" class="cancle"/>
						</div>
					</div-->
				</div>
			</div>
		</div>
<!-- col_5 -->
		<div class="col_5">
			<ul id="col_panel_1">
				<li class="ac_panel panel_green">
				<%--
				页面编辑须知：需要填写id和方法的参数，活动块类似。
				1、id="activity_0000000000101"：id顺序填写，从0000000000101开始。
				2、onclick="openDetail('activity_0000000000101')"：将id传入方法中。
				3、活动标题：任意
				4、活动介绍：介绍内容，任意
					--%>
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000101')" id="activity_0000000000101">活动标题！</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">活动介绍……</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
				<li class="ac_panel panel_red">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000102')" id="activity_0000000000102">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
				<li class="ac_panel panel_blue">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000103')" id="activity_0000000000103">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
			</ul>
		</div>
<!-- col_6 -->
		<div class="col_6">
			<ul id="col_panel_2">
				<li class="ac_panel panel_green">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000104')" id="activity_0000000000104">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
				<li class="ac_panel panel_red">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000105')" id="activity_0000000000105">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
				<li class="ac_panel panel_blue">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000106')" id="activity_0000000000106">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
			</ul>
		</div>
<!-- col_7 -->
		<div class="col_7">
			<ul id="col_panel_3">
				<li class="ac_panel panel_green">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000107')" id="activity_0000000000107">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
				<li class="ac_panel panel_red">
					<h4 class="ac_title"><a class="ac_link"  onclick="openDetail('activity_0000000000108')" id="activity_0000000000108">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
				<li class="ac_panel panel_blue">
					<h4 class="ac_title"><a class="ac_link" onclick="openDetail('activity_0000000000109')" id="activity_0000000000109">Times Designers Are Monitoring Reaction to the Redesign, With Adjustments Possible</a></h4>
					<hr class="hr"/>
					<p class="ac_info text_over">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius, dolores facilis maiores minus itaque excepturi.</p>
					<hr class="hr"/>
					<p class="ac_time">结束时间:<strong>2014-8-29</strong></p>
				</li>
			</ul>
		</div>
<!-- col_1 -->
	</div>
	<footer>
		<div class="alert_success_s"></div>
		<div class="alert_success_b"></div>
	</footer>
	<script type="text/javascript" src="<%=basePath%>/javascripts/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/jquery.nicescroll.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/run_prettify.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/Editor/kindeditor-min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/Editor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/BaseValues.js"></script>
</body>
</html>



