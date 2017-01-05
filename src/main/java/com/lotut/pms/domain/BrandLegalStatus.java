package com.lotut.pms.domain;

public class BrandLegalStatus {
	private int legalStatusId;
	private String legalStatusName;
	
	public BrandLegalStatus() {
	}



	public BrandLegalStatus(int legalStatusId, String legalStatusName) {
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
