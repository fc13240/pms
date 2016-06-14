package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Page;
import com.lotut.pms.domain.Patent;


public interface PatentSearchService {
	List<Patent> search(String keyword,Page page);
	public List<Patent> getPatentsByIds(List<String> patentIds);
}
