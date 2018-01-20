package com.zxl.tsc.login.bean;

import java.io.Serializable;


public class User implements Serializable{

	private static final long serialVersionUID = 1169958693886162392l;
    private int userId;
    private String loginName;
    private String password;
    private int type;
    private long registTime;
	private String personalMail;
	public String getPersonalMail() {
		return personalMail;
	}
	public void setPersonalMail(String personalMail) {
		this.personalMail = personalMail;
	}
    
	public User() {
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public long getRegistTime() {
		return registTime;
	}
	public void setRegistTime(long registTime) {
		this.registTime = registTime;
	}
	

}
