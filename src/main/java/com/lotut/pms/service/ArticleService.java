package com.lotut.pms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;

public interface ArticleService {
	UserArticle getUserArticleByPage(Page page,HttpSession session);
	
	UserArticle searchUserArticleByPage(ArticleSearchCondition articleSearchCondition,HttpSession session);

	List<ArticleType> getAllArticleTypes();
	
	void auditArticle(Article article);
	
	Article getUserArticleById(int id);
	
	void addArticleType(String keyword);

	void deleteArticleType(int typeId);

	void updateArticleType(int typeId, String typeName);

	void deleteArticle(int articleId);
}
