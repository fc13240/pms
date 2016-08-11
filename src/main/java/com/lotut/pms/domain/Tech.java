package com.lotut.pms.domain;

public class Tech {
	private int techId;
	private int proxyOrgId;
	private String remarkName;
	private User techUser;
	public int getTechId() {
		return techId;
	}
	public void setTechId(int techId) {
		this.techId = techId;
	}
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
	public User getTechUser() {
		return techUser;
	}
	public void setTechUser(User techUser) {
		this.techUser = techUser;
	}
	
	
}
