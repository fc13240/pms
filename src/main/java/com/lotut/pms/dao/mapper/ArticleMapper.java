package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.Page;

public interface ArticleMapper {
	List<Article> getUserArticleByPage(Page page);
	
	int getUserArticleCount(int userId);
}
