package com.lotut.pms.domain;

public class brandLegalStatus {
	private int legalStatusId;
	private String legalStatusName;
	
	public brandLegalStatus() {
	}



	public brandLegalStatus(int legalStatusId, String legalStatusName) {
		this.legalStatusId = legalStatusId;
		this.legalStatusName = legalStatusName;
	}



	public int getLegalStatusId() {
		return legalStatusId;
	}



	public void setLegalStatusId(int legalStatusId) {
		this.legalStatusId = legalStatusId;
	}



	public String getLegalStatusName() {
		return legalStatusName;
	}



	public void setLegalStatusName(String legalStatusName) {
		this.legalStatusName = legalStatusName;
	}
	
	
	
	
}
