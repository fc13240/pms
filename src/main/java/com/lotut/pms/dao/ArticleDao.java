package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;

public interface ArticleDao {
	List<Article> getUserArticleByPage(Page page);
	
	int getUserArticleCount(int userId);
	
	List<Article> searchUserArticleByPage(ArticleSearchCondition articleSearchCondition);
	
	int searchUserArticleCount(ArticleSearchCondition articleSearchCondition);
	
	List<ArticleType> getAllArticleTypes();
}
