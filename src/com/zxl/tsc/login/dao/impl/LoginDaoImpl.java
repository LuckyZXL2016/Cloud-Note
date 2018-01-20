package com.zxl.tsc.login.dao.impl;

import org.springframework.stereotype.Service;

import com.zxl.tsc.login.dao.LoginDao;
import com.zxl.tsc.util.RedisTools;
import com.zxl.tsc.util.constants.Constants;

@Service("loginDaoImpl")
public class LoginDaoImpl implements LoginDao {

	public boolean getLoginInfo(String userName, String password) throws Exception {
		boolean flag = false;
		String userInfo = RedisTools.get(userName);
		if (userInfo!=null) {
			String[] split = userInfo.split("\\"+Constants.STRING_SEPARATOR);
			if (password.equals(split[0])) {
				flag=true;
			}
		}
		return flag;
	}

}
