<%@ page import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%String basePath = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>/styles/login.css" />
<title>登录</title>

<script type="text/javascript">
function login(){
	document.getElementById('login_form').submit();
}
function refreshMe(obj) {
	obj.src = "http://localhost:8080/ttsweb/verifyCode/getCode.do?t=" + Math.random();
}
</script>
</head>

<body>
<div class="loginbar">
  <div class="logo"></div>
  <form action="<%=basePath%>/login/loginnow" method="post" id ="login_form">
  <div class="loginbox">
    <ul>
      <li><!--<p>用户名或密码错误</p>-->
        <input name="loginName" id="login_name" type="text" value="请输入用户名" /></li>
      <li><input  name="password" id="login_password" type="text" value="请输入密码" /></li>
      <li class="clearfloat"><!--<p>验证码错误</p>-->
        <span><input  name="validateCode" type="text" class="captcha" /></span>
        <span>
        <img id="validateImg" alt="看不清楚？换一张" width="82" height="34" src="http://localhost:8080/ttsweb/verifyCode/getCode.do" onclick="refreshMe(this)" /> 
        </span><span><a style="cursor:pointer;" onclick="refreshMe(document.getElementById('validateImg'))" >看不清楚？换一张</a></span></li>
      <li class="btn"><input name="提交" type="submit" class="btn" value="登 录" /></li>
      <li class="forget"><a href="#">忘记密码？</a></li>
    </ul>
  </div>
  </form>
</div>
</body>
</html>


