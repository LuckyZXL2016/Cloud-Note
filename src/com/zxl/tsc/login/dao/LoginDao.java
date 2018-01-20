package com.zxl.tsc.login.dao;

public interface LoginDao {

	/**
	 * 从分布式缓存读取用户信息
	 * key = TTSSTU+TTS+sha1(用户名+密码)
	 * @param loginKey
	 * @return
	 */
	public boolean getLoginInfo(String userName, String password)throws Exception;
	
}
