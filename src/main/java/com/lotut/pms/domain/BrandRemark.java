package com.lotut.pms.domain;

import java.sql.Timestamp;

public class BrandRemark {
	private int remarkId;
	private User user ;
	private int brandId;
	private String content;
	private Timestamp remarkTime;
	
	public int getRemarkId() {
		return remarkId;
	}
	public void setRemarkId(int remarkId) {
		this.remarkId = remarkId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public int getBrandId() {
		return brandId;
	}
	public void setBrandId(int brandId) {
		this.brandId = brandId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRemarkTime() {
		return remarkTime;
	}
	public void setRemarkTime(Timestamp remarkTime) {
		this.remarkTime = remarkTime;
	}
	
	
}
