package com.lotut.pms.service;

import java.util.List;

import com.lotut.pms.domain.PatentDoc;

public interface PatentDocService {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(int userId);
	
	PatentDoc getUserPatentDocById(long patentDocsId);
	
}
