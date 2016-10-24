package com.lotut.pms.service.impl;

import com.lotut.pms.dao.ArticleDao;
import com.lotut.pms.service.ArticleService;

public class ArticleServiceImpl implements ArticleService {
	private ArticleDao articleDao;

	public ArticleServiceImpl(ArticleDao articleDao) {
		this.articleDao = articleDao;
	}
	
}
