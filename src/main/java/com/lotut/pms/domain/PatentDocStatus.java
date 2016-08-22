package com.lotut.pms.domain;

public class PatentDocStatus {
	private int patentDocStatusId;
	private String statusDescription;
	
	public PatentDocStatus() {
		
	}
	
	public PatentDocStatus(int patentDocStatusId) {
		this.patentDocStatusId = patentDocStatusId;
	}

	

	public int getPatentDocStatusId() {
		return patentDocStatusId;
	}

	public void setPatentDocStatusId(int patentDocStatusId) {
		this.patentDocStatusId = patentDocStatusId;
	}

	public String getStatusDescription() {
		return statusDescription;
	}

	public void setStatusDescription(String statusDescription) {
		this.statusDescription = statusDescription;
	}
}
