package com.zxl.tsc.note.bean;

public class Article {

	public String id; // required
	public String title; // required
	public String content; // required
	public String time; // required
	public String tc100; // required

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getTc100() {
		return tc100;
	}

	public void setTc100(String tc100) {
		this.tc100 = tc100;
	}

}
