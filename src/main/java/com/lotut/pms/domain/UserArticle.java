package com.lotut.pms.domain;

import java.util.List;

public class UserArticle {
	private Page page;
	private List<Article> articles;
	private List<ArticleType> articleTypes;
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
	public List<ArticleType> getArticleTypes() {
		return articleTypes;
	}
	public void setArticleTypes(List<ArticleType> articleTypes) {
		this.articleTypes = articleTypes;
	}
	
	
}
