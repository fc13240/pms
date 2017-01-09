package com.lotut.pms.domain;

public class BrandLegalStatusCount {
	private Integer brandCount;
	private BrandLegalStatus brandLegalStatus;
	
	
	
	public BrandLegalStatusCount() {
	}
	public BrandLegalStatusCount(Integer brandCount, BrandLegalStatus brandLegalStatus) {
		this.brandCount = brandCount;
		this.brandLegalStatus = brandLegalStatus;
	}
	public Integer getBrandCount() {
		return brandCount;
	}
	public void setBrandCount(Integer brandCount) {
		this.brandCount = brandCount;
	}
	public BrandLegalStatus getBrandLegalStatus() {
		return brandLegalStatus;
	}
	public void setBrandLegalStatus(BrandLegalStatus brandLegalStatus) {
		this.brandLegalStatus = brandLegalStatus;
	}
	
}
