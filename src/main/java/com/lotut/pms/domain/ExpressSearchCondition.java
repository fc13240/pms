package com.lotut.pms.domain;

public class ExpressSearchCondition {
	private int userId;
	private String keyword;
	private Page page;
	
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getKeyword() {
		if (keyword != null) {
			return keyword.trim();
		}
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

	
	public String toString(){
		String keywordStr=keyword ==null ? "" :keyword.toString();
		
		return "&keyword="+keywordStr;
		
	}
}
