package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;


public interface PatentSearchDao {
	List<Patent> search(String keyword,Page page);
}
