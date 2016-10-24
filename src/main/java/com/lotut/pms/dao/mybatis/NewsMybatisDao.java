package com.lotut.pms.dao.mybatis;


import org.mybatis.spring.support.SqlSessionDaoSupport;

import com.lotut.pms.dao.NewsDao;
import com.lotut.pms.dao.mapper.NewsMapper;

public class NewsMybatisDao extends SqlSessionDaoSupport implements NewsDao{
	private NewsMapper newsMapper;

	public void setNewsMapper(NewsMapper newsMapper) {
		this.newsMapper = newsMapper;
	}
	
}
