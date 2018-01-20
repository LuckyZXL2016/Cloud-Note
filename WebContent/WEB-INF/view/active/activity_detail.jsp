<%@ page import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath = request.getContextPath(); %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Activity Note</title>
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
		<div class="alert_can" style="display:none;">
			<div class="alert_background"></div>
			<div class="right_bottom">
				<div class="panel_can"><!-- panel容器 -->
					<!--div class="panel panel_deleteNote">
						<div class="panel_top">
							<h3 class="panel_title">选择笔记参加活动</h3>
						</div>
						<div class="panel_middle">
							<div class="select_note">
								<label>选择笔记本:</label>
								<select id="selectNoteBook">
								</select>
							</div>
							<div class="select_note">
								<label>&nbsp;&nbsp;&nbsp;选择笔记:</label>
								<select id="selectNote">
								</select>
							</div>
						</div>
						<div class="panel_bottom">
							<input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="button" value="取 消" class="cancle"/>
						</div>
					</div-->
				</div>
			</div>
		</div>
<!-- col_2 -->
		<div class="col_2"><!-- noteCan -->
			<div class="border">
				<div class="col_top clear_float">
					<div class="col_li li_action">
						<div id="addActivityNote" title="参加本次活动"><i class='icon i_plus'></i></div>
					</div>
					<div class="col_li li_title">
						<h4 class='text_over'>活动笔记</h4>
					</div>
				</div>
				<div class="col_middle" style='/*height:550px;*/'>
					<ul id='all_activity_note'><!-- #my_note,#search_note,#recycle_note,#star_note,#activity_note,#all_activity_note -->
						<!--活动笔记-->
					</ul>
				</div>
			</div>
		</div>
<!-- col_3 预览笔记-->
		<div class="col_3" id='viewNote' style="display:block;width:75%;">
			<div class="note_title clear_float">
				<div class="col_li col_left"><i class='icon i_quoteLeft'></i></div>
				<div class="col_li col_left" style='max-width:80%'><h2 class='h2_styles text_over' id='outputNoteTitle'></h2></div>
				<div class="col_li col_left"><i class='icon i_quoteRight'></i></div>
			</div>
			<div class="note_content" id='outputNoteContent' style='/*height:550px;*/'>
			</div>
		</div>	
	</div>
	<footer>
		<div class="alert_success_s"></div>
		<div class="alert_success_b"></div>
		<div class="alert_success_all"></div>
	</footer>
	<script type="text/javascript" src="<%=basePath%>/javascripts/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/jquery.nicescroll.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/Know.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/Editor/kindeditor-min.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/Editor/lang/zh_CN.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/index.js"></script>
	<script type="text/javascript" src="<%=basePath%>/javascripts/BaseValues.js"></script>
	<input id="activity_rowkey_hidden" type="hidden">
	<script type="text/javascript" >
	/**
			*进入页面之后加载，查询所有笔记
			*/
$(function(){
		var noteBookRowKey = "${rowKey}";
		$("#activity_rowkey_hidden").val(noteBookRowKey);
		$.ajax({
			type : "post",
			url : basePath +"note/getNoteListByNotebook",
			async : false,
			dataType : "json",
			data: {"rowkey":noteBookRowKey},
			success : function(data) {
				//alert(data.allNoteBook);
				if(data.noteList!=null){
					var allNoteList = eval(data.noteList);
					$.each(allNoteList,function(idx,item){ //循环对象取值
						var title=addActivityNote(item.name);
						$('#all_activity_note').prepend(title);
						$('#all_activity_note li:first').data('noteRowKey',item.rowKey);
	          		 });
				}
			},
			error:function(data) {
				alert("no");
			}
		});
});

</script>
</body>
</html>



