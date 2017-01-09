package com.lotut.pms.domain;

public class BrandLegalStatusCount {
	private Integer brandCount;
	private int legalStatusId;
	private String legalStatusName;
	
	
	
	public BrandLegalStatusCount() {
	}
	public BrandLegalStatusCount(Integer brandCount, int legalStatusId, String legalStatusName) {
		this.brandCount = brandCount;
		this.legalStatusId = legalStatusId;
		this.legalStatusName = legalStatusName;
	}
	public Integer getBrandCount() {
		return brandCount;
	}
	public void setBrandCount(Integer brandCount) {
		this.brandCount = brandCount;
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
