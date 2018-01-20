/**
 * 
 */
package com.zxl.tsc.login.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.zxl.tsc.util.constants.Constants;
@Controller
@RequestMapping("/login")
public class LoginController {
	private static Logger logger = LoggerFactory.getLogger(LoginController.class);
	//@Resource
	//private LoginService loginService;
	/**
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/showloginpage")
	public String login(HttpServletRequest request)throws Exception{
		
		return "login/login";
	}
	@RequestMapping("/showloginpage2")
	public String login2(HttpServletRequest request)throws Exception{
		
		return "login/login2";
	}
	@RequestMapping("/showloginpage3")
	public String login3(HttpServletRequest request)throws Exception{
		
		return "login/login3";
	}
	
	@RequestMapping("/loginnow")
	public String loginin(HttpServletRequest request,String loginName,String password){
		
		try {
			if (loginName==null||"".equals(loginName)||password==null||"".equals(password)) {
				return "error/404";
			}
			request.getSession().setAttribute(Constants.USER_INFO, loginName.trim());
		} catch (Exception e) {
			logger.error("登陆失败：loginName:"+loginName+";",e);
			e.printStackTrace();
		}
		
		return "note/inotecenter";
	}

	
}
