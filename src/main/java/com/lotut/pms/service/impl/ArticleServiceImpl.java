package com.lotut.pms.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lotut.pms.dao.ArticleDao;
import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;
import com.lotut.pms.service.ArticleService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.WebUtils;

public class ArticleServiceImpl implements ArticleService {
	private ArticleDao articleDao;

	public ArticleServiceImpl(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}

	@Override
	public UserArticle getUserArticleByPage(Page page, HttpSession session) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=articleDao.getUserArticleCount(userId);
		page.setTotalRecords(totalCount);
		List<Article> articles=articleDao.getUserArticleByPage(page);
		UserArticle userArticle=new UserArticle();
		userArticle.setPage(page);
		userArticle.setArticles(articles);
		return userArticle;
	}

	@Override
	public UserArticle searchUserArticleByPage(ArticleSearchCondition articleSearchCondition, HttpSession session) {
		int userId = PrincipalUtils.getCurrentUserId();
		Page page=articleSearchCondition.getPage();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		articleSearchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		int totalCount=articleDao.searchUserArticleCount(articleSearchCondition);
		page.setTotalRecords(totalCount);
		List<Article> articles=articleDao.searchUserArticleByPage(articleSearchCondition);

		List<ArticleType> articleTypes=articleDao.getAllArticleTypes();
		UserArticle userArticle=new UserArticle();
		userArticle.setPage(page);
		userArticle.setArticles(articles);
		userArticle.setArticleTypes(articleTypes);
		return userArticle;
	}

	@Override
	public List<ArticleType> getAllArticleTypes() {
		return articleDao.getAllArticleTypes();
	}

	@Override
	public void auditArticle(Article article) {
		articleDao.auditPass(article);
	}

	@Override
	public Article getUserArticleById(int id) {
		Article article=articleDao.getUserArticleById(id);
		return article;
	}
	
	@Override
	public void addArticleType(String keyword) {
		articleDao.addArticleType(keyword);
		
	}

	@Override
	public void deleteArticleType(int typeId) {
		articleDao.deleteArticleType(typeId);
		
	}

	@Override
	public void updateArticleType(int typeId, String typeName) {
		articleDao.updateArticleType(typeId,typeName);
		
	}

	@Override
	public void deleteArticle(int articleId) {
		articleDao.deleteArticle(articleId);
		
	}

	
}
