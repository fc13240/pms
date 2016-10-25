package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.Page;

public interface ArticleMapper {
	List<Article> getUserArticleByPage(Page page);
	
	int getUserArticleCount(int userId);
	
	List<Article> searchUserArticleByPage(ArticleSearchCondition searchCondition);
	
	int searchUserArticleCount(ArticleSearchCondition searchCondition);
	
	List<ArticleType>getAllArticleTypes();
}
