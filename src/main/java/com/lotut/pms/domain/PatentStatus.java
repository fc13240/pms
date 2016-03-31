package com.lotut.pms.domain;

public class PatentStatus {
	private int patentStatusId;
	private String statusDescription;
	
	public PatentStatus() {
		
	}
	
	public PatentStatus(int patentStatusId) {
		this.patentStatusId = patentStatusId;
	}

	public int getPatentStatusId() {
		return patentStatusId;
	}

	public void setPatentStatusId(int patentStatusId) {
		this.patentStatusId = patentStatusId;
	}

	public String getStatusDescription() {
		return statusDescription;
	}

	public void setStatusDescription(String statusDescription) {
		this.statusDescription = statusDescription;
	}
}
