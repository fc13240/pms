package com.lotut.pms.domain;

public class BrandCategoryCount {
	private Integer brandCount;
	private BrandCategory brandCategory;
	
	
	
	public BrandCategoryCount() {
	}


	public BrandCategoryCount(Integer brandCount, BrandCategory brandCategory) {
		this.brandCount = brandCount;
		this.brandCategory = brandCategory;
	}
	
	
	public Integer getBrandCount() {
		return brandCount;
	}
	public void setBrandCount(Integer brandCount) {
		this.brandCount = brandCount;
	}
	public BrandCategory getBrandCategory() {
		return brandCategory;
	}
	public void setBrandCategory(BrandCategory brandCategory) {
		this.brandCategory = brandCategory;
	}
	
	
	
}
