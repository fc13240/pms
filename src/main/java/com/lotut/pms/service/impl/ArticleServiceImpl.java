package com.lotut.pms.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.lotut.pms.dao.ArticleDao;
import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.CommonAppPerson;
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
		int totalCount=articleDao.searchUserArticleCount(userId);
		page.setTotalRecords(totalCount);
		List<Article> articles=articleDao.searchUserArticleByPage(articleSearchCondition);
		return null;
	}

	
}
