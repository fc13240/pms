package com.lotut.pms.service.impl;

import java.util.List;

import com.lotut.pms.dao.PatentMongoDao;
import com.lotut.pms.dao.PatentSearchDao;
import com.lotut.pms.domain.Patent;
import com.lotut.pms.service.PatentSearchService;



public class PatentSearchServiceImpl implements PatentSearchService {
	
	private PatentSearchDao patentSearchDao;
	private PatentMongoDao patentMongoDao;

	public PatentSearchServiceImpl(PatentSearchDao patentSearchDao,PatentMongoDao patentMongoDao) {
		this.patentSearchDao = patentSearchDao;
		this.patentMongoDao = patentMongoDao;
	}

	@Override
	public List<Patent> search(String keyword) {
		return patentSearchDao.search(keyword);
	}

	@Override
	public List<Patent> getPatentsByIds(List<String> patentIds) {
		List<Patent> patents=patentMongoDao.getPatentsByIds(patentIds);
		return patents;
	}
}
