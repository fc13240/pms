package com.lotut.pms.service.impl;

import com.lotut.pms.dao.NewsDao;
import com.lotut.pms.service.NewsService;

public class NewsServiceImpl implements NewsService {
	private NewsDao newsDao;

	public NewsServiceImpl(NewsDao newsDao) {
		this.newsDao = newsDao;
	}
	
}
