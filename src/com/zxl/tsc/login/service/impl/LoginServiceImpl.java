package com.zxl.tsc.login.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zxl.tsc.login.dao.LoginDao;
import com.zxl.tsc.login.service.LoginService;
@Service
public class LoginServiceImpl implements LoginService{

	@Resource(name="loginDaoImpl")
	private LoginDao loginDao;
	
	public boolean login(String userName, String password) throws Exception{
		return loginDao.getLoginInfo(userName,password);
		
	}
}
