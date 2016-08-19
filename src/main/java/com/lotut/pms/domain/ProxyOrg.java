package com.lotut.pms.domain;

public class ProxyOrg {
	private int orgId;
	private int orgUserId;
	private int parentOrgId;
	private String remarkName;
	private User user;
	public int getOrgId() {
		return orgId;
	}
	public void setOrgId(int orgId) {
		this.orgId = orgId;
	}
	public int getOrgUserId() {
		return orgUserId;
	}
	public void setOrgUserId(int orgUserId) {
		this.orgUserId = orgUserId;
	}
	public int getParentOrgId() {
		return parentOrgId;
	}
	public void setParentOrgId(int parentOrgId) {
		this.parentOrgId = parentOrgId;
	}
	public String getRemarkName() {
		return remarkName;
	}
	public void setRemarkName(String remarkName) {
		this.remarkName = remarkName;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	
}
