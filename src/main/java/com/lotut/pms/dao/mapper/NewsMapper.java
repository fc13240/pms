package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.News;
import com.lotut.pms.domain.NewsImg;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.NewsType;
import com.lotut.pms.domain.Page;

public interface NewsMapper {
	
	List<News> getUserNewsByPage (Page page);
	
	int getUserNewsCount (int userId);
	
	News getUserNewsById (@Param("newsId")int newsId);
	
	List<News> searchUserNewsByPage (NewsSearchCondition searchCondition);
	
	int searchUserNewsCount(NewsSearchCondition searchCondition);
	
	List<NewsType> getAllNewsTypes();
	
	void deleteNewsById(@Param("newsId")int newsId);
	
	void insertNews(News news);
	
	void saveNews(News news);
	
	void addNewsImage(NewsImg newsImg);
	
	void updateNewsInfo(News news);
	
	void updateNewsType(NewsType newsType);
	
	int getNewsTypeCount(NewsType newsType);
	
	void deleteNewsType(NewsType newsType);
	
	void addNewsType(NewsType newsType);
	
	void updateNewsCheckStatus(int newsId);
	
	void auditPass(News news);
	
	List<News> getAllNewsByPage	(Page page);
	
	List<News> searchAllNewsByPage(NewsSearchCondition searchCondition);
	
	int getAllNewsCount(int userId);
	
	int searchAllNewsCount(NewsSearchCondition searchCondition);
}
