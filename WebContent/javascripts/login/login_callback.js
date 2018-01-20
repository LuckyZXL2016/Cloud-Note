/**
 * 登录成功
 * @param result
 */
function loginSuccess(result){
	if(result.status == 1){
		//用户名：用户id存cookie
		addCookie(cookie_key,result.resource.cnUserId,2);
		addCookie(UserName,result.resource.cnUserName,2);
		location.href="edit.html";
	}else{
		alert("登录失败");
	}
	
}

function loginError(){
	alert("登录异常");
}


/***
 * 注册成功 
 * @param result
 */
function registSuccess(result){
	if(result.status == 1){
		alert("注册成功");
		get('zc').className='sig sig_out';
		get('dl').className='log log_in';
	}else{
		alert("登录失败");
	}
}

function registError(){
	alert("注册异常");
}




/***
 * 修改密码成功 
 * @param result
 */
function changepwdSuccess(result){
	if(result.status == 1){
		alert("修改密码成功");
		logout();
	}else{
		alert("修改密码失败");
	}
}
/***
 * 修改密码失败
 */
function changepwdError(){
	alert("系统异常");
	location.href="log_in.html";
}