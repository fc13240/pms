package com.lotut.pms.domain;

public class ArticleSearchCondition {
	private int userId;
	private Page page;
	private String keyword;
	private Integer articleType;
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getArticleType() {
		return articleType;
	}
	public void setArticleType(Integer articleType) {
		this.articleType = articleType;
	}
	
	
}
