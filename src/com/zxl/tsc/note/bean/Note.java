package com.zxl.tsc.note.bean;

import com.zxl.tsc.util.constants.Constants;

public class Note {
	private String rowKey;
	private String name;
	private String createTime;
	private String content;
	private String status;

	public String getRowKey() {
		return rowKey;
	}

	public void setRowKey(String rowKey) {
		this.rowKey = rowKey;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 * @zhoujia
	 */
	@Override
	public boolean equals(Object obj) {
		//重写equals方法，当rowkey相等则是同一条笔记
		if(obj instanceof Note){
			Note n = (Note)obj;
			if(n.rowKey.equals(this.rowKey)){
				return true;
			}
		}
		return false;
	}
	public String toString() {
		StringBuffer sb = new StringBuffer();
		sb.append(rowKey).append(Constants.STRING_SEPARATOR).append(name).append(Constants.STRING_SEPARATOR).append(createTime).append(Constants.STRING_SEPARATOR).append(content).append(Constants.STRING_SEPARATOR).append(status);
		return sb.toString();
	}
}
