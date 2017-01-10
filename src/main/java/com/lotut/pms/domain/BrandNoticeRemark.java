package com.lotut.pms.domain;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

public class BrandNoticeRemark {
	private int remarkId;
	@DateTimeFormat(iso=ISO.DATE_TIME,pattern="yyyy-MM-dd")
	private Date remarkTime;
	private long brandNotice;
	private String content;
	private User user;
	public int getRemarkId() {
		return remarkId;
	}
	public void setRemarkId(int remarkId) {
		this.remarkId = remarkId;
	}
	public Date getRemarkTime() {
		return remarkTime;
	}
	public void setRemarkTime(Date remarkTime) {
		this.remarkTime = remarkTime;
	}
	public long getBrandNotice() {
		return brandNotice;
	}
	public void setBrandNotice(long brandNotice) {
		this.brandNotice = brandNotice;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
}
