<%@ page import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%String basePath = request.getContextPath(); %>
<!DOCTYPE html>
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
		<div class="activity_btn">
			<div class="activity_link">
				<h4><a class="ac_link"  onclick="openActivity();">活动</a><i class='icon i_global'></i></h4>
			</div>
		</div>
	</header>
	<div class="row clear_float">
<!-- alert -->
		<div class="alert_can" style='display:none;'>
			<div class="alert_background"></div>
			<div class="right_bottom">
				<div class="panel_can"><!-- panel容器 -->
				</div>
			</div>
		</div>
<!-- col_1 -->
		<div class="col_1">
			<div class="border">
				<div class="col_top clear_float">
					<div class="col_li li_action">
						<div id="addNoteBook"><i class='icon i_plus'></i></div>
					</div>
					<div class="col_li li_title">
						<h4 class='text_over'>我的笔记本</h4>
					</div>
				</div>
				<div class="col_middle" style='/*height:550px;*/'>
					<ul id='noteBookList'>
						</ul>
				</div>
				<div class="col_bottom clear_float">
					<div class="col_li special" style='width:33.3%;' id='activityBt'><i class='icon i_action'></i></div>
					<div class="col_li special" style='width:33.4%;' id='starBt'><i class='icon i_star'></i></div>
					<div class="col_li special" style='width:33.3%;' id='recycleBt'><i class='icon i_recycle'></i></div>
				</div>
			</div>
		</div>
<!-- col_2 我的笔记-->
		<div class="col_2"><!-- noteCan -->
			<div class="border">
				<div class="col_top clear_float">
					<div class="col_li li_action">
						<div id="addNote"><i class='icon i_plus'></i></div>
					</div>
					<div class="col_li li_title">
						<h4 class='text_over'>我的笔记</h4>
					</div>
				</div>
				<div class="col_middle" style='/*height:550px;*/'>
					<ul id='my_note'><!-- #my_note,#search_note,#recycle_note,#star_note,#activity_note -->
					</ul>
				</div>
			</div>
		</div>
<!-- col_3 预览笔记-->
		<div class="col_3" id='viewNote'>
			<div class="note_title clear_float">
				<div class="col_li col_left"><i class='icon i_quoteLeft'></i></div>
				<div class="col_li col_left" style='max-width:80%'><h2 class='h2_styles text_over' id='outputNoteTitle'></h2></div>
				<div class="col_li col_left"><i class='icon i_quoteRight'></i></div>
			</div>
			<div id="outputNoteContent" class="note_content" style='/*height:550px;*/'>
			</div>
		</div>
<!-- col_3 编辑笔记-->
		<div class="col_3" id='editNote'>
			<div class="note_title clear_float">
				<div class="col_li col_left" style='width:79%'><input class='input_text' id='inputNoteTitle' type="text" placeholder="此处输入笔记标题"/></div>
				<div class="col_li" style='width:20%'>
					<!--div class="col_li col_left"-->
						<div id="saveNote">
							<p><i class='icon i_save'></i><span class='font_16'>保存&nbsp;</span></p>
						</div>
				</div>
			</div>
			<div class="note_content" style='margin:0'>
				<form>
					<textarea id="editorNote" style="width:100%;/*height:550px;*/"></textarea>
				</form>
			</div>
		</div>
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
	<script type="text/javascript" >
	/**
			*进入页面之后加载，查询所有笔记
			*/
	$(function(){
			$.ajax({
				type : "post",
				url : basePath +"note/getAllNoteBook",
				async : false,
				dataType : "json",
				success : function(data) {
					//alert(data.allNoteBook);
					if(data.allNoteBook!=null){
						var allNoteBookList = eval(data.allNoteBook);
						$("#recycleBt").data("recycleBtRowKey",data.recycleBtRowKey);
						$("#starBt").data("starBtRowKey",data.starBtRowKey);
						$("#activityBt").data("activityBtRowKey",data.activityBtRowKey);
						$.each(allNoteBookList,function(idx,item){ //循环对象取值
							var title=addNoteBook(item.name);
							$('#noteBookList').prepend(title);
							$('#noteBookList li:first').data('noteBookRowKey',item.rowKey);
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

