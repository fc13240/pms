package com.lotut.pms.domain;

public class Tech {
	private int id;
	private int userId;
	private int proxyOrgId;
	private String remarkName;
	private User user;
	
	public int getProxyOrgId() {
		return proxyOrgId;
	}
	public void setProxyOrgId(int proxyOrgId) {
		this.proxyOrgId = proxyOrgId;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	
}
