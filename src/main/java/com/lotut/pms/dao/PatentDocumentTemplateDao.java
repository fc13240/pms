package com.lotut.pms.dao;

import java.util.List;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.TemplatePage;

public interface PatentDocumentTemplateDao {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);
	
	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(int userId,int patentDocSectionId);
	
	List<PatentDocSectionType> getPatentDocSectionTypes();
	
	PatentDocumentTemplate findTemplateDocByTemplateId( int templateId);
	
	void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate);
	
	void deleteTemplateDoc(int templateId);
	
	List<PatentDocumentTemplate> getTemplateList(int sectionId,int pageSize,int patentType);
	
	List<PatentDocumentTemplate> getTemplateListByPage(TemplatePage templatePage);
	
	int getTemlateSizeBySectionId(int sectionId,int patentType);
}
