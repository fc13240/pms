package com.lotut.pms.domain;

public class PatentType {
	private int patentTypeId;
	
	private String typeDescription;
	
	public PatentType() {
		
	}
	
	public PatentType(int patentTypeId) {
		this.patentTypeId = patentTypeId;
	}
	

	public int getPatentTypeId() {
		return patentTypeId;
	}

	public void setPatentTypeId(int patentTypeId) {
		this.patentTypeId = patentTypeId;
	}

	public String getTypeDescription() {
		return typeDescription;
	}

	public void setTypeDescription(String typeDescription) {
		this.typeDescription = typeDescription;
	}
}
