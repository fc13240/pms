package com.lotut.pms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;

public interface PatentDocumentTemplateDao {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);
	
	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(@Param("userId") int userId,@Param("patentDocSectionId") int patentDocSectionId);
	
	List<PatentDocSectionType> getPatentDocSectionTypes();
	
	PatentDocumentTemplate findTemplateDocByTemplateId( int templateId);
	
	void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate);
	
	void deleteTemplateDoc(int templateId);
	
	List<PatentDocumentTemplate> getTemplateList(int sectionId);
}
