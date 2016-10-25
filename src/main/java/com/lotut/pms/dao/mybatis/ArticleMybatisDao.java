package com.lotut.pms.dao.mybatis;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.ArticleDao;
import com.lotut.pms.dao.mapper.ArticleMapper;
import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;

public class ArticleMybatisDao extends SqlSessionDaoSupport implements ArticleDao{
	private ArticleMapper articleMapper;

	public void setArticleMapper(ArticleMapper articleMapper) {
		this.articleMapper = articleMapper;
	}

	@Override
	public List<Article> getUserArticleByPage(Page page) {
		return articleMapper.getUserArticleByPage(page);
	}

	@Override
	public int getUserArticleCount(int userId) {
		return articleMapper.getUserArticleCount(userId);
	}
	
	@Override
	public void addArticleType(String keyword) {
		articleMapper.addArticleType(keyword);
		
	}

	@Override
	public void deleteArticleType(int typeId) {
		articleMapper.deleteArticleType(typeId);
		
	}

	@Override
	public void updateArticleType(int typeId, String typeName) {
		articleMapper.updateArticleType(typeId,typeName);
		
	}

	@Override
	public void deleteArticle(int articleId) {
		articleMapper.deleteArticle(articleId);
		
	}



	@Override
	public List<Article> searchUserArticleByPage(ArticleSearchCondition searchCondition) {
		return articleMapper.searchUserArticleByPage(searchCondition);
	}

	@Override
	public List<ArticleType> getAllArticleTypes() {
		return articleMapper.getAllArticleTypes();
	}

	@Override
	public int searchUserArticleCount(ArticleSearchCondition searchCondition) {
		return articleMapper.searchUserArticleCount(searchCondition);
	}

	@Override
	public void auditPass(Article article) {
		articleMapper.auditPass(article);
	}

	@Override
	public Article getUserArticleById(int id) {
		return articleMapper.getUserArticleById(id);
	}

	



	
}
