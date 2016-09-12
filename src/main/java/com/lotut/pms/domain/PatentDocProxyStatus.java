package com.lotut.pms.domain;

public class PatentDocProxyStatus {
	private int patentDocProxyStatusId;
	private String statusDescription;
	
	public PatentDocProxyStatus() {
		
	}
	
	public PatentDocProxyStatus(int patentDocProxyStatusId) {
		this.patentDocProxyStatusId = patentDocProxyStatusId;
	}

	public int getPatentDocProxyStatusId() {
		return patentDocProxyStatusId;
	}

	public void setPatentDocProxyStatusId(int patentDocProxyStatusId) {
		this.patentDocProxyStatusId = patentDocProxyStatusId;
	}

	public String getStatusDescription() {
		return statusDescription;
	}

	public void setStatusDescription(String statusDescription) {
		this.statusDescription = statusDescription;
	}
	
	
	
	
}
