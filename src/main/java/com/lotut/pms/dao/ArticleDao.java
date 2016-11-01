package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleImg;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;

public interface ArticleDao {
	List<Article> getUserArticleByPage(Page page);
	
	int getUserArticleCount(int userId);
	
	List<Article> searchUserArticleByPage(ArticleSearchCondition searchCondition);
	
	int searchUserArticleCount(ArticleSearchCondition searchCondition);
	
	List<ArticleType> getAllArticleTypes();
	
	void auditPass(Article article);
	
	Article getUserArticleById(int id);
	
	void addArticleType(String keyword);

	void deleteArticleType(int typeId);

	void updateArticleType(int typeId, String typeName);

	void deleteArticle(int articleId);
	
	void insertArticle(Article article);
	
	void updateArticle(Article article);
	
	void addArticleImage(ArticleImg articleImg);
	
	List<Article> getCheckedArticleList(Page page);
	
	int getCheckedArticleCount(int userId);
	
	List<Article> searchAllArticleByPage(ArticleSearchCondition searchCondition);
	
	int searchAllArticleCount(ArticleSearchCondition searchCondition);
	
	void deleteNullData();

	int getArticleCountByType(int typeId);
}
