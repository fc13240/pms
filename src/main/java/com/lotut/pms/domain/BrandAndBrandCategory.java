package com.lotut.pms.domain;

import java.util.List;

public class BrandAndBrandCategory {
	private List<Brand> brandRecords;
	private List<BrandCategory> brandCategoryRecords;
	
	public List<Brand> getBrandRecords() {
		return brandRecords;
	}
	public void setBrandRecords(List<Brand> brandRecords) {
		this.brandRecords = brandRecords;
	}
	public List<BrandCategory> getBrandCategoryRecords() {
		return brandCategoryRecords;
	}
	public void setBrandCategoryRecords(List<BrandCategory> brandCategoryRecords) {
		this.brandCategoryRecords = brandCategoryRecords;
	}
	
}
