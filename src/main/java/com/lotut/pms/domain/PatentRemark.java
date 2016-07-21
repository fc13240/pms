package com.lotut.pms.domain;

import java.sql.Timestamp;

public class PatentRemark {
	private int remarkId;
	private Timestamp createTime;
	private String content;
	private long patentId;
	private User user;
	public int getRemarkId() {
		return remarkId;
	}
	public void setRemarkId(int remarkId) {
		this.remarkId = remarkId;
	}
	public Timestamp getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Timestamp createTime) {
		this.createTime = createTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getPatentId() {
		return patentId;
	}
	public void setPatentId(long patentId) {
		this.patentId = patentId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}


