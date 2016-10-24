package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.NewsDao;
import com.lotut.pms.domain.News;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.NewsType;
import com.lotut.pms.domain.Page;
import com.lotut.pms.service.NewsService;

public class NewsServiceImpl implements NewsService {
	private NewsDao newsDao;

	public NewsServiceImpl(NewsDao newsDao) {
		this.newsDao = newsDao;
	}

	@Override
	public List<News> getUserNewsByPage(Page page) {
		return newsDao.getUserNewsByPage(page);
	}

	@Override
	public int getUserNewsCount(int userId) {
		return newsDao.getUserNewsCount(userId);
	}

	@Override
	public News getUserNewsById(int newsId) {
		return newsDao.getUserNewsById(newsId);
	}

	@Override
	public List<News> searchUserNewsByPage(NewsSearchCondition newsSearchCondition) {
		return newsDao.searchUserNewsByPage(newsSearchCondition);
	}

	@Override
	public int searchUserNewsCount(NewsSearchCondition searchCondition) {
		return newsDao.searchUserNewsCount(searchCondition);
	}

	@Override
	public List<NewsType> getAllNewsTypes() {
		return newsDao.getAllNewsTypes();
	}
	
}
