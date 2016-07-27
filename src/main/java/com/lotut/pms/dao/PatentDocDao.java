package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.PatentDoc;

public interface PatentDocDao {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(int userId);
	
	PatentDoc getUserPatentDocById(long patentDocsId);
	
}
