package com.lotut.pms.dao.mybatis;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.NewsDao;
import com.lotut.pms.dao.mapper.NewsMapper;
import com.lotut.pms.domain.News;
import com.lotut.pms.domain.NewsImg;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.NewsType;
import com.lotut.pms.domain.Page;

public class NewsMybatisDao extends SqlSessionDaoSupport implements NewsDao{
	private NewsMapper newsMapper;

	public void setNewsMapper(NewsMapper newsMapper) {
		this.newsMapper = newsMapper;
	}

	@Override
	public List<News> getUserNewsByPage(Page page) {
		return newsMapper.getUserNewsByPage(page);
	}

	@Override
	public int getUserNewsCount(int userId) {
		return newsMapper.getUserNewsCount(userId);
	}

	@Override
	public News getUserNewsById(int newsId) {
		return newsMapper.getUserNewsById(newsId);
	}

	@Override
	public List<News> searchUserNewsByPage(NewsSearchCondition searchCondition) {
		return newsMapper.searchUserNewsByPage(searchCondition);
	}

	@Override
	public int searchUserNewsCount(NewsSearchCondition searchCondition) {
		return newsMapper.searchUserNewsCount(searchCondition);
	}

	@Override
	public List<NewsType> getAllNewsTypes() {
		return newsMapper.getAllNewsTypes();
	}

	@Override
	public void deleteNewsById(int newsId) {
		newsMapper.deleteNewsById(newsId);
	}
	
	@Override
	public void insertNews(News news) {
		newsMapper.insertNews(news);
	}
	
	@Override
	public void updateNews(News news) {
		newsMapper.updateNews(news);
	}
	
	@Override
	public 	void addNewsImage(NewsImg newsImg) {
		newsMapper.addNewsImage(newsImg);
	}
	
	@Override
	public 	void updateNewsInfo(News news) {
		newsMapper.updateNewsInfo(news);
	}
	
	@Override
	public 	void updateNewsType(NewsType newsType) {
		newsMapper.updateNewsType(newsType);
	}
	
	
	@Override
	public int getNewsTypeCount(NewsType newsType) {
		return newsMapper.getNewsTypeCount(newsType);
	}
	
	@Override
	public void deleteNewsType(NewsType newsType) {
		newsMapper.deleteNewsType(newsType);
	}
	
	@Override
	public void addNewsType(NewsType newsType) {
		newsMapper.addNewsType(newsType);
	}
	
}
