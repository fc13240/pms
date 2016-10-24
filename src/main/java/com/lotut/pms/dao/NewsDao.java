package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.News;
import com.lotut.pms.domain.Page;

public interface NewsDao {
	List<News> getUserNewsByPage (Page page);
	
	int getUserNewsCount (int userId);
	
}
