package com.lotut.pms.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.lotut.pms.domain.PatentDocSectionType;
import com.lotut.pms.domain.PatentDocumentTemplate;
import com.lotut.pms.domain.TemplatePage;

public interface PatentDocumentTemplateService {
	void savePatentDocumentTemplate(PatentDocumentTemplate patentDocumentTemplate);

	List<PatentDocumentTemplate> getPatentDocTemplateListByUserId(int userId,int patentDocSectionId);
	
	List<PatentDocSectionType> getPatentDocSectionTypes();
	
	PatentDocumentTemplate findTemplateDocByTemplateId( int templateId);
	
	void updateTemplateDoc(PatentDocumentTemplate patentDocumentTemplate);
	
	void deleteTemplateDoc(int templateId);
	
	List<PatentDocumentTemplate> getTemplateList(int sectionId,int pagSize);

	List<PatentDocumentTemplate> getTemplateListByPage(TemplatePage templatePage);
	
}
