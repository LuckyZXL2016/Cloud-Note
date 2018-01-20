
// JavaScript Document
/*
 *处理页面高度
 *配置Google滚动条——niceScroll
 *配置编辑器——Kindeditor
 *
 */
function get_dom(e){
	return document.getElementById(e);
}
		
//动态给head添加style
function func_style(){
	var window_height=window.innerHeight?window.innerHeight:document.body.clientHeight;
	window_height=window.innerHeight-127;
	window_height=window_height>=182?window_height:182;
	var dom_head=document.getElementsByTagName('head')[0];
	var dom_style=document.getElementsByTagName('style')[0];
	if(!dom_style){
		dom_style=document.createElement("style");
		dom_style.type="text/css";
		dom_head.appendChild(dom_style);
	}
	dom_style.innerHTML=".col_1 .col_middle,.col_2 .col_middle{height:"+window_height+"px;}";
	if(!!get_dom('editorNote')){
		get_dom('editorNote').style.height=window_height+'px';
	}
}
func_style();
//改变窗口大小时自动调整
window.onresize=function(){
	//style();
}
	

//KindEditor函数配置
var editor = KindEditor.create('#editorNote',{
	items:[
		'preview', 'template', 'code',
		'plainpaste', 'wordpaste', '|', 'justifyleft', 'justifycenter', 'justifyright',
		'justifyfull', 'insertorderedlist', 'insertunorderedlist', 'indent', 'outdent', 'subscript',
		'superscript', 'clearhtml', 'quickformat', 'source',
		'formatblock', 'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold',
		'italic', 'underline', 'strikethrough', 'lineheight', 'removeformat', '|', 'table', 'hr',
		'anchor', 'link', 'unlink', 'fullscreen'
	],
	resizeType:0,
	//cssData:'body{background:red}',
	fullscreenShortcut:true,
	//autoHeightMode : true,
	afterCreate:function(){
		//this.loadPlugin('autoheight');
	}
});


//niceScroll函数配置
function scroll(){
	//HTML样式
	var styles_html={
		cursoropacitymax:0
	};
	//$(".col_middle").niceScroll(styles_col_middle);
	$("html,.col_middle,.note_content").niceScroll(styles_html);
}
scroll();


/*
 *声明全局变量
 *panelCan——弹出框,里面的属性装载了弹出框的内容
 *noteCan——我的笔记,回收站笔记,收藏笔记,搜索笔记,活动笔记
 */
var panelCan={			//panel_moveNote和panel_moveBackNote当中的select数据需要清空
	panel_addNoteBook:'<div class="panel panel_addNoteBook"><div class="panel_top"><h3 class="panel_title">添加笔记本</h3></div><div class="panel_middle"><label class="label">笔记本名称：</label><input type="text" class="panel_text" id="noteBookTitle"/></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_deleteNoteBook:'<div class="panel panel_deleteNoteBook"><div class="panel_top"><h3 class="panel_title">删除笔记本</h3></div><div class="panel_middle"><h4>您确定要把该笔记本彻底删除吗?</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_renameNoteBook:'<div class="panel panel_renameNoteBook"><div class="panel_top"><h3 class="panel_title">重命名笔记本</h3></div><div class="panel_middle"><label class="label">新笔记本名称：</label><input type="text" class="panel_text" id="renameNoteBookTitle"/></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_addNote:'<div class="panel panel_addNote"><div class="panel_top"><h3 class="panel_title">添加笔记</h3></div><div class="panel_middle"><label class="label">笔记名称：</label><input type="text" class="panel_text" id="noteTitle"/></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_deleteNote:'<div class="panel panel_deleteNote"><div class="panel_top"><h3 class="panel_title">删除笔记</h3></div><div class="panel_middle"><h4>您确定要把该笔记删除至回收站吗?</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_moveNote:'<div class="panel panel_moveNote"><div class="panel_top"><h3 class="panel_title">移动笔记</h3></div><div class="panel_middle"><label class="label">移动至：</label><select id="moveNoteTo"><option value="0">选择笔记本</option></select></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_shareNote:'<div class="panel panel_shareNote"><div class="panel_top"><h3 class="panel_title">分享笔记</h3></div><div class="panel_middle"><h4>您确定要分享该笔记吗?</h4><h4>分享的笔记将不能被取消分享</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_clearNote:'<div class="panel panel_clearNote"><div class="panel_top"><h3 class="panel_title">清空回收站</h3></div><div class="panel_middle"><h4>您确定要清空回收站笔记吗?</h4><h4>清空之后将不可恢复</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_deleteRecycleNote:'<div class="panel panel_deleteRecycleNote"><div class="panel_top"><h3 class="panel_title">彻底删除笔记</h3></div><div class="panel_middle"><h4>您确定要删除该笔记吗?</h4><h4>删除之后将不可恢复</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_moveBackNote:'<div class="panel panel_moveBackNote"><div class="panel_top"><h3 class="panel_title">还原笔记</h3></div><div class="panel_middle"><label class="label">还原至：</label><select id="moveBackNoteTo"><option value="0">请选择笔记本</option></select></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_deleteStarNote:'<div class="panel panel_deleteStarNote"><div class="panel_top"><h3 class="panel_title">取消收藏</h3></div><div class="panel_middle"><h4>您确定要取消收藏该笔记吗?</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_starNote:'<div class="panel panel_starNote"><div class="panel_top"><h3 class="panel_title">收藏笔记</h3></div><div class="panel_middle"><h4>该笔记将被放至收藏笔记本,确认收藏吗?</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_selectNote:'<div class="panel panel_selectNote"><div class="panel_top"><h3 class="panel_title">选择笔记参加活动</h3></div><div class="panel_middle"><div class="select_note"><label>选择笔记本:&nbsp;</label><select id="selectNoteBook"><option value="0">请选择笔记本</option></select></div><div class="select_note"><label>&nbsp;&nbsp;&nbsp;选择笔记:&nbsp;</label><select id="selectNote"><option value="0">请选择笔记</option></select></div></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>',
	panel_starActivityNote:'<div class="panel panel_starActivityNote"><div class="panel_top"><h3 class="panel_title">收藏笔记</h3></div><div class="panel_middle"><h4>该笔记将被放至收藏笔记本,确认收藏吗?</h4></div><div class="panel_bottom"><input type="button" value="确 定" class="sure"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取 消" class="cancle"/></div></div>'

}
var noteCan={
	note_my:'<div class="border"><div class="col_top clear_float"><div class="col_li li_action"><div id="addNote" title="添加笔记"><i class="icon i_plus"></i></div></div><div class="col_li li_title"><h4 class="text_over">我的笔记</h4></div></div><div class="col_middle"><ul id="my_note"></ul></div></div>',
	note_recycle:'<div class="border"><div class="col_top clear_float"><div class="col_li li_action"><div id="clearRecycle" title="清空回收站"><i class="icon i_recycle"></i></div></div><div class="col_li li_action"></div><div class="col_li li_title"><h4 class="text_over">回收站笔记</h4></div></div><div class="col_middle"><ul id="recycle_note"></ul></div></div>',
	note_search:'<div class="border"><div class="col_top clear_float"><div class="col_li li_action"><div id="searchNote" title="搜索笔记"><i class="icon i_search"></i></div></div><div class="col_li li_title"><h4 class="text_over">搜索笔记</h4></div></div><div class="col_middle"><ul id="search_note"></ul></div></div>',
	note_star:'<div class="border"><div class="col_top clear_float"><div class="col_li li_action"><div id="starNote" title="收藏笔记"><i class="icon i_star"></i></div></div><div class="col_li li_title"><h4 class="text_over">收藏笔记</h4></div></div><div class="col_middle"><ul id="star_note"></ul></div></div>',
	note_activity:'<div class="border"><div class="col_top clear_float"><div class="col_li li_action"><div id="activityNote"><i class="icon i_action"></i></div></div><div class="col_li li_title"><h4 class="text_over">活动笔记</h4></div></div><div class="col_middle"><ul id="activity_note"></ul></div></div>'
}


/*
 *重写alert函数
 *
 *
 */
//window.alert=function(s){
//	//window.close();
//}


/*
 *转义HTML代码
 *
 *
 */
function formate(e){
	e=e.replace(/</g,'&lt;');
	e=e.replace(/>/g,'&gt;');
	return e;
}


/*
 *添加DOM
 *笔记本
 *
 */
function addNoteBook(title){
	return '<li class="book_list clear_float"><div class="col_li li_action hover_show"><div class="delete_notebook line-height"><i class="icon i_delete"></i></div></div><div class="col_li li_title"><p class="line-height text_over"><i class="icon i_book"></i><span>'+title+'</span></p></div></li>';
}
/*
 *添加DOM
 *笔记
 *
 */
function addNote(title){
	return '<li class="book_list clear_float"><div class="col_li li_action clear_float hover_show"><div class="note_operation line-height"><div class="col_li delete_note" title="删除"><i class="icon i_delete"></i></div><div class="col_li move_note" title="移动"><i class="icon i_move"></i></div><div class="col_li no_action" title="wait"><i class="icon i_wait"></i></div><div class="col_li more_action"><i class="icon i_more"></i></div></div></div><div class="col_li li_title"><p class="line-height text_over"><i class="icon i_note"></i><span>'+title+'</span></p></div></li>';
}
function addRecycleNote(title){
	return '<li class="book_list clear_float"><div class="col_li li_action clear_float hover_show"><div class="note_operation line-height"><div class="col_li delete_note" title="删除"><i class="icon i_delete"></i></div><div class="col_li recycle_note" title="恢复"><i class="icon i_back"></i></div><div class="col_li no_action" title="wait"><i class="icon i_wait"></i></div><div class="col_li more_action"><i class="icon i_more"></i></div></div></div><div class="col_li li_title"><p class="line-height text_over"><i class="icon i_note"></i><span>'+title+'</span></p></div></li>';
}
function addActivityNote(title){
	return '<li class="book_list clear_float"><div class="col_li li_action clear_float hover_show"><div class="note_operation line-height"><div class="col_li star_note" title="收藏"><i class="icon i_star"></i></div><div class="col_li no_action" title="wait"><i class="icon i_wait"></i></div><div class="col_li no_action" title="wait"><i class="icon i_wait"></i></div><div class="col_li more_action"><i class="icon i_more"></i></div></div></div><div class="col_li li_title"><p class="line-height text_over"><i class="icon i_note"></i><span>'+title+'</span></p></div></li>';
	}
function addStarNote(title){
	return '<li class="book_list clear_float"><div class="col_li li_action clear_float hover_show"><div class="note_operation line-height"><div class="col_li delete_note" title="取消收藏"><i class="icon i_delete"></i></div><div class="col_li no_action" title="wait"><i class="icon i_wait"></i></div><div class="col_li no_action" title="wait"><i class="icon i_wait"></i></div><div class="col_li more_action"><i class="icon i_more"></i></div></div></div><div class="col_li li_title"><p class="line-height text_over"><i class="icon i_note"></i><span>'+title+'</span></p></div></li>';	
}
//清空笔记栏，清空笔记内容栏
function cleanEditor(){
	$("#inputNoteTitle").val("");
	$('#saveNote').data({
		saveNote:undefined
	});
	editor.html("");
	$("#outputNoteTitle").text("");
	$("#outputNoteContent").html("");
}
function openActivity(){
	window.open(basePath+"note/showActivity");
}
function openDetail(rowKey){
	window.open(basePath+"note/openDetail?rowKey="+rowKey);
}
function addMyActivityNote(title){
	return '<li class="book_list clear_float"><div class="col_li li_action clear_float hover_show"></div><div class="col_li li_title"><p class="line-height text_over"><i class="icon i_note"></i><span>'+title+'</span></p></div></li>';	

}
function getRowKeyUserName(rowKey) {
	var split = rowKey.split("_");
	var name = "";
	for (var i = 0; i < split.length - 1; i++) {
		name = name + split[i] + "_";
	}
	return name.substr(0, name.length - 1);
}

function getRowKeyCreateTime(rowKey) {
	var split = rowKey.split("_");
	return split[split.length - 1];
}
/*
 *显示半透明背景
 *
 */
function show_bg(){
	$(".alert_can").show();
	$(".panel_can input[id]").focus();
}


/*
 *检查输入是否为空
 *
 */
function check_null(s){
	s=s.replace(/ /g,'');
	s=s.length;
	return s;
}


/*
 *提示操作成功
 *
 */
function show_success(dom,s){
	dom.html("<h4>"+s+"</h4>");
	dom.fadeIn(1000);
	setTimeout(function(){dom.fadeOut(1000);},2000);
}


/*
 *点击特殊笔记本
 *
 */
function click_special(dom){
	dom.siblings('.check_bt').attr('class','col_li special');
	dom.attr('class','col_li check_bt');
	$('.col_1 .col_middle .check_book').attr('class','book_list clear_float');
}


/*
 *点击笔记
 *
 */
function click_note(dom){
	dom.siblings()
		.attr('class','book_list clear_float')
		.end()
		.attr('class','check_book clear_float');
}



/**
 * ==========================================================================================================================
 * ==============================================ajax操作区域==================================================================
 * ===========================================================================================================================
 */
$(function(){
	/*
	 *隐藏半透明背景
	 *
	 */
	 $('.alert_can').on('click','.cancle',function(){
		$(".alert_can").hide();
	 });
	 
	 
	/*
	 *点击添加笔记本，弹出对话框
	 *
	 */
	$('#addNoteBook').click(function(){
		$('.panel_can').html(panelCan.panel_addNoteBook);
		show_bg();
	});
	/*
	 *点击“确定”添加笔记本
	 *ajax请求
	 */
	$('.panel_can').on('click','.panel_addNoteBook .sure',function(){
		var title=$('#noteBookTitle').val();
		var length=check_null(title);
		if(length>0){
			title=formate(title);
			var flag;
			$.ajax({
				type : "post",
				url : basePath +"note/addNoteBook",
				async : false,
				dataType : "json",
				data: {"noteBookName":title},
				success : function(data) {
					//alert(data.success);
					flag=data.success;
					if(flag){
						title=addNoteBook(title);
						$('#noteBookList').prepend(title);
						$('#noteBookList li:first').data('noteBookRowKey',data.resource);
						$('.cancle').trigger('click');
					}
				},
				error:function(data) {
					//alert("no");
				}
			});
		}
		
	});
	$('.panel_can').on("keyup",".panel_middle",function(a){
		if(a.keyCode==108||a.keyCode==13){
			$(this).siblings('.panel_bottom').children('.sure').trigger('click');
		}
    });
	
	/*
	 *单击笔记本,获取笔记本下的所有笔记
	 *ajax请求
	 */
	$('.col_1').on('click','.col_middle li',function(){
		cleanEditor();
		$(this).siblings()
			.attr('class','book_list clear_float')
			.end()
			.attr('class','check_book clear_float');
		$('.col_1 .col_bottom .check_bt').attr('class','col_li special');
		//AJAX
		$('.col_2').html(noteCan.note_my);
		$('#addNote').data('noteBookRowKey',$(this));
		var noteBookRowKey = $(this).data("noteBookRowKey");
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
						var title=addNote(item.name);
						$('#my_note').prepend(title);
						$('#my_note li:first').data('noteRowKey',item.rowKey);
	          		 });
				}
			},
			error:function(data) {
				alert("no");
			}
		});
	});
	/*
	 *点击删除笔记本，弹出对话框
	 *
	 */
	$('.col_1').on('click','.col_middle .delete_notebook',function(){
		var dom=$(this).parents('li');
		$('.panel_can').html(panelCan.panel_deleteNoteBook);
		show_bg();
		$('.alert_can').data({
			deleteNoteBook:dom
		});
		return false;
	});
	/*
	 *点击“确定”删除笔记本
	 *@panel_deleteNoteBook
	 */
	$('.panel_can').on('click','.panel_deleteNoteBook .sure',function(){
		//AJAX
		var rowKey = $('.alert_can').data('deleteNoteBook').data('noteBookRowKey');
		var name = $('.alert_can').data('deleteNoteBook').text();
		$.ajax({
			type : "post",
			url : basePath+"note/deleteNoteBook",
			async : false,
			dataType : "json",
			data: {"noteBookName":name,"rowKey":rowKey},
			success : function(data) {
				//alert(data.allNoteBook);
				flag=data.success;
				if(flag){
					$('.alert_can').data('deleteNoteBook').remove();
					$('.cancle').trigger('click');
				}else{
					$('.cancle').trigger('click');
					show_success($('.alert_success_b'),data.message);
					
				}
				
			},
			error:function(data) {
				//alert("no");
			}
		});
		
	});
	/*
	 *双击笔记本，弹出修改笔记本名称对话框
	 */
	$('.col_1').on('dblclick','.col_middle li',function(){
		var dom=$(this);
		$('.panel_can').html(panelCan.panel_renameNoteBook);
		show_bg();
		$('.alert_can').data({
			renameNoteBook:dom
		});
	});
	/*
	 *点击“确定”重命名笔记本
	 */
	$('.panel_can').on('click','.panel_renameNoteBook .sure',function(){
		var oldName = $('.alert_can').data('renameNoteBook').text();
		var rowKey = $('.alert_can').data('renameNoteBook').data('noteBookRowKey');
		var title=$('#renameNoteBookTitle').val();
		var length=check_null(title);
		if(length>0){
			title=formate(title);
			//AJAX
			$.ajax({
				type : "post",
				url : basePath+"note/updateNoteBook",
				async : false,
				dataType : "json",
				data: {"oldNoteBookName":oldName,"newNoteBookName":title,"rowKey":rowKey},
				success : function(data) {
					//alert(data.allNoteBook);
					flag=data.success;
					if(flag){
						$('.alert_can').data('renameNoteBook')
						.children('.li_title')
						.children('p')
						.children('span').text(title);
						$('.cancle').trigger('click');
					}
				},
				error:function(data) {
					alert("no");
				}
			});
		}
		
	});
	/*
	 *点击“添加笔记”，弹出对话框
	 */
	$(document).on('click','#addNote',function(){
		$('.panel_can').html(panelCan.panel_addNote);
		show_bg();
	});
	/*
	 *点击“确定”添加笔记
	 */
	$('.panel_can').on('click','.panel_addNote .sure',function(){
		var noteBookRowkey = $('#addNote').data('noteBookRowKey').data('noteBookRowKey');
		var title=$('#noteTitle').val();
		var length=check_null(title);
		if(length>0){
			title=formate(title);
			var flag;
			$.ajax({
				type : "post",
				url : basePath +"note/addNote",
				async : false,
				dataType : "json",
				data: {"noteName":title,"noteBookRowkey":noteBookRowkey},
				success : function(data) {
					//alert(data.success);
					flag=data.success;
					if(flag){
						title=addNote(title);
						$('#my_note').prepend(title);
						$('#my_note li:first').data('noteRowKey',data.resource);
						$('.cancle').trigger('click');
						//$('#my_note li:first').trigger('click');
						show_success($('.alert_success_b'),'创建成功');
					}
				},
				error:function(data) {
					//alert("no");
				}
			});
		}
	});
	/*
	 *单击笔记,获取笔记详情
	 *#my_note
	 */
	$('.col_2').on('click','.#my_note li',function(){
		var dom=$(this);
		var noteRowKey = dom.data('noteRowKey');
		$.ajax({
			type : "post",
			url : basePath+"note/getNote",
			async : false,
			dataType : "json",
			data: {"noteRowkey":noteRowKey},
			success : function(data) {
				//alert(data.allNoteBook);
				flag=data.success;
				if(flag){
					$('#saveNote').data({
						saveNote:dom
					});
					click_note(dom);
					//AJAX
					$('#inputNoteTitle').val(
							data.note.name
					);
					$('#viewNote').hide();
					$('#editNote').show();
					editor.html(data.note.content);
				}
				
			},
			error:function(data) {
			}
		});
	});
	/*
	 *单击特殊笔记
	 *#分享的笔记,#回收站笔记,#收藏的笔记
	 */
	$('.col_2').on('click','#search_note li,#recycle_note li,#star_note li,#activity_note li,#all_activity_note li',function(){
		var dom=$(this);
		var noteRowKey = dom.data('noteRowKey');
		$.ajax({
			type : "post",
			url : basePath+"note/getNote",
			async : false,
			dataType : "json",
			data: {"noteRowkey":noteRowKey},
			success : function(data) {
				//alert(data.allNoteBook);
				flag=data.success;
				if(flag){
					click_note(dom);
					//AJAX
					$('#outputNoteTitle').text(
							data.note.name
					);
					$('#outputNoteContent').html(
							data.note.content
					);
					//AJAX
					$('#viewNote').show();
					$('#editNote').hide();
				}
				
			},
			error:function(data) {
			}
		});
	});
	/*
	 *删除笔记
	 *@panel_deleteNote
	 */
	$('.col_2').on('click','#my_note .delete_note',function(){
		var dom=$(this).parents('li');
		$('.panel_can').html(panelCan.panel_deleteNote);
		show_bg();
		$('.alert_can').data({
			deleteNote:dom
		});
		return false;
	});
	
	
	/*
	 *确定删除笔记
	 *
	 */
	$('.panel_can').on('click','.panel_deleteNote .sure',function(){
		//AJAX
		cleanEditor();
		var noteRowKey = $('.alert_can').data('deleteNote').data('noteRowKey');
		var oldNoteBookRowkey = $('#addNote').data('noteBookRowKey').data('noteBookRowKey');
		var newNoteBookRowkey = $("#recycleBt").data("recycleBtRowKey");
		var noteName = $('.alert_can').data('deleteNote').text();
		$.ajax({
			type : "post",
			url : basePath+"note/moveAndDeleteNote",
			async : false,
			dataType : "json",
			data: {"noteRowKey":noteRowKey,"oldNoteBookRowkey":oldNoteBookRowkey,"newNoteBookRowkey":newNoteBookRowkey,"noteName":noteName},
			success : function(data) {
				flag=data.success;
				if(flag){
					$('.alert_can').data('deleteNote').remove();
					$('.cancle').trigger('click');
				}
				
			},
			error:function(data) {
			}
		});
	});
	
	
	/*
	 *删除回收站笔记
	 *@panel_deleteRecycleNote
	 */
	$('.col_2').on('click','#recycle_note .delete_note',function(){
		var dom=$(this).parents('li');
		$('.panel_can').html(panelCan.panel_deleteRecycleNote);
		show_bg();
		$('.alert_can').data({
			deleteRecycleNote:dom
		});
		return false;
	});
	
	
	/*
	 *确定删除回收站笔记
	 *
	 */
	$('.panel_can').on('click','.panel_deleteRecycleNote .sure',function(){
		//AJAX
		var noteRowKey = $('.alert_can').data('deleteRecycleNote').data('noteRowKey');
		var noteBookRowkey = $("#recycleBt").data("recycleBtRowKey");
		var oldNoteName = $('.alert_can').data('deleteRecycleNote').text();
		$.ajax({
			type : "post",
			url : basePath+"note/deleteNote",
			async : false,
			dataType : "json",
			data: {"oldNoteName":oldNoteName,"noteRowKey":noteRowKey,"noteBookRowkey":noteBookRowkey},
			success : function(data) {
				//alert(data.allNoteBook);
				flag=data.success;
				if(flag){
					$('.alert_can').data('deleteRecycleNote').remove();
					$('.cancle').trigger('click');
				}
			},
			error:function(data) {
			}
		});
	});
	/*
	 *保存笔记
	 *down-clear
	 */
	$('#saveNote').click(function(){
		var dom=$(this);
		var newNoteName=$('#inputNoteTitle').val();
		var length=check_null(newNoteName);
		var noteRowKey = dom.data('saveNote').data('noteRowKey');
		var noteBookRowkey = $('#addNote').data('noteBookRowKey').data('noteBookRowKey');
		if (dom.data('saveNote').data('noteRowKey')== undefined ||$('#addNote').data('noteBookRowKey').data('noteBookRowKey')==undefined||dom.data('saveNote').data('noteRowKey')== "" ||$('#addNote').data('noteBookRowKey').data('noteBookRowKey')==""||dom.data('saveNote').data('noteRowKey')== null ||$('#addNote').data('noteBookRowKey').data('noteBookRowKey')==null) {
			return;
		}
		if(!!dom.data('saveNote')){
			if(length>0){
				noteName=formate(newNoteName);
				var oldNoteName = dom.data('saveNote').text();
				//alert(dom.data('saveNote').data('noteRowKey'));
				var noteRowKey = dom.data('saveNote').data('noteRowKey');
				var noteBookRowkey = $('#addNote').data('noteBookRowKey').data('noteBookRowKey');
				var content = editor.html();
				if(content.length>500000){
					show_success($('.alert_success_b'),'笔记过长！');
					return;
				}
					//AJAX
					$.ajax({
						type : "post",
						url : basePath+"note/updateNote",
						async : false,
						dataType : "json",
						data: {"noteName":noteName,"oldNoteName":oldNoteName,"noteRowKey":noteRowKey,"content":content,"noteBookRowkey":noteBookRowkey},
						success : function(data) {
							//alert(data.allNoteBook);
							flag=data.success;
							if(flag){
								//AJAX
								dom.data('saveNote')
									.children('.li_title')
									.children('p')
									.children('span').html(newNoteName);
								show_success($('.alert_success_b'),'保存成功');
							}
						},
						error:function(data) {
							//alert("no");
						}
					});
			}
			else{
				$('#inputNoteTitle').attr('placeholder','笔记标题不能为空');
			}
		}
	});
	/*
	 *移动笔记
	 *@panel_moveNote
	 */
	$('.col_2').on('click','#my_note .move_note',function(){
		var dom=$(this).parents('li');
		var noteRowKey = dom.data('noteRowKey');
		var userName = getRowKeyUserName(noteRowKey);
		$.ajax({
			type : "post",
			url : basePath +"note/getAllNoteBookByUserName",
			async : false,
			dataType : "json",
			data: {"userName":userName},
			success : function(data) {
				//alert(data.allNoteBook);
				$('.panel_can').html(panelCan.panel_moveNote);
				show_bg();
				$('.alert_can').data({
					moveNote:dom
				});
				if(data.allNoteBook!=null){
					var allNoteBookList = eval(data.allNoteBook);
					$.each(allNoteBookList,function(idx,item){ //循环对象取值
						$("#moveNoteTo").append('<option value="'+item.rowKey+'">'+item.name+'</option>');
	          		 });
				}
			},
			error:function(data) {
				alert("no");
			}
		});
		return false;
	});
	/*
	 *确定移动笔记
	 *
	 */
	$('.panel_can').on('click','.panel_moveNote .sure',function(){
		cleanEditor();
		var newNoteBookRowkey = $("#moveNoteTo").val();
		if (newNoteBookRowkey==0) {
			show_success($('.alert_success_b'),'请选择正确的笔记本');
			return;
		}
		var noteRowKey =$('.alert_can').data('moveNote').data('noteRowKey');
		var noteName =$('.alert_can').data('moveNote').text();
		var oldNoteBookRowkey = $('#addNote').data('noteBookRowKey').data('noteBookRowKey');
		$.ajax({
			type : "post",
			url : basePath+"note/moveAndDeleteNote",
			async : false,
			dataType : "json",
			data: {"noteRowKey":noteRowKey,"oldNoteBookRowkey":oldNoteBookRowkey,"newNoteBookRowkey":newNoteBookRowkey,"noteName":noteName},
			success : function(data) {
				flag=data.success;
				if(flag){
					//AJAX
					$('.alert_can').data('moveNote').remove();
					$('.cancle').trigger('click');
				}
			},
			error:function(data) {
			}
		});
	});
	/*
	 *分享笔记
	 *@panel_shareNote
	 */
	$('.col_2').on('click','#my_note .share_note',function(){
		var dom=$(this).parents('li');
		$('.panel_can').html(panelCan.panel_shareNote);
		show_bg();
		$('.alert_can').data({
			shareNote:dom
		});
		return false;
	});
	/*
	 *确定分享笔记
	 *
	 */
	$('.panel_can').on('click','.panel_shareNote .sure',function(){
		//AJAX
		show_success($('.alert_success_s'),'分享成功');
		$('.cancle').trigger('click');
	});
	/*
	 *单击回收站
	 *@note_recycle
	 *#recycleBt
	 */
	$('#recycleBt').click(function(){
		cleanEditor();
		click_special($(this));
		$('.col_2').html(noteCan.note_recycle);
	var noteBookRowKey = $("#recycleBt").data("recycleBtRowKey");
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
					var title=addRecycleNote(item.name);
					$('#recycle_note').prepend(title);
					$('#recycle_note li:first').data('noteRowKey',item.rowKey);
          		 });
			}
		},
		error:function(data) {
			alert("no");
		}
	});
	
	return false;
	});
	/*
	 *单击收藏
	 *@note_star
	 *#starBt
	 */
	$('#starBt').click(function(){
		cleanEditor();
		click_special($(this));
		$('.col_2').html(noteCan.note_star);
	var noteBookRowKey = $("#starBt").data("starBtRowKey");
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
					var title=addStarNote(item.name);
					$('#star_note').prepend(title);
					$('#star_note li:first').data('noteRowKey',item.rowKey);
          		 });
			}
		},
		error:function(data) {
			alert("no");
		}
	});
	return false;
	});
	
	
	/*
	 *单击活动
	 *@note_activity
	 *#activityBt
	 */
	$('#activityBt').click(function(){
		cleanEditor();
		click_special($(this));
		$('.col_2').html(noteCan.note_activity);
	var noteBookRowKey = $("#activityBt").data("activityBtRowKey");
	$.ajax({
		type : "post",
		url : basePath +"note/getNoteListByNotebook",
		async : false,
		dataType : "json",
		data: {"rowkey":noteBookRowKey},
		success : function(data) {
			if(data.noteList!=null){
				var allNoteList = eval(data.noteList);
				$.each(allNoteList,function(idx,item){ //循环对象取值
					var title=addMyActivityNote(item.name);
					$('#activity_note').prepend(title);
					$('#activity_note li:first').data('noteRowKey',item.rowKey);
          		 });
			}
		},
		error:function(data) {
			alert("no");
		}
	});
	
	return false;
	});
	/*
	 *清空回收站
	 *@panel_clearNote
	 */
	$('.col_2').on('click','#clearRecycle',function(){
		$('.panel_can').html(panelCan.panel_clearNote);
		show_bg();
	});
	/*
	 *确定清空回收站
	 *
	 */
	$('.panel_can').on('click','.panel_clearNote .sure',function(){
		//AJAX
		show_success($('.alert_success_s'),'回收站已被清空');
		$('.cancle').trigger('click');
	});
	/*
	 *搜索笔记
	 *@note_search
	 */
	$('#searchButton').click(function(){
		$('.col_2').html(noteCan.note_search);
	});
	/*
	 *恢复笔记
	 *@panel_moveBackNote
	 *#recycle_note
	 */
	$('.col_2').on('click','#recycle_note .recycle_note',function(){
		var dom=$(this).parents('li');
		var noteRowKey = dom.data('noteRowKey');
		var userName = getRowKeyUserName(noteRowKey);
		$.ajax({
			type : "post",
			url : basePath +"note/getAllNoteBookByUserName",
			async : false,
			dataType : "json",
			data: {"userName":userName},
			success : function(data) {
				//alert(data.allNoteBook);
				$('.panel_can').html(panelCan.panel_moveBackNote);
				show_bg();
				$('.alert_can').data({
					moveBackNote:dom
				});
				if(data.allNoteBook!=null){
					var allNoteBookList = eval(data.allNoteBook);
					$("#recycleBt").data("recycleBtRowKey",data.recycleBtRowKey);
					$.each(allNoteBookList,function(idx,item){ //循环对象取值
						$("#moveBackNoteTo").append('<option value="'+item.rowKey+'">'+item.name+'</option>');
	          		 });
				}
			},
			error:function(data) {
				alert("no");
			}
		});
		return false;
	});
	/*
	 *确定恢复笔记
	 *
	 */
	$('.panel_can').on('click','.panel_moveBackNote .sure',function(){
		//AJAX
		var newNoteBookRowkey = $("#moveBackNoteTo").val();
		if (newNoteBookRowkey==0) {
			show_success($('.alert_success_b'),'请选择正确的笔记本');
			return;
		}
		var noteRowKey =$('.alert_can').data('moveBackNote').data('noteRowKey');
		var noteName =$('.alert_can').data('moveBackNote').text()
		var oldNoteBookRowkey = getRowKeyUserName(newNoteBookRowkey)+"_0000000000000";
		$.ajax({
			type : "post",
			url : basePath+"note/moveAndDeleteNote",
			async : false,
			dataType : "json",
			data: {"noteRowKey":noteRowKey,"oldNoteBookRowkey":oldNoteBookRowkey,"newNoteBookRowkey":newNoteBookRowkey,"noteName":noteName},
			success : function(data) {
				flag=data.success;
				if(flag){
					$('.alert_can').data('moveBackNote').remove();
					$('.cancle').trigger('click');
				}
			},
			error:function(data) {
			}
		});
	});
	/*
	 *取消收藏
	 *@panel_deleteStarNote
	 *#star_note
	 */
	$('.col_2').on('click','#star_note .delete_note',function(){
		var dom=$(this).parents('li');
		$('.panel_can').html(panelCan.panel_deleteStarNote);
		show_bg();
		$('.alert_can').data({
			deleteStarNote:dom
		});
		return false;
	});
	/*
	 *确定取消收藏
	 *
	 */
	$('.panel_can').on('click','.panel_deleteStarNote .sure',function(){
		//AJAX
		var noteRowKey = $('.alert_can').data('deleteStarNote').data('noteRowKey');
		var noteBookRowkey = $("#starBt").data("starBtRowKey");
		var oldNoteName = $('.alert_can').data('deleteStarNote').text();
		$.ajax({
			type : "post",
			url : basePath+"note/deleteNote",
			async : false,
			dataType : "json",
			data: {"oldNoteName":oldNoteName,"noteRowKey":noteRowKey,"noteBookRowkey":noteBookRowkey},
			success : function(data) {
				//alert(data.allNoteBook);
				flag=data.success;
				if(flag){
					//AJAX
					$('.alert_can').data('deleteStarNote').remove();
					$('.cancle').trigger('click');
				}
			},
			error:function(data) {
			}
		});
	});
	/*
	 *收藏笔记
	 *@panel_starNote
	 *#search_note
	 */
	$('.col_2').on('click','#search_note .star_note',function(){
		var dom=$(this).parents('li');
		$('.panel_can').html(panelCan.panel_starNote);
		show_bg();
		$('.alert_can').data({
			starNote:dom
		});
		return false;
	});
	/*
	 *确定收藏笔记
	 *
	 */
	$('.panel_can').on('click','.panel_starNote .sure',function(){
		//AJAX
		//$('.alert_can').data('starNote');
		show_success($('.alert_success_s'),'收藏成功');
		$('.cancle').trigger('click');
	});
	/*
	 *未确定按钮
	 *no_action
	 */
	$('.col_2').on('click','.no_action',function(){
		return false;
	});
	
	//======================================================================================
	//====================================笔记活动页面======================================
	//======================================================================================
		/*
		 *单机活动笔记
		 *
		 */
		$('.col_2').on('click','.col_middle li',function(){
			$(this).siblings()
				.attr('class','book_list clear_float')
				.end()
				.attr('class','check_book clear_float');
		});
		
		
		/*
		 *参加活动
		 *panel_selectNote
		 */
		$('#addActivityNote').click(function(){
			$.ajax({
				type : "post",
				url : basePath +"note/getAllNoteBook",
				async : false,
				dataType : "json",
				success : function(data) {
					//alert(data.allNoteBook);
					if(data.allNoteBook!=null){
						$('.panel_can').html(panelCan.panel_selectNote);
						show_bg();
						//<select id="selectNoteBook"></select>
						var allNoteBookList = eval(data.allNoteBook);
						$.each(allNoteBookList,function(idx,item){ //循环对象取值
							$("#selectNoteBook").append('<option value="'+item.rowKey+'">'+item.name+'</option>');
		          		 });
					}
				},
				error:function(data) {
					alert("no");
				}
			});
		});
		
		
		/*
		 *选择笔记本
		 *#selectNoteBook
		 */
		$('.panel_can').on('change','#selectNoteBook',function(){
			var noteBookRowKey = $(this).val();
			$.ajax({
				type : "post",
				url : basePath +"note/getNoteListByNotebook",
				async : false,
				dataType : "json",
				data: {"rowkey":noteBookRowKey},
				success : function(data) {
					$("#selectNote").html("<option value='0'>请选择笔记</option>");
					//alert(data.allNoteBook);selectNote
					if(data.noteList!=null){
						var allNoteList = eval(data.noteList);
						$.each(allNoteList,function(idx,item){ //循环对象取值
							$("#selectNote").append('<option value="'+item.rowKey+'">'+item.name+'</option>');
		          		 });
					}
				},
				error:function(data) {
					alert("no");
				}
			});
		});
		
		
		/*
		 *选择笔记本
		 *#selectNote
		 */
		$('.panel_can').on('change','#selectNote',function(){
			
		});
		
		
		/*
		 *确定参加活动
		 *
		 */
		$('.panel_can').on('click','.panel_selectNote .sure',function(){
			var noteRowKey = $("#selectNote").val();
			var oldNoteBookRowkey = $("#selectNoteBook").val();
			var newNoteBookRowkey = $("#activity_rowkey_hidden").val();
			if (noteRowKey==0||oldNoteBookRowkey==0) {
				show_success($('.alert_success_b'),'请选择正确的笔记本或者笔记');
				return;
			}
			var title = $("#selectNote option[value='"+noteRowKey+"']").text();
			$.ajax({
				type : "post",
				url : basePath+"note/activeMyNote",
				async : false,
				dataType : "json",
				data: {"noteRowKey":noteRowKey,"oldNoteBookRowkey":oldNoteBookRowkey,"newNoteBookRowkey":newNoteBookRowkey},
				success : function(data) {
					flag=data.success;
					if(flag){
						//AJAX
						 title=addActivityNote(title);
						$('#all_activity_note').prepend(title);
						$('#all_activity_note li:first').data('noteRowKey',noteRowKey);
						show_success($('.alert_success_all'),'参加活动成功');
						$('.cancle').trigger('click');
					}
					
				},
				error:function(data) {
				}
			});
		});
		
		
		/*
		 *收藏活动笔记
		 *@panel_starActivityNote
		 *#all_activity_note
		 */
		$('.col_2').on('click','#all_activity_note .star_note',function(){
			var dom=$(this).parents('li');
			$('.alert_can').data({
				starActivityNote:dom
			});
			$('.panel_can').html(panelCan.panel_starActivityNote);
			show_bg();
			return false;
		});
		
		
		/*
		 *确定收藏笔记
		 *
		 */
		$('.panel_can').on('click','.panel_starActivityNote .sure',function(){
			var noteRowKey = $('.alert_can').data('starActivityNote').data('noteRowKey');
			$.ajax({
				type : "post",
				url : basePath+"note/starOtherNote",
				async : false,
				dataType : "json",
				data: {"noteRowKey":noteRowKey},
				success : function(data) {
					flag=data.success;
					if(flag){
						show_success($('.alert_success_all'),'收藏成功');
						$('.cancle').trigger('click');
					}
					
				},
				error:function(data) {
				}
			});
		});
});
