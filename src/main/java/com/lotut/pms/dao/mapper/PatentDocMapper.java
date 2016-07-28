package com.lotut.pms.dao.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDoc;

public interface PatentDocMapper {
	void savePatentDoc(PatentDoc patentDoc);
	
	List<PatentDoc> getUserPatentDoc(@Param("userId")int userId);
	
	PatentDoc getUserPatentDocById(@Param("patentDocsId")long patentDocsId);
	
	void updatePatentDoc(PatentDoc patentDoc);
	
	void deletePatentDoc(long patentDocsId);


}
