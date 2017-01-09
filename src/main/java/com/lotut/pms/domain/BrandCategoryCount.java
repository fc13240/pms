package com.lotut.pms.domain;

public class BrandCategoryCount {
	private Integer brandCount;
	private int categoryId;
	private String categoryName;
	
	
	
	public BrandCategoryCount() {
	}
	
	public BrandCategoryCount(Integer brandCount, int categoryId, String categoryName) {
		this.brandCount = brandCount;
		this.categoryId = categoryId;
		this.categoryName = categoryName;
	}

	public Integer getBrandCount() {
		return brandCount;
	}
	public void setBrandCount(Integer brandCount) {
		this.brandCount = brandCount;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
	
}
