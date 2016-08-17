package com.lotut.pms.domain;

public class AppPersonType {
	private int TypeId;
	private String TypeDescription;
	public int getTypeId() {
		return TypeId;
	}
	public void setTypeId(int typeId) {
		TypeId = typeId;
	}
	public String getTypeDescription() {
		return TypeDescription;
	}
	public void setTypeDescription(String typeDescription) {
		TypeDescription = typeDescription;
	}
	public AppPersonType() {
		
	}
	public AppPersonType(int typeId, String typeDescription) {
		super();
		TypeId = typeId;
		TypeDescription = typeDescription;
	}
	public AppPersonType(int typeId) {
		super();
		TypeId = typeId;
	}
	
	
}
