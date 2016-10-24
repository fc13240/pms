package com.lotut.pms.dao.mybatis;


import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ArticleDao;
import com.lotut.pms.dao.mapper.ArticleMapper;

public class ArticleMybatisDao extends SqlSessionDaoSupport implements ArticleDao{
	private ArticleMapper articleMapper;

	public void setArticleMapper(ArticleMapper articleMapper) {
		this.articleMapper = articleMapper;
	}
	
}
