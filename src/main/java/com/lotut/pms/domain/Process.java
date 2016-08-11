package com.lotut.pms.domain;

public class Process {
	private int processId;
	private int proxyOrgId;
	private String remarkName;
	private User processUser;
	public int getProcessId() {
		return processId;
	}
	public void setProcessId(int processId) {
		this.processId = processId;
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
	public User getProcessUser() {
		return processUser;
	}
	public void setProcessUser(User processUser) {
		this.processUser = processUser;
	}
	
	
}
