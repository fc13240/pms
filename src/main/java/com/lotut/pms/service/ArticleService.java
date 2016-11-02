package com.lotut.pms.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleImg;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;

public interface ArticleService {
	UserArticle getUserArticleByPage(Page page,HttpSession session);
	
	UserArticle searchUserArticleByPage(ArticleSearchCondition articleSearchCondition,HttpSession session);
	
	UserArticle searchAllArticleByPage(ArticleSearchCondition articleSearchCondition,HttpSession session);

	List<ArticleType> getAllArticleTypes();
	
	void auditArticle(Article article);
	
	Article getUserArticleById(int id);
	
	void addArticleType(String keyword);

	void deleteArticleType(int typeId);

	void updateArticleType(int typeId, String typeName);

	void deleteArticle(int articleId);
	
	void insertArticle(Article article);
	
	void updateArticle(Article article);
	
	void insertArticleImage(ArticleImg articleImg,MultipartFile multipartFile);
	
	UserArticle getCheckedArticleList(Page page,HttpSession session);

	int getArticleCountByType(int typeId);
}
