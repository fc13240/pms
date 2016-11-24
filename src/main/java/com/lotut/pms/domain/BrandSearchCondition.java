package com.lotut.pms.domain;

public class BrandSearchCondition {
	private int userId;
	private int categoryId;
	private String kewyword;
	private Page page;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getKewyword() {
		return kewyword;
	}
	public void setKewyword(String kewyword) {
		this.kewyword = kewyword;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	
	
}
