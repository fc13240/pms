package com.lotut.pms.domain;

public class BrandSearchCondition {
	private int userId;
	private Integer categoryId;
	private String keyword;
	private Page page;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Integer getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	@Override
	public String toString(){
		String categoryIdStr = categoryId == null ? "":categoryId.toString();
		String keywordStr = keyword == null ? "":keyword.toString();
		return "categoryId=" + categoryIdStr+"&keyword="+keywordStr;
	}
}
