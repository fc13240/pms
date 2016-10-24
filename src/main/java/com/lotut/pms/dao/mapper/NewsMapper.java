package com.lotut.pms.dao.mapper;

import java.util.List;

import com.lotut.pms.domain.News;
import com.lotut.pms.domain.Page;

public interface NewsMapper {
	
	List<News> getUserNewsByPage (Page page);
	
	int getUserNewsCount (int userId);

}
