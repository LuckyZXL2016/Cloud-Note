//用户登录名
var UserName = "cloudNoteUserName";
// 用户操作令牌
var UserToken;
// 笔记本列表数组
var NotBootArrayList;
// 当前笔记本的所有笔记列表数组
var NoteListByNowNotBook;

/** basePath * */
// var basePath = "http://192.168.0.220:8080/inote/";
// js获取项目根路径，如： http://localhost:8083/uimcardprj
// 获取当前网址，如： http://localhost:8083/uimcardprj/share/meun.jsp
var curWwwPath = window.document.location.href;
// 获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
var pathName = window.document.location.pathname;
var pos = curWwwPath.indexOf(pathName);
// 获取主机地址，如： http://localhost:8083
var localhostPaht = curWwwPath.substring(0, pos);
// 获取带"/"的项目名，如：/uimcardprj
var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
var basePath = localhostPaht + projectName + "/";
var cookie_key = "tarena_cloud_note_user";

var activity_key = "activity_key";