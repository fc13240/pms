package com.lotut.pms.service.impl;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.lotut.pms.constants.Settings;
import com.lotut.pms.dao.ArticleDao;
import com.lotut.pms.domain.Article;
import com.lotut.pms.domain.ArticleImg;
import com.lotut.pms.domain.ArticleSearchCondition;
import com.lotut.pms.domain.ArticleType;
import com.lotut.pms.domain.ArticleImg;
import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.UserArticle;
import com.lotut.pms.service.ArticleService;
import com.lotut.pms.util.PrincipalUtils;
import com.lotut.pms.web.util.FileOption;
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
	public UserArticle getCheckedArticleList(Page page, HttpSession session) {
		int userId = PrincipalUtils.getCurrentUserId();
		page.setUserId(userId);
		page.setPageSize(WebUtils.getPageSize(session));
		if (page.getCurrentPage() <= 0) {
			page.setCurrentPage(1);
		}
		int totalCount=articleDao.getCheckedArticleCount(userId);
		page.setTotalRecords(totalCount);
		List<Article> articles=articleDao.getCheckedArticleList(page);
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
		articleSearchCondition.setUserId(PrincipalUtils.getCurrentUserId());
		int totalCount=articleDao.searchUserArticleCount(articleSearchCondition);
		page.setTotalRecords(totalCount);
		List<Article> articles=articleDao.searchUserArticleByPage(articleSearchCondition);

		List<ArticleType> articleTypes=articleDao.getAllArticleTypes();
		UserArticle userArticle=new UserArticle();
		userArticle.setPage(page);
		userArticle.setArticles(articles);
		userArticle.setArticleTypes(articleTypes);
		return userArticle;
	}

	@Override
	public List<ArticleType> getAllArticleTypes() {
		return articleDao.getAllArticleTypes();
	}

	@Override
	public void auditArticle(Article article) {
		articleDao.auditPass(article);
	}

	@Override
	public Article getUserArticleById(int id) {
		Article article=articleDao.getUserArticleById(id);
		return article;
	}
	
	@Override
	public void addArticleType(String keyword) {
		articleDao.addArticleType(keyword);
		
	}

	@Override
	public void deleteArticleType(int typeId) {
		articleDao.deleteArticleType(typeId);
		
	}

	@Override
	public void updateArticleType(int typeId, String typeName) {
		articleDao.updateArticleType(typeId,typeName);
		
	}

	@Override
	public void deleteArticle(int articleId) {
		articleDao.deleteArticle(articleId);
		
	}

	@Override
	public void insertArticle(Article article) {
		articleDao.insertArticle(article);
	}

	@Override
	public void updateArticle(Article article) {
		articleDao.updateArticle(article);
		
	}

	@Override
	@Transactional
	public void insertArticleImage(ArticleImg articleImg,MultipartFile multipartFile) {
		String defaultSaveDir = Settings.NEWS_SMALL_IMAGE_PATH;
		String defaultSaveUrl = Settings.NEWS_SMALL_IMAGE_URL;
		int userId = PrincipalUtils.getCurrentUserId();
		String saveImageUrl = FileOption.uploaffile(userId, multipartFile, defaultSaveDir, defaultSaveUrl);
		articleImg.setImgUrl(saveImageUrl);
		articleDao.addArticleImage(articleImg);
	}

	

	
}
