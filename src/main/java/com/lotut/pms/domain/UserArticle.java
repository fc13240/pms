package com.lotut.pms.domain;

import java.util.List;

public class UserArticle {
	private Page page;
	private List<Article> articles;
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public List<Article> getArticles() {
		return articles;
	}
	public void setArticles(List<Article> articles) {
		this.articles = articles;
	}
	
	
}
