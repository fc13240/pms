package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Patent;


public interface PatentMongoDao {
	public List<Patent> getPatentsByIds(List<String> ids);
}
