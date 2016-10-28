package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.News;
import com.lotut.pms.domain.NewsImg;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.NewsType;
import com.lotut.pms.domain.Page;

public interface NewsDao {
	List<News> getUserNewsByPage (Page page);
	
	int getUserNewsCount (int userId);
	
	News getUserNewsById (int newsId);
	
	List<News> searchUserNewsByPage (NewsSearchCondition searchCondition);
	
	int searchUserNewsCount(NewsSearchCondition searchCondition);
	
	List<NewsType> getAllNewsTypes();
	
	void deleteNewsById(int newsId);
	
	void insertNews(News news);
	
	void updateNews(News news);
	
	void addNewsImage(NewsImg newsImg);
	
	void updateNewsInfo(News news);
	
	void updateNewsType(NewsType newsType);
	
	int getNewsTypeCount(NewsType newsType);
	
	void deleteNewsType(NewsType newsType);
	
	void addNewsType(NewsType newsType);
	
	void updateNewsCheckStatus(int newsId);
}
