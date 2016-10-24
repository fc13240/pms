package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.News;
import com.lotut.pms.domain.NewsSearchCondition;
import com.lotut.pms.domain.Page;

public interface NewsService {
	List<News> getUserNewsByPage (Page page);
	
	int getUserNewsCount (int userId);
	
	News getUserNewsById (int newsId);
	
	List<News> searchUserNewsByPage (NewsSearchCondition searchCondition);
	
	int searchUserNewsCount(NewsSearchCondition searchCondition);
}
