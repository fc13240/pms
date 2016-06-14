package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.Patent;


public interface PatentSearchService {
	List<Patent> search(String keyword);
	public List<Patent> getPatentsByIds(List<String> patentIds);
}
